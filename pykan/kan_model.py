import torch
import torch.nn as nn
import torch.nn.functional as F
from config import Config

# =======================================================================
# 核心模型定义 (Hardware-Aligned KAN Model)
# =======================================================================
# 面向 C++/MATLAB 用户的学习指南：
# 1. nn.Module 是 PyTorch 中所有神经网络组件的基类，类似于 C++ 的虚基类。
#    任何继承了它的类，只要实现了 __init__ 和 forward 两个方法，
#    PyTorch 就能利用自动求导引擎 (Autograd) 自动为你计算反向传播梯度。
# 2. 这个文件是我们整个工程的“硬件灵魂”。它彻底抛弃了第三方库，
#    用最底层的张量操作 100% 复刻了 FPGA 里的定点数乘加与截断逻辑。

class HardwareKANLayer(nn.Module):
    """
    自研硬件级 KAN 算子层 (对应 FPGA 中的一个计算 Stage)
    特点：固定网格、平移不变、无动态归一化、末端硬截断。
    """
    def __init__(self, in_features, out_features):
        super().__init__() # 必须调用父类构造函数
        self.in_features = in_features
        self.out_features = out_features
        
        # ---------------------------------------------------------------
        # 1. 硬件网格固化参数 (Fixed Hardware Grid)
        # ---------------------------------------------------------------
        # 网格步长固定为 0.25，11个控制点均匀分布在 [-1.25, 1.25]。
        # 【拓展预留】：如果你想增加拟合的细腻度，可以将步长缩小 (如 0.125)，
        # 并相应地增加控制点数量 (如 21)。这会导致导出的 CSV 列数变多。
        self.grid_step = 0.25
        centers = torch.linspace(-1.25, 1.25, 11)
        
        # register_buffer 的作用：将其注册为模型状态，随模型一起保存和加载，
        # 但它不是“权重”，不参与梯度更新。类似于硬件里写死的 ROM 常量。
        self.register_buffer("centers", centers)
        
        # ---------------------------------------------------------------
        # 2. 物理连线权重声明 (Trainable Parameters)
        # ---------------------------------------------------------------
        # nn.Parameter 告诉 PyTorch：这是一个需要求导、需要被优化器更新的变量。
        # base_weight: 基础线性路径的权重矩阵，维度 [输出维度, 输入维度]
        self.base_weight = nn.Parameter(torch.Tensor(out_features, in_features))
        
        # spline_weight: 样条路径的三维权重矩阵，维度 [输出, 输入, 11个控制点]
        # 在硬件里，这对应每条物理连线上的 11 个拉伸系数。
        self.spline_weight = nn.Parameter(torch.Tensor(out_features, in_features, 11))
        
        self.reset_parameters()
        
    def reset_parameters(self):
        """
        极限保守的初始化策略：防止初始 MAC (乘积累加) 冲破硬件的饱和区。
        如果不做这个，60 个通道的随机数加起来瞬间就会溢出，导致梯度死亡。
        """
        # 权重量级被死死压在 1 / 输入通道数 的范围内
        limit = 1.0 / self.in_features
        # uniform_ 产生均匀分布的随机数
        nn.init.uniform_(self.base_weight, -limit, limit)
        nn.init.uniform_(self.spline_weight, -limit, limit)

    def hw_b_spline_core(self, u):
        """
        硬件级核心算子：标准中心三次 B-样条 (Cubic B-Spline Basis)
        输入 u: 绝对相对距离 d / grid_step
        输出: 该距离下的基准激活值 (0 到 0.6667 之间)
        
        【硬件映射提示】：在 FPGA 里，绝对不要用 DSP 去实时算这个三次方程！
        你应该用 Python 写个脚本，把这个函数在 u ∈ [0, 2] 之间切成 256 份，
        算好结果存进单口 ROM 里。运行时直接根据距离 u 查表即可。
        """
        out = torch.zeros_like(u) # 初始化全 0 张量
        
        # 核心区：距离在 [0, 1) 的区间
        # Python 中的 & 是按位与，用于张量逻辑运算
        mask1 = (u >= 0) & (u < 1)
        out[mask1] = (1.0 / 6.0) * ((2 - u[mask1])**3 - 4 * (1 - u[mask1])**3)
        
        # 裙边区：距离在 [1, 2) 的区间
        mask2 = (u >= 1) & (u < 2)
        out[mask2] = (1.0 / 6.0) * ((2 - u[mask2])**3)
        
        # 距离 >= 2 时，结果依然是初始的 0 (局部支撑性)
        return out

    def forward(self, x):
        """
        前向传播逻辑：精确对应 FPGA 的一条数据流水线。
        传入的 x 已经是被上一层(或输入端)严格限制在 [-1, 1] 内的数据。
        """
        # 1. 基础路径 (Base Path)
        # 对应硬件：输入 -> 查 SiLU 表 -> 乘 base_weight
        base_out = F.linear(F.silu(x), self.base_weight)
        
        # 2. 样条路径并行展开 (Spline Path)
        # unsqueeze(-1) 相当于在最后加一个维度，利用广播机制 (Broadcasting)
        # 同时算出 x 到 11 个中心的绝对距离 u
        u = torch.abs(x.unsqueeze(-1) - self.centers) / self.grid_step
        
        # 算出所有输入的基准激活值
        bases = self.hw_b_spline_core(u)
        
        # einsum 是爱因斯坦求和约定，这里执行的是极其高效的批量矩阵乘加。
        # 对应硬件：基函数激活值 × 量化样条系数，然后在控制点维度(k)上累加。
        spline_out = torch.einsum('bik,oik->bo', bases, self.spline_weight)
        
        # 3. 汇总与硬件饱和截断 (Adder Tree & Saturation Register)
        # 对应硬件：加法树求和
        mac_sum = base_out + spline_out
        
        # ==========================================
        # 【核心约束】饱和输出寄存器 (Saturation)
        # 模拟硬件流水线最后一级的溢出截断模块。
        # 保证下一层吃进去的输入，绝对被锁死在 [-1, 1] 内。
        # ==========================================
        out_saturated = torch.clamp(mac_sum, min=-1.0, max=1.0)
        
        return out_saturated


class BatteryKAN(nn.Module):
    """
    网络容器：负责组装多层 HardwareKANLayer，并管理 Hook 监控。
    """
    def __init__(self):
        super().__init__()
        self.layer_stats = {} # 用于存储各层的动态物理极值
        
        # nn.ModuleList 相当于 C++ 的 std::vector<nn::Module*>
        # 它能确保里面的子模块被正确注册，其参数能被优化器找到。
        self.layers = nn.ModuleList()
        in_dim = Config.LAYERS[0]
        
        # 动态级联生成网络
        for out_dim in Config.LAYERS[1:]:
            self.layers.append(HardwareKANLayer(in_dim, out_dim))
            in_dim = out_dim

    def _get_hook(self, name):
        """
        探针生成器 (Probe Generator)
        类似于在 MATLAB Simulink 里拉一个 Scope 出来监测特定节点的信号。
        """
        def hook(module, input, output):
            # detach() 表示将张量从计算图里剥离出来，我们只读数值，不求导，节省内存
            in_val = input[0].detach()
            out_val = output.detach()
            
            # 持续累积并更新全局最值 (Global Min/Max)
            if name not in self.layer_stats:
                self.layer_stats[name] = {
                    "in_min": in_val.min().item(), "in_max": in_val.max().item(),
                    "out_min": out_val.min().item(), "out_max": out_val.max().item(),
                    "out_tensor": output # 注意这里没用 detach，为了留给 train.py 算越界惩罚梯度
                }
            else:
                self.layer_stats[name]["in_min"] = min(self.layer_stats[name]["in_min"], in_val.min().item())
                self.layer_stats[name]["in_max"] = max(self.layer_stats[name]["in_max"], in_val.max().item())
                self.layer_stats[name]["out_min"] = min(self.layer_stats[name]["out_min"], out_val.min().item())
                self.layer_stats[name]["out_max"] = max(self.layer_stats[name]["out_max"], out_val.max().item())
                self.layer_stats[name]["out_tensor"] = output 
        return hook

    def register_monitoring(self):
        """为所有级联层挂载探针"""
        for i, layer in enumerate(self.layers):
            layer.register_forward_hook(self._get_hook(f"Layer_{i}"))

    def get_parameter_groups(self):
        """
        【双线优化器的支柱】
        将所有参数扫描一遍，按名字分门别类，打包送给 train.py 里的不同优化器。
        """
        base_params, spline_params = [], []
        # named_parameters() 会递归遍历模型中所有的 nn.Parameter
        for name, param in self.named_parameters():
            if 'spline_weight' in name:
                spline_params.append(param)
            else:
                base_params.append(param)
        return base_params, spline_params

    def forward(self, x):
        """顺序流转计算"""
        for layer in self.layers:
            x = layer(x)
        return x