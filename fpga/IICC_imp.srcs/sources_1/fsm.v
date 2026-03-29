module fsm(
    input        clk,
    input        rst_n,
    input        start,
    
    input        load_done, 
    //地址控制器接口
    output reg   calc_en,
    input        all_done,
    output reg   fsm_done,
    output [1:0] current_state
);

    localparam IDLE = 2'd0;
    localparam LOAD = 2'd1;
    localparam CALC = 2'd2;
    localparam DONE = 2'd3;

    reg [1:0] state, next_state;
    assign current_state = state;

    always @(*) begin
        case (state)
            IDLE: next_state = start ? LOAD : IDLE;
            LOAD: next_state = load_done ? CALC : LOAD;
            CALC: next_state = all_done ? DONE : CALC;
            DONE: next_state = IDLE; //停留一个周期后返回 IDLE
            default: next_state = IDLE;
        endcase
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            calc_en  <= 1'b0;
            fsm_done <= 1'b0;
        end else begin
            calc_en  <= (state == CALC);
            fsm_done <= (state == DONE);
        end
    end
endmodule