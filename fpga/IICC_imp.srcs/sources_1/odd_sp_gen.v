//生成B样条取值和索引的总模块
module sp_gen#(
    parameter                           DATA_WIDTH = 16,
    parameter                           HBITS     = 2,
    parameter                           GRID      = 8
)(
    input                               clk,
    input                               rst_n,
    input                               en,
    input       [DATA_WIDTH-1:0]         data_in,

    output      [2:0]                    grid_index,
    //x+h
    output      [DATA_WIDTH-1:0]         o_data_k1,
    //2h-x
    output      [DATA_WIDTH-1:0]         o_data_k2,
    //x
    output      [DATA_WIDTH-1:0]         o_data_k0,
    //h-x
    output      [DATA_WIDTH-1:0]         o_data_k3,
    //silu
    output      [DATA_WIDTH-1:0]         silu
);
    //addr_gen
    //x和x+h
    wire [DATA_WIDTH-2-HBITS:0] addr_1;
    //h-x和2h-x
    wire [DATA_WIDTH-2-HBITS:0] addr_2;
    addr_gen #(
        .DATA_WIDTH 	(DATA_WIDTH),
        .HBITS     	(HBITS))
    u_addr_gen(
        .data   	(data_in ),
        .addr_1 	(addr_1  ),
        .addr_2 	(addr_2  )
    );
    //grid_index_gen
    grid_index_gen #(
        .DATA_WIDTH 	(DATA_WIDTH),
        .HBITS     	(HBITS),
        .GRID      	(GRID))
    u_grid_index_gen(
        .data       	(data_in   ),
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
        .addra(data_in),  // input wire [15 : 0] addra
        .douta(silu)  // output wire [15 : 0] douta
    );
endmodule