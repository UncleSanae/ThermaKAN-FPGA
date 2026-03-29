// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sun Mar 22 18:58:08 2026
// Host        : AyaShameimaru running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top w_b4 -prefix
//               w_b4_ w_b4_sim_netlist.v
// Design      : w_b4
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k410tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "w_b4,blk_mem_gen_v8_4_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module w_b4
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
  (* C_INIT_FILE = "w_b4.mem" *) 
  (* C_INIT_FILE_NAME = "w_b4.mif" *) 
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
  w_b4_blk_mem_gen_v8_4_6 U0
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
fmyrfzmZ
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
