<div align="center">

<img src="./assets/mascot.png" alt="Project Mascot" width="400">

# Miracle-KAN: Hardware-Aligned Thermal Predictor

[![Hardware](https://img.shields.io/badge/Hardware-FPGA-blue.svg)](https://github.com/)
[![Quantization](https://img.shields.io/badge/Quantization-Q1.15-red.svg)](https://github.com/)
[![Network](https://img.shields.io/badge/Architecture-KAN-green.svg)](https://github.com/)

**一个完全抛弃乘法器、基于纯纯查表与加法树的 KAN (Kolmogorov-Arnold Network) 硬件加速器。**

</div>

---

## ⚡ Core Features

- **Hardware-In-The-Loop Simulation**: 包含完整的 FP32 全精度与 Q1.15 十六位定点数双线前向推理模拟，精确预测定点化带来的截断误差。
- **Multiplier-Free Architecture**: 在底层硬件映射中完全移除了多项式计算，B-样条与 SiLU 激活函数全部坍缩为 256 深度的静态只读存储器 (ROM) 查表。
- **Strict Physical Constraint**: 训练端内置 L1 越界惩罚与权重绝对锁死机制，从源头扼杀加法树溢出，确保网络流转数据 100% 贴合 `[-1, 1]` 硬件量程。

## 📁 Repository Structure

- `kan_model.py` / `train.py`: 带有物理级约束的自研平移不变 KAN 网络训练框架。
- `evaluate.py`: FP32 vs Q1.15 定点数精度压测与热动力学误差分析工具。
- `extract_weights.py`: 自动化提权脚本。直接将 `.pth` 模型解析为 FPGA 友好的 `.mem` 十六进制补码初始化文件。

## 🚀 Quick Start

```bash
# 1. 执行全精度模型训练与硬件边界约束
python train.py

# 2. 生成双精度评测报告与拟合曲线
python evaluate.py

# 3. 提取十六进制硬件初始化流 (LUTs & MAC Weights)
python extract_weights.py