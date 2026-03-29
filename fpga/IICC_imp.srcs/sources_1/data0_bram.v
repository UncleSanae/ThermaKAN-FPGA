module data0_bram#(
    parameter DATA_WIDTH = 16,
    //NODE_0 = 9
    parameter ADDR_WIDTH = 4   
)(
    input                       clk,
    //==========================================
    //Port A:写端口
    //==========================================
    //写使能
    input                       wea,
    //写地址      
    input      [ADDR_WIDTH-1:0] addra,
    //写数据    
    input      [DATA_WIDTH-1:0] dina,     
    //==========================================
    //Port B:读端口
    //==========================================
    //读使能
    input                       enb,
    //读地址      
    input      [ADDR_WIDTH-1:0] addrb,
    //读数据    
    output reg [DATA_WIDTH-1:0] doutb     
);
    //声明
    reg [DATA_WIDTH-1:0] ram [0:(1<<ADDR_WIDTH)-1];
    //同步写
    always @(posedge clk) begin
        if (wea) begin
            ram[addra] <= dina;
        end
    end
    //同步读
    always @(posedge clk) begin
        if (enb) begin
            doutb <= ram[addrb];
        end
    end
endmodule