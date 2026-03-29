module adder#(
    parameter DATA_WIDTH = 16,
    //22位加法器
    parameter ACC_WIDTH  = 22
)(
    //时钟与复位
    input                           clk,
    input                           rst_n,
    //使能信号
    input                           en_d2,
    //乘法器输入节点
    input      [DATA_WIDTH-1:0]     mult_out_k0,
    input      [DATA_WIDTH-1:0]     mult_out_k1,
    input      [DATA_WIDTH-1:0]     mult_out_k2,
    input      [DATA_WIDTH-1:0]     mult_out_k3,
    input      [DATA_WIDTH-1:0]     mult_out_silu,
    //历史数据
    input      [ACC_WIDTH-1:0]      history_data,
    //输出
    output reg [ACC_WIDTH-1:0]      add_out
);
    //22位全精度有符号累加
    wire signed [ACC_WIDTH-1:0] full_sum = $signed(mult_out_k0) + 
                                           $signed(mult_out_k1) + 
                                           $signed(mult_out_k2) + 
                                           $signed(mult_out_k3) + 
                                           $signed(mult_out_silu) + 
                                           $signed(history_data);
    //时序逻辑
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            add_out <= {ACC_WIDTH{1'b0}};
        end else begin
            if(en_d2) begin
                add_out <= full_sum;
            end 
            else begin
                add_out <= add_out;
            end
        end
    end
endmodule