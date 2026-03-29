module data2_bram#(
    parameter       DATA_WIDTH = 16
)(
    input                    clk,
    input                    rst_n,
    input                    en,
    input                    enr,
    input                    enw,
    
    input  [DATA_WIDTH-1:0]  data2_in,
    output reg [DATA_WIDTH-1:0]  data2_out
);
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            data2_out <= 16'h0000;
        end
        else begin
            if(en)begin
                if(enw)begin
                    data2_out <= data2_in;
                end
                else begin
                    data2_out <= data2_out;
                end
            end
            else begin
                data2_out <= data2_out;
            end
        end
    end 
endmodule