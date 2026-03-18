module KERNEL #(
    parameter S_AXIS_DATAWIDTH = 16,
    parameter M_AXI_RDATAWIDTH = 64,
    parameter M_AXIS_DATAWIDTH = 64,
    parameter LG_LAYERSIZE     = 12,
    parameter ACC_DATAWIDTH    = 192  // Changed from 128 to 192 (4 x 48-bit accumulators)
)(
    input wire s_axis_aclk,
    input wire s_axis_aresetn,

    input wire [S_AXIS_DATAWIDTH-1:0] s_axis_tdata,
    input wire s_axis_tvalid,
    output reg s_axis_tready,

    input wire [M_AXI_RDATAWIDTH-1:0] m_axi_rdata,
    input wire m_axi_rvalid,
    input wire m_axi_rlast,
    output reg m_axi_rready,

    output reg [M_AXIS_DATAWIDTH-1:0] m_axis_tdata,
    output reg m_axis_tvalid,
    output reg m_axis_tlast,
    input wire m_axis_tready,

    input wire [LG_LAYERSIZE-1:0] input_layersize_x5,
    input wire [LG_LAYERSIZE-1:0] output_layersize
);

//pointers and counters
reg [LG_LAYERSIZE+2:0] write_counter;
reg signed [LG_LAYERSIZE-1:0] write_ptr, read_ptr;

//ram values
reg write_en;
reg [ACC_DATAWIDTH-1:0] write_data;
wire [ACC_DATAWIDTH-1:0] read_data;
reg [M_AXIS_DATAWIDTH-1:0] output_data;


//datapath reg
reg [31:0] mul1, mul2, mul3, mul4;
reg [ACC_DATAWIDTH-1:0] prev_value;

//control reg
reg step;
reg inp_valid, mul_valid, write_valid, first, mul_first;

//misc 
wire last_iter = (write_counter+1 == input_layersize_x5);
wire last_beat = (write_ptr+1 == output_layersize);

RAM #(
    .PTR_WIDTH(LG_LAYERSIZE),
    .DATA_WIDTH(ACC_DATAWIDTH)
) ram (s_axis_aclk, write_en, step, write_ptr, read_ptr, write_data, read_data);

//pipelined datapath
always @(posedge s_axis_aclk) begin
    if(~s_axis_aresetn) begin
        mul_valid <= 0;
        write_valid <= 0; 
    end
    else if(step) begin
        //mul + read stage
        mul1 <= $signed(s_axis_tdata)*$signed(m_axi_rdata[15:0]);
        mul2 <= $signed(s_axis_tdata)*$signed(m_axi_rdata[31:16]);
        mul3 <= $signed(s_axis_tdata)*$signed(m_axi_rdata[47:32]);
        mul4 <= $signed(s_axis_tdata)*$signed(m_axi_rdata[63:48]);
        mul_valid <= inp_valid;
        mul_first <= first;
        //add stage - 48-bit accumulators with sign extension
        write_data[47:0]    <= (mul_first ? 48'd0 : $signed(read_data[47:0]))    + $signed({{16{mul1[31]}}, mul1});
        write_data[95:48]   <= (mul_first ? 48'd0 : $signed(read_data[95:48]))   + $signed({{16{mul2[31]}}, mul2});
        write_data[143:96]  <= (mul_first ? 48'd0 : $signed(read_data[143:96]))  + $signed({{16{mul3[31]}}, mul3});
        write_data[191:144] <= (mul_first ? 48'd0 : $signed(read_data[191:144])) + $signed({{16{mul4[31]}}, mul4});
        write_valid <= mul_valid;
    end
end

always @(posedge s_axis_aclk) begin
    if(~s_axis_aresetn) begin
        first <= 1;
    end
    else begin
        if(step & inp_valid) begin
            if(last_iter & last_beat)
                first <= 1;
            else if(m_axi_rlast)
                first <= 0;
        end
    end
end

//control logic
always @(posedge s_axis_aclk) begin
    if(~s_axis_aresetn) begin
        write_counter <= 0;
        write_ptr <= 0;
        read_ptr <= 0;
   
    end
    else begin
        //handle read_ptr
        if(step & inp_valid) begin
            if(read_ptr+1 == output_layersize) begin
                read_ptr <= 0;
            end
            else 
                read_ptr <= read_ptr + 1; 
        end
        //hande write_ptr
        if(step & write_valid) begin
            if(last_beat) begin
                write_ptr <= 0;
                if(last_iter)
                    write_counter <= 0;
                else 
                    write_counter <= write_counter + 1;
            end
            else
                write_ptr <= write_ptr + 1; 
        end
    end
end

always @(*) begin
    inp_valid = s_axis_tvalid & m_axi_rvalid;
    step = last_iter ? m_axis_tready : 1;
    write_en = step & write_valid & ~last_iter;
end

always @(*) begin
    if(~s_axis_aresetn) begin
        s_axis_tready = 0;
        m_axi_rready = 0;
        m_axis_tvalid = 0;
        m_axis_tdata = 0;
        m_axis_tlast = 0;
    end
    else begin
        s_axis_tready = (m_axi_rlast) & step & inp_valid;
        // Optimized: Decoupled rready from rvalid
        m_axi_rready = step & s_axis_tvalid;
        if(last_iter) begin
            m_axis_tvalid = write_valid;
            // Extract Q6.10 from 48-bit accumulators: bits [25:10] (Shift right by 10)
            // Q5.10 * Q5.10 = Q10.20. Accumulator has 20 fractional bits.
            // We want 10 fractional bits in output. So we drop the lower 10 bits.
            m_axis_tdata = {write_data[25:10], write_data[73:58], write_data[121:106], write_data[169:154]};
            m_axis_tlast = last_beat;
        end
        else begin
            m_axis_tvalid = 0;
            m_axis_tdata = 0;
            m_axis_tlast = 0;
        end
    end
end

endmodule
