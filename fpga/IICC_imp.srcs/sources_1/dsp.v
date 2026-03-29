module dsp#(
    //Q1.15
    parameter DATA_WIDTH  = 16,
    parameter TRUNC_SHIFT = 15  
)(
    input                       clk,
    input                       rst_n,
    input                       en,
    
    input      [DATA_WIDTH-1:0] data_k0,
    input      [DATA_WIDTH-1:0] data_k1,
    input      [DATA_WIDTH-1:0] data_k2,
    input      [DATA_WIDTH-1:0] data_k3,
    input      [DATA_WIDTH-1:0] silu,
    
    input      [DATA_WIDTH-1:0] w_silu,
    input      [DATA_WIDTH-1:0] w_k0,
    input      [DATA_WIDTH-1:0] w_k1,
    input      [DATA_WIDTH-1:0] w_k2,
    input      [DATA_WIDTH-1:0] w_k3,

    output reg [DATA_WIDTH-1:0] mult_out_k0,
    output reg [DATA_WIDTH-1:0] mult_out_k1,
    output reg [DATA_WIDTH-1:0] mult_out_k2,
    output reg [DATA_WIDTH-1:0] mult_out_k3,
    output reg [DATA_WIDTH-1:0] mult_out_silu
);

    wire signed [31:0] m_k0   = $signed(data_k0) * $signed(w_k0);
    wire signed [31:0] m_k1   = $signed(data_k1) * $signed(w_k1);
    wire signed [31:0] m_k2   = $signed(data_k2) * $signed(w_k2);
    wire signed [31:0] m_k3   = $signed(data_k3) * $signed(w_k3);
    wire signed [31:0] m_silu = $signed(silu)    * $signed(w_silu);

    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            mult_out_k0   <= {DATA_WIDTH{1'b0}};
            mult_out_k1   <= {DATA_WIDTH{1'b0}};
            mult_out_k2   <= {DATA_WIDTH{1'b0}};
            mult_out_k3   <= {DATA_WIDTH{1'b0}};
            mult_out_silu <= {DATA_WIDTH{1'b0}};
        end else if(en)begin
            mult_out_k0   <= m_k0[TRUNC_SHIFT + DATA_WIDTH - 1 : TRUNC_SHIFT];
            mult_out_k1   <= m_k1[TRUNC_SHIFT + DATA_WIDTH - 1 : TRUNC_SHIFT];
            mult_out_k2   <= m_k2[TRUNC_SHIFT + DATA_WIDTH - 1 : TRUNC_SHIFT];
            mult_out_k3   <= m_k3[TRUNC_SHIFT + DATA_WIDTH - 1 : TRUNC_SHIFT];
            mult_out_silu <= m_silu[TRUNC_SHIFT + DATA_WIDTH - 1 : TRUNC_SHIFT];
        end
    end

endmodule