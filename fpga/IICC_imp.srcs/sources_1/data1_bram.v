module data1_bram #(
    //22位
    parameter ACC_WIDTH  = 22,  
    //NODE_1 = 64
    parameter ADDR_WIDTH = 6     
)(
    input                       clk,
    //==========================================
    //Port A:读端口
    //==========================================
    //读使能
    input                       ena,
    //读地址      
    input      [ADDR_WIDTH-1:0] addra,
    //读数据    
    output reg [ACC_WIDTH-1:0]  douta,    
    //==========================================
    //Port B:写端口
    //==========================================
    //写使能
    input                       enb,  
    //写地址    
    input      [ADDR_WIDTH-1:0] addrb,
    //写数据  
    input      [ACC_WIDTH-1:0]  dinb      
);
    //声明
    reg [ACC_WIDTH-1:0] ram [0:(1<<ADDR_WIDTH)-1];
    //初始化
    integer i;
    initial begin
        for(i = 0; i < (1<<ADDR_WIDTH); i = i + 1) begin
            ram[i] = {ACC_WIDTH{1'b0}};
        end
    end
    //同步读
    always @(posedge clk) begin
        if (ena) begin
            douta <= ram[addra];
        end
    end
    //同步写
    always @(posedge clk) begin
        if (enb) begin
            ram[addrb] <= dinb;
        end
    end
endmodule