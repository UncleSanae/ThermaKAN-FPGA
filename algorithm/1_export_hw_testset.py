import os
import torch
import numpy as np
import pandas as pd
from config import Config
from kan_model import BatteryKAN
from data_loader import load_and_preprocess_data

def float_to_q1_15_hex(val):
    """浮点数转 Q1.15 十六进制，严格匹配 FPGA 格式"""
    scale = 32768.0
    val_scaled = np.round(val * scale)
    val_int = int(np.clip(val_scaled, -32768, 32767))
    return f"{val_int & 0xFFFF:04X}"

def main():
    print(">>> 1. 正在加载测试集与 PyTorch 模型...")
    _, test_loaders, _, scaler_y = load_and_preprocess_data()
    
    model = BatteryKAN().to(Config.DEVICE)
    model.load_state_dict(torch.load(Config.WEIGHT_PATH, map_location=Config.DEVICE, weights_only=True))
    model.eval()

    # 从所有测试集文件中，取第一个文件作为时序画图的连续数据流
    file_name, loader = list(test_loaders.items())[0]
    print(f">>> 2. 选中测试文件: {file_name}，开始全量推理并生成硬件激励...")

    hw_inputs_hex = []
    sw_preds_norm = []
    trues_norm = []
    times = []

    with torch.no_grad():
        for batch_x, batch_y, batch_t in loader:
            # 记录软件全精度预测值、真实值、时间戳
            preds = model(batch_x.to(Config.DEVICE)).cpu().numpy()
            sw_preds_norm.extend(preds)
            trues_norm.extend(batch_y.numpy())
            times.extend(batch_t.numpy())

            # 将特征数据格式化为 Hex 存入列表
            batch_x_np = batch_x.numpy()
            for i in range(batch_x_np.shape[0]):
                for j in range(batch_x_np.shape[1]):
                    hw_inputs_hex.append(float_to_q1_15_hex(batch_x_np[i, j]))

    # 将归一化的 [-1, 1] 结果反向转化为物理温度 (℃)
    real_sw_preds = scaler_y.inverse_transform(np.array(sw_preds_norm).reshape(-1, 1)).flatten()
    real_trues    = scaler_y.inverse_transform(np.array(trues_norm).reshape(-1, 1)).flatten()
    times         = np.array(times).flatten()

    # 导出文件 1：给 Vivado 读取的纯文本 Hex 流
    if not os.path.exists(Config.HW_EXPORT_DIR):
        os.makedirs(Config.HW_EXPORT_DIR)
        
    input_txt_path = os.path.join(Config.HW_EXPORT_DIR, "hw_input.txt")
    with open(input_txt_path, "w") as f:
        f.write("\n".join(hw_inputs_hex))

    # 导出文件 2：供绘图脚本比对的 CSV 基准档案
    ref_csv_path = os.path.join(Config.HW_EXPORT_DIR, "sw_reference.csv")
    df = pd.DataFrame({"Time": times, "True_Temp": real_trues, "SW_Pred_Temp": real_sw_preds})
    df.to_csv(ref_csv_path, index=False)

    print(f"[+] 成功！共处理 {len(times)} 组时序数据。")
    print(f"    -> 硬件激励流已导出至 : {input_txt_path}")
    print(f"    -> 软件基准表已导出至 : {ref_csv_path}")
    print(">>> 下一步：请将 hw_input.txt 的绝对路径填入 Verilog Testbench，并在 Vivado 中运行仿真！")

if __name__ == "__main__":
    main()