module ram #(
    parameter DATA_WIDTH = 16,
    parameter ADDR_WIDTH = 6
)(
    input                       clk,
    input                       we,
    input      [ADDR_WIDTH-1:0] waddr,
    input      [DATA_WIDTH-1:0] wdata,
    input                       re,
    input      [ADDR_WIDTH-1:0] raddr,
    output reg [DATA_WIDTH-1:0] rdata
);
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram [0:(1<<ADDR_WIDTH)-1];
    always @(posedge clk) begin
        if (we) ram[waddr] <= wdata;
        if (re) rdata <= ram[raddr];
    end
endmodule