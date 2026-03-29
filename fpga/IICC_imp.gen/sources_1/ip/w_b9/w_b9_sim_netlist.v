// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 19:05:15 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b9 -prefix
//               w_b9_ w_b9_sim_netlist.v
// Design      : w_b9
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b9,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b9
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
  (* C_INIT_FILE = "w_b9.mem" *) 
  (* C_INIT_FILE_NAME = "w_b9.mif" *) 
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
  w_b9_blk_mem_gen_v8_4_6 U0
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
andcVZ7p
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
