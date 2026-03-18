import numpy as np

def float_to_q1_15_hex(val):
    """将浮点数转换为 16-bit Q1.15 格式的十六进制补码"""
    scale = 32768.0
    val_scaled = np.round(val * scale)
    val_int = int(np.clip(val_scaled, -32768, 32767))
    val_uint16 = val_int & 0xFFFF
    return f"{val_uint16:04X}"

def generate_bspline_coe():
    DEPTH = 8192  # 13位地址对应的深度
    
    rom_a_data = []
    rom_b_data = []
    
    print(f"正在生成深度为 {DEPTH} 的 B-样条 COE 文件...")
    
    for addr in range(DEPTH):
        # 将 0~8191 的离散地址映射到 [0, 1) 的归一化数学空间
        u = addr / float(DEPTH)
        
        # ==========================================
        # 1. 计算 ROM B (区间 [0, h) -> u 属于 [0, 1))
        # ==========================================
        val_b = (1.0 / 6.0) * ((2.0 - u)**3 - 4.0 * (1.0 - u)**3)
        rom_b_data.append(float_to_q1_15_hex(val_b))
        
        # ==========================================
        # 2. 计算 ROM A (区间 [h, 2h) -> u_a 属于 [1, 2))
        # ==========================================
        u_a = u + 1.0
        val_a = (1.0 / 6.0) * ((2.0 - u_a)**3)
        rom_a_data.append(float_to_q1_15_hex(val_a))

    # ==========================================
    # 3. 按照 Vivado 规范格式化写入 .coe 文件
    # ==========================================
    with open('sp_rom_a.coe', 'w') as f_a:
        f_a.write("memory_initialization_radix=16;\n")
        f_a.write("memory_initialization_vector=\n")
        # 数据用逗号隔开，最后一个带分号
        f_a.write(",\n".join(rom_a_data) + ";\n")
        
    with open('sp_rom_b.coe', 'w') as f_b:
        f_b.write("memory_initialization_radix=16;\n")
        f_b.write("memory_initialization_vector=\n")
        f_b.write(",\n".join(rom_b_data) + ";\n")

    print("[+] sp_rom_a.coe 生成完毕 (用于 [h, 2h) 区间衰减段)")
    print("[+] sp_rom_b.coe 生成完毕 (用于 [0, h)  区间峰值段)")
    
    # 打印边界值进行抽样物理校验
    print("\n[物理边界校验 (十六进制 / 浮点物理值)]:")
    print(f"ROM B 地址 0    (u=0.0) : {rom_b_data[0]}  (预期约 0.6667)")
    print(f"ROM B 地址 8191 (u~1.0) : {rom_b_data[-1]}  (预期约 0.1667)")
    print(f"ROM A 地址 0    (u=1.0) : {rom_a_data[0]}  (预期约 0.1667)")
    print(f"ROM A 地址 8191 (u~2.0) : {rom_a_data[-1]}  (预期接近 0)")

if __name__ == "__main__":
    generate_bspline_coe()