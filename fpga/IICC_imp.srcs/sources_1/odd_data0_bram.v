module data0_bram#(
    parameter                   DATA_WIDTH  = 16,
    parameter                   ADDR_WIDTH  = 4,
    parameter                   LAYER_WIDTH = 1,
    parameter                   NODE_WIDTH  = 6 
)(
    input                       clk,
    input                       rst_n,
    input   [2:0]               next_state,
    input   [2:0]               state,
    input   [LAYER_WIDTH-1:0]   layer,
    input   [NODE_WIDTH-1:0]    node_in,
    input   [DATA_WIDTH-1:0]    data0_in,
    input   [3:0]               load_cnt,
    output  [DATA_WIDTH-1:0]    data0_out
);
    wire    [3:0]               addra = (load_cnt == 4'd0)?4'd0:load_cnt - 1'b1;
    wire    [3:0]               addrb = node_in[3:0];
    wire wea = (next_state == 3'd1 || state == 3'd1);
    wire enb = (state == 3'd2 && layer == 1'b0);
    data0_ram u_data0_ram (
        .clka(clk),    // input wire clka
        .ena(wea),      // input wire ena
        .wea(wea),      // input wire [0 : 0] wea
        .addra(addra),  // input wire [3 : 0] addra
        .dina(data0_in),    // input wire [15 : 0] dina
        .clkb(clk),    // input wire clkb
        .enb(enb),      // input wire enb
        .addrb(addrb),  // input wire [3 : 0] addrb
        .doutb(data0_out)  // output wire [15 : 0] doutb
    );
endmodule