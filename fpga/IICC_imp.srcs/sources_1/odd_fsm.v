//总状态机
module fsm#(
    //数据格式
    parameter                   LAYER_WIDTH = 1,
    parameter                   LAYER       = 2,
    parameter                   NODE_WIDTH  = 6,  
    parameter                   NODE_0      = 9,
    parameter                   NODE_1      = 64,
    parameter                   NODE_2      = 1  
)(
    //系统时钟输入
    input                       sys_clk,
    //复位信号
    input                       rst_n,
    //开始信号
    input                       start,
    //结束信号
    output                      done,
    //状态输出
    output      reg     [2:0]   state,
    output      reg     [2:0]   next_state,
    //节点输出
    output      reg     [LAYER_WIDTH-1:0]  layer,
    output      reg     [NODE_WIDTH-1:0]   node_in,
    output      reg     [NODE_WIDTH-1:0]   node_out,
    //输出计数
    output      reg     [3:0]              load_cnt,
    output      reg     [2:0]              finish_cnt
);
    //计数部分
    wire [NODE_WIDTH-1:0] max_node_in [LAYER-1:0];
    wire [NODE_WIDTH-1:0] max_node_out [LAYER-1:0];
    assign max_node_in[0] = NODE_0 - 1'b1;  
    assign max_node_in[1] = NODE_1 - 1'b1; 
    assign max_node_out[0] = NODE_1 - 1'b1; 
    assign max_node_out[1] = NODE_2 - 1'b1;
    reg                         load_done;
    reg                         finish_done;
    reg                         out_done;
    assign done = out_done;
//差分时钟转换为单时钟信号
//    IBUFDS #(
//      .DIFF_TERM("FALSE"),       // Differential Termination
//      .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
//      .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
//    )IBUFDS_inst (
//     .O(sys_clk),  // Buffer output
//      .I(sys_clk_p),  // Diff_p buffer input (connect directly to top-level port)
//      .IB(sys_clk_n) // Diff_n buffer input (connect directly to top-level port)
//    );
//状态机设计
    //待机
    localparam                  IDLE    =   3'd0;
    //加载输入数据
    localparam                  LOAD    =   3'd1;
    //输入数据使能
    localparam                  READ1   =   3'd2;
    //输入数据输出
    localparam                  READ2   =   3'd3;
    //输出数据计算
    localparam                  CUL     =   3'd4;
    //等待流水线
    localparam                  FINISH  =   3'd5;
    //提取输出数据
    localparam                  OUT     =   3'd6;
    //换阶段排空
    localparam                  FLUSH   =   3'd7;
    //状态判断逻辑
    always @(*) begin
        case (state)
            IDLE    :  next_state  =   (start)?LOAD:IDLE;
            LOAD    :  next_state  =   (load_done)?READ1:LOAD;
            READ1   :  next_state  =   READ2;
            READ2   :  next_state  =   (node_out == max_node_out[layer])?((node_in == max_node_in[layer] && layer == LAYER - 1'b1)?FINISH:READ1):CUL;
            FINISH  :  next_state  =   (finish_done)?OUT:FINISH;
            OUT     :  next_state  =   (out_done)?IDLE:OUT;
            CUL     :  next_state  =   (node_out == max_node_out[layer])?((node_in == max_node_in[layer] && layer == 1'b0)?FLUSH:READ1):CUL;
            FLUSH   :  next_state  =   READ1;
            default :  next_state  =   IDLE; 
        endcase
    end
    //状态机转换
    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end      
    //计数控制逻辑
    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin
            load_cnt    <= 4'd0;
            load_done   <= 1'b0;
            finish_cnt  <= 3'd0;
            finish_done <= 1'b0;
            out_done    <= 1'b0;
        end 
        else begin
            if (next_state == LOAD) begin
                if (load_cnt == 4'd8) begin
                    load_done <= 1'b1;
                    load_cnt  <= load_cnt + 1'b1;
                end else begin
                    load_cnt  <= load_cnt + 1'b1;
                    load_done <= 1'b0;
                end
            end 
            else begin
                load_cnt  <= 4'd0;
                load_done <= 1'b0;
            end
            if (next_state == FINISH) begin
                if (finish_cnt == 3'd3) begin
                    finish_done <= 1'b1;
                end else begin
                    finish_cnt  <= finish_cnt + 1'b1;
                    finish_done <= 1'b0;
                end
            end else begin
                finish_cnt  <= 3'd0;
                finish_done <= 1'b0;
            end
            if (next_state == OUT) begin
                out_done <= 1'b1;
            end else begin
                out_done <= 1'b0;
            end
        end
    end  
//节点控制逻辑
    always @(posedge sys_clk or negedge rst_n) begin
        if(!rst_n)begin
            layer       <=  1'b0;
            node_in     <=  6'd0;
            node_out    <=  6'd0;
        end
        else begin
            //node_out
            if(next_state == CUL)begin
                node_out <= node_out + 1'b1;
            end
            else if (next_state == READ1)begin
                node_out <= 6'd0;
            end
            else begin
                node_out <= node_out;
            end
            //node_in
            if(next_state == READ1 && state != LOAD)begin
                if(node_in == max_node_in[layer])begin
                    node_in <= 6'd0;
                end
                else begin
                    node_in <= node_in + 1'b1;
                end
            end
            else begin
                node_in <= node_in;
            end
            //layer
            if(next_state == READ1 && node_in == max_node_in[layer] && node_out == max_node_out[layer])begin
                layer <= layer + 1'b1;
            end
            else begin
                layer <= layer;
            end
        end
    end
endmodule