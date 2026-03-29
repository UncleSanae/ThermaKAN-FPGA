module data2_bram#(
    parameter DATA_WIDTH = 16
)(
    input                       clk,
    input                       rst_n,
    //写使能
    input                       wr_en,
    //数据接口    
    input      [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_out <= {DATA_WIDTH{1'b0}};
        end else begin
            if (wr_en) begin
                data_out <= data_in;
            end
        end
    end 
endmodule