import os
import torch
import numpy as np
import pandas as pd
from kan_model import BatteryKAN
from config import Config

# =======================================================================
# 硬件参数提取与十六进制固化工具 (Hardware Weights Extractor & LUT Generator)
# =======================================================================
# 面向 C++/MATLAB/FPGA 用户的学习指南：
# 1. 硬件工程师不看浮点数。FPGA 只认 0 和 1。
# 2. 本脚本的核心任务是：将 PyTorch 训练出的 FP32 浮点权重，
#    彻底转化为有符号定点数的“十六进制补码 (Two's Complement)”。
# 3. 导出的 .mem 文件是 Verilog 测试激励 (Testbench) 和 BRAM 初始化的标准格式。

def float_to_q1_15_int(val):
    """
    将单精度浮点数转换为 Q1.15 格式的 16-bit 有符号整数。
    物理极值：最大正数 32767，最小负数 -32768。
    """
    scale = 32768.0
    val_scaled = np.round(val * scale)
    # 模拟硬件的饱和截断 (Saturation Clamp)
    return int(np.clip(val_scaled, -32768, 32767))

def int16_to_hex(val_int):
    """
    将 Python 的带符号整数转换为 4 位长度的十六进制补码字符串 (Hex)。
    C++ 程序员注意：这相当于 `sprintf(buf, "%04X", (uint16_t)val_int);`
    """
    # 转换为 16 位无符号整数表示，从而自动获得补码
    val_uint16 = val_int & 0xFFFF 
    return f"{val_uint16:04X}"

def generate_luts(output_dir):
    """
    生成 B-样条核心与 Sigmoid 的定点数查找表 (LUT)
    默认将输入域划分为 256 个点，对应 FPGA 里的 8-bit 地址线。
    """
    print("\n>>> 正在生成硬件激活函数查表 (LUT)...")
    
    # 1. B-样条查找表 (u 在 [0, 2] 之间)
    u_vals = np.linspace(0, 2, 256)
    bspline_hex_list = []
    
    for u in u_vals:
        # B-样条核心分段函数 (等价于我们模型里的 hw_b_spline_core)
        if 0 <= u < 1:
            val = (1.0 / 6.0) * ((2 - u)**3 - 4 * (1 - u)**3)
        elif 1 <= u < 2:
            val = (1.0 / 6.0) * ((2 - u)**3)
        else:
            val = 0.0
            
        val_int = float_to_q1_15_int(val)
        bspline_hex_list.append(int16_to_hex(val_int))
        
    with open(os.path.join(output_dir, 'LUT_BSpline.mem'), 'w') as f:
        f.write("// Q1.15 Format, 256 entries for u in [0, 2]\n")
        f.write("\n".join(bspline_hex_list))
        
    # 2. Sigmoid 查找表 (x 在 [-1, 1] 之间)
    # 你在硬件里读取这个表的值后，乘以输入 x，即可复原 SiLU 函数
    x_vals = np.linspace(-1, 1, 256)
    sigmoid_hex_list = []
    
    for x in x_vals:
        val = 1.0 / (1.0 + np.exp(-x))
        val_int = float_to_q1_15_int(val)
        sigmoid_hex_list.append(int16_to_hex(val_int))
        
    with open(os.path.join(output_dir, 'LUT_Sigmoid.mem'), 'w') as f:
        f.write("// Q1.15 Format, 256 entries for x in [-1, 1]\n")
        f.write("\n".join(sigmoid_hex_list))
        
    print(f"  -> LUT_BSpline.mem 和 LUT_Sigmoid.mem 已生成。")


def extract_hardware_weights(pth_path='kan_battery_weights.pth'):
    output_dir = './hw_export'
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
        
    print(f"\n>>> 正在加载固化权重: {pth_path} ...")
    model = BatteryKAN()
    try:
        model.load_state_dict(torch.load(pth_path, map_location='cpu'))
    except FileNotFoundError:
        print(f"[!] 找不到权重文件 {pth_path}，请确保已经执行过 train.py")
        return
        
    model.eval()
    csv_records = []
    mem_hex_lines = []

    # 遍历自研的硬件 KAN 层
    for layer_idx, layer in enumerate(model.layers):
        base_w = layer.base_weight.detach().numpy()
        spline_w = layer.spline_weight.detach().numpy()
        out_neurons, in_neurons = base_w.shape

        for out_j in range(out_neurons):
            for in_i in range(in_neurons):
                # =======================================================
                # 提取单条物理连线 (Edge) 的全部参数
                # =======================================================
                bw_raw = float(base_w[out_j, in_i])
                bw_int = float_to_q1_15_int(bw_raw)
                bw_hex = int16_to_hex(bw_int)
                
                # 构建用于数据分析与对比的宽表 Row
                row = {
                    "Layer_Src": layer_idx,
                    "Layer_Dst": layer_idx + 1,
                    "Neuron_Src": in_i,
                    "Neuron_Dst": out_j,
                    
                    # 基础权重对比
                    "Base_Raw": bw_raw,
                    "Base_Q1_15": bw_int,
                    "Base_Hex": bw_hex
                }
                
                # 用于纯硬件导入的一维 Hex 字符串流
                # 格式规范：先存 Base，再顺序存 11 个 Spline
                edge_hex_stream = [bw_hex]
                
                for k in range(11):
                    sw_raw = float(spline_w[out_j, in_i, k])
                    sw_int = float_to_q1_15_int(sw_raw)
                    sw_hex = int16_to_hex(sw_int)
                    
                    # 记录到 CSV
                    row[f"Sp_{k}_Raw"] = sw_raw
                    row[f"Sp_{k}_Q1_15"] = sw_int
                    row[f"Sp_{k}_Hex"] = sw_hex
                    
                    # 记录到硬件数据流
                    edge_hex_stream.append(sw_hex)

                csv_records.append(row)
                
                # 用空格连接这 12 个 Hex 值，作为 Verilog 初始化文件的一行
                mem_hex_lines.append(f"// L{layer_idx}_{in_i}_to_L{layer_idx+1}_{out_j}")
                mem_hex_lines.append(" ".join(edge_hex_stream))

    # =======================================================
    # 导出文件
    # =======================================================
    # 1. 导出供人眼核对的 CSV
    csv_path = os.path.join(output_dir, 'weights_comparison.csv')
    df = pd.DataFrame(csv_records)
    df.to_csv(csv_path, index=False)
    
    # 2. 导出供 FPGA 读取的 MEM
    mem_path = os.path.join(output_dir, 'weights_network.mem')
    with open(mem_path, 'w') as f:
        f.write("\n".join(mem_hex_lines))
        
    # 3. 独立生成查表
    generate_luts(output_dir)
    
    print(f"\n[+] 硬件提取流水线执行完毕！所有产物已放入 {output_dir}/ 目录。")
    print("================================================================")
    print("产物清单:")
    print("1. weights_comparison.csv : 全精度与定点数交叉对比总表")
    print("2. weights_network.mem    : 十六进制权重流 (Verilog $readmemh 可直读)")
    print("3. LUT_BSpline.mem        : B-样条离散化十六进制表 (256 深)")
    print("4. LUT_Sigmoid.mem        : Sigmoid 离散化十六进制表 (256 深)")
    print("================================================================\n")


if __name__ == "__main__":
    extract_hardware_weights()