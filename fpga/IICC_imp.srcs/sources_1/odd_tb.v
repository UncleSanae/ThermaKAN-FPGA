`timescale 1ns / 1ps

module top_tb();

    // 信号声明
    reg         sys_clk;
    reg         rst_n;
    reg         start;
    reg  [15:0] data_in;

    // 例化顶层模块
    top#(
        .DATA_WIDTH (16),
        .LAYER_WIDTH(1),
        .LAYER      (2),
        .NODE_WIDTH (6),
        .NODE_0     (9),
        .NODE_1     (64),
        .NODE_2     (1)
    )u_top(
        .sys_clk    (sys_clk),
        .rst_n      (rst_n),
        .start      (start),
        .data_in    (data_in)
    );

    // 生成时钟 (100MHz, 周期10ns)
    initial begin
        sys_clk = 1'b0;
        forever #5 sys_clk = ~sys_clk;
    end

    // 测试数据灌入变量
    integer i;

    // 仿真激励
    initial begin
        // 初始化信号
        rst_n   = 1'b0;
        start   = 1'b0;
        data_in = 16'd0;

        #25;
        rst_n   = 1'b1;
        #20;

        // 触发开始信号
        start   = 1'b1;
        data_in = 16'h0CCD;
        #10;
        start   = 1'b0;
        data_in = 16'hE666;
        #10;
        data_in = 16'h2666;
        #10;
        data_in = 16'hCCCD;
        #10;
        data_in = 16'h4000;
        #10;
        data_in = 16'hB333;
        #10;
        data_in = 16'h599A;
        #10;
        data_in = 16'h999A;
        #10;
        data_in = 16'h7333;
        #10;
        
        // 数据送完后总线归零
        data_in = 16'd0;

        // 跨层级等待 FSM 的 done 信号拉高 (由于顶层未引出，直接探测内部节点)
        wait(u_top.u_fsm.done == 1'b1);
        #30;

        // 模拟外部硬件级复位，准备迎接下一次推理
        rst_n = 1'b0;
        #20;
        rst_n = 1'b1;

        #100;
        $finish;
    end

endmodule