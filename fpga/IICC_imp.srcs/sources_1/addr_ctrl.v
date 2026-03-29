module addr_ctrl#(
    parameter LAYER_WIDTH = 2,
    parameter NODE_WIDTH  = 7,
    parameter MAX_LAYERS  = 2,
    parameter [(MAX_LAYERS+1)*NODE_WIDTH-1:0] TOPOLOGY = {7'd1, 7'd64, 7'd9},
    parameter PIPE_STAGES = 5 
)(
    input                        clk,
    input                        rst_n,
    input                        calc_en,
    output reg [LAYER_WIDTH-1:0] layer,
    output reg [NODE_WIDTH-1:0]  node_in,
    output reg [NODE_WIDTH-1:0]  node_out,
    output wire                  layer_valid,
    output reg                   all_done
);

    wire [NODE_WIDTH-1:0] max_node_in  [0:MAX_LAYERS-1];
    wire [NODE_WIDTH-1:0] max_node_out [0:MAX_LAYERS-1];

    genvar i;
    generate
        for (i = 0; i < MAX_LAYERS; i = i + 1) begin : gen_topo
            assign max_node_in[i]  = TOPOLOGY[i*NODE_WIDTH +: NODE_WIDTH] - 1'b1;
            assign max_node_out[i] = TOPOLOGY[(i+1)*NODE_WIDTH +: NODE_WIDTH] - 1'b1;
        end
    endgenerate

    reg [2:0] state;
    localparam S_RUN = 3'd0, S_WAIT = 3'd1, S_FLUSH = 3'd2, S_DONE = 3'd3;
    reg [3:0] cnt; 

    assign layer_valid = (calc_en && state == S_RUN);
    wire need_wait = (max_node_out[layer] + 1'b1 < PIPE_STAGES);

    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            layer <= 0; node_in <= 0; node_out <= 0;
            all_done <= 0; state <= S_RUN; cnt <= 0;
        end else if(calc_en) begin
            case(state)
                S_RUN: begin
                    if(node_out == max_node_out[layer]) begin
                        if(node_in == max_node_in[layer]) begin
                            state <= S_FLUSH; cnt <= 0;
                        end else begin
                            if(need_wait) begin 
                                state <= S_WAIT; cnt <= 0;
                            end else begin
                                node_in <= node_in + 1'b1; node_out <= 0;
                            end
                        end
                    end else begin
                        node_out <= node_out + 1'b1;
                    end
                end
                S_WAIT: begin
                    if(cnt == PIPE_STAGES - 1) begin
                        node_in <= node_in + 1'b1; node_out <= 0; state <= S_RUN;
                    end else cnt <= cnt + 1'b1;
                end
                S_FLUSH: begin
                    if(cnt == PIPE_STAGES + 1) begin
                        if(layer == MAX_LAYERS - 1) begin
                            all_done <= 1'b1; state <= S_DONE;
                        end else begin
                            layer <= layer + 1'b1; node_in <= 0; node_out <= 0; state <= S_RUN;
                        end
                    end else cnt <= cnt + 1'b1;
                end
                S_DONE: all_done <= 1'b1;
            endcase
        end else begin
            all_done <= 0; state <= S_RUN; layer <= 0; node_in <= 0; node_out <= 0;
        end
    end
endmodule