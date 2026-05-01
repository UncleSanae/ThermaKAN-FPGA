`timescale 1ns / 1ps

module tb(); // [cite: 156]

    parameter CLK_PERIOD = 10;
    
    reg         sys_clk; // [cite: 156]
    reg         rst_n; // [cite: 157]
    reg         start; // [cite: 157]
    reg  [15:0] data_in; // [cite: 158]
    wire [15:0] data_out; // [cite: 158]

    top #( // [cite: 158]
        .DATA_WIDTH  (16), // [cite: 158]
        .ACC_WIDTH   (22), // [cite: 158]
        .LAYER_WIDTH (2), // [cite: 158]
        .NODE_WIDTH  (7), // [cite: 158]
        .MAX_LAYERS  (2), // [cite: 158]
        .TOPOLOGY    ({7'd1, 7'd64, 7'd9}), // [cite: 158]
        .BASE_ADDR   ({16'd576, 16'd0}), // [cite: 158]
        .HBITS       (2), // [cite: 158]
        .GRID        (8), // [cite: 159]
        .PIPE_STAGES (5) // [cite: 159]
    ) u_top (
        .sys_clk     (sys_clk), // [cite: 159]
        .rst_n       (rst_n), // [cite: 159]
        .start       (start), // [cite: 159]
        .data_in     (data_in), // [cite: 159]
        .data_out    (data_out) // [cite: 159]
    );

    initial begin
        sys_clk = 1'b0; // [cite: 160]
        forever #(CLK_PERIOD / 2) sys_clk = ~sys_clk; // [cite: 161]
    end

    task sys_reset; // [cite: 161]
        begin // [cite: 162]
            rst_n   = 1'b0; // [cite: 162]
            start   = 1'b0; // [cite: 163]
            data_in = 16'd0; // [cite: 163]
            #(CLK_PERIOD * 5); // [cite: 163]
            rst_n   = 1'b1; // [cite: 163]
            #(CLK_PERIOD * 2); // [cite: 163]
        end // [cite: 164]
    endtask

    task feed_input_data; // [cite: 164]
        input [15:0] d0, d1, d2, d3, d4, d5, d6, d7, d8; // [cite: 165]
        begin // [cite: 166]
            @(negedge sys_clk); start = 1'b1; data_in = d0; // [cite: 166-167]
            @(negedge sys_clk); start = 1'b0; data_in = d1; // [cite: 167]
            @(negedge sys_clk); data_in = d2; // [cite: 167]
            @(negedge sys_clk); data_in = d3; // [cite: 167-168]
            @(negedge sys_clk); data_in = d4; // [cite: 168]
            @(negedge sys_clk); data_in = d5; // [cite: 168]
            @(negedge sys_clk); data_in = d6; // [cite: 168]
            @(negedge sys_clk); data_in = d7; // [cite: 168-169]
            @(negedge sys_clk); data_in = d8; // [cite: 169]
            @(negedge sys_clk); data_in = 16'd0; // [cite: 169]
        end // [cite: 170]
    endtask

    integer fin, fout;
    integer r_code;
    integer test_cnt;
    reg [15:0] temp_data [0:8];
    integer i;

    initial begin
        $display("=================================================="); // [cite: 170]
        $display("   Batch Hardware Simulation Started              "); 
        $display("=================================================="); // [cite: 171]

        sys_reset(); // [cite: 171]

        fin  = $fopen("C:/Users/31683/Desktop/Code/FPGA_KANs_IICC/algorithm/hw_export/hw_input.txt", "r");
        fout = $fopen("C:/Users/31683/Desktop/Code/FPGA_KANs_IICC/algorithm/hw_export/hw_output.txt", "w");

        if(fin == 0)begin
            $display("[!] 错误：无法打开 hw_input.txt，请检查绝对路径。");
            $finish;
        end

        test_cnt = 0;

        while(!$feof(fin))begin
            r_code = 1;
            for(i = 0; i < 9; i = i + 1)begin
                if($fscanf(fin, "%h\n", temp_data[i]) != 1)begin
                    r_code = 0;
                end
            end
            
            if(r_code == 1)begin
                feed_input_data(temp_data[0], temp_data[1], temp_data[2], 
                                temp_data[3], temp_data[4], temp_data[5], 
                                temp_data[6], temp_data[7], temp_data[8]);

                wait(u_top.u_fsm.fsm_done == 1'b1); // [cite: 173]
                #(CLK_PERIOD * 10); // [cite: 173]

                $fdisplay(fout, "%04x", data_out);
                
                test_cnt = test_cnt + 1;
                if(test_cnt % 100 == 0)begin
                    $display("已完成 %0d 组测试...", test_cnt);
                end
            end
        end

        $fclose(fin);
        $fclose(fout);
        $display("==================================================");
        $display("仿真完成！总测试组数: %0d", test_cnt);
        $display("==================================================");
        $finish;
    end
endmodule