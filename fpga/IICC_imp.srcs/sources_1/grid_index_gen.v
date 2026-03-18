//输入16位数字，输出对应网格索引
module grid_index_gen#(
    parameter                           DATAWIDTH = 16,
    parameter                           HBITS     = 2,
    parameter                           GRID      = 8
)(
    input       [DATAWIDTH-1:0]         data,
    //网格索引
    output      [3:0]   grid_index
);
    assign              grid_index = (GRID/2) + ($signed(data) >>> (15-HBITS));
endmodule