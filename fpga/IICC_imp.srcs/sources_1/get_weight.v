module get_weight#(
    parameter DATA_WIDTH  = 16,
    parameter NODE_WIDTH  = 7,
    parameter LAYER_WIDTH = 2,
    parameter MAX_LAYERS  = 2,
    parameter [(MAX_LAYERS+1)*NODE_WIDTH-1:0] TOPOLOGY = {7'd1, 7'd64, 7'd9},
    parameter [MAX_LAYERS*16-1:0] BASE_ADDR = {16'd576, 16'd0}
)(
    input                       clk,
    input                       rst_n,
    input                       en,
    input      [2:0]            grid_index,
    input      [LAYER_WIDTH-1:0]layer,
    input      [NODE_WIDTH-1:0] node_in,
    input      [NODE_WIDTH-1:0] node_out,

    output     [DATA_WIDTH-1:0] w_silu,
    output     [DATA_WIDTH-1:0] w_k0,
    output     [DATA_WIDTH-1:0] w_k1,
    output     [DATA_WIDTH-1:0] w_k2,
    output     [DATA_WIDTH-1:0] w_k3
);

    wire [15:0] base [0:MAX_LAYERS-1];
    wire [NODE_WIDTH-1:0] out_nodes [0:MAX_LAYERS-1];
    genvar i;
    generate
        for(i = 0; i < MAX_LAYERS; i = i + 1) begin : gen_param
            assign base[i] = BASE_ADDR[i*16 +: 16];
            assign out_nodes[i] = TOPOLOGY[(i+1)*NODE_WIDTH +: NODE_WIDTH];
        end
    endgenerate

    wire [15:0] sp_addr = base[layer] + node_in * out_nodes[layer] + node_out;

    wire [DATA_WIDTH-1:0] w_b [0:10];
    w_silu u_w_silu (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_silu));
    w_b0   u_w_b0   (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[0]));
    w_b1   u_w_b1   (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[1]));
    w_b2   u_w_b2   (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[2]));
    w_b3   u_w_b3   (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[3]));
    w_b4   u_w_b4   (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[4]));
    w_b5   u_w_b5   (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[5]));
    w_b6   u_w_b6   (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[6]));
    w_b7   u_w_b7   (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[7]));
    w_b8   u_w_b8   (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[8]));
    w_b9   u_w_b9   (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[9]));
    w_b10  u_w_b10  (.clka(clk), .ena(en), .addra(sp_addr), .douta(w_b[10]));

    assign w_k0 = w_b[{1'b0, grid_index}];
    assign w_k1 = w_b[{1'b0, grid_index} + 1];
    assign w_k2 = w_b[{1'b0, grid_index} + 2];
    assign w_k3 = w_b[{1'b0, grid_index} + 3];

endmodule