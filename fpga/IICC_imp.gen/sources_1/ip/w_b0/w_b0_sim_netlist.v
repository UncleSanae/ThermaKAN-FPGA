// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 16:56:20 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b0 -prefix
//               w_b0_ w_b0_sim_netlist.v
// Design      : w_b0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b0,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b0
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
  (* C_INIT_FILE = "w_b0.mem" *) 
  (* C_INIT_FILE_NAME = "w_b0.mif" *) 
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
  w_b0_blk_mem_gen_v8_4_6 U0
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
y0SPV/Ys
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
