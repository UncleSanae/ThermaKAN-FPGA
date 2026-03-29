// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 19:05:18 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b8 -prefix
//               w_b8_ w_b8_sim_netlist.v
// Design      : w_b8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b8,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b8
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
  (* C_INIT_FILE = "w_b8.mem" *) 
  (* C_INIT_FILE_NAME = "w_b8.mif" *) 
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
  w_b8_blk_mem_gen_v8_4_6 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17904)
`pragma protect data_block
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
CiyWuIcF
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
