module get_weight#(
    parameter       DATA_WIDTH = 16,
    parameter       NODE_WIDTH = 6,
    parameter       LAYER_WIDTH = 1,
    parameter       NODE_0      = 9,
    parameter       NODE_1      = 64
)(
    input           clk,
    input           rst_n,
    input           en,
    input   [2:0]   grid_index,
    input   [LAYER_WIDTH-1:0]  layer,
    input   [NODE_WIDTH-1:0]   node_in,
    input   [NODE_WIDTH-1:0]   node_out,

    output  [DATA_WIDTH-1:0]  w_silu,
    output  [DATA_WIDTH-1:0]  w_k0,
    output  [DATA_WIDTH-1:0]  w_k1,
    output  [DATA_WIDTH-1:0]  w_k2,
    output  [DATA_WIDTH-1:0]  w_k3
);
    wire [9:0] sp_addr;
    assign sp_addr = (layer == 1'b0)?(node_in * NODE_1 + node_out):((NODE_0 * NODE_1) + node_in);

    wire [DATA_WIDTH-1:0] w_b [0:10];

    w_silu u_w_silu (
    .clka(clk),    // input wire clka
    .ena(en),      // input wire ena
    .addra(sp_addr),  // input wire [9 : 0] addra
    .douta(w_silu)  // output wire [15 : 0] douta
    );
    w_b0 u_w_b0 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[0])  // output wire [15 : 0] douta
    );
    w_b1 u_w_b1 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[1])  // output wire [15 : 0] douta
    );
    w_b2 u_w_b2 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[2])  // output wire [15 : 0] douta
    );
    w_b3 u_w_b3 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[3])  // output wire [15 : 0] douta
    );
    w_b4 u_w_b4 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[4])  // output wire [15 : 0] douta
    );
    w_b5 u_w_b5 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[5])  // output wire [15 : 0] douta
    );
    w_b6 u_w_b6 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[6])  // output wire [15 : 0] douta
    );
    w_b7 u_w_b7 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[7])  // output wire [15 : 0] douta
    );
    w_b8 u_w_b8 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[8])  // output wire [15 : 0] douta
    );
    w_b9 u_w_b9 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[9])  // output wire [15 : 0] douta
    );
    w_b10 u_w_b10 (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(sp_addr),  // input wire [9 : 0] addra
        .douta(w_b[10])  // output wire [15 : 0] douta
    );
    assign w_k0 = w_b[{1'b0, grid_index}];
    assign w_k1 = w_b[{1'b0, grid_index}+1];
    assign w_k2 = w_b[{1'b0, grid_index}+2];
    assign w_k3 = w_b[{1'b0, grid_index}+3];
endmodule