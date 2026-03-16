import os
import torch
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score

from config import Config
from data_loader import load_and_preprocess_data
from kan_model import BatteryKAN

# =======================================================================
# 硬件量化与在环仿真评测 (Hardware Quantization & Evaluation)
# =======================================================================
# 面向 C++/MATLAB 用户的学习指南：
# 1. 这个脚本不仅是用来“画图”的，它其实是一个轻量级的“硬件在环仿真器”。
# 2. 在实际的 FPGA 开发中，我们在写 Verilog 之前，必须先在上位机证明定点化
#    (Fixed-point) 带来的舍入误差不会导致系统崩溃。
# 3. 这里通过双线推理 (FP32 全精度 vs Q1.15 定点数)，直接在物理层面验证可行性。

# -----------------------------------------------------------------------
# 1. 硬件定点数量化核心算子
# -----------------------------------------------------------------------
def quantize_fixed_point(tensor, total_bits=16, fraction_bits=15):
    """
    通用定点数硬件量化模拟函数 (默认模拟 Q1.15 格式)
    
    【原理说明】：
    - Q1.15 格式：1 位符号位，15 位小数位，总共 16 位。
    - 在 FPGA 中，定点数本质上是把小数放大 2^15 倍后当成整数存。
    - 精度分辨率：1 / (2^15) ≈ 3.05e-5。
    
    【拓展预留】：如果你发现 16-bit 浪费了 BRAM，想测试 8-bit (Q1.7) 或 12-bit (Q1.11)，
    只需在调用此函数时传入 fraction_bits=7 或 11 即可。
    """
    # 缩放因子 (例如 2^15 = 32768)
    scale = 2.0 ** fraction_bits
    
    # 最大/最小整数边界 (模拟 16-bit 有符号整数的溢出边界)
    # C++ 中的 INT16_MAX = 32767, INT16_MIN = -32768
    max_val = (2.0 ** (total_bits - 1)) - 1
    min_val = -(2.0 ** (total_bits - 1))
    
    # 步骤 1：乘上缩放因子并四舍五入，模拟硬件的 round 逻辑
    scaled_tensor = torch.round(tensor * scale)
    
    # 步骤 2：钳位限制，模拟硬件累加器溢出时的饱和截断 (Saturation)
    clamped_tensor = torch.clamp(scaled_tensor, min=min_val, max=max_val)
    
    # 步骤 3：除以缩放因子返回浮点表示，以便在 PyTorch 的体系内继续进行可视化统计
    return clamped_tensor / scale


def simulate_hardware_inference(model, x):
    """
    严格模拟底层数字 IC/FPGA 的 KAN 数据流转。
    为什么不能直接用 model(x)? 因为我们要强制在每一次乘法和加法前后，
    都插入 quantize_fixed_point 漏斗，模拟硬件的寄存器截断行为。
    """
    # 1. 外部输入信号量化：模拟 16-bit ADC (模数转换) 传感器数据传入
    x_q = quantize_fixed_point(x, total_bits=16, fraction_bits=15)
    
    for layer in model.layers:
        # 2. 权重固化读取：模拟从 FPGA BRAM/ROM 读出的定点权重
        q_base_weight = quantize_fixed_point(layer.base_weight)
        q_spline_weight = quantize_fixed_point(layer.spline_weight)
        
        # 3. 基础路径 (Base Path) 计算
        # 注意：此处激活函数 SiLU 保持了全精度。
        # 【拓展预留】：未来如果你把 SiLU 也做成了 ROM 查表，需要在这里加上查表的量化误差。
        base_act = torch.nn.functional.silu(x_q)
        base_out = torch.nn.functional.linear(base_act, q_base_weight)
        
        # 4. 样条路径 (Spline Path) 计算
        u = torch.abs(x_q.unsqueeze(-1) - layer.centers) / layer.grid_step
        bases = layer.hw_b_spline_core(u)
        spline_out = torch.einsum('bik,oik->bo', bases, q_spline_weight)
        
        # 5. 加法树求和，并模拟加法器输出寄存器的定点截断
        mac_sum = base_out + spline_out
        mac_sum_q = quantize_fixed_point(mac_sum)
        
        # 6. 最后一级的饱和输出寄存器：超量程硬截断到 [-1, 1] 
        # 保证下一层的输入绝对安全。
        x_q = torch.clamp(mac_sum_q, min=-1.0, max=1.0)
        
    return x_q

# -----------------------------------------------------------------------
# 2. 诊断与绘图逻辑
# -----------------------------------------------------------------------
def print_global_physical_alignment(model, scaler_x, scaler_y):
    """
    生成硬件说明书 (Hardware Spec Sheet)。
    将网络运行时的极限值打印出来，直接交付给 Verilog 工程师作为位宽设计的参考。
    """
    print("\n" + "█"*30 + " 神经元物理含义与全局极值锁定 " + "█"*30)
    print("【第一部分：硬编码写死的归一化常数 (Fixed Bounds)】")
    print(f"  - 电压 (V)   : X_min = {scaler_x.data_min_[0]:10.6f}, X_max = {scaler_x.data_max_[0]:10.6f}")
    print(f"  - 电流 (A)   : X_min = {scaler_x.data_min_[1]:10.6f}, X_max = {scaler_x.data_max_[1]:10.6f}")
    print(f"  - 环温 (°C)  : X_min = {scaler_x.data_min_[2]:10.6f}, X_max = {scaler_x.data_max_[2]:10.6f}")
    print(f"  - 表温 (°C)  : Y_min = {scaler_y.data_min_[0]:10.6f}, Y_max = {scaler_y.data_max_[0]:10.6f}")

    print("\n【第二部分：各层神经元在整个测试集上的绝对数值范围 (用于固定网格)】")
    for name, stats in model.layer_stats.items():
        print(f"  -> {name}:")
        print(f"     输入全局范围 (In)  : [{stats['in_min']:9.5f}, {stats['in_max']:9.5f}]")
        print(f"     输出全局范围 (Out) : [{stats['out_min']:9.5f}, {stats['out_max']:9.5f}]")
        if "Layer_0" not in name:
            range_span = stats['in_max'] - stats['in_min']
            if range_span > 10.0:
                print(f"     [!] 警告：该中间层输入极差达到 {range_span:.2f}，如果 Grid 范围定在 [-1, 1]，样条曲线已严重失效！")
    print("█"*88 + "\n")


def evaluate(model, test_loaders, scaler_x, scaler_y):
    """
    核心评测模块。
    执行全精度与定点数双线推理，并将抽象的 [-1, 1] 结果还原为真实的物理温度进行对比。
    """
    # model.eval() 类似于关闭训练模式的特定行为 (如 Dropout 失效)
    model.eval()
    
    # 挂载监控探针，用于抓取极大极小值
    model.register_monitoring()
    
    print(">>> 正在遍历全量测试集，执行双线推理 (FP32 & HW Q1.15)...")
    for file_name, loader in test_loaders.items():
        all_fp32_preds, all_hw_preds, all_trues, all_times = [], [], [], []
        
        # torch.no_grad() 相当于告诉引擎：这里不需要算梯度，省下内存和算力。
        # 类似 C++ 中对只读变量使用 const 引用。
        with torch.no_grad():
            for batch_x, batch_y, batch_t in loader:
                batch_x_dev = batch_x.to(Config.DEVICE)
                
                # 双线推理分支
                # 1. 软件级全精度 FP32
                fp32_preds = model(batch_x_dev)
                # 2. 硬件级定点数 Q1.15
                hw_preds = simulate_hardware_inference(model, batch_x_dev)
                
                # 将 GPU 上的 tensor 拉回到 CPU，并转成普通的 numpy 数组 (类似 MATLAB 矩阵)
                all_fp32_preds.append(fp32_preds.cpu().numpy())
                all_hw_preds.append(hw_preds.cpu().numpy())
                all_trues.append(batch_y.numpy())
                all_times.append(batch_t.numpy())
                
        # -------------------------------------------------------------------
        # 物理量反归一化 (Inverse Transform)
        # 将网络输出的 [-1, 1] 映射回真实的摄氏度 ℃。
        # 这一步通常在 MCU (单片机) 或上位机执行，所以保持全精度即可。
        # -------------------------------------------------------------------
        real_fp32_preds = scaler_y.inverse_transform(np.vstack(all_fp32_preds))
        real_hw_preds   = scaler_y.inverse_transform(np.vstack(all_hw_preds))
        real_trues      = scaler_y.inverse_transform(np.vstack(all_trues))
        phys_times      = np.hstack(all_times)
        
        # -------------------------------------------------------------------
        # 指标计算 (Metrics)
        # RMSE: 均方根误差，对极大值(异常突变)更敏感
        # MAE: 平均绝对误差，反映整体平均偏离程度
        # -------------------------------------------------------------------
        rmse_fp32 = np.sqrt(mean_squared_error(real_trues, real_fp32_preds))
        mae_fp32  = mean_absolute_error(real_trues, real_fp32_preds)
        r2_fp32   = r2_score(real_trues, real_fp32_preds)
        abs_errors_fp32 = np.abs(real_trues - real_fp32_preds)

        rmse_hw = np.sqrt(mean_squared_error(real_trues, real_hw_preds))
        mae_hw  = mean_absolute_error(real_trues, real_hw_preds)
        r2_hw   = r2_score(real_trues, real_hw_preds)
        abs_errors_hw = np.abs(real_trues - real_hw_preds)
        
        # 纯量化误差：反映了丢弃小数精度究竟带来了多大影响
        hw_quant_error = np.abs(real_fp32_preds - real_hw_preds)

        # -------------------------------------------------------------------
        # 三子图混合对比渲染 (MATLAB 风格绘图)
        # -------------------------------------------------------------------
        plt.rcParams['axes.unicode_minus'] = False    
        fig, axes = plt.subplots(3, 1, figsize=(12, 16))
        
        # 子图 1: 拟合曲线 (真实值 vs 软件预测 vs 硬件预测)
        axes[0].plot(phys_times, real_trues, label='Measured (True)', color='#2ca02c', linewidth=2.0)
        axes[0].plot(phys_times, real_fp32_preds, label='Software FP32 Pred', color='#d62728', linestyle='--', linewidth=1.5, alpha=0.8)
        axes[0].plot(phys_times, real_hw_preds, label='Hardware Q1.15 Pred', color='#1f77b4', linestyle='-.', linewidth=1.5, alpha=0.9)
        axes[0].set_title(f'[{file_name}] Thermal Dynamics Fit (Software vs Hardware)', fontsize=13, fontweight='bold')
        axes[0].set_ylabel('Temperature (°C)')
        axes[0].legend()
        axes[0].grid(True, linestyle=':', alpha=0.7)
        
        # 子图 2: 绝对误差分布对比
        axes[1].plot(phys_times, abs_errors_fp32, label='FP32 Absolute Error', color='#d62728', linewidth=1.2, alpha=0.6)
        axes[1].plot(phys_times, abs_errors_hw, label='Q1.15 HW Absolute Error', color='#1f77b4', linewidth=1.2, alpha=0.8)
        axes[1].set_title('Error Magnitude over Physical Time', fontsize=12)
        axes[1].set_ylabel('Absolute Error (°C)')
        axes[1].set_xlabel('Physical Time (Seconds)')
        axes[1].legend()
        axes[1].grid(True, linestyle=':', alpha=0.7)
        
        # 子图 3: 双精度指标综合报告 (纯文字呈现)
        axes[2].axis('off') # 关掉坐标轴边框
        metrics_text = (
            f"--- Performance Report & Quantization Analysis ---\n\n"
            f"【Software FP32 Metrics】\n"
            f"  RMSE: {rmse_fp32:.4f} °C   |   MAE: {mae_fp32:.4f} °C\n"
            f"  R2:   {r2_fp32:.4f}        |   Max Err: {abs_errors_fp32.max():.4f} °C\n\n"
            f"【Hardware Q1.15 Metrics】\n"
            f"  RMSE: {rmse_hw:.4f} °C   |   MAE: {mae_hw:.4f} °C\n"
            f"  R2:   {r2_hw:.4f}        |   Max Err: {abs_errors_hw.max():.4f} °C\n\n"
            f"【Quantization Degradation (HW vs FP32)】\n"
            f"  Max Pure Quantization Error: {hw_quant_error.max():.6f} °C\n"
            f"  Mean Quantization Error:   {hw_quant_error.mean():.6f} °C"
        )
        axes[2].text(0.5, 0.5, metrics_text, fontsize=13, ha='center', va='center', family='monospace', 
                     bbox=dict(boxstyle='round', facecolor='#f8f9fa', edgecolor='#ced4da', pad=1.5))
        
        plt.tight_layout()
        save_name = f'eval_phys_quantized_{file_name.replace(".mat", "")}.png'
        plt.savefig(save_name, dpi=300)
        plt.close()

    print_global_physical_alignment(model, scaler_x, scaler_y)
    print("[+] 所有包含硬件量化对比的评估图像已生成。")


# =======================================================================
# 独立运行入口
# =======================================================================
if __name__ == "__main__":
    # 纯测试模式：绝不触发训练流程，只获取数据加载器
    _, test_loaders, scaler_x, scaler_y = load_and_preprocess_data()
    
    weight_path = 'kan_battery_weights.pth'
    if not os.path.exists(weight_path):
        print(f"[!] 错误：未找到权重文件 {weight_path}，请先运行 train.py 进行模型训练与导出。")
        exit()
        
    # 实例化一个“白板模型” (空壳)
    model = BatteryKAN().to(Config.DEVICE)
    
    # 将硬盘里的固化权重灌入白板模型。
    # load_state_dict 类似 C++ 中从二进制文件反序列化结构体数据。
    model.load_state_dict(torch.load(weight_path, map_location=Config.DEVICE))
    print(f"[+] 成功从硬盘加载模型权重: {weight_path}")
    
    # 启动双精度对比评测
    evaluate(model, test_loaders, scaler_x, scaler_y)