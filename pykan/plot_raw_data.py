import os
import glob
import scipy.io as sio
import matplotlib.pyplot as plt

# =======================================================================
# 原始数据可视化诊断工具 (Raw Data Diagnostic Plotter)
# =======================================================================
# 面向 C++/MATLAB 用户的学习指南：
# 1. 这是一个独立的数据探查脚本 (EDA: Exploratory Data Analysis)。
# 2. matplotlib.pyplot 是 Python 界的标准绘图库，它的 API 设计极其模仿 MATLAB。
#    如果你熟悉 MATLAB 的 figure, plot, subplot, grid on, 那你会觉得非常亲切。
# 3. 强烈建议在跑模型前先运行此脚本。深度学习/硬件映射最怕“垃圾进，垃圾出 (GIGO)”。
#    如果原始传感器数据有断崖式跳变或全是 0，模型再好也没用。

def plot_raw_datasets():
    """
    遍历数据文件夹中的所有 .mat 文件，提取核心物理量并绘制时序曲线。
    """
    # 这里直接硬编码了数据目录。
    # 【拓展预留】：如果你的项目越来越大，建议改成从 config 导入：
    # from config import Config; data_dir = Config.DATA_DIR
    data_dir = './data/'
    
    # glob 类似于 C++ 中的目录遍历 (如 std::filesystem) 配合正则表达式，
    # 但 Python 中只需一行代码就能抓出所有特定后缀的文件。
    files = glob.glob(os.path.join(data_dir, '*.mat'))
    
    if not files:
        print(f"[!] 错误：在 {data_dir} 目录下没有找到任何 .mat 文件。请检查路径。")
        return
    
    # 修复 matplotlib 在显示负号 '-' 时可能出现的方块乱码问题
    plt.rcParams['axes.unicode_minus'] = False
    
    for file in files:
        file_name = os.path.basename(file)
        print(f"\n>>> 正在解析并绘制文件: {file_name}")
        
        # Python 中的 try...except 等同于 C++ 的 try...catch。
        # 在批量处理文件时必须加，防止某一个损坏的 .mat 文件导致整个脚本崩溃退出。
        try:
            # -------------------------------------------------------------------
            # 1. 数据读取与解析
            # -------------------------------------------------------------------
            # sio.loadmat 完全等价于 MATLAB 中的 load('xxx.mat')。
            mat = sio.loadmat(file)
            
            # MATLAB 保存的结构体 (struct) 传到 Python 会变成嵌套的 numpy 数组。
            # 这里的 [0, 0] 是为了剥离外层的无用维度，直接深入到真实数据区。
            meas = mat['meas'][0, 0]
            field_names = meas.dtype.names
            
            # 提取数组并展平 (flatten)，等价于 MATLAB 的 V = meas.Voltage(:)
            V = meas['Voltage'].flatten()
            I = meas['Current'].flatten()
            T_surf = meas['Battery_Temp_degC'].flatten()
            
            # 严格检查环境温度字段是否存在 (容错处理)
            has_chamber_temp = 'Chamber_Temp_degC' in field_names
            if has_chamber_temp:
                T_amb = meas['Chamber_Temp_degC'].flatten()
                print(f"  -> 检测到 Chamber_Temp_degC，包含环境温度数据。")
            else:
                T_amb = None
                print(f"  -> [缺失警告] 该文件没有 Chamber_Temp_degC 字段！将动态调整画板。")

            # -------------------------------------------------------------------
            # 2. 动态画板与子图分配 (Subplots)
            # -------------------------------------------------------------------
            # 【拓展预留】：如果你以后增加了新传感器（例如内阻 R_internal），
            # 这里只需将基础数量 3 改为 4，并在下面增加对应的 axes[3].plot(...)。
            num_plots = 4 if has_chamber_temp else 3
            
            # 创建一个包含 num_plots 行、1 列的画板。
            # figsize 控制图片的长宽比例，宽度固定 10，高度随子图数量动态伸缩。
            fig, axes = plt.subplots(num_plots, 1, figsize=(10, 3 * num_plots))
            
            # 如果只有一个子图，axes 不是数组；为了代码统一，通常在使用前确认其为数组。
            # 这里由于 num_plots 至少为 3，axes 肯定是一维数组，可以直接用索引访问。
            
            # 第一张图：电压
            axes[0].plot(V, color='#1f77b4') # 这里的颜色是 HEX 十六进制代码，UI 设计常用
            axes[0].set_title(f'[{file_name}] Voltage (V)')
            axes[0].grid(True, linestyle=':') # 添加虚线网格，方便肉眼对齐波峰波谷
            
            # 第二张图：电流
            axes[1].plot(I, color='#ff7f0e')
            axes[1].set_title('Current (A)')
            axes[1].grid(True, linestyle=':')
            
            # 第三张图：表面温度 (你的模型预测目标)
            axes[2].plot(T_surf, color='#d62728')
            axes[2].set_title('Battery Surface Temperature (degC)')
            axes[2].grid(True, linestyle=':')
            
            # 第四张图：环境温度 (按需绘制)
            if has_chamber_temp:
                axes[3].plot(T_amb, color='#9467bd')
                axes[3].set_title('Chamber Ambient Temperature (degC)')
                axes[3].grid(True, linestyle=':')
            
            # -------------------------------------------------------------------
            # 3. 图像保存与清理
            # -------------------------------------------------------------------
            # tight_layout 会自动调整子图的间距，防止标题和坐标轴互相重叠。
            plt.tight_layout()
            
            # 动态生成保存路径，并去掉原有的 .mat 后缀
            save_path = f"raw_data_plot_{file_name.replace('.mat', '')}.png"
            plt.savefig(save_path, dpi=200) # dpi=200 保证了图片的清晰度
            
            # C++ 习惯：内存管理。画完必须 close，否则每画一张图内存就会增加，直到 OOM 崩溃。
            plt.close()
            print(f"  -> [+] 图像已物理保存至: {save_path}")
            
        except Exception as e:
            # 捕捉一切导致崩溃的异常（如变量名拼写错误、MATLAB 文件损坏等）并打印
            print(f"  -> [!] 处理 {file_name} 时发生致命错误: {e}")

# Python 的标准入口点宏。
# 等价于 C++ 的 int main()。只有直接运行本脚本时，下面这行才会执行；
# 如果是被别的脚本 import，这里就不会执行。
if __name__ == '__main__':
    plot_raw_datasets()