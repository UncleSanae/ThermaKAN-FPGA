//生成B样条取值和索引的总模块
module sp_gen#(
    parameter                           DATAWIDTH = 16,
    parameter                           HBITS     = 2,
    parameter                           GRID      = 8
)(
    input                               clk,
    input                               rst_n,
    input                               en,
    input       [DATAWIDTH-1:0]         data,

    output      reg[3:0]                grid_index_d0,
    //x+h
    output      [DATAWIDTH-1:0]         o_data_k1,
    //2h-x
    output      [DATAWIDTH-1:0]         o_data_k2,
    //x
    output      [DATAWIDTH-1:0]         o_data_k0,
    //h-x
    output      [DATAWIDTH-1:0]         o_data_k3,
    //silu
    output      [DATAWIDTH-1:0]         silu,
    //输出信号
    output      reg                     o_valid
);
    wire [3:0] grid_index;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            grid_index_d0 <= 4'd0;
            o_valid <= 1'd0;
        end
        else begin
            grid_index_d0 <= grid_index;
            o_valid <= en;
        end
    end
    //addr_gen
    //x和x+h
    wire [DATAWIDTH-2-HBITS:0] addr_1;
    //h-x和2h-x
    wire [DATAWIDTH-2-HBITS:0] addr_2;
    addr_gen #(
        .DATAWIDTH 	(DATAWIDTH),
        .HBITS     	(HBITS))
    u_addr_gen(
        .data   	(data    ),
        .addr_1 	(addr_1  ),
        .addr_2 	(addr_2  )
    );
    //grid_index_gen
    grid_index_gen #(
        .DATAWIDTH 	(DATAWIDTH),
        .HBITS     	(HBITS),
        .GRID      	(GRID))
    u_grid_index_gen(
        .data       	(data        ),
        .grid_index 	(grid_index)
    );
    //x+h和2h-x的rom
    sp_rom_a sp_rom_a (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(addr_1),  // input wire [12 : 0] addra
        .douta(o_data_k1),  // output wire [15 : 0] douta
        .clkb(clk),    // input wire clkb
        .enb(en),      // input wire enb
        .addrb(addr_2),  // input wire [12 : 0] addrb
        .doutb(o_data_k2)  // output wire [15 : 0] doutb
    );
    //x和h-x的rom
    sp_rom_b sp_rom_b (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(addr_1),  // input wire [12 : 0] addra
        .douta(o_data_k0),  // output wire [15 : 0] douta
        .clkb(clk),    // input wire clkb
        .enb(en),      // input wire enb
        .addrb(addr_2),  // input wire [12 : 0] addrb
        .doutb(o_data_k3)  // output wire [15 : 0] doutb
    );
    silu_rom silu_rom (
        .clka(clk),    // input wire clka
        .ena(en),      // input wire ena
        .addra(data),  // input wire [15 : 0] addra
        .douta(silu)  // output wire [15 : 0] douta
    );
endmodule