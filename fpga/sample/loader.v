`timescale 1ns/1ps

module LOADER #(
    parameter S_AXIS_DATAWIDTH = 16,
    parameter M_AXIS_DATAWIDTH = 16,
    parameter ADDRWIDTH        = 32,
    parameter LG_LAYERSIZE     = 12,
    parameter GRID_SIZE        = 11,
    parameter HBITS            = 2
    // parameter BASE_ADDR        = 32'h00080000,
    // parameter ZERO_ADDR        = 32'h00010000
)(
    input wire                                  s_axis_aclk,
    input wire                                  s_axis_aresetn,

    input wire signed [S_AXIS_DATAWIDTH-1:0]    s_axis_tdata,
    input wire                                  s_axis_tvalid,
    output reg                                  s_axis_tready,

    output wire [M_AXIS_DATAWIDTH-1:0]          m_axis_tdata,
    output wire                                 m_axis_tvalid,
    input wire                                  m_axis_tready,

    input wire [31:0]                           BASE_ADDR,
    input wire [31:0]                           ZERO_ADDR,
    input wire [LG_LAYERSIZE-1:0]               inp_layer_size,
    input wire [LG_LAYERSIZE-1:0]               out_layer_size, //multiple of 4

    output reg [ADDRWIDTH-1:0]                  m_axi_araddr,
    output reg                                  m_axi_arvalid,
    input wire                                  m_axi_arready,
    output reg [7:0]                            m_axi_arlen,
    output reg [2:0]                            m_axi_arsize,
    output reg [1:0]                            m_axi_arburst
);

wire [9:0] o_data_1, o_data_2, o_data_3, o_data_4;

wire en = s_axis_tvalid & s_axis_tready & s_axis_aresetn;

SPLINEGEN #(S_AXIS_DATAWIDTH, HBITS, 10) spline_generator (
    s_axis_aclk,
    en,
    s_axis_tdata,
    o_data_1,
    o_data_2,
    o_data_3,
    o_data_4
);

wire        [9:0]   sig_out;
reg signed  [31:0]  silu_out;
reg                 sig_overflow;
reg                 sig_underflow;

SIGMOID sigmoid_generator (
    s_axis_aclk,
    en,
    s_axis_tdata[13:0],
    sig_out
);

// get non zero spline index
reg signed  [13:0]  grid_id;

reg                 buff_axis_tvalid;
reg         [79:0]  buff_axis_tdata;
wire                buff_axis_tready;
reg signed  [15:0]  inp_data;

wire signed [15:0] sig_out_16 = sig_overflow ? 16'h0400 : sig_underflow ? 16'h0000 : {6'b000000, sig_out};

reg [2:0]   burst_counter;
reg [11:0]  node_counter;
reg [19:0]  curr_address;
reg [19:0]  node_address;
reg [1:0]   state;

// Dynamic validity check based on burst counter (k=0,1,2,3)
// Valid HW Index Range: [-GRID_SIZE, GRID_SIZE-1] -> [-8, 7]
// current_hw_idx = grid_id + (burst_counter - 1)
// We check this when burst_counter >= 1 (Spline bursts)
wire signed [13:0] current_hw_idx = grid_id + {11'd0, burst_counter} - 14'd1;
wire spline_valid = (current_hw_idx >= 0) && (current_hw_idx < GRID_SIZE);

localparam STATE_INPUT  = 0;
localparam STATE_OUTPUT = 1;
localparam STATE_BUFFER = 2;

always @(posedge s_axis_aclk) begin
    if(~s_axis_aresetn) begin
        state <= STATE_INPUT;
        burst_counter <= 0;
        node_counter <= 0;
        curr_address <= BASE_ADDR[31:12];
        node_address <= BASE_ADDR[31:12];
        grid_id <= 0;
        inp_data <= 0;
        sig_underflow <= 1;
        sig_overflow <= 1;
    end
    else begin
        case(state)
            STATE_INPUT: begin
                if(s_axis_tvalid) begin
                    state <= STATE_OUTPUT;
                    inp_data <= s_axis_tdata;
                    sig_overflow  <= (|s_axis_tdata[14:13]) & (~s_axis_tdata[15]);
                    sig_underflow <= ~(&s_axis_tdata[14:13]) & s_axis_tdata[15];
                    // Set address for Burst 0 (SiLU) -> node_address + GRID_SIZE (8)
                    curr_address <= node_address + GRID_SIZE;
                    // grid_id is signed, no offset
                    grid_id <= (s_axis_tdata >>> (10-HBITS)) + 4;
                end
            end
            STATE_OUTPUT: begin
                if(m_axi_arready) begin
                    if(burst_counter == 4)
                        state <= STATE_BUFFER;
                    //NODE ADDRESS LOGIC
                    if(burst_counter == 4)
                        node_address <= node_address + (GRID_SIZE + 1); // Stride 12 (11 Spline + 1 Base)
                    //CURR ADDRESS LOGIC
                    if(burst_counter == 0) 
                        curr_address <= node_address + grid_id; // Burst 1: Spline 0 (Signed addition)
                    else 
                        curr_address <= curr_address + 1; // Burst 2,3,4: Spline 1,2,3
                    if(burst_counter == 4) 
                        burst_counter <= 0;
                    else
                        burst_counter <= burst_counter+1;
                end
            end
            STATE_BUFFER: begin
                if(buff_axis_tready) begin
                    state <= STATE_INPUT;
                    if(node_counter == inp_layer_size-1)begin
                        node_counter <= 0;
                        node_address <= BASE_ADDR;
                    end
                    else
                        node_counter <= node_counter+1;
                end
            end
        endcase
    end
end

always @(posedge s_axis_aclk) begin
    silu_out <= inp_data * sig_out_16;
    

end

always @(*) begin
    buff_axis_tdata = {{6'd0, o_data_4}, {6'd0, o_data_3}, {6'd0, o_data_2}, {6'd0, o_data_1}, silu_out[25:10]};

    // Burst 0 (SiLU): Always fetch from valid address
    // Bursts 1-4 (Splines): Only fetch if spline_valid is true, otherwise use ZERO_ADDR
    if (burst_counter == 0)
        m_axi_araddr = curr_address<<12;  // Always fetch SiLU weights
    else
        m_axi_araddr = spline_valid ? curr_address<<12 : ZERO_ADDR;  // Conditional spline fetch
    m_axi_arlen = ((out_layer_size>>2)-1);
    m_axi_arsize = 3'b011;
    m_axi_arburst = 2'b01;

    if(~s_axis_aresetn) begin
        s_axis_tready = 0;
        m_axi_arvalid = 0;
        buff_axis_tvalid = 0;
    end 
    else begin
        case(state)
            STATE_INPUT: begin
                s_axis_tready = 1;
                m_axi_arvalid = 0;
                buff_axis_tvalid = 0;
            end
            STATE_OUTPUT: begin
                s_axis_tready = 0;
                m_axi_arvalid = 1;
                buff_axis_tvalid = 0;
            end
            STATE_BUFFER: begin
                s_axis_tready = 0;
                m_axi_arvalid = 0;
                buff_axis_tvalid = 1;
            end
            default: begin
                s_axis_tready = 0;
                m_axi_arvalid = 0;
                buff_axis_tvalid = 0;
            end
        endcase
    end
end

//BUFFER MODULE
// Intermediate signals between buffer and fifo
wire [15:0] fifo_in_tdata;
wire fifo_in_tvalid;
wire fifo_in_tready;

//BUFFER MODULE
axis_dwidth_converter_0 buffer (
  s_axis_aclk,
  s_axis_aresetn,
  buff_axis_tvalid,
  buff_axis_tready,
  buff_axis_tdata,
  fifo_in_tvalid,
  fifo_in_tready,
  fifo_in_tdata
);

// OUTPUT FIFO MODULE
axis_data_fifo_0 output_fifo (
  .s_axis_aclk(s_axis_aclk),
  .s_axis_aresetn(s_axis_aresetn),
  .s_axis_tvalid(fifo_in_tvalid),
  .s_axis_tready(fifo_in_tready),
  .s_axis_tdata(fifo_in_tdata),
  .m_axis_tvalid(m_axis_tvalid),
  .m_axis_tready(m_axis_tready),
  .m_axis_tdata(m_axis_tdata)
);

endmodule
