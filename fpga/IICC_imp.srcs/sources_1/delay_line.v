module delay_line #(
    //信号位宽
    parameter WIDTH  = 1,
    //延迟周期数   
    parameter STAGES = 1    
)(
    //时钟复位
    input                  clk,
    input                  rst_n,
    //输入输出
    input      [WIDTH-1:0] in_data,
    output     [WIDTH-1:0] out_data
);
    generate
        //无延迟
        if (STAGES == 0) begin : gen_no_delay
            assign out_data = in_data;
        end else begin : gen_delay
            //移位寄存器链
            reg [WIDTH-1:0] shift_reg [0:STAGES-1];
            integer i;
            always @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                    for (i = 0; i < STAGES; i = i + 1) begin
                        shift_reg[i] <= {WIDTH{1'b0}};
                    end
                end else begin
                    //第一级
                    shift_reg[0] <= in_data;
                    //后续级
                    for (i = 1; i < STAGES; i = i + 1) begin
                        shift_reg[i] <= shift_reg[i-1];
                    end
                end
            end
            //最后一级输出
            assign out_data = shift_reg[STAGES-1];
        end
    endgenerate
endmodule