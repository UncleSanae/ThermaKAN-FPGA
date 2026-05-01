import scipy.io as sio
import struct
import numpy as np
import os

def float_to_hex(f):
    # 将浮点数打包为 32 位小端 (IEEE-754) 十六进制机器码
    return format(struct.unpack('<I', struct.pack('<f', float(f)))[0], '08X')

# 1. 动态获取当前路径，完美避开找不到文件的问题
current_dir = os.path.dirname(os.path.abspath(__file__))
mat_file_path = os.path.join(current_dir, 'data', '04-29-17_13.07 3541_Charge2a.mat')
mat_data = sio.loadmat(mat_file_path)

# 2. 自动寻找有效数据字典的 Key (也就是你终端里的 'meas')
real_key = [k for k in mat_data.keys() if not k.startswith('__')][0]
print(f"已自动找到数据 Key: '{real_key}'")

# 3. 【终极剥壳】用 np.squeeze 压缩掉所有大小为 1 的无效维度 (把 1x8 变成 8)
raw_data = mat_data[real_key].item()

# 4. 根据数组索引提取特征 (此时 raw_data 已经是真正的一维 8 元素数组了)
voltage_array = raw_data[1].flatten() 
current_array = raw_data[2].flatten() 

num_samples = len(voltage_array)

# 5. 生成固定为 25.0 ℃ 的环境温度数组
temp_array = np.full(num_samples, 25.0, dtype=np.float32)

# 6. 生成虚拟 ADC 读取用的纯 Hex 文本
output_path = os.path.join(current_dir, "sim_adc_data.txt")
with open(output_path, "w") as f:
    for i in range(num_samples):
        # 转换为无损 IEEE-754 十六进制
        c_hex = float_to_hex(current_array[i])
        v_hex = float_to_hex(voltage_array[i])
        t_hex = float_to_hex(temp_array[i])
        
        # 顺序必须与之前 Verilog 写的地址对应：电流(0x04) -> 电压(0x00) -> 温度(0x08)
        f.write(f"{c_hex}\n")
        f.write(f"{v_hex}\n")
        f.write(f"{t_hex}\n")

print(f"数据提取完成！已生成 {num_samples} 组测试帧，保存在：\n{output_path}")