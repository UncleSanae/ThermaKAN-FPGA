<div align="center">

<img src="./assets/7ba109dfa9ec8a13a152bdcab103918fa1ecc0da.jpg" alt="Project Mascot" width="800">

# ThermaKAN-FPGA

[![FPGA](https://img.shields.io/badge/FPGA-Kintex--7-orange.svg)](https://github.com/)
[![EDA](https://img.shields.io/badge/Tool-Vivado-blue.svg)](https://github.com/)
[![HDL](https://img.shields.io/badge/HDL-Verilog-green.svg)](https://github.com/)
[![Algorithm](https://img.shields.io/badge/Algorithm-PyTorch-EE4C2C.svg)](https://github.com/)
[![Python](https://img.shields.io/badge/Language-Python-3776AB.svg)](https://github.com/)

**基于 FPGA 的 KAN (Kolmogorov-Arnold Network) 电池温度预测硬件实现**

</div>

---

## 项目简介

本项目实现了一个用于预测电池表面温度的 KAN 硬件加速器。工程包含完整的软硬件协同开发流程：
1. **软件端**：基于 PyTorch 搭建平移不变的 KAN 网络，完成数据处理、模型训练以及 Q1.15 定点数防溢出约束。
2. **硬件端**：提取十六进制权重与离散化激活函数（LUT），在 Kintex-7 平台上基于 Verilog 完成底层算子的 RTL 设计与部署。

## 目录结构

- `algorithm/`：Python 算法工程。包含模型训练、定点数量化仿真测试，以及生成 `.mem` 硬件初始化文件的提取脚本。
- `fpga/`：FPGA 硬件工程。包含 Verilog 源码、Testbench 仿真文件及 Vivado 综合工程（待上传）。
- `assets/`：项目展示图与文档资源。
