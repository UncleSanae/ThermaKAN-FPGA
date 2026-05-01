import scipy.io as sio
import struct
import numpy as np

def float_to_hex(f):
    # 将浮点数打包为 32 位小端 (IEEE-754) 十六进制机器码
    # 增加 float() 强制类型转换，防止传入 numpy.float64 时 struct 模块报错
    return format(struct.unpack('<I', struct.pack('<f', float(f)))[0], '08X')

# 1. 加载数据文件
mat_file_path = 'data/04-29-17_13.07 3541_Charge2a.mat'
mat_data = sio.loadmat(mat_file_path)

# 2. 自动寻找有效数据字典的 Key
real_key = [k for k in mat_data.keys() if not k.startswith('__')][0]
raw_matrix = mat_data[real_key]

# 3. 【Bug修复】稳健剥壳：递归解开 MATLAB 的多层 (1,1) object 嵌套
while isinstance(raw_matrix, np.ndarray) and raw_matrix.size == 1:
    raw_matrix = raw_matrix.item()

# 4. 根据之前的输出结构提取电压和电流 ([1]是电压, [2]是电流)
voltage_array = raw_matrix[1].flatten() 
current_array = raw_matrix[2].flatten() 

num_samples = len(voltage_array)

# 5. 【修正】生成固定为 25.0 ℃ 的环境温度数组
temp_array = np.full(num_samples, 25.0, dtype=np.float32)

# 6. 生成虚拟 ADC 读取用的纯 Hex 文本
with open("sim_adc_data.txt", "w") as f:
    for i in range(num_samples):
        # 转换为无损 IEEE-754 十六进制
        c_hex = float_to_hex(current_array[i])
        v_hex = float_to_hex(voltage_array[i])
        t_hex = float_to_hex(temp_array[i])
        
        # 顺序必须与之前 Verilog 写的地址对应：电流(0x04) -> 电压(0x00) -> 温度(0x08)
        # 这里依次写入文件的行为，会按顺序灌入 Verilog 的 rom_data 数组
        f.write(f"{c_hex}\n")
        f.write(f"{v_hex}\n")
        f.write(f"{t_hex}\n")

print("数据提取完成！")
print(f"共生成 {num_samples} 组帧 (每帧包含电流、电压、温度)。")
print("环境温度已全部锁定为 25.0 ℃。")