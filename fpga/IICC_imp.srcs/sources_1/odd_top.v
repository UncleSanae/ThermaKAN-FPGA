module top#(
    //数据格式
    parameter                   DATA_WIDTH   = 16,
    parameter                   LAYER_WIDTH = 1,
    parameter                   LAYER       = 2,
    parameter                   NODE_WIDTH  = 6,  
    parameter                   NODE_0      = 9,
    parameter                   NODE_1      = 64,
    parameter                   NODE_2      = 1, 
    parameter                   HBITS       = 2,
    parameter                   GRID        = 8
)(
     //系统时钟输入
    input                       sys_clk,
    //复位信号
    input                       rst_n,
    //开始信号
    input                       start,
    //输入信号
    input       [DATA_WIDTH-1:0]     data_in,
    output reg  [DATA_WIDTH-1:0]     data_out
);

    //状态机
    wire done;
    wire [2:0] state;
    wire [2:0] next_state;
    wire [LAYER_WIDTH-1:0] layer;
    wire [NODE_WIDTH-1:0] node_in;
    wire [NODE_WIDTH-1:0] node_out;
    wire [3:0]            load_cnt;
    wire [2:0]            finish_cnt;
    fsm #(
        .LAYER_WIDTH 	(LAYER_WIDTH),
        .LAYER       	(LAYER),
        .NODE_WIDTH  	(NODE_WIDTH),
        .NODE_0      	(NODE_0),
        .NODE_1      	(NODE_1),
        .NODE_2      	(NODE_2))
    u_fsm(
        .sys_clk    	(sys_clk     ),
        .rst_n      	(rst_n       ),
        .start      	(start       ),
        .done       	(done        ),
        .state      	(state       ),
        .next_state 	(next_state  ),
        .layer      	(layer       ),
        .node_in    	(node_in     ),
        .node_out   	(node_out    ),
        .load_cnt       (load_cnt    ),
        .finish_cnt     (finish_cnt  )
    );

    wire en_d0 = (state == 3'd3 || state == 3'd4);
    reg  en_d1;
    reg  en_d2;
    reg  [LAYER_WIDTH-1:0]layer_d1;
    reg  [LAYER_WIDTH-1:0]layer_d2;
    reg  [LAYER_WIDTH-1:0]layer_d3;
    reg  [2:0]            state_d1;
    reg  [2:0]            state_d2;
    reg  [2:0]            state_d3;
    reg  [NODE_WIDTH-1:0] node_out_d1;
    reg  [NODE_WIDTH-1:0] node_out_d2;
    reg  [NODE_WIDTH-1:0] node_out_d3;
    always @(posedge sys_clk or negedge rst_n) begin
        if(!rst_n)begin
            en_d1 <= 1'b0;
            en_d2 <= 1'b0;
            layer_d1 <= 1'b0;
            layer_d2 <= 1'b0;
            layer_d3 <= 1'b0;
            state_d1 <= 3'd0;
            state_d2 <= 3'd0;
            state_d3 <= 3'd0;
            node_out_d1 <= 6'd0;
            node_out_d2 <= 6'd0;
            node_out_d3 <= 6'd0;
        end
        else begin
            en_d1 <= en_d0;
            en_d2 <= en_d1;
            layer_d1 <= layer;
            layer_d2 <= layer_d1;
            layer_d3 <= layer_d2;
            state_d1 <= state;
            state_d2 <= state_d1;
            state_d3 <= state_d2;
            node_out_d1 <= node_out;
            node_out_d2 <= node_out_d1;
            node_out_d3 <= node_out_d2;
        end
    end

    //data0_bram
    wire [DATA_WIDTH-1:0] data0_out;
    wire [DATA_WIDTH-1:0] data0_in = data_in;
    data0_bram #(
        .DATA_WIDTH  	(DATA_WIDTH),
        .ADDR_WIDTH  	(4   ),
        .LAYER_WIDTH 	(LAYER_WIDTH),
        .NODE_WIDTH  	(NODE_WIDTH))
    u_data0_bram(
        .clk        	(sys_clk     ),
        .rst_n      	(rst_n       ),
        .state          (state       ),
        .next_state 	(next_state  ),
        .layer      	(layer       ),
        .node_in    	(node_in     ),
        .data0_in   	(data0_in    ),
        .load_cnt   	(load_cnt    ),
        .data0_out  	(data0_out   )
    );
    //data1_bram
    wire [DATA_WIDTH-1:0] data1_out;
    wire en_re = state == 3'd2;
    reg  en_re_d1;
    reg  en_re_d2;
    reg  en_re_d3;
    reg  en_re_d4;
    always @(posedge sys_clk or negedge rst_n) begin
        if(!rst_n)begin
            en_re_d1 <= 1'b0;
            en_re_d2 <= 1'b0;
            en_re_d3 <= 1'b0;
            en_re_d4 <= 1'b0; 
        end
        else begin
            en_re_d1 <= en_re;
            en_re_d2 <= en_re_d1;
            en_re_d3 <= en_re_d2;
            en_re_d4 <= en_re_d3;
        end
    end
    wire [DATA_WIDTH-1:0] add_out;
    data1_bram #(
        .DATA_WIDTH  	(DATA_WIDTH),
        .LAYER_WIDTH 	(LAYER_WIDTH),
        .NODE_WIDTH  	(NODE_WIDTH))
    u_data1_bram(
        .clk         	(sys_clk      ),
        .rst_n       	(rst_n        ),
        .layer       	(layer        ),
        .layer_d3    	(layer_d3     ),
        .en_d1       	(en_d1        ),
        .en_re       	(en_re        ),
        .state_d3    	(state_d3     ),
        .node_in     	(node_in      ),
        .node_out_d1 	(node_out_d1  ),
        .node_out_d3 	(node_out_d3  ),
        .data1_in    	(add_out      ),
        .data1_out   	(data1_out    )
    );

    // output declaration of module data2_bram
    wire [DATA_WIDTH-1:0] data2_out;
    
    data2_bram #(
        .DATA_WIDTH 	(DATA_WIDTH))
    u_data2_bram(
        .clk       	(sys_clk    ),
        .rst_n     	(rst_n      ),
        .en        	(layer_d3 == 1'b1 && (en_re_d2 || en_re_d4)),
        .enr       	(en_re_d2        ),
        .enw       	(en_re_d4        ),
        .data2_in  	(add_out   ),
        .data2_out 	(data2_out  )
    );
    
    
    //sp_gen
    wire [2:0] grid_index;
    wire [DATA_WIDTH-1:0] o_data_k1;
    wire [DATA_WIDTH-1:0] o_data_k2;
    wire [DATA_WIDTH-1:0] o_data_k0;
    wire [DATA_WIDTH-1:0] o_data_k3;
    wire [DATA_WIDTH-1:0] silu;
    wire [DATA_WIDTH-1:0] sp_data_in;
    assign sp_data_in = (layer == 1'b0) ? data0_out : data1_out;
    sp_gen #(
        .DATA_WIDTH 	(DATA_WIDTH),
        .HBITS     	    (HBITS),
        .GRID      	    (GRID))
    u_sp_gen(
        .clk        	(sys_clk     ),
        .rst_n      	(rst_n       ),
        .en         	(en_d0       ),
        .data_in    	(sp_data_in  ),
        .grid_index 	(grid_index  ),
        .o_data_k1  	(o_data_k1   ),
        .o_data_k2  	(o_data_k2   ),
        .o_data_k0  	(o_data_k0   ),
        .o_data_k3  	(o_data_k3   ),
        .silu       	(silu        )
    );


    reg [2:0]   grid_index_d0;
    always @(posedge sys_clk or negedge rst_n) begin
        if(!rst_n)begin
            grid_index_d0 <= 3'd0;
        end
        else begin
            grid_index_d0 <= grid_index;
        end
    end
    // output declaration of module get_weight
    wire [DATA_WIDTH-1:0] w_silu;
    wire [DATA_WIDTH-1:0] w_k0;
    wire [DATA_WIDTH-1:0] w_k1;
    wire [DATA_WIDTH-1:0] w_k2;
    wire [DATA_WIDTH-1:0] w_k3;
    
    get_weight #(
        .DATA_WIDTH  	(DATA_WIDTH),
        .NODE_WIDTH  	(NODE_WIDTH),
        .LAYER_WIDTH 	(LAYER_WIDTH),
        .NODE_0      	(NODE_0),
        .NODE_1      	(NODE_1))
    u_get_weight(
        .clk        	(sys_clk     ),
        .rst_n      	(rst_n       ),
        .en         	(en_d0       ),
        .grid_index 	(grid_index_d0),
        .layer      	(layer       ),
        .node_in    	(node_in     ),
        .node_out   	(node_out    ),
        .w_silu     	(w_silu      ),
        .w_k0       	(w_k0        ),
        .w_k1       	(w_k1        ),
        .w_k2       	(w_k2        ),
        .w_k3       	(w_k3        )
    );
    
    // output declaration of module dsp
    wire [DATA_WIDTH-1:0] mult_out_k0;
    wire [DATA_WIDTH-1:0] mult_out_k1;
    wire [DATA_WIDTH-1:0] mult_out_k2;
    wire [DATA_WIDTH-1:0] mult_out_k3;
    wire [DATA_WIDTH-1:0] mult_out_silu;
    
    dsp #(
        .DATA_WIDTH 	(DATA_WIDTH))
    u_dsp(
        .clk           	(sys_clk        ),
        .rst_n         	(rst_n          ),
        .en            	(en_d1          ),
        .data_k0       	(o_data_k0      ),
        .data_k1       	(o_data_k1      ),
        .data_k2       	(o_data_k2      ),
        .data_k3       	(o_data_k3      ),
        .silu          	(silu           ),
        .w_silu        	(w_silu         ),
        .w_k0          	(w_k0           ),
        .w_k1          	(w_k1           ),
        .w_k2          	(w_k2           ),
        .w_k3          	(w_k3           ),
        .mult_out_k0   	(mult_out_k0    ),
        .mult_out_k1   	(mult_out_k1    ),
        .mult_out_k2   	(mult_out_k2    ),
        .mult_out_k3   	(mult_out_k3    ),
        .mult_out_silu 	(mult_out_silu  )
    );

    // output declaration of module adder
    
    
    adder #(
        .DATA_WIDTH 	(DATA_WIDTH),
        .NODE_WIDTH 	(NODE_WIDTH))
    u_adder(
        .clk           	(sys_clk        ),
        .rst_n         	(rst_n          ),
        .en_d2         	(en_d2          ),
        .mult_out_k0   	(mult_out_k0    ),
        .mult_out_k1   	(mult_out_k1    ),
        .mult_out_k2   	(mult_out_k2    ),
        .mult_out_k3   	(mult_out_k3    ),
        .mult_out_silu 	(mult_out_silu  ),
        .history_data  	((layer_d2)?data2_out:data1_out),
        .add_out       	(add_out        )
    );
    
    always @(posedge sys_clk or negedge rst_n) begin
        if(!rst_n)begin
            data_out <= 16'h0000;
        end
        else if(state == 3'd6)begin
            data_out <= data2_out;
        end
    end
       
endmodule