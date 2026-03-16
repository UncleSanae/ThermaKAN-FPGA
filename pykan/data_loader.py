import os
import glob
import random
import numpy as np
import scipy.io as sio
import torch
from torch.utils.data import Dataset, DataLoader
from config import Config

# =======================================================================
# 1. PyTorch 数据集接口定义 (Data Interface)
# =======================================================================
# 面向 C++/MATLAB 用户的学习指南：
# torch.utils.data.Dataset 类似于 C++ 中的纯虚类（接口）。
# 只要你重写了 __len__ (返回数据总长度) 和 __getitem__ (根据索引返回单条数据)，
# PyTorch 的底层 C++ 数据加载引擎就能自动通过多线程并发读取你的数据。
class BatteryDataset(Dataset):
    def __init__(self, x_data, y_data, t_data):
        # 预先将 NumPy 数组 (通常是 float64) 转换为 PyTorch 张量 (float32)。
        # 在深度学习和硬件映射中，float32 是标准精度，足以满足需求且节省内存。
        self.x = torch.tensor(x_data, dtype=torch.float32)
        self.y = torch.tensor(y_data, dtype=torch.float32)
        self.t = torch.tensor(t_data, dtype=torch.float32)

    def __len__(self):
        # 返回总样本数，DataLoader 靠这个来知道什么时候一个 Epoch 结束
        return len(self.x)

    def __getitem__(self, idx):
        # 每次被访问时，返回对应的 特征(x), 标签(y), 时间(t)
        return self.x[idx], self.y[idx], self.t[idx]

# =======================================================================
# 2. 硬件级固化归一化器 (Hardware-Aligned Scaler)
# =======================================================================
# 为什么不用 sklearn.preprocessing.MinMaxScaler？
# 动态 Scaler 会根据每次喂入的数据不同而改变归一化参数。对于固化到 FPGA 的系统，
# 你的 ADC (模数转换) 量程和映射常数必须是写死的。
class FixedScaler:
    def __init__(self, mins, maxs):
        self.data_min_ = np.array(mins, dtype=np.float32)
        self.data_max_ = np.array(maxs, dtype=np.float32)
        
    def transform(self, X):
        """
        正向归一化：将物理真实值映射到 [-1, 1] 的硬件工作区间。
        底层数学逻辑：$N = 2 \times \frac{X - X_{min}}{X_{max} - X_{min}} - 1$
        """
        scale = 2.0 / (self.data_max_ - self.data_min_)
        return (X - self.data_min_) * scale - 1.0
        
    def inverse_transform(self, X_norm):
        """
        反向归一化：将硬件预测的 [-1, 1] 结果还原回真实的物理量 (如 ℃)。
        """
        scale = (self.data_max_ - self.data_min_) / 2.0
        return (X_norm + 1.0) * scale + self.data_min_

# =======================================================================
# 3. 核心数据管道 (Data Pipeline)
# =======================================================================
def load_and_preprocess_data():
    """
    数据流处理流水线：读取 .mat -> 提取特征 -> 固化归一化 -> 滑动窗口截取 -> 封装 DataLoader
    """
    # 获取目录下所有的 .mat 文件
    files = glob.glob(os.path.join(Config.DATA_DIR, '*.mat'))
    if len(files) == 0:
        raise ValueError(f"在 {Config.DATA_DIR} 中未找到任何 .mat 文件。")
    
    # 用于缓存所有解析出的原始物理数据
    all_raw_features, all_raw_labels, all_raw_times = [], [], []
    
    # -------------------------------------------------------------------
    # 步骤 A：解析 MATLAB 数据结构
    # -------------------------------------------------------------------
    for file in files:
        mat = sio.loadmat(file)
        # 读取嵌套的 struct 结构。MATLAB 导出的 struct 在 Python 中通常会变成这种极其深度的嵌套。
        meas = mat['meas'][0, 0]
        field_names = meas.dtype.names
        
        # 提取核心数据。flatten() 类似 MATLAB 的 A(:)，将多维数组展平成一维向量。
        # nan_to_num 用于抹平传感器可能的断连/空值，替换为默认安全值。
        V = np.nan_to_num(meas['Voltage'].flatten(), nan=0.0)
        I = np.nan_to_num(meas['Current'].flatten(), nan=0.0)
        T_surf = np.nan_to_num(meas['Battery_Temp_degC'].flatten(), nan=25.0)
        
        # 鲁棒性检查：不同批次采集的数据可能缺失环境温度
        if 'Chamber_Temp_degC' in field_names:
            T_amb = np.nan_to_num(meas['Chamber_Temp_degC'].flatten(), nan=25.0)
        else:
            T_amb = np.full_like(V, 25.0)
            
        if 'Time' in field_names:
            time_arr = np.nan_to_num(meas['Time'].flatten(), nan=0.0)
        elif 't' in field_names:
            time_arr = np.nan_to_num(meas['t'].flatten(), nan=0.0)
        else:
            time_arr = np.arange(len(V), dtype=float)
            
        # 特征堆叠 (Feature Stacking)
        # np.column_stack 相当于 MATLAB 中的 [V, I, T_amb] 矩阵横向拼接。
        # 【拓展预留】：如果未来加入了内部温度 T_core，只需在这里改为 np.column_stack((V, I, T_amb, T_core))
        # 并同步修改 Config.BASE_FEATURES 的数量。
        features = np.column_stack((V, I, T_amb))
        # reshape(-1, 1) 相当于变回列向量，对应单一输出标签
        labels = T_surf.reshape(-1, 1)
        
        all_raw_features.append(features)
        all_raw_labels.append(labels)
        all_raw_times.append(time_arr)
        
    # -------------------------------------------------------------------
    # 步骤 B：执行绝对物理量程归一化
    # -------------------------------------------------------------------
    # 这里直接定义了传感器/ADC的极限范围，这对于硬件系统至关重要。
    # 电压V: [2.80, 4.3], 电流I: [-0.5, 3.5], 环境温度Tamb: [-10.0, 30.0]
    # 【拓展预留】：如果你的特征数组增加了维度，这里的 mins 和 maxs 列表也必须同步添加对应物理量的极值。
    scaler_x = FixedScaler(mins=[2.80, -0.5, -10.0], maxs=[4.3, 3.5, 30.0])
    # 目标表面温度T_surf 的归一化边界
    scaler_y = FixedScaler(mins=[24.0], maxs=[32.0])
    
    train_x_list, train_y_list, train_t_list = [], [], []
    
    # -------------------------------------------------------------------
    # 步骤 C：时间序列滑动窗口截取 (Sliding Window)
    # -------------------------------------------------------------------
    # 将长条状的时序数据，切成一段一段带有历史信息的片段，用来模拟系统的状态方程记忆。
    for features, labels, time_arr in zip(all_raw_features, all_raw_labels, all_raw_times):
        # 针对当前电池文件的数据，进行全量归一化
        scaled_features = scaler_x.transform(features)
        scaled_labels = scaler_y.transform(labels)
        
        # 滑动截取
        for i in range(len(scaled_features) - Config.SEQ_LEN):
            # 取从 i 到 i+SEQ_LEN 的特征段，展平成一维向量 (这也是 Config.INPUT_DIM 的由来)
            train_x_list.append(scaled_features[i : i + Config.SEQ_LEN].flatten())
            # 标签对应的是这一个时间窗【末尾】的物理状态
            train_y_list.append(scaled_labels[i + Config.SEQ_LEN - 1])
            train_t_list.append(time_arr[i + Config.SEQ_LEN - 1])
            
    # 将切片封装进 DataLoader。它会自动处理打乱 (shuffle) 和打包 (batching)。
    train_loader = DataLoader(
        BatteryDataset(np.array(train_x_list), np.array(train_y_list), np.array(train_t_list)), 
        batch_size=Config.BATCH_SIZE, shuffle=True
    )
    
    # -------------------------------------------------------------------
    # 步骤 D：分离测试集 (Hold-out Test Set)
    # -------------------------------------------------------------------
    # 随机抽取指定数量的文件作为纯净测试集，不参与训练。
    test_files_indices = random.sample(range(len(files)), min(Config.TEST_FILES_COUNT, len(files)))
    test_loaders = {}
    
    for idx in test_files_indices:
        file_name = os.path.basename(files[idx])
        
        # 提取与转换测试集（不参与切片混合，保持独立文件结构供后续可视化使用）
        features = all_raw_features[idx]
        labels = all_raw_labels[idx]
        time_arr = all_raw_times[idx]
        
        scaled_features = scaler_x.transform(features)
        scaled_labels = scaler_y.transform(labels)
        
        t_x_list, t_y_list, t_t_list = [], [], []
        for i in range(len(scaled_features) - Config.SEQ_LEN):
            t_x_list.append(scaled_features[i : i + Config.SEQ_LEN].flatten())
            t_y_list.append(scaled_labels[i + Config.SEQ_LEN - 1])
            t_t_list.append(time_arr[i + Config.SEQ_LEN - 1])
            
        # 测试集切忌使用 shuffle=True，否则画出来的物理曲线时间轴会是完全错乱的
        test_loaders[file_name] = DataLoader(
            BatteryDataset(np.array(t_x_list), np.array(t_y_list), np.array(t_t_list)), 
            batch_size=Config.BATCH_SIZE, shuffle=False
        )
        
    return train_loader, test_loaders, scaler_x, scaler_y