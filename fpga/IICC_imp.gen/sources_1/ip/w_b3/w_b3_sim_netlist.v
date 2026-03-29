// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 16:59:16 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b3 -prefix
//               w_b3_ w_b3_sim_netlist.v
// Design      : w_b3
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b3,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b3
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
  (* C_INIT_FILE = "w_b3.mem" *) 
  (* C_INIT_FILE_NAME = "w_b3.mif" *) 
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
  w_b3_blk_mem_gen_v8_4_6 U0
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
8baCrK+H
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
