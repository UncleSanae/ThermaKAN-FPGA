//双端B样条取值BRAM地址生成模块
//输入1位符号15位小数格式x，获取相对应与x和x+h，h-x和2h-x的两个BRAM地址
module addr_gen#(
    parameter                           DATAWIDTH = 16,
    parameter                           HBITS     = 2
)(
    input       [DATAWIDTH-1:0]         data,
    //x和x+h
    output      [DATAWIDTH-2-HBITS:0]   addr_1,
    //h-x和2h-x
    output      [DATAWIDTH-2-HBITS:0]   addr_2
);
    wire        [DATAWIDTH-1:0]         data_abs   =  ~data[DATAWIDTH-1:0]+1'b1;
    assign                              addr_1  =  (data[DATAWIDTH-1])?data_abs[DATAWIDTH-2-HBITS:0]:data[DATAWIDTH-2-HBITS:0];
    assign                              addr_2  =  (data[DATAWIDTH-1])?data[DATAWIDTH-2-HBITS:0]:data_abs[DATAWIDTH-2-HBITS:0];
endmodule
