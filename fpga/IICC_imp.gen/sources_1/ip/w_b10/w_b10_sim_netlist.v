// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 16:57:29 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b10 -prefix
//               w_b10_ w_b10_sim_netlist.v
// Design      : w_b10
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b10,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b10
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
  (* C_INIT_FILE = "w_b10.mem" *) 
  (* C_INIT_FILE_NAME = "w_b10.mif" *) 
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
  w_b10_blk_mem_gen_v8_4_6 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17920)
`pragma protect data_block
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
RMOOzve3tv93Crn8DrPO+LvP+5Yp/g==
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
