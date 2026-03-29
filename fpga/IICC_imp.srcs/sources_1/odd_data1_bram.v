module data1_bram#(
    parameter                   DATA_WIDTH  = 16,
    parameter                   LAYER_WIDTH = 1,
    parameter                   NODE_WIDTH  = 6 
)(
    input                       clk,
    input                       rst_n,
    
    input  [LAYER_WIDTH-1:0]    layer,
    input  [LAYER_WIDTH-1:0]    layer_d3,

    input                       en_d1,
    input                       en_re,

    input  [2:0]                state_d3,

    input  [NODE_WIDTH-1:0]     node_in,

    input  [NODE_WIDTH-1:0]     node_out_d1,
    input  [NODE_WIDTH-1:0]     node_out_d3,

    input  [DATA_WIDTH-1:0]     data1_in,
    output [DATA_WIDTH-1:0]     data1_out
);
    wire                        ena    = (layer)?en_re:en_d1;    
    wire [5:0] addra = (layer)? node_in[5:0] : node_out_d1[5:0];
    wire                        enb    = (layer_d3)?1'b0:(state_d3 == 3'd3 || state_d3 == 3'd4);
    wire [5:0] addrb = node_out_d3[5:0];
    wire [DATA_WIDTH-1:0] doutb;            
    data1_ram u_data1_ram (
        .clka(clk),    // input wire clka
        .ena(ena),      // input wire ena
        .wea(1'b0),      // input wire [0 : 0] wea
        .addra(addra),  // input wire [5 : 0] addra
        .dina(16'h0000),    // input wire [15 : 0] dina
        .douta(data1_out),  // output wire [15 : 0] douta

        .clkb(clk),    // input wire clkb
        .enb(enb),      // input wire enb
        .web(enb),      // input wire [0 : 0] web
        .addrb(addrb),  // input wire [5 : 0] addrb
        .dinb(data1_in),    // input wire [15 : 0] dinb
        .doutb(doutb)  // output wire [15 : 0] doutb
    );
endmodule