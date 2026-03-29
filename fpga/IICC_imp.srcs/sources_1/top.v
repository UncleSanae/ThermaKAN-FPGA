module top#(
    parameter DATA_WIDTH  = 16,
    parameter ACC_WIDTH   = 22,
    parameter LAYER_WIDTH = 2,
    parameter NODE_WIDTH  = 7,
    parameter MAX_LAYERS  = 2,
    parameter [(MAX_LAYERS+1)*NODE_WIDTH-1:0] TOPOLOGY = {7'd1, 7'd64, 7'd9},
    parameter [MAX_LAYERS*16-1:0] BASE_ADDR = {16'd576, 16'd0},
    parameter HBITS       = 2,
    parameter GRID        = 8,
    parameter PIPE_STAGES = 5
)(
    input                       sys_clk,
    input                       rst_n,
    input                       start,
    input      [DATA_WIDTH-1:0] data_in,
    output     [DATA_WIDTH-1:0] data_out
);

    wire [1:0] fsm_state;
    wire       calc_en, fsm_done, all_done;
    reg  [3:0] load_cnt;
    wire       load_done = (load_cnt == 4'd9);

    always@(posedge sys_clk or negedge rst_n)begin
        if(!rst_n) load_cnt <= 4'd0;
        else if(fsm_state == 2'd1 || start) begin 
            if(!load_done) load_cnt <= load_cnt + 1'b1;
        end else load_cnt <= 4'd0;
    end

    fsm u_fsm(
        .clk(sys_clk), .rst_n(rst_n), .start(start), .load_done(load_done),
        .calc_en(calc_en), .all_done(all_done), .fsm_done(fsm_done), .current_state(fsm_state)
    );

    wire [LAYER_WIDTH-1:0] layer;
    wire [NODE_WIDTH-1:0]  node_in, node_out;
    wire                   layer_valid;

    addr_ctrl #(
        .LAYER_WIDTH(LAYER_WIDTH), .NODE_WIDTH(NODE_WIDTH), .MAX_LAYERS(MAX_LAYERS),
        .TOPOLOGY(TOPOLOGY), .PIPE_STAGES(PIPE_STAGES)
    ) u_addr_ctrl (
        .clk(sys_clk), .rst_n(rst_n), .calc_en(calc_en), .layer(layer),
        .node_in(node_in), .node_out(node_out), .layer_valid(layer_valid), .all_done(all_done)
    );

    wire [LAYER_WIDTH-1:0] layer_d1, layer_d2, layer_d3, layer_d4;
    wire [NODE_WIDTH-1:0]  node_in_d1, node_in_d2, node_in_d3;
    wire [NODE_WIDTH-1:0]  node_out_d1, node_out_d2, node_out_d3, node_out_d4;
    wire                   en_d1, en_d2, en_d3, en_d4;

    delay_line #(.WIDTH(LAYER_WIDTH), .STAGES(1)) u_lyr1 (.clk(sys_clk), .rst_n(rst_n), .in_data(layer), .out_data(layer_d1));
    delay_line #(.WIDTH(LAYER_WIDTH), .STAGES(2)) u_lyr2 (.clk(sys_clk), .rst_n(rst_n), .in_data(layer), .out_data(layer_d2));
    delay_line #(.WIDTH(LAYER_WIDTH), .STAGES(3)) u_lyr3 (.clk(sys_clk), .rst_n(rst_n), .in_data(layer), .out_data(layer_d3));
    delay_line #(.WIDTH(LAYER_WIDTH), .STAGES(4)) u_lyr4 (.clk(sys_clk), .rst_n(rst_n), .in_data(layer), .out_data(layer_d4));

    delay_line #(.WIDTH(NODE_WIDTH), .STAGES(1)) u_nin1 (.clk(sys_clk), .rst_n(rst_n), .in_data(node_in), .out_data(node_in_d1));
    delay_line #(.WIDTH(NODE_WIDTH), .STAGES(2)) u_nin2 (.clk(sys_clk), .rst_n(rst_n), .in_data(node_in), .out_data(node_in_d2));
    delay_line #(.WIDTH(NODE_WIDTH), .STAGES(3)) u_nin3 (.clk(sys_clk), .rst_n(rst_n), .in_data(node_in), .out_data(node_in_d3));

    delay_line #(.WIDTH(NODE_WIDTH), .STAGES(1)) u_nout1 (.clk(sys_clk), .rst_n(rst_n), .in_data(node_out), .out_data(node_out_d1));
    delay_line #(.WIDTH(NODE_WIDTH), .STAGES(2)) u_nout2 (.clk(sys_clk), .rst_n(rst_n), .in_data(node_out), .out_data(node_out_d2));
    delay_line #(.WIDTH(NODE_WIDTH), .STAGES(3)) u_nout3 (.clk(sys_clk), .rst_n(rst_n), .in_data(node_out), .out_data(node_out_d3));
    delay_line #(.WIDTH(NODE_WIDTH), .STAGES(4)) u_nout4 (.clk(sys_clk), .rst_n(rst_n), .in_data(node_out), .out_data(node_out_d4));

    delay_line #(.WIDTH(1), .STAGES(1)) u_en1 (.clk(sys_clk), .rst_n(rst_n), .in_data(layer_valid), .out_data(en_d1));
    delay_line #(.WIDTH(1), .STAGES(2)) u_en2 (.clk(sys_clk), .rst_n(rst_n), .in_data(layer_valid), .out_data(en_d2));
    delay_line #(.WIDTH(1), .STAGES(3)) u_en3 (.clk(sys_clk), .rst_n(rst_n), .in_data(layer_valid), .out_data(en_d3));
    delay_line #(.WIDTH(1), .STAGES(4)) u_en4 (.clk(sys_clk), .rst_n(rst_n), .in_data(layer_valid), .out_data(en_d4));

    //==========================================
    //缓存架构
    //==========================================
    wire [DATA_WIDTH-1:0] input_rdata;
    ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(4)) u_input_ram (
        .clk(sys_clk), .we(fsm_state == 2'd1 || start), .waddr(load_cnt), .wdata(data_in),
        .re(1'b1), .raddr(node_in[3:0]), .rdata(input_rdata)
    );

    wire [ACC_WIDTH-1:0] ping_rdata, pong_rdata;
    wire [ACC_WIDTH-1:0] add_out;
    
    wire ping_we = en_d4 && (layer_d4[0] == 1'b0);
    wire pong_we = en_d4 && (layer_d4[0] == 1'b1);

    wire [5:0] ping_raddr = (layer[0] == 1'b1) ? node_in[5:0] : node_out_d2[5:0];
    wire [5:0] pong_raddr = (layer[0] == 1'b0) ? node_in[5:0] : node_out_d2[5:0];

    ram #(.DATA_WIDTH(ACC_WIDTH), .ADDR_WIDTH(6)) u_ping_ram(
        .clk(sys_clk), .we(ping_we), .waddr(node_out_d4[5:0]), .wdata(add_out),
        .re(1'b1), .raddr(ping_raddr), .rdata(ping_rdata)
    );

    ram #(.DATA_WIDTH(ACC_WIDTH), .ADDR_WIDTH(6)) u_pong_ram(
        .clk(sys_clk), .we(pong_we), .waddr(node_out_d4[5:0]), .wdata(add_out),
        .re(1'b1), .raddr(pong_raddr), .rdata(pong_rdata)
    );

    wire signed [ACC_WIDTH-1:0] sping = ping_rdata;
    wire signed [ACC_WIDTH-1:0] spong = pong_rdata;
    wire [DATA_WIDTH-1:0] clamped_ping = (sping > 22'sd32767) ? 16'h7FFF : (sping < -22'sd32768) ? 16'h8000 : sping[15:0];
    wire [DATA_WIDTH-1:0] clamped_pong = (spong > 22'sd32767) ? 16'h7FFF : (spong < -22'sd32768) ? 16'h8000 : spong[15:0];

    wire [DATA_WIDTH-1:0] sp_data_in = (layer_d1 == 0) ? input_rdata : (layer_d1[0] == 1'b1) ? clamped_ping : clamped_pong;
    wire [ACC_WIDTH-1:0] history_data = (node_in_d3 == 0) ? 0 : (layer_d3[0] == 1'b0) ? ping_rdata : pong_rdata;

    //==========================================
    //运算流水线
    //==========================================
    wire [2:0]            grid_index, grid_index_d1;
    wire [DATA_WIDTH-1:0] o_data_k0, o_data_k1, o_data_k2, o_data_k3, silu;
    
    sp_gen u_sp_gen (
        .clk(sys_clk), .rst_n(rst_n), .en(en_d1), .data_in(sp_data_in), .grid_index(grid_index),
        .o_data_k0(o_data_k0), .o_data_k1(o_data_k1), .o_data_k2(o_data_k2), .o_data_k3(o_data_k3), .silu(silu)
    );

    delay_line #(.WIDTH(3), .STAGES(1)) u_dly_grid (.clk(sys_clk), .rst_n(rst_n), .in_data(grid_index), .out_data(grid_index_d1));

    wire [DATA_WIDTH-1:0] w_silu, w_k0, w_k1, w_k2, w_k3;
    get_weight #(
        .LAYER_WIDTH(LAYER_WIDTH), .NODE_WIDTH(NODE_WIDTH), .MAX_LAYERS(MAX_LAYERS), .TOPOLOGY(TOPOLOGY), .BASE_ADDR(BASE_ADDR)
    ) u_get_weight (
        .clk(sys_clk), .rst_n(rst_n), .en(en_d1), .grid_index(grid_index_d1),
        .layer(layer_d1), .node_in(node_in_d1), .node_out(node_out_d1),
        .w_silu(w_silu), .w_k0(w_k0), .w_k1(w_k1), .w_k2(w_k2), .w_k3(w_k3)
    );

    wire [DATA_WIDTH-1:0] mk0, mk1, mk2, mk3, msilu;
    dsp u_dsp (
        .clk(sys_clk), .rst_n(rst_n), .en(en_d2), .data_k0(o_data_k0), .data_k1(o_data_k1), 
        .data_k2(o_data_k2), .data_k3(o_data_k3), .silu(silu), .w_silu(w_silu), 
        .w_k0(w_k0), .w_k1(w_k1), .w_k2(w_k2), .w_k3(w_k3),
        .mult_out_k0(mk0), .mult_out_k1(mk1), .mult_out_k2(mk2), .mult_out_k3(mk3), .mult_out_silu(msilu)
    );

    adder u_adder (
        .clk(sys_clk), .rst_n(rst_n), .en_d2(en_d3), .mult_out_k0(mk0), .mult_out_k1(mk1), 
        .mult_out_k2(mk2), .mult_out_k3(mk3), .mult_out_silu(msilu), .history_data(history_data), .add_out(add_out)
    );

    //==========================================
    //结果锁存与截断输出
    //==========================================
    reg [ACC_WIDTH-1:0] final_accum;
    always @(posedge sys_clk) begin
        if (en_d4 && layer_d4 == MAX_LAYERS - 1) final_accum <= add_out;
    end

    wire signed [ACC_WIDTH-1:0] final_accum_signed = final_accum;
    wire [DATA_WIDTH-1:0] final_clamped_out = (final_accum_signed > 22'sd32767) ? 16'h7FFF :
                                              (final_accum_signed < -22'sd32768) ? 16'h8000 : final_accum_signed[15:0];
    
    wire final_out_en;
    delay_line #(.WIDTH(1), .STAGES(2)) u_final_en (.clk(sys_clk), .rst_n(rst_n), .in_data(fsm_done), .out_data(final_out_en));

    reg [DATA_WIDTH-1:0] final_out_reg;
    always @(posedge sys_clk) begin
        if(!rst_n) final_out_reg <= 0;
        else if(final_out_en) final_out_reg <= final_clamped_out;
    end
    assign data_out = final_out_reg;

endmodule