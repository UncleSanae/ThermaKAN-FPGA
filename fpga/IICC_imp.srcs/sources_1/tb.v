`timescale 1ns / 1ps

module tb();

    parameter CLK_PERIOD = 10;
    
    reg         sys_clk;
    reg         rst_n;
    reg         start;
    reg  [15:0] data_in;
    wire [15:0] data_out; 

    top #(
        .DATA_WIDTH  (16),
        .ACC_WIDTH   (22),
        .LAYER_WIDTH (2),
        .NODE_WIDTH  (7),
        .MAX_LAYERS  (2),
        .TOPOLOGY    ({7'd1, 7'd64, 7'd9}),
        .BASE_ADDR   ({16'd576, 16'd0}),
        .HBITS       (2),
        .GRID        (8),
        .PIPE_STAGES (5)
    ) u_top (
        .sys_clk     (sys_clk),
        .rst_n       (rst_n),
        .start       (start),
        .data_in     (data_in),
        .data_out    (data_out)
    );

    initial begin
        sys_clk = 1'b0;
        forever #(CLK_PERIOD / 2) sys_clk = ~sys_clk;
    end

    task sys_reset;
        begin
            rst_n   = 1'b0;
            start   = 1'b0;
            data_in = 16'd0;
            #(CLK_PERIOD * 5);
            rst_n   = 1'b1;
            #(CLK_PERIOD * 2);
        end
    endtask

    task feed_input_data;
        input [15:0] d0, d1, d2, d3, d4, d5, d6, d7, d8;
        begin
            @(negedge sys_clk);
            start   = 1'b1;
            data_in = d0;
            
            @(negedge sys_clk);
            start   = 1'b0;
            data_in = d1;
            
            @(negedge sys_clk); data_in = d2;
            @(negedge sys_clk); data_in = d3;
            @(negedge sys_clk); data_in = d4;
            @(negedge sys_clk); data_in = d5;
            @(negedge sys_clk); data_in = d6;
            @(negedge sys_clk); data_in = d7;
            @(negedge sys_clk); data_in = d8;
            
            @(negedge sys_clk);
            data_in = 16'd0;
        end
    endtask

    real real_temp;

    initial begin
        $display("==================================================");
        $display("   KAN Hardware Accelerator Simulation Started    ");
        $display("==================================================");

        sys_reset();

        feed_input_data(
            16'h0CCD, 16'hE666, 16'h2666, 
            16'hCCCD, 16'h4000, 16'hB333, 
            16'h599A, 16'h999A, 16'h7333
        );

        wait(u_top.u_fsm.fsm_done == 1'b1);
        
        #(CLK_PERIOD * 10);

        if(data_out[15])begin
            real_temp = -1.0 * (~data_out + 1'b1) / 32768.0;
        end else begin
            real_temp = data_out / 32768.0;
        end

        $display("Simulation Completed.");
        $display("Raw Hex Output (Q1.15): 0x%h", data_out);
        $display("Decoded Temperature   : %f degC", real_temp);
        $display("==================================================");

        #(CLK_PERIOD * 10);
        $finish;
    end

endmodule