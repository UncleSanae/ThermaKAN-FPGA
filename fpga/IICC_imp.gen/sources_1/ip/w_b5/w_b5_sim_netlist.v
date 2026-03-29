// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 19:05:15 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b5 -prefix
//               w_b5_ w_b5_sim_netlist.v
// Design      : w_b5
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b5,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b5
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
  (* C_INIT_FILE = "w_b5.mem" *) 
  (* C_INIT_FILE_NAME = "w_b5.mif" *) 
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
  w_b5_blk_mem_gen_v8_4_6 U0
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
mv48cz0U
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
