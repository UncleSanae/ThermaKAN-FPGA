
import pybamm
import pandas as pd
import numpy as np
import uuid
import os

# 使用我们对齐好的参数
parameter_values = pybamm.ParameterValues("Chen2020")
parameter_values.update({
    "Nominal cell capacity [A.h]": 3.0,
    "Voltage cut-off [V]": 2.5,
    "Upper voltage cut-off [V]": 4.2,
    "Initial temperature [K]": 273.15 + 25,
    "Ambient temperature [K]": 273.15 + 25,
    "Current function [A]": 3.0,

    # 1. 强力提压：大幅降低负极初始浓度，提高正极初始浓度
    # 这一步能把起始电压从 3.8V 顶到 4.15V 附近
    "Initial concentration in negative electrode [mol.m-3]": 33000, # 调低负极浓度以降低其电位
    "Initial concentration in positive electrode [mol.m-3]": 14500, # 调高正极浓度以提高其电位

    # 2. 强力拉长：增加电极宽度和并联数
    # 如果现在只有 2.0Ah，我们需要增加约 50% 的活性面积
    "Electrode width [m]": 0.1, # 从 0.1 增加到 0.15
    "Number of electrodes connected in parallel to make a cell": 11, # 从 10 增加到 12

    # 3. 细节微调：减小接触电阻，让起始阶段不掉压
    "Contact resistance [Ohm]": 0.0, 

    # 4. 保持斜率：既然斜率对了，扩散系数保持在 2e-15 附近
    "Negative particle diffusivity [m2.s-1]": 2e-15, 
    "Positive particle diffusivity [m2.s-1]": 2e-15,
    }, check_already_exists=False)

def generate_dataset(num_samples=100):
    dataset = []
    
    for i in range(num_samples):
        # 随机环境温度 (-10C 到 40C)
        temp = 273.15 + np.random.uniform(-10, 40)
        parameter_values.update({"Ambient temperature [K]": temp})

        # 【关键修改】：将电池初始状态设为 0% SOC (亏电态)        
        # 这样充电指令才能生效，产生完整的充电曲线        
        parameter_values.update({            
            "Initial concentration in negative electrode [mol.m-3]": 500,  
            # 负极几乎没锂            
            "Initial concentration in positive electrode [mol.m-3]": 33000, 
            # 锂都在正极        
        })
        
        # 随机决定是正常还是攻击 (50% 概率)
        is_attack = np.random.choice([0, 1])
        
        if is_attack == 0:
            # 正常充电工况：恒流恒压 (CC-CV)
            experiment = pybamm.Experiment(["Charge at 1C until 4.2V", "Hold at 4.2V until 0.05C"])
        else:
            # 模拟 FDI 攻击：在充电电流中加入 5% 的随机抖动
            # 这里可以用自定义电流函数实现，简单起见我们模拟一个过热攻击
            experiment = pybamm.Experiment(["Charge at 1.5C until 4.3V"]) # 故意提高截止电压模拟过充
            
        try:
            model = pybamm.lithium_ion.DFN({"thermal": "lumped"})
            sim = pybamm.Simulation(model, parameter_values=parameter_values, experiment=experiment)
            sol = sim.solve()
            
            # 提取 KAN 需要的特征：电压、电流、表面温度、核心温度
            df = pd.DataFrame({
                "Voltage [V]": sol["Terminal voltage [V]"].data,
                "Current [A]": sol["Current [A]"].data,
                "Surface_Temp [C]": sol["Surface temperature [K]"].data - 273.15,
                "Core_Temp [C]": sol["X-averaged cell temperature [K]"].data - 273.15,
                "Label": is_attack
            })
            dataset.append(df)
            print(f"样本 {i} 生成成功, 标签: {is_attack}")
        except:
            continue

    # 合并并保存
    final_df = pd.concat(dataset)
    final_df.to_csv("kan_test_dataset.csv", index=False)

#generate_dataset(200)


def generate_large_dataset(target_samples=150):
    all_data = []
    output_file = "kan_training_data_large.csv"
    
    # 预设对齐好的参数（使用你之前调好的 Chen2020 参数）
    model = pybamm.lithium_ion.DFN({"thermal": "lumped"})
    
    for i in range(target_samples):
        # 1. 随机化环境因子 (增加数据集多样性)
        temp = 273.15 + np.random.uniform(5, 40) # 5C 到 40C
        parameter_values.update({"Ambient temperature [K]": temp})
        
        # 2. 初始状态：设为亏电态 (SOC=0) 确保有完整的充电过程
        parameter_values.update({
            "Initial concentration in negative electrode [mol.m-3]": 500, 
            "Initial concentration in positive electrode [mol.m-3]": 33000,
        })

        # 3. 随机生成正常(0)或攻击(1)工况
        is_attack = np.random.choice([0, 1])
        if is_attack == 0:
            # 正常：1C 充到 4.2V
            experiment = pybamm.Experiment(["Charge at 1C until 4.2V", "Hold at 4.2V until 0.05C"])
        else:
            # 攻击：模拟 2C 恶意快充且过充到 4.4V
            experiment = pybamm.Experiment(["Charge at 2C until 4.4V"])

        try:
            sim = pybamm.Simulation(model, parameter_values=parameter_values, experiment=experiment)
            # t_eval 控制采样点数量，确保每个样本有足够行数
            sol = sim.solve() 
            
            # 提取特征
            # 提取特征时增加 Ambient_Temp
            df = pd.DataFrame({
                "Voltage [V]": sol["Terminal voltage [V]"].data,
                "Current [A]": sol["Current [A]"].data,
                "Surface_Temp [C]": sol["Surface temperature [K]"].data - 273.15,
                "Core_Temp [C]": sol["X-averaged cell temperature [K]"].data - 273.15,
                "Ambient_Temp [C]": temp - 273.15,  # 【新增】存储当前样本的环境温度
                "Label": is_attack
            })

            
            # 4. 每生成一个样本就追加写入 CSV（避免内存溢出）
            if not os.path.isfile(output_file):
                df.to_csv(output_file, index=False)
            else:
                df.to_csv(output_file, mode='a', header=False, index=False)
                
            print(f"已完成样本 {i+1}/{target_samples}, 当前总行数估计: {(i+1)*600}")
            
        except Exception as e:
            print(f"样本 {i} 失败: {e}")
            continue

    print(f"数据集生成完毕！文件保存为: {output_file}")

# 开始生成
generate_large_dataset(150)
