import torch
import torch.nn as nn
import torch.optim as optim
from torch.optim.lr_scheduler import OneCycleLR

from config import Config
from data_loader import load_and_preprocess_data
from kan_model import BatteryKAN

# =======================================================================
# 核心训练引擎 (Training Engine)
# =======================================================================
# 面向 C++/MATLAB 用户的学习指南：
# 1. 深度学习的训练本质上是一个极大规模的非线性优化问题（类似 MATLAB 的 fmincon）。
# 2. PyTorch 的训练循环通常是标准化的模板：
#    清空梯度 -> 前向传播 -> 算误差(Loss) -> 反向传播求导 -> 走一步更新权重。
# 3. 这个脚本专门为你加入了“硬件越界惩罚”和“权重硬锁死”逻辑，
#    这是把纯粹的数学算法拉回物理现实（定点数硬件）的关键。

def train_model():
    print(f"\n>>> 启动加速引擎: {Config.DEVICE}")
    
    # -------------------------------------------------------------------
    # 1. 数据与模型准备
    # -------------------------------------------------------------------
    # 我们在这里用不到测试集，所以用下划线 _ 忽略它，节省内存
    train_loader, _, scaler_x, scaler_y = load_and_preprocess_data()
    
    # 实例化模型并推送到显存/内存 (类似 MATLAB 的 gpuArray)
    model = BatteryKAN().to(Config.DEVICE)
    # 必须在此注册探针，否则等下算惩罚项时拿不到中间层输出
    model.register_monitoring() 
    
    # -------------------------------------------------------------------
    # 2. 误差函数与多优化器构建 (Dual-Optimizer Setup)
    # -------------------------------------------------------------------
    # MSELoss (均方误差)：用于衡量预测温度和真实温度的总体差距
    criterion = nn.MSELoss()
    
    # 获取被物理隔离的两组参数：基础权重 和 样条权重
    base_params, spline_params = model.get_parameter_groups()
    
    # 基础优化器：带强 L2 正则化 (weight_decay) 的 AdamW，用于压制 Base_Weight 的绝对值
    opt_base = optim.AdamW(base_params, lr=Config.LR_BASE, weight_decay=Config.WEIGHT_DECAY_BASE)
    # 样条优化器：纯粹的 Adam，赋予样条函数最大拟合自由度，不加衰减惩罚
    opt_spline = optim.Adam(spline_params, lr=Config.LR_SPLINE, weight_decay=Config.WEIGHT_DECAY_SPLINE)
    
    # -------------------------------------------------------------------
    # 3. 学习率动态调度器 (Learning Rate Schedulers)
    # -------------------------------------------------------------------
    # OneCycleLR 会让学习率在一个 Epoch 周期内“先预热升到最高，再缓慢退火到接近 0”。
    # 这种策略在初期能防止网络陷入局部死区，后期能精准收敛。
    sched_base = OneCycleLR(opt_base, max_lr=Config.LR_BASE, steps_per_epoch=len(train_loader), epochs=Config.EPOCHS)
    sched_spline = OneCycleLR(opt_spline, max_lr=Config.LR_SPLINE, steps_per_epoch=len(train_loader), epochs=Config.EPOCHS)
    
    # 【拓展预留】：如果你发现中间层虽然被压在 [-1, 1] 里，但是大量数据贴在 ±1 导致饱和截断，
    # 你可以把 PENALTY_WEIGHT 调大 (如 10, 20)，强迫网络输出收敛到 0 附近。
    PENALTY_WEIGHT = 5.0 

    print(">>> 启动硬件级严格约束训练 (自研平移不变 KAN 架构)...")
    
    # -------------------------------------------------------------------
    # 4. 主训练大循环 (Epoch Loop)
    # -------------------------------------------------------------------
    for epoch in range(1, Config.EPOCHS + 1):
        # 显式切换为训练模式 (在此模式下，Dropout 或 BatchNorm 才会生效，虽然我们没用，但是个好习惯)
        model.train()
        total_loss = 0
        
        # 遍历数据集里的每一个 Batch (批次)
        for batch_x, batch_y, _ in train_loader:
            # 将数据从 CPU 内存搬运到 GPU 显存
            batch_x, batch_y = batch_x.to(Config.DEVICE), batch_y.to(Config.DEVICE)
            
            # 【关键】PyTorch 默认会累加历史梯度，每次迭代前必须手动清零
            opt_base.zero_grad()
            opt_spline.zero_grad()
            
            # 正向推理预测温度
            pred = model(batch_x)
            
            # 基础误差：(预测温度 - 真实温度)^2
            mse_loss = criterion(pred, batch_y)
            
            # -----------------------------------------------------------
            # 【硬件核心】高压电网：中间激活值越界惩罚
            # -----------------------------------------------------------
            penalty_loss = 0.0
            
            # 为什么是 len(LAYERS) - 2？
            # 假设3层网络，索引为0,1。我们只管中间层(Layer_0)的数据是不是在[-1,1]内，
            # 而不用管最后一层(Layer_1)的输出，因为最后一层是实际物理温度的归一化结果。
            for i in range(len(Config.LAYERS) - 2):
                hidden_out = model.layer_stats[f'Layer_{i}']['out_tensor']
                
                # 数学逻辑：|x| - 1.0。如果数据落在安全区 [-1, 1] 里，结果为负数。
                # 经过 ReLU 后，负数变成 0，不产生惩罚。
                # 一旦 |x| > 1.0，ReLU 就会输出线性的越界幅度，直接叠加到 Loss 上。
                overflow = torch.relu(torch.abs(hidden_out) - 1.0)
                
                # 计算该层全批次越界的平均值
                penalty_loss += torch.mean(overflow) 
                
            # 总损失 = 拟合误差 + (惩罚系数 × 越界误差)
            loss = mse_loss + PENALTY_WEIGHT * penalty_loss
            
            # -----------------------------------------------------------
            # 【反向传播与优化】
            # -----------------------------------------------------------
            # 自动求导机制：一键计算所有参与图运算的权重的偏导数
            loss.backward()
            
            # 梯度裁剪：防止在训练早期因为数据波动导致梯度爆炸
            torch.nn.utils.clip_grad_norm_(base_params, Config.MAX_GRAD_NORM)
            torch.nn.utils.clip_grad_norm_(spline_params, Config.MAX_GRAD_NORM)
            
            # 优化器根据算出的梯度，迈出更新权重的一步
            opt_base.step()
            opt_spline.step()
            
            # ===========================================================
            # 【硬件级终极锁死】强制权重落在 Q1.15 [-1, 1] 定点数量程内
            # ===========================================================
            # with torch.no_grad(): 相当于告诉框架“暂停记录计算图，我要直接修改底层内存”。
            # 如果不加这句，强行 clamp 权重会引发梯度断裂报错。
            with torch.no_grad(): 
                for layer in model.layers:
                    layer.base_weight.clamp_(-1.0, 1.0)
                    layer.spline_weight.clamp_(-1.0, 1.0)
            
            # 调度器更新当前轮次下的学习率
            sched_base.step()
            sched_spline.step()
            
            # .item() 将单元素张量转换为 Python 原生浮点数，防止 GPU 显存泄漏
            total_loss += loss.item()
            
        # -------------------------------------------------------------------
        # 5. 日志打印
        # -------------------------------------------------------------------
        if epoch % 10 == 0 or epoch == 1:
            curr_lr_b = sched_base.get_last_lr()[0]
            curr_lr_s = sched_spline.get_last_lr()[0]
            print(f"Epoch [{epoch:4d}/{Config.EPOCHS}] | "
                  f"总 Loss: {total_loss/len(train_loader):.6f} | "
                  f"Base_LR: {curr_lr_b:.5f} | Spline_LR: {curr_lr_s:.5f}")
            
    # -------------------------------------------------------------------
    # 6. 模型导出固化
    # -------------------------------------------------------------------
    # state_dict() 返回一个包含模型所有权重参数的字典。
    # torch.save 将其序列化为二进制 .pth 文件，这是后续提权、部署的基石。
    # 【拓展预留】：如果想保存带有优化器状态的 checkpoint 用于断点续训，
    # 可以保存为 dict: torch.save({'model': model.state_dict(), 'opt': opt_base.state_dict()}, 'ckpt.pth')
    torch.save(model.state_dict(), 'kan_battery_weights.pth')
    print("\n[+] 训练完成！模型绝对物理约束权重已写入: kan_battery_weights.pth")

if __name__ == "__main__":
    train_model()