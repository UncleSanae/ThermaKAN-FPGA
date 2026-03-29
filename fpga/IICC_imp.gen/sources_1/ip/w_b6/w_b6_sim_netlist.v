// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 19:05:16 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b6 -prefix
//               w_b6_ w_b6_sim_netlist.v
// Design      : w_b6
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b6,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b6
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
  (* C_INIT_FILE = "w_b6.mem" *) 
  (* C_INIT_FILE_NAME = "w_b6.mif" *) 
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
  w_b6_blk_mem_gen_v8_4_6 U0
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
gcbme0Db
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
