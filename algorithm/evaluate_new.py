import os
import torch
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score

from config import Config
from data_loader import load_and_preprocess_data
from kan_model import BatteryKAN

# =======================================================================
# 硬件量化与在环仿真评测 (增强版) —— 新增 MAE 柱状图对比
# =======================================================================

# -----------------------------------------------------------------------
# 1. 硬件定点数量化核心算子 (复用 evaluate.py)
# -----------------------------------------------------------------------
def quantize_fixed_point(tensor, total_bits=16, fraction_bits=15):
    """
    通用定点数硬件量化模拟函数 (默认模拟 Q1.15 格式)
    """
    scale = 2.0 ** fraction_bits
    max_val = (2.0 ** (total_bits - 1)) - 1
    min_val = -(2.0 ** (total_bits - 1))
    scaled_tensor = torch.round(tensor * scale)
    clamped_tensor = torch.clamp(scaled_tensor, min=min_val, max=max_val)
    return clamped_tensor / scale


def simulate_hardware_inference(model, x):
    """
    严格模拟底层数字 IC/FPGA 的 KAN 数据流转。
    """
    x_q = quantize_fixed_point(x, total_bits=16, fraction_bits=15)

    for layer in model.layers:
        q_base_weight = quantize_fixed_point(layer.base_weight)
        q_spline_weight = quantize_fixed_point(layer.spline_weight)

        base_act = torch.nn.functional.silu(x_q)
        base_out = torch.nn.functional.linear(base_act, q_base_weight)

        u = torch.abs(x_q.unsqueeze(-1) - layer.centers) / layer.grid_step
        bases = layer.hw_b_spline_core(u)
        spline_out = torch.einsum('bik,oik->bo', bases, q_spline_weight)

        mac_sum = base_out + spline_out
        mac_sum_q = quantize_fixed_point(mac_sum)

        x_q = torch.clamp(mac_sum_q, min=-1.0, max=1.0)

    return x_q


# -----------------------------------------------------------------------
# 2. 诊断与绘图逻辑 (增强版绘图)
# -----------------------------------------------------------------------
def print_global_physical_alignment(model, scaler_x, scaler_y):
    """与 evaluate.py 完全相同的打印逻辑"""
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
    执行全精度与定点数双线推理，生成 2×2 子图对比，
    新增 Q1.15 vs FP32 的 MAE 柱状图。
    """
    model.eval()
    model.register_monitoring()

    # 收集所有文件的指标，用于最后的汇总柱状图
    all_summary = []  # 每个元素: (file_name, mae_fp32, mae_hw, rmse_fp32, rmse_hw)

    print(">>> 正在遍历全量测试集，执行双线推理 (FP32 & HW Q1.15)...")
    for file_name, loader in test_loaders.items():
        all_fp32_preds, all_hw_preds, all_trues, all_times = [], [], [], []

        with torch.no_grad():
            for batch_x, batch_y, batch_t in loader:
                batch_x_dev = batch_x.to(Config.DEVICE)

                fp32_preds = model(batch_x_dev)
                hw_preds = simulate_hardware_inference(model, batch_x_dev)

                all_fp32_preds.append(fp32_preds.cpu().numpy())
                all_hw_preds.append(hw_preds.cpu().numpy())
                all_trues.append(batch_y.numpy())
                all_times.append(batch_t.numpy())

        # 物理量反归一化
        real_fp32_preds = scaler_y.inverse_transform(np.vstack(all_fp32_preds))
        real_hw_preds   = scaler_y.inverse_transform(np.vstack(all_hw_preds))
        real_trues      = scaler_y.inverse_transform(np.vstack(all_trues))
        phys_times      = np.hstack(all_times)

        # 指标计算
        rmse_fp32 = np.sqrt(mean_squared_error(real_trues, real_fp32_preds))
        mae_fp32  = mean_absolute_error(real_trues, real_fp32_preds)
        r2_fp32   = r2_score(real_trues, real_fp32_preds)
        abs_errors_fp32 = np.abs(real_trues - real_fp32_preds)

        rmse_hw = np.sqrt(mean_squared_error(real_trues, real_hw_preds))
        mae_hw  = mean_absolute_error(real_trues, real_hw_preds)
        r2_hw   = r2_score(real_trues, real_hw_preds)
        abs_errors_hw = np.abs(real_trues - real_hw_preds)

        hw_quant_error = np.abs(real_fp32_preds - real_hw_preds)

        # 存储汇总数据
        all_summary.append((file_name, mae_fp32, mae_hw, rmse_fp32, rmse_hw, r2_fp32, r2_hw,
                            abs_errors_fp32.max(), abs_errors_hw.max()))

        # -------------------------------------------------------------------
        # 2×2 子图渲染
        # -------------------------------------------------------------------
        plt.rcParams['axes.unicode_minus'] = False
        fig, axes = plt.subplots(2, 2, figsize=(14, 10))

        # ----- 子图 (0,0): 拟合曲线 -----
        axes[0, 0].plot(phys_times, real_trues, label='Measured (True)', color='#2ca02c', linewidth=2.0)
        axes[0, 0].plot(phys_times, real_fp32_preds, label='Software FP32 Pred', color='#d62728', linestyle='--', linewidth=1.5, alpha=0.8)
        axes[0, 0].plot(phys_times, real_hw_preds, label='Hardware Q1.15 Pred', color='#1f77b4', linestyle='-.', linewidth=1.5, alpha=0.9)
        axes[0, 0].set_title(f'[{file_name}] Thermal Dynamics Fit', fontsize=12, fontweight='bold')
        axes[0, 0].set_ylabel('Temperature (°C)')
        axes[0, 0].legend(fontsize=8)
        axes[0, 0].grid(True, linestyle=':', alpha=0.7)

        # ----- 子图 (0,1): 绝对误差分布 -----
        axes[0, 1].plot(phys_times, abs_errors_fp32, label='FP32 Abs Error', color='#d62728', linewidth=1.2, alpha=0.6)
        axes[0, 1].plot(phys_times, abs_errors_hw, label='Q1.15 HW Abs Error', color='#1f77b4', linewidth=1.2, alpha=0.8)
        axes[0, 1].set_title('Error Magnitude over Physical Time', fontsize=12)
        axes[0, 1].set_ylabel('Absolute Error (°C)')
        axes[0, 1].set_xlabel('Physical Time (Seconds)')
        axes[0, 1].legend(fontsize=8)
        axes[0, 1].grid(True, linestyle=':', alpha=0.7)

        # ----- 子图 (1,0): MAE 柱状图对比 (Q1.15 vs FP32) -----
        degrad_pct = (mae_hw - mae_fp32) / (mae_fp32 + 1e-10) * 100
        bars = axes[1, 0].bar(['Full-Precision (FP32)', 'Fixed-Point (Q1.15)'],
                              [mae_fp32, mae_hw],
                              color=['#d62728', '#1f77b4'],
                              width=0.4,
                              edgecolor='black', linewidth=1.0)
        # 在柱状图顶部标注数值
        for bar, val in zip(bars, [mae_fp32, mae_hw]):
            axes[1, 0].text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.001,
                            f'{val:.4f} °C', ha='center', va='bottom', fontsize=10, fontweight='bold')
        axes[1, 0].set_title('Mean Absolute Error (MAE)', fontsize=12, fontweight='bold')
        axes[1, 0].set_ylabel('MAE (°C)')
        axes[1, 0].grid(True, axis='y', linestyle=':', alpha=0.7)

        # ----- 子图 (1,1): RMSE 与 R² 柱状图对比 (双指标) -----
        x_pos = np.arange(2)  # 两个类别: FP32, Q1.15
        width = 0.35

        # RMSE 子柱
        bars_rmse = axes[1, 1].bar(x_pos - width/2, [rmse_fp32, rmse_hw],
                                   width, label='RMSE', color='#9467bd', edgecolor='black', linewidth=1.0)
        # R² 子柱
        bars_r2 = axes[1, 1].bar(x_pos + width/2, [r2_fp32, r2_hw],
                                 width, label='R²', color='#8c564b', edgecolor='black', linewidth=1.0)

        # 标注数值
        for bar, val in zip(bars_rmse, [rmse_fp32, rmse_hw]):
            axes[1, 1].text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.002,
                            f'{val:.4f}', ha='center', va='bottom', fontsize=9, fontweight='bold')
        for bar, val in zip(bars_r2, [r2_fp32, r2_hw]):
            axes[1, 1].text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.002,
                            f'{val:.4f}', ha='center', va='bottom', fontsize=9, fontweight='bold')

        axes[1, 1].set_xticks(x_pos)
        axes[1, 1].set_xticklabels(['FP32', 'Q1.15'])
        axes[1, 1].set_title('RMSE & R² Comparison', fontsize=12, fontweight='bold')
        axes[1, 1].legend(fontsize=9)
        axes[1, 1].grid(True, axis='y', linestyle=':', alpha=0.7)

        plt.tight_layout()
        if not os.path.exists(Config.PLOTS_DIR):
            os.makedirs(Config.PLOTS_DIR)

        save_name = os.path.join(Config.PLOTS_DIR, f'eval_new_{file_name.replace(".mat", "")}.png')
        plt.savefig(save_name, dpi=300)
        plt.close()
        print(f"  [✓] 已生成: {save_name}")

    # ===================================================================
    # 汇总：跨文件 MAE 对比柱状图
    # ===================================================================
    if len(all_summary) > 0:
        fig_sum, ax_sum = plt.subplots(1, 1, figsize=(10, 5))

        # 按文件名排序
        all_summary.sort(key=lambda x: x[0])
        file_labels = [s[0].replace('.mat', '') for s in all_summary]
        mae_fp32_vals  = [s[1] for s in all_summary]
        mae_hw_vals    = [s[2] for s in all_summary]
        rmse_fp32_vals = [s[3] for s in all_summary]
        rmse_hw_vals   = [s[4] for s in all_summary]

        x = np.arange(len(file_labels))
        width = 0.35

        # 分组柱状图: FP32 vs Q1.15
        bars_fp32 = ax_sum.bar(x - width/2, mae_fp32_vals, width,
                               label='FP32 MAE', color='#d62728', edgecolor='black', linewidth=1.0)
        bars_hw   = ax_sum.bar(x + width/2, mae_hw_vals, width,
                               label='Q1.15 MAE', color='#1f77b4', edgecolor='black', linewidth=1.0)

        # 标注数值
        for bar, val in zip(bars_fp32, mae_fp32_vals):
            ax_sum.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.001,
                        f'{val:.3f}', ha='center', va='bottom', fontsize=8, fontweight='bold', color='#d62728')
        for bar, val in zip(bars_hw, mae_hw_vals):
            ax_sum.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.001,
                        f'{val:.3f}', ha='center', va='bottom', fontsize=8, fontweight='bold', color='#1f77b4')

        ax_sum.set_xticks(x)
        ax_sum.set_xticklabels(file_labels, rotation=15, ha='right', fontsize=9)
        ax_sum.set_ylabel('Mean Absolute Error (°C)')
        ax_sum.set_title('Cross-File MAE Summary: FP32 vs Q1.15', fontsize=13, fontweight='bold')
        ax_sum.legend(fontsize=10)
        ax_sum.grid(True, axis='y', linestyle=':', alpha=0.7)

        plt.tight_layout()
        summary_save = os.path.join(Config.PLOTS_DIR, 'eval_new_mae_summary.png')
        fig_sum.savefig(summary_save, dpi=300)
        plt.close()
        print(f"  [✓] 已生成汇总图: {summary_save}")

    print_global_physical_alignment(model, scaler_x, scaler_y)
    print("[+] 所有包含硬件量化对比与 MAE 柱状图的评估图像已生成。")


# =======================================================================
# 独立运行入口
# =======================================================================
if __name__ == "__main__":
    _, test_loaders, scaler_x, scaler_y = load_and_preprocess_data()

    weight_path = Config.WEIGHT_PATH
    if not os.path.exists(weight_path):
        print(f"[!] 错误：未找到权重文件 {weight_path}，请先运行 train.py 进行模型训练与导出。")
        exit()

    model = BatteryKAN().to(Config.DEVICE)
    model.load_state_dict(torch.load(weight_path, map_location=Config.DEVICE))
    print(f"[+] 成功从硬盘加载模型权重: {weight_path}")

    evaluate(model, test_loaders, scaler_x, scaler_y)
