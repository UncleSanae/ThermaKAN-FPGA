//输入16位数字，输出对应网格索引
module grid_index_gen#(
    parameter                           DATA_WIDTH = 16,
    parameter                           HBITS     = 2,
    parameter                           GRID      = 8
)(
    input       [DATA_WIDTH-1:0]         data,
    //网格索引
    output      [2:0]   grid_index
);
    assign              grid_index = (GRID/2) + ($signed(data) >>> (15-HBITS));
endmodule