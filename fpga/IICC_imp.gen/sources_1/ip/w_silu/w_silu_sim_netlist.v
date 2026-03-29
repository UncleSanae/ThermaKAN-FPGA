// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 19:05:16 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_silu -prefix
//               w_silu_ w_silu_sim_netlist.v
// Design      : w_silu
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_silu,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_silu
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.3548 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "w_silu.mem" *) 
  (* C_INIT_FILE_NAME = "w_silu.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "640" *) 
  (* C_READ_DEPTH_B = "640" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "640" *) 
  (* C_WRITE_DEPTH_B = "640" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  w_silu_blk_mem_gen_v8_4_6 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
aMT3usC6uizzcwnzOCX4OsS16Ob+YxFcsGovFpFklbnaIaD1S0lVdxenTwHPp6ByIEi+ehwr6Rgg
z/3AlTheI5NFTM8ihiMA18/wmUxI7EbaftJACA1LykUKCuj5myy0T+DACuv3sGYIZS38TZTZnnBC
FGAlvTZmRWs+JzneH3o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR9ZerhYSAb39nzEkeYvhnwEs5t9y/+yTDf8KuoUtR1BGeHZq8pA/YxtjzQLtaOW1R1IQUb0FtSI
e3CYAb7WHYbIjcpw3vKHvW1SqcGn9CMGa556CYKmD2oF12Kow8xRaFvMSBUVxX7HsHxNWnRd+PU1
+C0YayU2KFIY/7Yl6cZ5luAzhw/6SW3PFYUIyyqWy5MCIXweHOwQR2IpQEdlDur5nluN7i7BeB+i
fxwwHh8TU/g7T4mhZFkiTuBKdLAtQOjxWxzqTMxgcuAjlTylY16FgMFOASdvvSbqBZJjbxMdVloU
rYjS8O/8rWktv8GXcaIdBJ2BRj01q7jsChsbwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Qvl63GHz9mq2xOB7elt/vAQ7URLGdD1Lkcz7f3Wtw31dwjjjbP62Ny/Jr6OmBIheWlgejx38qxAT
TrHiiEyjKmGcnPn1Tn2n+cH4RAxCbOFnCI9n6+YsYMTe9JkplGhGGr39SkFgJz0I2IKpPsuqTjCj
rhf49TAryNMQeRpREJA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MA+9Ro+dh339m0iZrkKbqTKN8gQ5xkxN/SPCfhkOn+5jjgCTS5IOKLHil+HsZDjX333ebxnornwG
MOBxyEdFfLM8SA+bs2r41J/j0af2VVMmCM3hOh8JmZxB4X9Jg/glegNCbvwzqxMbOQNEy+zt7j5t
TFVD82RtPFmYVVYZZyll/WvAA+0aVpyjzLCIM1GznFky0RWLv65Wp4MJJnNRRrtG3muMznVO/u2s
tACsJ9jzv9M0IlMYjYH9BixhG6cZX02I4LEXXaPkhdOINlMMhsbArXtc9NphzmS4bY1/1yF1D6YD
EKLyS2Sr3HDl0O/lefN+jvfG8iKuVl55PNNrVQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wpMTg7STjFkUDhOqdNPa0FHXTnHQgKmhvqDv+rRVBvMiQ8O7u8oj7ibITq3o+jugJsMJ60B410gQ
JFTcqCJKYmYJvqi8rPLLOYDmFG6ZLP/Ixr3n62IyIaCeDltBahi3yV009QN0X+iuzuFCL+Y7g9ff
IvAgyBly+Z3Itv2H9EJMZPMl17Sa7IkgjmWqzVXIKNMKn0iDVYsQw6ZgzQDYQ8N8IvTIEggU3/lh
6Nf0hV0ev3qOv/2P+4w0U766Ux3yLuzPJSI7bKm3/ip9NjhOytxOiKKqVXhKG8dzbbuS5u3EE/eq
q6YxkL7gpvNltVqqBnJB6vHSyWrD6+MqsCtR9A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q7Q4SSp70lxFryaopuic9VVP/Ire0pSsPEIMYdURBAczC7ShkuYeV02U7L3BlAiyBE4vBKcwYSQd
cWiaj8sVP7q4kxoRHKxLV1R5PIO6l4DsLWE2E+1MLyUPME0w5KTular/oX8EPCJ5n/8VCtW7x4Vf
dpeyki1/IAPJkAyi3zVZKHzgKhEwnZaZZtZYuMWoPZMt4V38sAcE42Raf+7yfFWG5HO74JY6iEnW
gJeRk58K+avB/XLF2/j2RQZfjTYizrprT2tUMBK6e7DRWZZtk8AOcsMhUikev44IFGNbNXjP8BXC
0J3y3P7pCFT6l+saU83nRwi/H25fSA34diJtNw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a/8ooC+s+6nfvfa1+oBhsvYWLJjFgp83DI1kNyOi5Am+ugPbGRmgGZudfyo6yw6Yd5gGbLm5aToQ
5G4cGF5HaXD5TU6A0ZZFMTIbzFLE76JMjjIxX8JcaJIZpSmrXqlru8l5gDINUEAmwUY3mRQnjcGJ
0Z+kMRH8iAEF+gEviPiFZSBbJeOPqivIS217kimQJX3BeNbNPQTP+GUidcRywpGMh5avxtA0kDRO
F9SoCSyTm9hr2v9hsK1IUAYQLb7n2/R+z5YNKNzt1oN4qgJH1wZfdI8if2K8+ohyOdnxrrgJOWdj
cOqr7cGqEOYfBMTIQeHVZzb7NGWVN+9B8XSUaQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
FLPvOUNRWNW2GU+FEGmt2XWthOT5bY/31DRbol2cUmEGNF6b2XzpCosNKGx/o2n6sQvGP39KRFCs
nJu0ihe2dUGee9nEZZUcpwPjnEfXVI3yJaRVYy8iL+rm59lXq0jX4sjAPieDvv8shgAnoXLTZGlq
K+2c1JhaHt+nFi27TDrYar/+P8nP1MhocOS7BjzCvSs0foEXj92/qD+71Sm/LqGr8cjlH2qTJJ8B
ynxoH6iT+bksVA2VbtPT9o6h1kJ/zwP4wcsL9l+qSlJhd4GI11JPux26DlNyIi41WmufQcfiT0PB
r6O9+0E9lV9ODwKdjaxfZRK29rjKeq2yr0jWhMV38XKKqHAJli7MIypGRXcCo+u89H87KgYt+ebw
s3foIqCe0JKR57WzI8VD6XdNtOL8eBxK539oemx4vkE0cGYECZKYru6A2hPeZOYDD5eyWSUlQl1R
EciK49WM8HnssyRVcmE6di6bISMbVi0TZG/v98bz+9UZa8DtqMVYH0tz

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fphquQOeFuqByo36Gh2C1zEC1J6u9swSMbMzsKldIvLm+SZ6/hr/N8KJ/G2vBABzX6UtbVuP1ZXx
AxdftP4Aqis1B3Bs6989aQG9eo0SOHA7r6aFLtFb3qoD5Pvqw4aVNU4z4EtTpFpn/jCWD21lKROf
q5X32HRfFq1jwqod+9vIbUNRRzz5y9VHvXfacZlxDazSPmcCF4hxB1KqWqT44KmYVkDedgkgnYgb
ZGidHnTb3W7C8tSqC9ac4kNJCL429QndtddweESJNlpX+65pt9Irok9pkOodwoj0QScswOIFjhBZ
/GrzZLQcFWiD3gXRU4DazzxQnGdRH4qEIRWziw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1lUYYHPCt1BUJOvcBbgMU2GSQiqfxItz4ntieMaenjrtsE9SLwaU6xB0tBl8Atw5yP/RRNww1kX/
9uZbTz5He3r9mPVt+mGxB4N3f9BbCrQRb4USVPgKO/+vWUfMQERGklScy0+fz75WuxH74CjRUoDI
8iyssb2cUNnfDe13jIoI8gM1w4w/Pkxkmb6Mef53QMxacHAWEZeytcH3fuL/adO263D8P90U3XJv
vBXJmbjkRVi9qzjBzfMxuOy2KbZaZgR3BLzaffIfFnMwg/Rb8sGls5pQsZv5jL2wk3+Bj3OXBYdd
pDyjGoalJBzObKzd/t15kNHwY4FXYFcZLQPncw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YRmSEzaa2WFVvMH1BwWc1TIUpVbzSEIP0VbI6n0sEgct/X4PiTfMQmK1jBVCaISIzwBxscKQwZOt
mb/nmINGg6I7ih39LSbBMtx6cdCUiyaLkPeRbqfyPpKhvnUIFmdKVvTd1dYzxeOeuDnhSVaBaAcN
3lngSg7lIbmhLIGjC29yQrBTiLArbVZi6IRGronMK51e3UrYa6GspsznhiuRcXjEb4bHKrJ2CM5Z
BUwA+E9949sQgyOagFZbLVle2ESbwBaoxcAPn2gxfRHlT0leqyLgUGDZLsfArzGzw9BTGzyEG2TR
XOrKFNYRfMXMrnGsBM7acIelY4LdAMgsKgDH/A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17936)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
