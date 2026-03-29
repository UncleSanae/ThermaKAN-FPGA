// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 18:03:10 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b7 -prefix
//               w_b7_ w_b7_sim_netlist.v
// Design      : w_b7
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b7,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b7
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
  (* C_INIT_FILE = "w_b7.mem" *) 
  (* C_INIT_FILE_NAME = "w_b7.mif" *) 
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
  w_b7_blk_mem_gen_v8_4_6 U0
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
rg7fOgrd
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
