// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 16:54:08 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b1 -prefix
//               w_b1_ w_b1_sim_netlist.v
// Design      : w_b1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b1,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b1
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
  (* C_INIT_FILE = "w_b1.mem" *) 
  (* C_INIT_FILE_NAME = "w_b1.mif" *) 
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
  w_b1_blk_mem_gen_v8_4_6 U0
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
MxWIUWk8
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
