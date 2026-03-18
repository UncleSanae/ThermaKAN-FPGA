// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Mar 18 11:33:32 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/31683/Desktop/Code/FPGA_KANs_IICC/fpga/IICC_imp.gen/sources_1/ip/sp_rom_a/sp_rom_a_stub.v
// Design      : sp_rom_a
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *)
module sp_rom_a(clka, ena, addra, douta, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="ena,addra[12:0],douta[15:0],enb,addrb[12:0],doutb[15:0]" */
/* synthesis syn_force_seq_prim="clka" */
/* synthesis syn_force_seq_prim="clkb" */;
  input clka /* synthesis syn_isclock = 1 */;
  input ena;
  input [12:0]addra;
  output [15:0]douta;
  input clkb /* synthesis syn_isclock = 1 */;
  input enb;
  input [12:0]addrb;
  output [15:0]doutb;
endmodule
