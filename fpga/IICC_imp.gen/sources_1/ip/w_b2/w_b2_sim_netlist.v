// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 16:58:21 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b2 -prefix
//               w_b2_ w_b2_sim_netlist.v
// Design      : w_b2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b2,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b2
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
  (* C_INIT_FILE = "w_b2.mem" *) 
  (* C_INIT_FILE_NAME = "w_b2.mif" *) 
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
  w_b2_blk_mem_gen_v8_4_6 U0
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
vYbW4csT
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
