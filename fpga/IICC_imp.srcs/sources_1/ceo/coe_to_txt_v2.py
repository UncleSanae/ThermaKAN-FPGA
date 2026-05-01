import os
import glob

def clean_and_rename_coe():
    # 建立映射表：{ 你的 Python 生成的文件名 : 硬件代码里读取的文件名 }
    name_map = {
        # 权重文件映射 (rom_bX -> w_bX_init)
        "rom_silu.coe": "w_silu_init.txt",
        "rom_b0.coe":   "w_b0_init.txt",
        "rom_b1.coe":   "w_b1_init.txt",
        "rom_b2.coe":   "w_b2_init.txt",
        "rom_b3.coe":   "w_b3_init.txt",
        "rom_b4.coe":   "w_b4_init.txt",
        "rom_b5.coe":   "w_b5_init.txt",
        "rom_b6.coe":   "w_b6_init.txt",
        "rom_b7.coe":   "w_b7_init.txt",
        "rom_b8.coe":   "w_b8_init.txt",
        "rom_b9.coe":   "w_b9_init.txt",
        "rom_b10.coe":  "w_b10_init.txt",
        # 基函数文件映射
        "sp_rom_a.coe":  "sp_rom_a_init.txt",
        "sp_rom_b.coe":  "sp_rom_b_init.txt",
        "silu_rom.coe":  "silu_rom_init.txt"
    }

    print("开始清洗并转换 COE 文件...")
    
    converted_count = 0
    for coe_name, txt_name in name_map.items():
        if not os.path.exists(coe_name):
            print(f"[!] 找不到文件: {coe_name}，跳过。")
            continue

        with open(coe_name, 'r', encoding='utf-8') as f:
            content = f.read()

        # 核心清洗逻辑：提取 memory_initialization_vector= 后的数据段
        if "memory_initialization_vector=" not in content:
            print(f"[!] {coe_name} 格式不正确，无法提取向量数据。")
            continue

        data_part = content.split("memory_initialization_vector=")[1]
        
        # 移除逗号、分号并按空白符分割
        clean_data = data_part.replace(',', ' ').replace(';', ' ').split()

        # 写入目标 TXT 文件
        with open(txt_name, 'w', encoding='utf-8') as f:
            for val in clean_data:
                f.write(val + '\n')
        
        print(f"[√] 转换成功: {coe_name} -> {txt_name} ({len(clean_data)} 行)")
        converted_count += 1

    print(f"\n任务结束，共转换 {converted_count} 个文件。")
    print("提示：在 Verilog 仿真中建议使用绝对路径引用这些 .txt 文件。")

if __name__ == "__main__":
    clean_and_rename_coe()