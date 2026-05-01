import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from config import Config
from data_loader import load_and_preprocess_data

def hex_to_q1_15_float(hex_str):
    """解析 FPGA 导出的 16 进制有符号补码，还原为 [-1, 1] 浮点数"""
    val = int(hex_str, 16)
    if val >= 32768:
        val -= 65536
    return val / 32768.0

def main():
    hw_output_path = os.path.join(Config.HW_EXPORT_DIR, "hw_output.txt")
    ref_csv_path = os.path.join(Config.HW_EXPORT_DIR, "sw_reference.csv")

    if not os.path.exists(hw_output_path) or not os.path.exists(ref_csv_path):
        print("[!] 错误：缺少输出文件或基准文件，请确认是否已完成 Vivado 仿真？")
        return

    print(">>> 1. 正在加载 CSV 基准数据与 FPGA 仿真结果...")
    df = pd.read_csv(ref_csv_path)
    times         = df["Time"].values
    real_trues    = df["True_Temp"].values
    real_sw_preds = df["SW_Pred_Temp"].values

    # 需要用到相同的量程反归一化模块
    _, _, _, scaler_y = load_and_preprocess_data()

    # 读取并解析 FPGA 输出的 Hex 文件
    with open(hw_output_path, "r") as f:
        hw_hex_lines = f.read().splitlines()

    hw_preds_norm = [hex_to_q1_15_float(h) for h in hw_hex_lines if h.strip()]
    
    # 将 FPGA 算出的 [-1, 1] 反归一化为真实的摄氏度
    real_hw_preds = scaler_y.inverse_transform(np.array(hw_preds_norm).reshape(-1, 1)).flatten()

    # 长度安全对齐（防止 Vivado 仿真未完全跑完导致的数据阶段）
    min_len = min(len(real_trues), len(real_hw_preds))
    times         = times[:min_len]
    real_trues    = real_trues[:min_len]
    real_sw_preds = real_sw_preds[:min_len]
    real_hw_preds = real_hw_preds[:min_len]

    print(f">>> 2. 数据对齐完毕，共截取并比对 {min_len} 组流水线周期输出。")
    
    # 计算物理误差指标
    mae_sw = np.mean(np.abs(real_trues - real_sw_preds))
    mae_hw = np.mean(np.abs(real_trues - real_hw_preds))
    max_err_hw = np.max(np.abs(real_trues - real_hw_preds))
    quant_loss = np.mean(np.abs(real_sw_preds - real_hw_preds))

    print(f"\n--- FPGA 物理验证终极成绩单 ---")
    print(f"软件 FP32 模型 MAE : {mae_sw:.4f} ℃")
    print(f"硬件 Q1.15 IP 核 MAE : {mae_hw:.4f} ℃")
    print(f"硬件最大绝对偏差(Max): {max_err_hw:.4f} ℃")
    print(f"因定点数造成的量化损耗: {quant_loss:.6f} ℃")

    # ==========================================
    # 开始渲染 MATLAB 风格对比长图
    # ==========================================
    plt.rcParams['axes.unicode_minus'] = False
    fig, axes = plt.subplots(2, 1, figsize=(12, 10))

    # 子图 1: 三线拟合轨迹对比
    axes[0].plot(times, real_trues, label='Measured Ground Truth', color='#2ca02c', linewidth=2.0)
    axes[0].plot(times, real_sw_preds, label='Software (FP32 PyTorch)', color='#d62728', linestyle='--', linewidth=1.5, alpha=0.8)
    axes[0].plot(times, real_hw_preds, label='Hardware (FPGA Q1.15 Verilog)', color='#1f77b4', linestyle='-.', linewidth=1.5, alpha=0.9)
    axes[0].set_title('Thermal Dynamics Fit: FPGA Verification vs Software', fontsize=13, fontweight='bold')
    axes[0].set_ylabel('Temperature (℃)')
    axes[0].legend()
    axes[0].grid(True, linestyle=':', alpha=0.7)

    # 子图 2: 误差剥离对比图
    err_sw = np.abs(real_trues - real_sw_preds)
    err_hw = np.abs(real_trues - real_hw_preds)
    
    axes[1].plot(times, err_sw, label='Software Absolute Error', color='#d62728', linewidth=1.2, alpha=0.6)
    axes[1].plot(times, err_hw, label='FPGA Absolute Error', color='#1f77b4', linewidth=1.2, alpha=0.8)
    axes[1].set_title('Prediction Error Magnitude over Physical Time', fontsize=12)
    axes[1].set_ylabel('Absolute Error (℃)')
    axes[1].set_xlabel('Physical Time (Seconds)')
    axes[1].legend()
    axes[1].grid(True, linestyle=':', alpha=0.7)

    plt.tight_layout()
    if not os.path.exists(Config.PLOTS_DIR):
        os.makedirs(Config.PLOTS_DIR)
        
    save_name = os.path.join(Config.PLOTS_DIR, 'fpga_hardware_validation_trace.png')
    plt.savefig(save_name, dpi=300)
    plt.close()
    print(f"\n[+] FPGA 终极三线对比评估图已生成至: {save_name}")

if __name__ == "__main__":
    main()