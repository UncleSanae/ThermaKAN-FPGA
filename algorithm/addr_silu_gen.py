import numpy as np

def float_to_q1_15_hex(val):
    """将浮点数转换为 16-bit Q1.15 格式的十六进制补码"""
    scale = 32768.0
    val_scaled = np.round(val * scale)
    # 钳位防溢出，虽然 SiLU 在 [-1, 1] 范围内绝对不会超过 1.0
    val_int = int(np.clip(val_scaled, -32768, 32767))
    val_uint16 = val_int & 0xFFFF
    return f"{val_uint16:04X}"

def generate_silu_coe():
    DEPTH = 65536  # 16-bit 数据直接寻址的完整深度
    
    silu_data = []
    print(f"正在生成深度为 {DEPTH} 的 SiLU COE 文件...")
    
    for addr in range(DEPTH):
        # 1. 将 16-bit 硬件物理地址(补码)还原为数学浮点数 x
        if addr < 32768:
            x = addr / 32768.0        # 正数部分
        else:
            x = (addr - 65536) / 32768.0  # 负数部分
            
        # 2. 计算 SiLU 激活函数: x / (1 + exp(-x))
        sigmoid_x = 1.0 / (1.0 + np.exp(-x))
        val_silu = x * sigmoid_x
        
        # 3. 转化为 16 进制 Q1.15 存入数组
        silu_data.append(float_to_q1_15_hex(val_silu))

    # 4. 写入 COE 文件
    with open('silu_rom.coe', 'w') as f:
        f.write("memory_initialization_radix=16;\n")
        f.write("memory_initialization_vector=\n")
        f.write(",\n".join(silu_data) + ";\n")

    print("[+] silu_rom.coe 生成完毕")
    
    # 打印几个关键点做物理校验
    print("\n[物理边界校验 (十六进制 / 数学预期)]:")
    print(f"输入 x=0.0    (Addr 0x0000) : {silu_data[0]}      (预期 0.0)")
    print(f"输入 x=1.0    (Addr 0x7FFF) : {silu_data[32767]}      (预期 0.7310)")
    print(f"输入 x=-1.0   (Addr 0x8000) : {silu_data[32768]}      (预期 -0.2689)")

if __name__ == "__main__":
    generate_silu_coe()