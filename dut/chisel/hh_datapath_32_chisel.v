module multiplier(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [47:0] io_out_s
);
  assign io_out_s = io_in_a * io_in_b; // @[BinaryDesigns.scala 81:23]
endmodule
module full_subber(
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  output [7:0] io_out_s,
  output       io_out_c
);
  wire [8:0] _result_T = io_in_a - io_in_b; // @[BinaryDesigns.scala 69:23]
  wire [9:0] _result_T_2 = _result_T - 9'h0; // @[BinaryDesigns.scala 69:34]
  wire [8:0] result = _result_T_2[8:0]; // @[BinaryDesigns.scala 68:22 69:12]
  assign io_out_s = result[7:0]; // @[BinaryDesigns.scala 70:23]
  assign io_out_c = result[8]; // @[BinaryDesigns.scala 71:23]
endmodule
module twoscomplement(
  input  [7:0] io_in,
  output [7:0] io_out
);
  wire [7:0] _x_T = ~io_in; // @[BinaryDesigns.scala 25:16]
  assign io_out = 8'h1 + _x_T; // @[BinaryDesigns.scala 25:14]
endmodule
module full_adder(
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  output [7:0] io_out_s,
  output       io_out_c
);
  wire [8:0] _result_T = io_in_a + io_in_b; // @[BinaryDesigns.scala 55:23]
  wire [9:0] _result_T_1 = {{1'd0}, _result_T}; // @[BinaryDesigns.scala 55:34]
  wire [8:0] result = _result_T_1[8:0]; // @[BinaryDesigns.scala 54:22 55:12]
  assign io_out_s = result[7:0]; // @[BinaryDesigns.scala 56:23]
  assign io_out_c = result[8]; // @[BinaryDesigns.scala 57:23]
endmodule
module FP_multiplier_10ccs(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
`endif // RANDOMIZE_REG_INIT
  wire [23:0] multiplier_io_in_a; // @[FloatingPointDesigns.scala 1721:28]
  wire [23:0] multiplier_io_in_b; // @[FloatingPointDesigns.scala 1721:28]
  wire [47:0] multiplier_io_out_s; // @[FloatingPointDesigns.scala 1721:28]
  wire [7:0] subber_io_in_a; // @[FloatingPointDesigns.scala 1728:24]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 1728:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 1728:24]
  wire  subber_io_out_c; // @[FloatingPointDesigns.scala 1728:24]
  wire [7:0] complementN_io_in; // @[FloatingPointDesigns.scala 1737:29]
  wire [7:0] complementN_io_out; // @[FloatingPointDesigns.scala 1737:29]
  wire [7:0] adderN_io_in_a; // @[FloatingPointDesigns.scala 1754:24]
  wire [7:0] adderN_io_in_b; // @[FloatingPointDesigns.scala 1754:24]
  wire [7:0] adderN_io_out_s; // @[FloatingPointDesigns.scala 1754:24]
  wire  adderN_io_out_c; // @[FloatingPointDesigns.scala 1754:24]
  wire  s_0 = io_in_a[31]; // @[FloatingPointDesigns.scala 1687:20]
  wire  s_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 1688:20]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 1692:64]
  wire [8:0] _GEN_63 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 1692:36]
  wire [7:0] _GEN_0 = io_in_a[30:23] < 8'h1 ? 8'h1 : io_in_a[30:23]; // @[FloatingPointDesigns.scala 1694:45 1695:14 1697:14]
  wire [8:0] _GEN_1 = _GEN_63 > _T_2 ? _T_2 : {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 1692:71 1693:14]
  wire [8:0] _GEN_64 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 1699:36]
  wire [7:0] _GEN_2 = io_in_b[30:23] < 8'h1 ? 8'h1 : io_in_b[30:23]; // @[FloatingPointDesigns.scala 1701:45 1702:14 1704:14]
  wire [8:0] _GEN_3 = _GEN_64 > _T_2 ? _T_2 : {{1'd0}, _GEN_2}; // @[FloatingPointDesigns.scala 1699:71 1700:14]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FloatingPointDesigns.scala 1709:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 1710:23]
  wire [23:0] new_frac_0 = {1'h1,frac_0}; // @[FloatingPointDesigns.scala 1714:24]
  wire [23:0] new_frac_1 = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 1715:24]
  reg  s_reg_0_0; // @[FloatingPointDesigns.scala 1717:24]
  reg  s_reg_0_1; // @[FloatingPointDesigns.scala 1717:24]
  reg  s_reg_1_0; // @[FloatingPointDesigns.scala 1717:24]
  reg  s_reg_1_1; // @[FloatingPointDesigns.scala 1717:24]
  reg  s_reg_2_0; // @[FloatingPointDesigns.scala 1717:24]
  reg  s_reg_2_1; // @[FloatingPointDesigns.scala 1717:24]
  reg  s_reg_3_0; // @[FloatingPointDesigns.scala 1717:24]
  reg  s_reg_3_1; // @[FloatingPointDesigns.scala 1717:24]
  reg  s_reg_4_0; // @[FloatingPointDesigns.scala 1717:24]
  reg  s_reg_4_1; // @[FloatingPointDesigns.scala 1717:24]
  reg [7:0] exp_reg_0_0; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_0_1; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_1_0; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_1_1; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_2_0; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_2_1; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_3_0; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_3_1; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_4_0; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_4_1; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_5_0; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_5_1; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_6_0; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_6_1; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_7_0; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_7_1; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_8_0; // @[FloatingPointDesigns.scala 1718:26]
  reg [7:0] exp_reg_8_1; // @[FloatingPointDesigns.scala 1718:26]
  reg [23:0] new_frac_reg_0_0; // @[FloatingPointDesigns.scala 1719:31]
  reg [23:0] new_frac_reg_0_1; // @[FloatingPointDesigns.scala 1719:31]
  reg [23:0] new_frac_reg_1_0; // @[FloatingPointDesigns.scala 1719:31]
  reg [23:0] new_frac_reg_1_1; // @[FloatingPointDesigns.scala 1719:31]
  reg [47:0] multipplier_out_s_reg_0; // @[FloatingPointDesigns.scala 1725:40]
  reg [47:0] multipplier_out_s_reg_1; // @[FloatingPointDesigns.scala 1725:40]
  reg [47:0] multipplier_out_s_reg_2; // @[FloatingPointDesigns.scala 1725:40]
  reg [47:0] multipplier_out_s_reg_3; // @[FloatingPointDesigns.scala 1725:40]
  reg [47:0] multipplier_out_s_reg_4; // @[FloatingPointDesigns.scala 1725:40]
  reg [47:0] multipplier_out_s_reg_5; // @[FloatingPointDesigns.scala 1725:40]
  reg [7:0] subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1733:35]
  reg [7:0] complementN_out_reg_0; // @[FloatingPointDesigns.scala 1740:38]
  reg [7:0] complementN_out_reg_1; // @[FloatingPointDesigns.scala 1740:38]
  reg [7:0] complementN_out_reg_2; // @[FloatingPointDesigns.scala 1740:38]
  wire  new_s = s_reg_4_0 ^ s_reg_4_1; // @[FloatingPointDesigns.scala 1743:26]
  reg  new_s_reg_0; // @[FloatingPointDesigns.scala 1745:28]
  reg  new_s_reg_1; // @[FloatingPointDesigns.scala 1745:28]
  reg  new_s_reg_2; // @[FloatingPointDesigns.scala 1745:28]
  reg  new_s_reg_3; // @[FloatingPointDesigns.scala 1745:28]
  wire  is_exp1_neg_wire = exp_reg_5_1 < 8'h7f; // @[FloatingPointDesigns.scala 1748:40]
  reg  is_exp1_neg_reg_0; // @[FloatingPointDesigns.scala 1750:34]
  reg  is_exp1_neg_reg_1; // @[FloatingPointDesigns.scala 1750:34]
  wire [7:0] _adderN_io_in_a_T_1 = exp_reg_6_0 + 8'h1; // @[FloatingPointDesigns.scala 1758:39]
  reg [7:0] adderN_out_s_reg_0; // @[FloatingPointDesigns.scala 1765:35]
  reg  adderN_out_c_reg_0; // @[FloatingPointDesigns.scala 1766:35]
  reg [7:0] new_exp_reg_0; // @[FloatingPointDesigns.scala 1768:30]
  reg [22:0] new_mant_reg_0; // @[FloatingPointDesigns.scala 1769:31]
  reg [31:0] reg_out_s; // @[FloatingPointDesigns.scala 1771:28]
  wire  _new_exp_reg_0_T_1 = ~adderN_out_c_reg_0; // @[FloatingPointDesigns.scala 1775:55]
  wire [7:0] _new_exp_reg_0_T_2 = ~adderN_out_c_reg_0 ? 8'h1 : adderN_out_s_reg_0; // @[FloatingPointDesigns.scala 1775:54]
  wire  _new_exp_reg_0_T_5 = adderN_out_c_reg_0 | adderN_out_s_reg_0 > 8'hfe; // @[FloatingPointDesigns.scala 1775:142]
  wire [7:0] _new_exp_reg_0_T_6 = adderN_out_c_reg_0 | adderN_out_s_reg_0 > 8'hfe ? 8'hfe : adderN_out_s_reg_0; // @[FloatingPointDesigns.scala 1775:114]
  wire [7:0] _new_exp_reg_0_T_7 = is_exp1_neg_reg_1 ? _new_exp_reg_0_T_2 : _new_exp_reg_0_T_6; // @[FloatingPointDesigns.scala 1775:30]
  wire [31:0] _reg_out_s_T_1 = {new_s_reg_3,new_exp_reg_0,new_mant_reg_0}; // @[FloatingPointDesigns.scala 1817:53]
  wire [7:0] exp_0 = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 1691:19]
  wire [7:0] exp_1 = _GEN_3[7:0]; // @[FloatingPointDesigns.scala 1691:19]
  wire [47:0] _GEN_17 = multiplier_io_out_s; // @[FloatingPointDesigns.scala 1773:19 1785:32 1725:40]
  wire [7:0] _GEN_18 = subber_io_out_s; // @[FloatingPointDesigns.scala 1773:19 1786:27 1733:35]
  wire [7:0] _GEN_20 = complementN_io_out; // @[FloatingPointDesigns.scala 1773:19 1788:30 1740:38]
  wire [7:0] _GEN_23 = adderN_io_out_s; // @[FloatingPointDesigns.scala 1773:19 1791:27 1765:35]
  wire  _GEN_24 = adderN_io_out_c; // @[FloatingPointDesigns.scala 1773:19 1792:27 1766:35]
  multiplier multiplier ( // @[FloatingPointDesigns.scala 1721:28]
    .io_in_a(multiplier_io_in_a),
    .io_in_b(multiplier_io_in_b),
    .io_out_s(multiplier_io_out_s)
  );
  full_subber subber ( // @[FloatingPointDesigns.scala 1728:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  twoscomplement complementN ( // @[FloatingPointDesigns.scala 1737:29]
    .io_in(complementN_io_in),
    .io_out(complementN_io_out)
  );
  full_adder adderN ( // @[FloatingPointDesigns.scala 1754:24]
    .io_in_a(adderN_io_in_a),
    .io_in_b(adderN_io_in_b),
    .io_out_s(adderN_io_out_s),
    .io_out_c(adderN_io_out_c)
  );
  assign io_out_s = reg_out_s; // @[FloatingPointDesigns.scala 1820:14]
  assign multiplier_io_in_a = new_frac_reg_1_0; // @[FloatingPointDesigns.scala 1722:24]
  assign multiplier_io_in_b = new_frac_reg_1_1; // @[FloatingPointDesigns.scala 1723:24]
  assign subber_io_in_a = 8'h7f; // @[FloatingPointDesigns.scala 1729:20]
  assign subber_io_in_b = exp_reg_2_1; // @[FloatingPointDesigns.scala 1730:20]
  assign complementN_io_in = subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1738:23]
  assign adderN_io_in_a = multipplier_out_s_reg_4[47] ? _adderN_io_in_a_T_1 : exp_reg_6_0; // @[FloatingPointDesigns.scala 1757:70 1758:22 1761:22]
  assign adderN_io_in_b = complementN_out_reg_2; // @[FloatingPointDesigns.scala 1757:70 1759:22 1762:22]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 1717:24]
      s_reg_0_0 <= 1'h0; // @[FloatingPointDesigns.scala 1717:24]
    end else begin
      s_reg_0_0 <= s_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1717:24]
      s_reg_0_1 <= 1'h0; // @[FloatingPointDesigns.scala 1717:24]
    end else begin
      s_reg_0_1 <= s_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1717:24]
      s_reg_1_0 <= 1'h0; // @[FloatingPointDesigns.scala 1717:24]
    end else begin
      s_reg_1_0 <= s_reg_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1717:24]
      s_reg_1_1 <= 1'h0; // @[FloatingPointDesigns.scala 1717:24]
    end else begin
      s_reg_1_1 <= s_reg_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1717:24]
      s_reg_2_0 <= 1'h0; // @[FloatingPointDesigns.scala 1717:24]
    end else begin
      s_reg_2_0 <= s_reg_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1717:24]
      s_reg_2_1 <= 1'h0; // @[FloatingPointDesigns.scala 1717:24]
    end else begin
      s_reg_2_1 <= s_reg_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1717:24]
      s_reg_3_0 <= 1'h0; // @[FloatingPointDesigns.scala 1717:24]
    end else begin
      s_reg_3_0 <= s_reg_2_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1717:24]
      s_reg_3_1 <= 1'h0; // @[FloatingPointDesigns.scala 1717:24]
    end else begin
      s_reg_3_1 <= s_reg_2_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1717:24]
      s_reg_4_0 <= 1'h0; // @[FloatingPointDesigns.scala 1717:24]
    end else begin
      s_reg_4_0 <= s_reg_3_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1717:24]
      s_reg_4_1 <= 1'h0; // @[FloatingPointDesigns.scala 1717:24]
    end else begin
      s_reg_4_1 <= s_reg_3_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_0_0 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_0_0 <= exp_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_0_1 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_0_1 <= exp_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_1_0 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_1_0 <= exp_reg_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_1_1 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_1_1 <= exp_reg_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_2_0 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_2_0 <= exp_reg_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_2_1 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_2_1 <= exp_reg_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_3_0 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_3_0 <= exp_reg_2_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_3_1 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_3_1 <= exp_reg_2_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_4_0 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_4_0 <= exp_reg_3_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_4_1 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_4_1 <= exp_reg_3_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_5_0 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_5_0 <= exp_reg_4_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_5_1 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_5_1 <= exp_reg_4_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_6_0 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_6_0 <= exp_reg_5_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_6_1 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_6_1 <= exp_reg_5_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_7_0 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_7_0 <= exp_reg_6_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_7_1 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_7_1 <= exp_reg_6_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_8_0 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_8_0 <= exp_reg_7_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1718:26]
      exp_reg_8_1 <= 8'h0; // @[FloatingPointDesigns.scala 1718:26]
    end else begin
      exp_reg_8_1 <= exp_reg_7_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1719:31]
      new_frac_reg_0_0 <= 24'h0; // @[FloatingPointDesigns.scala 1719:31]
    end else begin
      new_frac_reg_0_0 <= new_frac_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1719:31]
      new_frac_reg_0_1 <= 24'h0; // @[FloatingPointDesigns.scala 1719:31]
    end else begin
      new_frac_reg_0_1 <= new_frac_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1719:31]
      new_frac_reg_1_0 <= 24'h0; // @[FloatingPointDesigns.scala 1719:31]
    end else begin
      new_frac_reg_1_0 <= new_frac_reg_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1719:31]
      new_frac_reg_1_1 <= 24'h0; // @[FloatingPointDesigns.scala 1719:31]
    end else begin
      new_frac_reg_1_1 <= new_frac_reg_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1725:40]
      multipplier_out_s_reg_0 <= 48'h0; // @[FloatingPointDesigns.scala 1725:40]
    end else begin
      multipplier_out_s_reg_0 <= _GEN_17;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1725:40]
      multipplier_out_s_reg_1 <= 48'h0; // @[FloatingPointDesigns.scala 1725:40]
    end else begin
      multipplier_out_s_reg_1 <= multipplier_out_s_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1725:40]
      multipplier_out_s_reg_2 <= 48'h0; // @[FloatingPointDesigns.scala 1725:40]
    end else begin
      multipplier_out_s_reg_2 <= multipplier_out_s_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1725:40]
      multipplier_out_s_reg_3 <= 48'h0; // @[FloatingPointDesigns.scala 1725:40]
    end else begin
      multipplier_out_s_reg_3 <= multipplier_out_s_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1725:40]
      multipplier_out_s_reg_4 <= 48'h0; // @[FloatingPointDesigns.scala 1725:40]
    end else begin
      multipplier_out_s_reg_4 <= multipplier_out_s_reg_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1725:40]
      multipplier_out_s_reg_5 <= 48'h0; // @[FloatingPointDesigns.scala 1725:40]
    end else begin
      multipplier_out_s_reg_5 <= multipplier_out_s_reg_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1733:35]
      subber_out_s_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1733:35]
    end else begin
      subber_out_s_reg_0 <= _GEN_18;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1740:38]
      complementN_out_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1740:38]
    end else begin
      complementN_out_reg_0 <= _GEN_20;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1740:38]
      complementN_out_reg_1 <= 8'h0; // @[FloatingPointDesigns.scala 1740:38]
    end else begin
      complementN_out_reg_1 <= complementN_out_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1740:38]
      complementN_out_reg_2 <= 8'h0; // @[FloatingPointDesigns.scala 1740:38]
    end else begin
      complementN_out_reg_2 <= complementN_out_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1745:28]
      new_s_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1745:28]
    end else begin
      new_s_reg_0 <= new_s;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1745:28]
      new_s_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1745:28]
    end else begin
      new_s_reg_1 <= new_s_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1745:28]
      new_s_reg_2 <= 1'h0; // @[FloatingPointDesigns.scala 1745:28]
    end else begin
      new_s_reg_2 <= new_s_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1745:28]
      new_s_reg_3 <= 1'h0; // @[FloatingPointDesigns.scala 1745:28]
    end else begin
      new_s_reg_3 <= new_s_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1750:34]
      is_exp1_neg_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1750:34]
    end else begin
      is_exp1_neg_reg_0 <= is_exp1_neg_wire;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1750:34]
      is_exp1_neg_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1750:34]
    end else begin
      is_exp1_neg_reg_1 <= is_exp1_neg_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1765:35]
      adderN_out_s_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1765:35]
    end else begin
      adderN_out_s_reg_0 <= _GEN_23;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1766:35]
      adderN_out_c_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1766:35]
    end else begin
      adderN_out_c_reg_0 <= _GEN_24;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1768:30]
      new_exp_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1768:30]
    end else if (multipplier_out_s_reg_5[47]) begin // @[FloatingPointDesigns.scala 1774:72]
      new_exp_reg_0 <= _new_exp_reg_0_T_7; // @[FloatingPointDesigns.scala 1775:24]
    end else begin
      new_exp_reg_0 <= _new_exp_reg_0_T_7; // @[FloatingPointDesigns.scala 1778:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1769:31]
      new_mant_reg_0 <= 23'h0; // @[FloatingPointDesigns.scala 1769:31]
    end else if (multipplier_out_s_reg_5[47]) begin // @[FloatingPointDesigns.scala 1774:72]
      if (is_exp1_neg_reg_1) begin // @[FloatingPointDesigns.scala 1776:31]
        if (_new_exp_reg_0_T_1) begin // @[FloatingPointDesigns.scala 1776:55]
          new_mant_reg_0 <= 23'h0;
        end else begin
          new_mant_reg_0 <= multipplier_out_s_reg_5[46:24];
        end
      end else if (_new_exp_reg_0_T_5) begin // @[FloatingPointDesigns.scala 1776:160]
        new_mant_reg_0 <= 23'h7fffff;
      end else begin
        new_mant_reg_0 <= multipplier_out_s_reg_5[46:24];
      end
    end else if (is_exp1_neg_reg_1) begin // @[FloatingPointDesigns.scala 1779:31]
      if (_new_exp_reg_0_T_1) begin // @[FloatingPointDesigns.scala 1779:55]
        new_mant_reg_0 <= 23'h0;
      end else begin
        new_mant_reg_0 <= multipplier_out_s_reg_5[45:23];
      end
    end else if (_new_exp_reg_0_T_5) begin // @[FloatingPointDesigns.scala 1779:156]
      new_mant_reg_0 <= 23'h7fffff;
    end else begin
      new_mant_reg_0 <= multipplier_out_s_reg_5[45:23];
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1771:28]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 1771:28]
    end else if (exp_reg_8_0 == 8'h0 | exp_reg_8_1 == 8'h0) begin // @[FloatingPointDesigns.scala 1814:60]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 1815:19]
    end else begin
      reg_out_s <= _reg_out_s_T_1; // @[FloatingPointDesigns.scala 1817:19]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  s_reg_0_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s_reg_0_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s_reg_1_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s_reg_1_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s_reg_2_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s_reg_2_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s_reg_3_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s_reg_3_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s_reg_4_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s_reg_4_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  exp_reg_0_0 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  exp_reg_0_1 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  exp_reg_1_0 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  exp_reg_1_1 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  exp_reg_2_0 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  exp_reg_2_1 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  exp_reg_3_0 = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  exp_reg_3_1 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  exp_reg_4_0 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  exp_reg_4_1 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  exp_reg_5_0 = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  exp_reg_5_1 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  exp_reg_6_0 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  exp_reg_6_1 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  exp_reg_7_0 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  exp_reg_7_1 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  exp_reg_8_0 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  exp_reg_8_1 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  new_frac_reg_0_0 = _RAND_28[23:0];
  _RAND_29 = {1{`RANDOM}};
  new_frac_reg_0_1 = _RAND_29[23:0];
  _RAND_30 = {1{`RANDOM}};
  new_frac_reg_1_0 = _RAND_30[23:0];
  _RAND_31 = {1{`RANDOM}};
  new_frac_reg_1_1 = _RAND_31[23:0];
  _RAND_32 = {2{`RANDOM}};
  multipplier_out_s_reg_0 = _RAND_32[47:0];
  _RAND_33 = {2{`RANDOM}};
  multipplier_out_s_reg_1 = _RAND_33[47:0];
  _RAND_34 = {2{`RANDOM}};
  multipplier_out_s_reg_2 = _RAND_34[47:0];
  _RAND_35 = {2{`RANDOM}};
  multipplier_out_s_reg_3 = _RAND_35[47:0];
  _RAND_36 = {2{`RANDOM}};
  multipplier_out_s_reg_4 = _RAND_36[47:0];
  _RAND_37 = {2{`RANDOM}};
  multipplier_out_s_reg_5 = _RAND_37[47:0];
  _RAND_38 = {1{`RANDOM}};
  subber_out_s_reg_0 = _RAND_38[7:0];
  _RAND_39 = {1{`RANDOM}};
  complementN_out_reg_0 = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  complementN_out_reg_1 = _RAND_40[7:0];
  _RAND_41 = {1{`RANDOM}};
  complementN_out_reg_2 = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  new_s_reg_0 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  new_s_reg_1 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  new_s_reg_2 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  new_s_reg_3 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  is_exp1_neg_reg_0 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  is_exp1_neg_reg_1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  adderN_out_s_reg_0 = _RAND_48[7:0];
  _RAND_49 = {1{`RANDOM}};
  adderN_out_c_reg_0 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  new_exp_reg_0 = _RAND_50[7:0];
  _RAND_51 = {1{`RANDOM}};
  new_mant_reg_0 = _RAND_51[22:0];
  _RAND_52 = {1{`RANDOM}};
  reg_out_s = _RAND_52[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module full_adder_32(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [23:0] io_out_s,
  output        io_out_c
);
  wire [24:0] _result_T = io_in_a + io_in_b; // @[BinaryDesigns.scala 55:23]
  wire [25:0] _result_T_1 = {{1'd0}, _result_T}; // @[BinaryDesigns.scala 55:34]
  wire [24:0] result = _result_T_1[24:0]; // @[BinaryDesigns.scala 54:22 55:12]
  assign io_out_s = result[23:0]; // @[BinaryDesigns.scala 56:23]
  assign io_out_c = result[24]; // @[BinaryDesigns.scala 57:23]
endmodule
module FP_adder_13ccs(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] subber_io_in_a; // @[FloatingPointDesigns.scala 1456:24]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 1456:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 1456:24]
  wire  subber_io_out_c; // @[FloatingPointDesigns.scala 1456:24]
  wire [23:0] adder_io_in_a; // @[FloatingPointDesigns.scala 1462:23]
  wire [23:0] adder_io_in_b; // @[FloatingPointDesigns.scala 1462:23]
  wire [23:0] adder_io_out_s; // @[FloatingPointDesigns.scala 1462:23]
  wire  adder_io_out_c; // @[FloatingPointDesigns.scala 1462:23]
  wire [7:0] subber2_io_in_a; // @[FloatingPointDesigns.scala 1523:25]
  wire [7:0] subber2_io_in_b; // @[FloatingPointDesigns.scala 1523:25]
  wire [7:0] subber2_io_out_s; // @[FloatingPointDesigns.scala 1523:25]
  wire  subber2_io_out_c; // @[FloatingPointDesigns.scala 1523:25]
  wire  sign_0 = io_in_a[31]; // @[FloatingPointDesigns.scala 1385:23]
  wire  sign_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 1386:23]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 1389:64]
  wire [8:0] _GEN_167 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 1389:36]
  wire [7:0] _GEN_0 = io_in_a[30:23] < 8'h1 ? 8'h1 : io_in_a[30:23]; // @[FloatingPointDesigns.scala 1391:46 1392:14 1394:14]
  wire [8:0] _GEN_1 = _GEN_167 > _T_2 ? _T_2 : {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 1389:71 1390:14]
  wire [8:0] _GEN_168 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 1396:36]
  wire [7:0] _GEN_2 = io_in_b[30:23] < 8'h1 ? 8'h1 : io_in_b[30:23]; // @[FloatingPointDesigns.scala 1398:45 1399:14 1401:14]
  wire [8:0] _GEN_3 = _GEN_168 > _T_2 ? _T_2 : {{1'd0}, _GEN_2}; // @[FloatingPointDesigns.scala 1396:71 1397:14]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FloatingPointDesigns.scala 1406:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 1407:23]
  wire [23:0] whole_frac_0 = {1'h1,frac_0}; // @[FloatingPointDesigns.scala 1411:26]
  wire [23:0] whole_frac_1 = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 1412:26]
  reg  sign_reg_0_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_0_1; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_1_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_1_1; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_2_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_2_1; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_3_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_3_1; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_4_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_4_1; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_5_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_5_1; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_6_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_6_1; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_7_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_7_1; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_8_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_8_1; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_9_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_9_1; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_10_0; // @[FloatingPointDesigns.scala 1414:28]
  reg  sign_reg_10_1; // @[FloatingPointDesigns.scala 1414:28]
  reg [7:0] exp_reg_0_0; // @[FloatingPointDesigns.scala 1415:28]
  reg [7:0] exp_reg_0_1; // @[FloatingPointDesigns.scala 1415:28]
  reg [7:0] exp_reg_1_0; // @[FloatingPointDesigns.scala 1415:28]
  reg [7:0] exp_reg_1_1; // @[FloatingPointDesigns.scala 1415:28]
  reg [7:0] exp_reg_2_0; // @[FloatingPointDesigns.scala 1415:28]
  reg [7:0] exp_reg_2_1; // @[FloatingPointDesigns.scala 1415:28]
  reg [22:0] frac_reg_0_0; // @[FloatingPointDesigns.scala 1416:28]
  reg [22:0] frac_reg_0_1; // @[FloatingPointDesigns.scala 1416:28]
  reg [22:0] frac_reg_1_0; // @[FloatingPointDesigns.scala 1416:28]
  reg [22:0] frac_reg_1_1; // @[FloatingPointDesigns.scala 1416:28]
  reg [22:0] frac_reg_2_0; // @[FloatingPointDesigns.scala 1416:28]
  reg [22:0] frac_reg_2_1; // @[FloatingPointDesigns.scala 1416:28]
  reg [23:0] wfrac_reg_0_0; // @[FloatingPointDesigns.scala 1417:28]
  reg [23:0] wfrac_reg_0_1; // @[FloatingPointDesigns.scala 1417:28]
  reg [23:0] wfrac_reg_1_0; // @[FloatingPointDesigns.scala 1417:28]
  reg [23:0] wfrac_reg_1_1; // @[FloatingPointDesigns.scala 1417:28]
  reg [23:0] wfrac_reg_2_0; // @[FloatingPointDesigns.scala 1417:28]
  reg [23:0] wfrac_reg_2_1; // @[FloatingPointDesigns.scala 1417:28]
  reg [7:0] subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1419:35]
  reg [7:0] subber_out_s_reg_1; // @[FloatingPointDesigns.scala 1419:35]
  reg  subber_out_c_reg_0; // @[FloatingPointDesigns.scala 1420:35]
  reg  subber_out_c_reg_1; // @[FloatingPointDesigns.scala 1420:35]
  reg [23:0] wire_temp_add_in_reg_0_0; // @[FloatingPointDesigns.scala 1422:39]
  reg [23:0] wire_temp_add_in_reg_0_1; // @[FloatingPointDesigns.scala 1422:39]
  reg [23:0] wire_temp_add_in_reg_1_0; // @[FloatingPointDesigns.scala 1422:39]
  reg [23:0] wire_temp_add_in_reg_1_1; // @[FloatingPointDesigns.scala 1422:39]
  reg  ref_s_reg_0; // @[FloatingPointDesigns.scala 1424:31]
  reg  ref_s_reg_1; // @[FloatingPointDesigns.scala 1424:31]
  reg  ref_s_reg_2; // @[FloatingPointDesigns.scala 1424:31]
  reg  ref_s_reg_3; // @[FloatingPointDesigns.scala 1424:31]
  reg  ref_s_reg_4; // @[FloatingPointDesigns.scala 1424:31]
  reg  ref_s_reg_5; // @[FloatingPointDesigns.scala 1424:31]
  reg  ref_s_reg_6; // @[FloatingPointDesigns.scala 1424:31]
  reg  ref_s_reg_7; // @[FloatingPointDesigns.scala 1424:31]
  reg [22:0] ref_frac_reg_0; // @[FloatingPointDesigns.scala 1425:31]
  reg [22:0] ref_frac_reg_1; // @[FloatingPointDesigns.scala 1425:31]
  reg [22:0] ref_frac_reg_2; // @[FloatingPointDesigns.scala 1425:31]
  reg [22:0] ref_frac_reg_3; // @[FloatingPointDesigns.scala 1425:31]
  reg [22:0] ref_frac_reg_4; // @[FloatingPointDesigns.scala 1425:31]
  reg [22:0] ref_frac_reg_5; // @[FloatingPointDesigns.scala 1425:31]
  reg [22:0] ref_frac_reg_6; // @[FloatingPointDesigns.scala 1425:31]
  reg [22:0] ref_frac_reg_7; // @[FloatingPointDesigns.scala 1425:31]
  reg [7:0] ref_exp_reg_0; // @[FloatingPointDesigns.scala 1426:31]
  reg [7:0] ref_exp_reg_1; // @[FloatingPointDesigns.scala 1426:31]
  reg [7:0] ref_exp_reg_2; // @[FloatingPointDesigns.scala 1426:31]
  reg [7:0] ref_exp_reg_3; // @[FloatingPointDesigns.scala 1426:31]
  reg [7:0] ref_exp_reg_4; // @[FloatingPointDesigns.scala 1426:31]
  reg [7:0] ref_exp_reg_5; // @[FloatingPointDesigns.scala 1426:31]
  reg [7:0] ref_exp_reg_6; // @[FloatingPointDesigns.scala 1426:31]
  reg [7:0] ref_exp_reg_7; // @[FloatingPointDesigns.scala 1426:31]
  reg [7:0] sub_exp_reg_0; // @[FloatingPointDesigns.scala 1427:31]
  reg [7:0] sub_exp_reg_1; // @[FloatingPointDesigns.scala 1427:31]
  reg [7:0] sub_exp_reg_2; // @[FloatingPointDesigns.scala 1427:31]
  reg [7:0] sub_exp_reg_3; // @[FloatingPointDesigns.scala 1427:31]
  reg [7:0] sub_exp_reg_4; // @[FloatingPointDesigns.scala 1427:31]
  reg [7:0] sub_exp_reg_5; // @[FloatingPointDesigns.scala 1427:31]
  reg [7:0] sub_exp_reg_6; // @[FloatingPointDesigns.scala 1427:31]
  reg [7:0] sub_exp_reg_7; // @[FloatingPointDesigns.scala 1427:31]
  reg [23:0] adder_io_out_s_reg_0; // @[FloatingPointDesigns.scala 1429:37]
  reg [23:0] adder_io_out_s_reg_1; // @[FloatingPointDesigns.scala 1429:37]
  reg [23:0] adder_io_out_s_reg_2; // @[FloatingPointDesigns.scala 1429:37]
  reg  adder_io_out_c_reg_0; // @[FloatingPointDesigns.scala 1430:37]
  reg  new_s_reg_0; // @[FloatingPointDesigns.scala 1432:35]
  reg  new_s_reg_1; // @[FloatingPointDesigns.scala 1432:35]
  reg  new_s_reg_2; // @[FloatingPointDesigns.scala 1432:35]
  reg  new_s_reg_3; // @[FloatingPointDesigns.scala 1432:35]
  reg  new_s_reg_4; // @[FloatingPointDesigns.scala 1432:35]
  reg  new_s_reg_5; // @[FloatingPointDesigns.scala 1432:35]
  reg [22:0] new_out_frac_reg_0; // @[FloatingPointDesigns.scala 1433:35]
  reg [7:0] new_out_exp_reg_0; // @[FloatingPointDesigns.scala 1434:35]
  reg  E_reg_0; // @[FloatingPointDesigns.scala 1435:24]
  reg  E_reg_1; // @[FloatingPointDesigns.scala 1435:24]
  reg  E_reg_2; // @[FloatingPointDesigns.scala 1435:24]
  reg  E_reg_3; // @[FloatingPointDesigns.scala 1435:24]
  reg  E_reg_4; // @[FloatingPointDesigns.scala 1435:24]
  reg  D_reg_0; // @[FloatingPointDesigns.scala 1436:24]
  reg  D_reg_1; // @[FloatingPointDesigns.scala 1436:24]
  reg  D_reg_2; // @[FloatingPointDesigns.scala 1436:24]
  reg  D_reg_3; // @[FloatingPointDesigns.scala 1436:24]
  reg  D_reg_4; // @[FloatingPointDesigns.scala 1436:24]
  reg [23:0] adder_result_reg_0; // @[FloatingPointDesigns.scala 1438:35]
  reg [23:0] adder_result_reg_1; // @[FloatingPointDesigns.scala 1438:35]
  reg [23:0] adder_result_reg_2; // @[FloatingPointDesigns.scala 1438:35]
  reg [5:0] leadingOne_reg_0; // @[FloatingPointDesigns.scala 1440:33]
  reg [5:0] leadingOne_reg_1; // @[FloatingPointDesigns.scala 1440:33]
  reg [31:0] io_in_a_reg_0; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_a_reg_1; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_a_reg_2; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_a_reg_3; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_a_reg_4; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_a_reg_5; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_a_reg_6; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_a_reg_7; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_a_reg_8; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_a_reg_9; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_a_reg_10; // @[FloatingPointDesigns.scala 1442:30]
  reg [31:0] io_in_b_reg_0; // @[FloatingPointDesigns.scala 1443:30]
  reg [31:0] io_in_b_reg_1; // @[FloatingPointDesigns.scala 1443:30]
  reg [31:0] io_in_b_reg_2; // @[FloatingPointDesigns.scala 1443:30]
  reg [31:0] io_in_b_reg_3; // @[FloatingPointDesigns.scala 1443:30]
  reg [31:0] io_in_b_reg_4; // @[FloatingPointDesigns.scala 1443:30]
  reg [31:0] io_in_b_reg_5; // @[FloatingPointDesigns.scala 1443:30]
  reg [31:0] io_in_b_reg_6; // @[FloatingPointDesigns.scala 1443:30]
  reg [31:0] io_in_b_reg_7; // @[FloatingPointDesigns.scala 1443:30]
  reg [31:0] io_in_b_reg_8; // @[FloatingPointDesigns.scala 1443:30]
  reg [31:0] io_in_b_reg_9; // @[FloatingPointDesigns.scala 1443:30]
  reg [31:0] io_in_b_reg_10; // @[FloatingPointDesigns.scala 1443:30]
  reg [7:0] subber2_out_s_reg_0; // @[FloatingPointDesigns.scala 1445:36]
  reg  subber2_out_c_reg_0; // @[FloatingPointDesigns.scala 1446:36]
  reg [7:0] cmpl_subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1467:40]
  wire [7:0] _cmpl_subber_out_s_reg_0_T = ~subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1469:41]
  wire [7:0] _cmpl_subber_out_s_reg_0_T_2 = 8'h1 + _cmpl_subber_out_s_reg_0_T; // @[FloatingPointDesigns.scala 1469:39]
  wire [23:0] _wire_temp_add_in_0_T = wfrac_reg_2_0 >> cmpl_subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1477:46]
  wire [23:0] _wire_temp_add_in_1_T = wfrac_reg_2_1 >> subber_out_s_reg_1; // @[FloatingPointDesigns.scala 1485:46]
  reg [23:0] cmpl_wire_temp_add_in_reg_0_0; // @[FloatingPointDesigns.scala 1488:44]
  reg [23:0] cmpl_wire_temp_add_in_reg_0_1; // @[FloatingPointDesigns.scala 1488:44]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_0_T = ~wire_temp_add_in_reg_0_0; // @[FloatingPointDesigns.scala 1490:48]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_0_T_2 = 24'h1 + _cmpl_wire_temp_add_in_reg_0_0_T; // @[FloatingPointDesigns.scala 1490:46]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_1_T = ~wire_temp_add_in_reg_0_1; // @[FloatingPointDesigns.scala 1491:48]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_1_T_2 = 24'h1 + _cmpl_wire_temp_add_in_reg_0_1_T; // @[FloatingPointDesigns.scala 1491:46]
  wire [1:0] _adder_io_in_a_T = {sign_reg_4_1,sign_reg_4_0}; // @[FloatingPointDesigns.scala 1494:38]
  wire  _new_s_T = ~adder_io_out_c_reg_0; // @[FloatingPointDesigns.scala 1501:15]
  wire  new_s = ~adder_io_out_c_reg_0 & (sign_reg_5_0 | sign_reg_5_1) | sign_reg_5_0 & sign_reg_5_1; // @[FloatingPointDesigns.scala 1501:75]
  wire  _D_T_1 = sign_reg_5_0 ^ sign_reg_5_1; // @[FloatingPointDesigns.scala 1508:53]
  wire  D = _new_s_T | sign_reg_5_0 ^ sign_reg_5_1; // @[FloatingPointDesigns.scala 1508:35]
  wire  E = _new_s_T & ~adder_io_out_s_reg_0[23] | _new_s_T & ~_D_T_1 | adder_io_out_c_reg_0 & adder_io_out_s_reg_0[23]
     & _D_T_1; // @[FloatingPointDesigns.scala 1510:134]
  reg [23:0] cmpl_adder_io_out_s_reg_0; // @[FloatingPointDesigns.scala 1512:42]
  wire [23:0] _cmpl_adder_io_out_s_reg_0_T = ~adder_io_out_s_reg_1; // @[FloatingPointDesigns.scala 1515:43]
  wire [23:0] _cmpl_adder_io_out_s_reg_0_T_2 = 24'h1 + _cmpl_adder_io_out_s_reg_0_T; // @[FloatingPointDesigns.scala 1515:41]
  wire [1:0] _adder_result_T = {sign_reg_7_1,sign_reg_7_0}; // @[FloatingPointDesigns.scala 1519:53]
  wire [1:0] _leadingOne_T_25 = adder_result_reg_0[2] ? 2'h2 : {{1'd0}, adder_result_reg_0[1]}; // @[FloatingPointDesigns.scala 1522:70]
  wire [1:0] _leadingOne_T_26 = adder_result_reg_0[3] ? 2'h3 : _leadingOne_T_25; // @[FloatingPointDesigns.scala 1522:70]
  wire [2:0] _leadingOne_T_27 = adder_result_reg_0[4] ? 3'h4 : {{1'd0}, _leadingOne_T_26}; // @[FloatingPointDesigns.scala 1522:70]
  wire [2:0] _leadingOne_T_28 = adder_result_reg_0[5] ? 3'h5 : _leadingOne_T_27; // @[FloatingPointDesigns.scala 1522:70]
  wire [2:0] _leadingOne_T_29 = adder_result_reg_0[6] ? 3'h6 : _leadingOne_T_28; // @[FloatingPointDesigns.scala 1522:70]
  wire [2:0] _leadingOne_T_30 = adder_result_reg_0[7] ? 3'h7 : _leadingOne_T_29; // @[FloatingPointDesigns.scala 1522:70]
  wire [3:0] _leadingOne_T_31 = adder_result_reg_0[8] ? 4'h8 : {{1'd0}, _leadingOne_T_30}; // @[FloatingPointDesigns.scala 1522:70]
  wire [3:0] _leadingOne_T_32 = adder_result_reg_0[9] ? 4'h9 : _leadingOne_T_31; // @[FloatingPointDesigns.scala 1522:70]
  wire [3:0] _leadingOne_T_33 = adder_result_reg_0[10] ? 4'ha : _leadingOne_T_32; // @[FloatingPointDesigns.scala 1522:70]
  wire [3:0] _leadingOne_T_34 = adder_result_reg_0[11] ? 4'hb : _leadingOne_T_33; // @[FloatingPointDesigns.scala 1522:70]
  wire [3:0] _leadingOne_T_35 = adder_result_reg_0[12] ? 4'hc : _leadingOne_T_34; // @[FloatingPointDesigns.scala 1522:70]
  wire [3:0] _leadingOne_T_36 = adder_result_reg_0[13] ? 4'hd : _leadingOne_T_35; // @[FloatingPointDesigns.scala 1522:70]
  wire [3:0] _leadingOne_T_37 = adder_result_reg_0[14] ? 4'he : _leadingOne_T_36; // @[FloatingPointDesigns.scala 1522:70]
  wire [3:0] _leadingOne_T_38 = adder_result_reg_0[15] ? 4'hf : _leadingOne_T_37; // @[FloatingPointDesigns.scala 1522:70]
  wire [4:0] _leadingOne_T_39 = adder_result_reg_0[16] ? 5'h10 : {{1'd0}, _leadingOne_T_38}; // @[FloatingPointDesigns.scala 1522:70]
  wire [4:0] _leadingOne_T_40 = adder_result_reg_0[17] ? 5'h11 : _leadingOne_T_39; // @[FloatingPointDesigns.scala 1522:70]
  wire [4:0] _leadingOne_T_41 = adder_result_reg_0[18] ? 5'h12 : _leadingOne_T_40; // @[FloatingPointDesigns.scala 1522:70]
  wire [4:0] _leadingOne_T_42 = adder_result_reg_0[19] ? 5'h13 : _leadingOne_T_41; // @[FloatingPointDesigns.scala 1522:70]
  wire [4:0] _leadingOne_T_43 = adder_result_reg_0[20] ? 5'h14 : _leadingOne_T_42; // @[FloatingPointDesigns.scala 1522:70]
  wire [4:0] _leadingOne_T_44 = adder_result_reg_0[21] ? 5'h15 : _leadingOne_T_43; // @[FloatingPointDesigns.scala 1522:70]
  wire [4:0] _leadingOne_T_45 = adder_result_reg_0[22] ? 5'h16 : _leadingOne_T_44; // @[FloatingPointDesigns.scala 1522:70]
  wire [4:0] _leadingOne_T_46 = adder_result_reg_0[23] ? 5'h17 : _leadingOne_T_45; // @[FloatingPointDesigns.scala 1522:70]
  wire [5:0] leadingOne = _leadingOne_T_46 + 5'h1; // @[FloatingPointDesigns.scala 1522:77]
  wire [5:0] _subber2_io_in_b_T_1 = 6'h18 - leadingOne_reg_0; // @[FloatingPointDesigns.scala 1525:42]
  wire [7:0] exp_0 = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 1387:19]
  wire [7:0] exp_1 = _GEN_3[7:0]; // @[FloatingPointDesigns.scala 1387:19]
  wire [7:0] _GEN_24 = subber_io_out_s; // @[FloatingPointDesigns.scala 1529:19 1538:27 1419:35]
  wire  _GEN_25 = subber_io_out_c; // @[FloatingPointDesigns.scala 1529:19 1539:27 1420:35]
  wire [23:0] _GEN_35 = adder_io_out_s; // @[FloatingPointDesigns.scala 1529:19 1554:29 1429:37]
  wire  _GEN_36 = adder_io_out_c; // @[FloatingPointDesigns.scala 1529:19 1555:29 1430:37]
  wire [7:0] _GEN_39 = subber2_io_out_s; // @[FloatingPointDesigns.scala 1529:19 1561:28 1445:36]
  wire  _GEN_40 = subber2_io_out_c; // @[FloatingPointDesigns.scala 1529:19 1562:28 1446:36]
  reg [31:0] reg_out_s; // @[FloatingPointDesigns.scala 1596:28]
  wire [8:0] _GEN_169 = {{1'd0}, ref_exp_reg_7}; // @[FloatingPointDesigns.scala 1613:29]
  wire [23:0] _new_out_frac_reg_0_T_2 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 1615:60]
  wire [7:0] _new_out_exp_reg_0_T_3 = ref_exp_reg_7 + 8'h1; // @[FloatingPointDesigns.scala 1617:48]
  wire [8:0] _GEN_142 = _GEN_169 == _T_2 ? _T_2 : {{1'd0}, _new_out_exp_reg_0_T_3}; // @[FloatingPointDesigns.scala 1613:66 1614:30 1617:30]
  wire [23:0] _GEN_143 = _GEN_169 == _T_2 ? _new_out_frac_reg_0_T_2 : {{1'd0}, adder_result_reg_2[23:1]}; // @[FloatingPointDesigns.scala 1613:66 1615:31 1618:31]
  wire [5:0] _new_out_frac_reg_0_T_6 = 6'h18 - leadingOne_reg_1; // @[FloatingPointDesigns.scala 1631:94]
  wire [85:0] _GEN_4 = {{63'd0}, adder_result_reg_2[22:0]}; // @[FloatingPointDesigns.scala 1631:73]
  wire [85:0] _new_out_frac_reg_0_T_7 = _GEN_4 << _new_out_frac_reg_0_T_6; // @[FloatingPointDesigns.scala 1631:73]
  wire [7:0] _GEN_144 = subber2_out_c_reg_0 ? 8'h1 : subber2_out_s_reg_0; // @[FloatingPointDesigns.scala 1626:46 1627:32 1630:32]
  wire [85:0] _GEN_145 = subber2_out_c_reg_0 ? 86'h0 : _new_out_frac_reg_0_T_7; // @[FloatingPointDesigns.scala 1626:46 1628:33 1631:33]
  wire [7:0] _GEN_146 = leadingOne_reg_1 == 6'h1 & adder_result_reg_2 == 24'h0 & ((sign_reg_10_0 ^ sign_reg_10_1) &
    io_in_a_reg_10[30:0] == io_in_b_reg_10[30:0]) ? 8'h0 : _GEN_144; // @[FloatingPointDesigns.scala 1622:184 1623:30]
  wire [85:0] _GEN_147 = leadingOne_reg_1 == 6'h1 & adder_result_reg_2 == 24'h0 & ((sign_reg_10_0 ^ sign_reg_10_1) &
    io_in_a_reg_10[30:0] == io_in_b_reg_10[30:0]) ? 86'h0 : _GEN_145; // @[FloatingPointDesigns.scala 1622:184 1624:31]
  wire  _GEN_148 = D_reg_4 ? new_s_reg_4 : new_s_reg_5; // @[FloatingPointDesigns.scala 1620:36 1621:22 1432:35]
  wire [7:0] _GEN_149 = D_reg_4 ? _GEN_146 : new_out_exp_reg_0; // @[FloatingPointDesigns.scala 1434:35 1620:36]
  wire [85:0] _GEN_150 = D_reg_4 ? _GEN_147 : {{63'd0}, new_out_frac_reg_0}; // @[FloatingPointDesigns.scala 1433:35 1620:36]
  wire  _GEN_151 = ~D_reg_4 ? new_s_reg_4 : _GEN_148; // @[FloatingPointDesigns.scala 1611:36 1612:22]
  wire [8:0] _GEN_152 = ~D_reg_4 ? _GEN_142 : {{1'd0}, _GEN_149}; // @[FloatingPointDesigns.scala 1611:36]
  wire [85:0] _GEN_153 = ~D_reg_4 ? {{62'd0}, _GEN_143} : _GEN_150; // @[FloatingPointDesigns.scala 1611:36]
  wire [8:0] _GEN_155 = E_reg_4 ? {{1'd0}, ref_exp_reg_7} : _GEN_152; // @[FloatingPointDesigns.scala 1607:36 1609:28]
  wire [85:0] _GEN_156 = E_reg_4 ? {{63'd0}, adder_result_reg_2[22:0]} : _GEN_153; // @[FloatingPointDesigns.scala 1607:36 1610:29]
  wire [85:0] _GEN_158 = sub_exp_reg_7 >= 8'h17 ? {{63'd0}, ref_frac_reg_7} : _GEN_156; // @[FloatingPointDesigns.scala 1603:48 1605:29]
  wire [8:0] _GEN_159 = sub_exp_reg_7 >= 8'h17 ? {{1'd0}, ref_exp_reg_7} : _GEN_155; // @[FloatingPointDesigns.scala 1603:48 1606:28]
  wire [8:0] _GEN_161 = io_in_a_reg_10[30:0] == 31'h0 & io_in_b_reg_10[30:0] == 31'h0 ? 9'h0 : _GEN_159; // @[FloatingPointDesigns.scala 1599:86 1601:28]
  wire [85:0] _GEN_162 = io_in_a_reg_10[30:0] == 31'h0 & io_in_b_reg_10[30:0] == 31'h0 ? 86'h0 : _GEN_158; // @[FloatingPointDesigns.scala 1599:86 1602:29]
  wire [31:0] _reg_out_s_T_1 = {new_s_reg_5,new_out_exp_reg_0,new_out_frac_reg_0}; // @[FloatingPointDesigns.scala 1635:55]
  wire [85:0] _GEN_170 = reset ? 86'h0 : _GEN_162; // @[FloatingPointDesigns.scala 1433:{35,35}]
  wire [8:0] _GEN_171 = reset ? 9'h0 : _GEN_161; // @[FloatingPointDesigns.scala 1434:{35,35}]
  full_subber subber ( // @[FloatingPointDesigns.scala 1456:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  full_adder_32 adder ( // @[FloatingPointDesigns.scala 1462:23]
    .io_in_a(adder_io_in_a),
    .io_in_b(adder_io_in_b),
    .io_out_s(adder_io_out_s),
    .io_out_c(adder_io_out_c)
  );
  full_subber subber2 ( // @[FloatingPointDesigns.scala 1523:25]
    .io_in_a(subber2_io_in_a),
    .io_in_b(subber2_io_in_b),
    .io_out_s(subber2_io_out_s),
    .io_out_c(subber2_io_out_c)
  );
  assign io_out_s = reg_out_s; // @[FloatingPointDesigns.scala 1597:14]
  assign subber_io_in_a = exp_reg_0_0; // @[FloatingPointDesigns.scala 1457:20]
  assign subber_io_in_b = exp_reg_0_1; // @[FloatingPointDesigns.scala 1458:20]
  assign adder_io_in_a = _adder_io_in_a_T == 2'h1 ? cmpl_wire_temp_add_in_reg_0_0 : wire_temp_add_in_reg_1_0; // @[FloatingPointDesigns.scala 1494:25]
  assign adder_io_in_b = _adder_io_in_a_T == 2'h2 ? cmpl_wire_temp_add_in_reg_0_1 : wire_temp_add_in_reg_1_1; // @[FloatingPointDesigns.scala 1495:25]
  assign subber2_io_in_a = ref_exp_reg_6; // @[FloatingPointDesigns.scala 1524:21]
  assign subber2_io_in_b = {{2'd0}, _subber2_io_in_b_T_1}; // @[FloatingPointDesigns.scala 1525:21]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_0_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_0_0 <= sign_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_0_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_0_1 <= sign_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_1_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_1_0 <= sign_reg_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_1_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_1_1 <= sign_reg_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_2_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_2_0 <= sign_reg_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_2_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_2_1 <= sign_reg_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_3_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_3_0 <= sign_reg_2_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_3_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_3_1 <= sign_reg_2_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_4_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_4_0 <= sign_reg_3_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_4_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_4_1 <= sign_reg_3_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_5_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_5_0 <= sign_reg_4_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_5_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_5_1 <= sign_reg_4_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_6_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_6_0 <= sign_reg_5_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_6_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_6_1 <= sign_reg_5_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_7_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_7_0 <= sign_reg_6_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_7_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_7_1 <= sign_reg_6_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_8_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_8_0 <= sign_reg_7_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_8_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_8_1 <= sign_reg_7_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_9_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_9_0 <= sign_reg_8_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_9_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_9_1 <= sign_reg_8_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_10_0 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_10_0 <= sign_reg_9_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1414:28]
      sign_reg_10_1 <= 1'h0; // @[FloatingPointDesigns.scala 1414:28]
    end else begin
      sign_reg_10_1 <= sign_reg_9_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1415:28]
      exp_reg_0_0 <= 8'h0; // @[FloatingPointDesigns.scala 1415:28]
    end else begin
      exp_reg_0_0 <= exp_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1415:28]
      exp_reg_0_1 <= 8'h0; // @[FloatingPointDesigns.scala 1415:28]
    end else begin
      exp_reg_0_1 <= exp_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1415:28]
      exp_reg_1_0 <= 8'h0; // @[FloatingPointDesigns.scala 1415:28]
    end else begin
      exp_reg_1_0 <= exp_reg_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1415:28]
      exp_reg_1_1 <= 8'h0; // @[FloatingPointDesigns.scala 1415:28]
    end else begin
      exp_reg_1_1 <= exp_reg_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1415:28]
      exp_reg_2_0 <= 8'h0; // @[FloatingPointDesigns.scala 1415:28]
    end else begin
      exp_reg_2_0 <= exp_reg_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1415:28]
      exp_reg_2_1 <= 8'h0; // @[FloatingPointDesigns.scala 1415:28]
    end else begin
      exp_reg_2_1 <= exp_reg_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1416:28]
      frac_reg_0_0 <= 23'h0; // @[FloatingPointDesigns.scala 1416:28]
    end else begin
      frac_reg_0_0 <= frac_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1416:28]
      frac_reg_0_1 <= 23'h0; // @[FloatingPointDesigns.scala 1416:28]
    end else begin
      frac_reg_0_1 <= frac_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1416:28]
      frac_reg_1_0 <= 23'h0; // @[FloatingPointDesigns.scala 1416:28]
    end else begin
      frac_reg_1_0 <= frac_reg_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1416:28]
      frac_reg_1_1 <= 23'h0; // @[FloatingPointDesigns.scala 1416:28]
    end else begin
      frac_reg_1_1 <= frac_reg_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1416:28]
      frac_reg_2_0 <= 23'h0; // @[FloatingPointDesigns.scala 1416:28]
    end else begin
      frac_reg_2_0 <= frac_reg_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1416:28]
      frac_reg_2_1 <= 23'h0; // @[FloatingPointDesigns.scala 1416:28]
    end else begin
      frac_reg_2_1 <= frac_reg_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1417:28]
      wfrac_reg_0_0 <= 24'h0; // @[FloatingPointDesigns.scala 1417:28]
    end else begin
      wfrac_reg_0_0 <= whole_frac_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1417:28]
      wfrac_reg_0_1 <= 24'h0; // @[FloatingPointDesigns.scala 1417:28]
    end else begin
      wfrac_reg_0_1 <= whole_frac_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1417:28]
      wfrac_reg_1_0 <= 24'h0; // @[FloatingPointDesigns.scala 1417:28]
    end else begin
      wfrac_reg_1_0 <= wfrac_reg_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1417:28]
      wfrac_reg_1_1 <= 24'h0; // @[FloatingPointDesigns.scala 1417:28]
    end else begin
      wfrac_reg_1_1 <= wfrac_reg_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1417:28]
      wfrac_reg_2_0 <= 24'h0; // @[FloatingPointDesigns.scala 1417:28]
    end else begin
      wfrac_reg_2_0 <= wfrac_reg_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1417:28]
      wfrac_reg_2_1 <= 24'h0; // @[FloatingPointDesigns.scala 1417:28]
    end else begin
      wfrac_reg_2_1 <= wfrac_reg_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1419:35]
      subber_out_s_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1419:35]
    end else begin
      subber_out_s_reg_0 <= _GEN_24;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1419:35]
      subber_out_s_reg_1 <= 8'h0; // @[FloatingPointDesigns.scala 1419:35]
    end else begin
      subber_out_s_reg_1 <= subber_out_s_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1420:35]
      subber_out_c_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1420:35]
    end else begin
      subber_out_c_reg_0 <= _GEN_25;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1420:35]
      subber_out_c_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1420:35]
    end else begin
      subber_out_c_reg_1 <= subber_out_c_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1422:39]
      wire_temp_add_in_reg_0_0 <= 24'h0; // @[FloatingPointDesigns.scala 1422:39]
    end else if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1472:39]
      wire_temp_add_in_reg_0_0 <= _wire_temp_add_in_0_T; // @[FloatingPointDesigns.scala 1477:27]
    end else begin
      wire_temp_add_in_reg_0_0 <= wfrac_reg_2_0; // @[FloatingPointDesigns.scala 1484:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1422:39]
      wire_temp_add_in_reg_0_1 <= 24'h0; // @[FloatingPointDesigns.scala 1422:39]
    end else if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1472:39]
      wire_temp_add_in_reg_0_1 <= wfrac_reg_2_1; // @[FloatingPointDesigns.scala 1478:27]
    end else begin
      wire_temp_add_in_reg_0_1 <= _wire_temp_add_in_1_T; // @[FloatingPointDesigns.scala 1485:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1422:39]
      wire_temp_add_in_reg_1_0 <= 24'h0; // @[FloatingPointDesigns.scala 1422:39]
    end else begin
      wire_temp_add_in_reg_1_0 <= wire_temp_add_in_reg_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1422:39]
      wire_temp_add_in_reg_1_1 <= 24'h0; // @[FloatingPointDesigns.scala 1422:39]
    end else begin
      wire_temp_add_in_reg_1_1 <= wire_temp_add_in_reg_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1424:31]
      ref_s_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1424:31]
    end else if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1472:39]
      ref_s_reg_0 <= sign_reg_2_1; // @[FloatingPointDesigns.scala 1475:13]
    end else begin
      ref_s_reg_0 <= sign_reg_2_0; // @[FloatingPointDesigns.scala 1482:13]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1424:31]
      ref_s_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1424:31]
    end else begin
      ref_s_reg_1 <= ref_s_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1424:31]
      ref_s_reg_2 <= 1'h0; // @[FloatingPointDesigns.scala 1424:31]
    end else begin
      ref_s_reg_2 <= ref_s_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1424:31]
      ref_s_reg_3 <= 1'h0; // @[FloatingPointDesigns.scala 1424:31]
    end else begin
      ref_s_reg_3 <= ref_s_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1424:31]
      ref_s_reg_4 <= 1'h0; // @[FloatingPointDesigns.scala 1424:31]
    end else begin
      ref_s_reg_4 <= ref_s_reg_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1424:31]
      ref_s_reg_5 <= 1'h0; // @[FloatingPointDesigns.scala 1424:31]
    end else begin
      ref_s_reg_5 <= ref_s_reg_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1424:31]
      ref_s_reg_6 <= 1'h0; // @[FloatingPointDesigns.scala 1424:31]
    end else begin
      ref_s_reg_6 <= ref_s_reg_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1424:31]
      ref_s_reg_7 <= 1'h0; // @[FloatingPointDesigns.scala 1424:31]
    end else begin
      ref_s_reg_7 <= ref_s_reg_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1425:31]
      ref_frac_reg_0 <= 23'h0; // @[FloatingPointDesigns.scala 1425:31]
    end else if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1472:39]
      ref_frac_reg_0 <= frac_reg_2_1; // @[FloatingPointDesigns.scala 1476:16]
    end else begin
      ref_frac_reg_0 <= frac_reg_2_0; // @[FloatingPointDesigns.scala 1483:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1425:31]
      ref_frac_reg_1 <= 23'h0; // @[FloatingPointDesigns.scala 1425:31]
    end else begin
      ref_frac_reg_1 <= ref_frac_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1425:31]
      ref_frac_reg_2 <= 23'h0; // @[FloatingPointDesigns.scala 1425:31]
    end else begin
      ref_frac_reg_2 <= ref_frac_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1425:31]
      ref_frac_reg_3 <= 23'h0; // @[FloatingPointDesigns.scala 1425:31]
    end else begin
      ref_frac_reg_3 <= ref_frac_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1425:31]
      ref_frac_reg_4 <= 23'h0; // @[FloatingPointDesigns.scala 1425:31]
    end else begin
      ref_frac_reg_4 <= ref_frac_reg_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1425:31]
      ref_frac_reg_5 <= 23'h0; // @[FloatingPointDesigns.scala 1425:31]
    end else begin
      ref_frac_reg_5 <= ref_frac_reg_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1425:31]
      ref_frac_reg_6 <= 23'h0; // @[FloatingPointDesigns.scala 1425:31]
    end else begin
      ref_frac_reg_6 <= ref_frac_reg_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1425:31]
      ref_frac_reg_7 <= 23'h0; // @[FloatingPointDesigns.scala 1425:31]
    end else begin
      ref_frac_reg_7 <= ref_frac_reg_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:31]
      ref_exp_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1426:31]
    end else if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1472:39]
      ref_exp_reg_0 <= exp_reg_2_1; // @[FloatingPointDesigns.scala 1473:15]
    end else begin
      ref_exp_reg_0 <= exp_reg_2_0; // @[FloatingPointDesigns.scala 1480:15]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:31]
      ref_exp_reg_1 <= 8'h0; // @[FloatingPointDesigns.scala 1426:31]
    end else begin
      ref_exp_reg_1 <= ref_exp_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:31]
      ref_exp_reg_2 <= 8'h0; // @[FloatingPointDesigns.scala 1426:31]
    end else begin
      ref_exp_reg_2 <= ref_exp_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:31]
      ref_exp_reg_3 <= 8'h0; // @[FloatingPointDesigns.scala 1426:31]
    end else begin
      ref_exp_reg_3 <= ref_exp_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:31]
      ref_exp_reg_4 <= 8'h0; // @[FloatingPointDesigns.scala 1426:31]
    end else begin
      ref_exp_reg_4 <= ref_exp_reg_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:31]
      ref_exp_reg_5 <= 8'h0; // @[FloatingPointDesigns.scala 1426:31]
    end else begin
      ref_exp_reg_5 <= ref_exp_reg_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:31]
      ref_exp_reg_6 <= 8'h0; // @[FloatingPointDesigns.scala 1426:31]
    end else begin
      ref_exp_reg_6 <= ref_exp_reg_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:31]
      ref_exp_reg_7 <= 8'h0; // @[FloatingPointDesigns.scala 1426:31]
    end else begin
      ref_exp_reg_7 <= ref_exp_reg_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1427:31]
      sub_exp_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1427:31]
    end else if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1472:39]
      sub_exp_reg_0 <= cmpl_subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1474:15]
    end else begin
      sub_exp_reg_0 <= subber_out_s_reg_1; // @[FloatingPointDesigns.scala 1481:15]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1427:31]
      sub_exp_reg_1 <= 8'h0; // @[FloatingPointDesigns.scala 1427:31]
    end else begin
      sub_exp_reg_1 <= sub_exp_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1427:31]
      sub_exp_reg_2 <= 8'h0; // @[FloatingPointDesigns.scala 1427:31]
    end else begin
      sub_exp_reg_2 <= sub_exp_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1427:31]
      sub_exp_reg_3 <= 8'h0; // @[FloatingPointDesigns.scala 1427:31]
    end else begin
      sub_exp_reg_3 <= sub_exp_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1427:31]
      sub_exp_reg_4 <= 8'h0; // @[FloatingPointDesigns.scala 1427:31]
    end else begin
      sub_exp_reg_4 <= sub_exp_reg_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1427:31]
      sub_exp_reg_5 <= 8'h0; // @[FloatingPointDesigns.scala 1427:31]
    end else begin
      sub_exp_reg_5 <= sub_exp_reg_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1427:31]
      sub_exp_reg_6 <= 8'h0; // @[FloatingPointDesigns.scala 1427:31]
    end else begin
      sub_exp_reg_6 <= sub_exp_reg_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1427:31]
      sub_exp_reg_7 <= 8'h0; // @[FloatingPointDesigns.scala 1427:31]
    end else begin
      sub_exp_reg_7 <= sub_exp_reg_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:37]
      adder_io_out_s_reg_0 <= 24'h0; // @[FloatingPointDesigns.scala 1429:37]
    end else begin
      adder_io_out_s_reg_0 <= _GEN_35;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:37]
      adder_io_out_s_reg_1 <= 24'h0; // @[FloatingPointDesigns.scala 1429:37]
    end else begin
      adder_io_out_s_reg_1 <= adder_io_out_s_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:37]
      adder_io_out_s_reg_2 <= 24'h0; // @[FloatingPointDesigns.scala 1429:37]
    end else begin
      adder_io_out_s_reg_2 <= adder_io_out_s_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1430:37]
      adder_io_out_c_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1430:37]
    end else begin
      adder_io_out_c_reg_0 <= _GEN_36;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1432:35]
      new_s_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1432:35]
    end else begin
      new_s_reg_0 <= new_s;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1432:35]
      new_s_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1432:35]
    end else begin
      new_s_reg_1 <= new_s_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1432:35]
      new_s_reg_2 <= 1'h0; // @[FloatingPointDesigns.scala 1432:35]
    end else begin
      new_s_reg_2 <= new_s_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1432:35]
      new_s_reg_3 <= 1'h0; // @[FloatingPointDesigns.scala 1432:35]
    end else begin
      new_s_reg_3 <= new_s_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1432:35]
      new_s_reg_4 <= 1'h0; // @[FloatingPointDesigns.scala 1432:35]
    end else begin
      new_s_reg_4 <= new_s_reg_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1432:35]
      new_s_reg_5 <= 1'h0; // @[FloatingPointDesigns.scala 1432:35]
    end else if (io_in_a_reg_10[30:0] == 31'h0 & io_in_b_reg_10[30:0] == 31'h0) begin // @[FloatingPointDesigns.scala 1599:86]
      new_s_reg_5 <= 1'h0; // @[FloatingPointDesigns.scala 1600:22]
    end else if (sub_exp_reg_7 >= 8'h17) begin // @[FloatingPointDesigns.scala 1603:48]
      new_s_reg_5 <= ref_s_reg_7; // @[FloatingPointDesigns.scala 1604:22]
    end else if (E_reg_4) begin // @[FloatingPointDesigns.scala 1607:36]
      new_s_reg_5 <= new_s_reg_4; // @[FloatingPointDesigns.scala 1608:22]
    end else begin
      new_s_reg_5 <= _GEN_151;
    end
    new_out_frac_reg_0 <= _GEN_170[22:0]; // @[FloatingPointDesigns.scala 1433:{35,35}]
    new_out_exp_reg_0 <= _GEN_171[7:0]; // @[FloatingPointDesigns.scala 1434:{35,35}]
    if (reset) begin // @[FloatingPointDesigns.scala 1435:24]
      E_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1435:24]
    end else begin
      E_reg_0 <= E;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1435:24]
      E_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1435:24]
    end else begin
      E_reg_1 <= E_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1435:24]
      E_reg_2 <= 1'h0; // @[FloatingPointDesigns.scala 1435:24]
    end else begin
      E_reg_2 <= E_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1435:24]
      E_reg_3 <= 1'h0; // @[FloatingPointDesigns.scala 1435:24]
    end else begin
      E_reg_3 <= E_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1435:24]
      E_reg_4 <= 1'h0; // @[FloatingPointDesigns.scala 1435:24]
    end else begin
      E_reg_4 <= E_reg_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:24]
      D_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1436:24]
    end else begin
      D_reg_0 <= D;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:24]
      D_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1436:24]
    end else begin
      D_reg_1 <= D_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:24]
      D_reg_2 <= 1'h0; // @[FloatingPointDesigns.scala 1436:24]
    end else begin
      D_reg_2 <= D_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:24]
      D_reg_3 <= 1'h0; // @[FloatingPointDesigns.scala 1436:24]
    end else begin
      D_reg_3 <= D_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:24]
      D_reg_4 <= 1'h0; // @[FloatingPointDesigns.scala 1436:24]
    end else begin
      D_reg_4 <= D_reg_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1438:35]
      adder_result_reg_0 <= 24'h0; // @[FloatingPointDesigns.scala 1438:35]
    end else if (new_s_reg_1 & ^_adder_result_T) begin // @[FloatingPointDesigns.scala 1519:24]
      adder_result_reg_0 <= cmpl_adder_io_out_s_reg_0;
    end else begin
      adder_result_reg_0 <= adder_io_out_s_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1438:35]
      adder_result_reg_1 <= 24'h0; // @[FloatingPointDesigns.scala 1438:35]
    end else begin
      adder_result_reg_1 <= adder_result_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1438:35]
      adder_result_reg_2 <= 24'h0; // @[FloatingPointDesigns.scala 1438:35]
    end else begin
      adder_result_reg_2 <= adder_result_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1440:33]
      leadingOne_reg_0 <= 6'h0; // @[FloatingPointDesigns.scala 1440:33]
    end else begin
      leadingOne_reg_0 <= leadingOne;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1440:33]
      leadingOne_reg_1 <= 6'h0; // @[FloatingPointDesigns.scala 1440:33]
    end else begin
      leadingOne_reg_1 <= leadingOne_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_0 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_0 <= io_in_a;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_1 <= io_in_a_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_2 <= io_in_a_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_3 <= io_in_a_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_4 <= io_in_a_reg_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_5 <= io_in_a_reg_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_6 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_6 <= io_in_a_reg_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_7 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_7 <= io_in_a_reg_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_8 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_8 <= io_in_a_reg_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_9 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_9 <= io_in_a_reg_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:30]
      io_in_a_reg_10 <= 32'h0; // @[FloatingPointDesigns.scala 1442:30]
    end else begin
      io_in_a_reg_10 <= io_in_a_reg_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_0 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_0 <= io_in_b;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_1 <= io_in_b_reg_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_2 <= io_in_b_reg_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_3 <= io_in_b_reg_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_4 <= io_in_b_reg_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_5 <= io_in_b_reg_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_6 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_6 <= io_in_b_reg_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_7 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_7 <= io_in_b_reg_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_8 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_8 <= io_in_b_reg_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_9 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_9 <= io_in_b_reg_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1443:30]
      io_in_b_reg_10 <= 32'h0; // @[FloatingPointDesigns.scala 1443:30]
    end else begin
      io_in_b_reg_10 <= io_in_b_reg_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1445:36]
      subber2_out_s_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1445:36]
    end else begin
      subber2_out_s_reg_0 <= _GEN_39;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:36]
      subber2_out_c_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1446:36]
    end else begin
      subber2_out_c_reg_0 <= _GEN_40;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1467:40]
      cmpl_subber_out_s_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1467:40]
    end else begin
      cmpl_subber_out_s_reg_0 <= _cmpl_subber_out_s_reg_0_T_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1488:44]
      cmpl_wire_temp_add_in_reg_0_0 <= 24'h0; // @[FloatingPointDesigns.scala 1488:44]
    end else begin
      cmpl_wire_temp_add_in_reg_0_0 <= _cmpl_wire_temp_add_in_reg_0_0_T_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1488:44]
      cmpl_wire_temp_add_in_reg_0_1 <= 24'h0; // @[FloatingPointDesigns.scala 1488:44]
    end else begin
      cmpl_wire_temp_add_in_reg_0_1 <= _cmpl_wire_temp_add_in_reg_0_1_T_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1512:42]
      cmpl_adder_io_out_s_reg_0 <= 24'h0; // @[FloatingPointDesigns.scala 1512:42]
    end else begin
      cmpl_adder_io_out_s_reg_0 <= _cmpl_adder_io_out_s_reg_0_T_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1596:28]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 1596:28]
    end else begin
      reg_out_s <= _reg_out_s_T_1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sign_reg_0_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  sign_reg_0_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  sign_reg_1_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  sign_reg_1_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  sign_reg_2_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  sign_reg_2_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  sign_reg_3_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  sign_reg_3_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  sign_reg_4_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  sign_reg_4_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  sign_reg_5_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  sign_reg_5_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  sign_reg_6_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  sign_reg_6_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  sign_reg_7_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  sign_reg_7_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  sign_reg_8_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  sign_reg_8_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  sign_reg_9_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  sign_reg_9_1 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  sign_reg_10_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  sign_reg_10_1 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  exp_reg_0_0 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  exp_reg_0_1 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  exp_reg_1_0 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  exp_reg_1_1 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  exp_reg_2_0 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  exp_reg_2_1 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  frac_reg_0_0 = _RAND_28[22:0];
  _RAND_29 = {1{`RANDOM}};
  frac_reg_0_1 = _RAND_29[22:0];
  _RAND_30 = {1{`RANDOM}};
  frac_reg_1_0 = _RAND_30[22:0];
  _RAND_31 = {1{`RANDOM}};
  frac_reg_1_1 = _RAND_31[22:0];
  _RAND_32 = {1{`RANDOM}};
  frac_reg_2_0 = _RAND_32[22:0];
  _RAND_33 = {1{`RANDOM}};
  frac_reg_2_1 = _RAND_33[22:0];
  _RAND_34 = {1{`RANDOM}};
  wfrac_reg_0_0 = _RAND_34[23:0];
  _RAND_35 = {1{`RANDOM}};
  wfrac_reg_0_1 = _RAND_35[23:0];
  _RAND_36 = {1{`RANDOM}};
  wfrac_reg_1_0 = _RAND_36[23:0];
  _RAND_37 = {1{`RANDOM}};
  wfrac_reg_1_1 = _RAND_37[23:0];
  _RAND_38 = {1{`RANDOM}};
  wfrac_reg_2_0 = _RAND_38[23:0];
  _RAND_39 = {1{`RANDOM}};
  wfrac_reg_2_1 = _RAND_39[23:0];
  _RAND_40 = {1{`RANDOM}};
  subber_out_s_reg_0 = _RAND_40[7:0];
  _RAND_41 = {1{`RANDOM}};
  subber_out_s_reg_1 = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  subber_out_c_reg_0 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  subber_out_c_reg_1 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  wire_temp_add_in_reg_0_0 = _RAND_44[23:0];
  _RAND_45 = {1{`RANDOM}};
  wire_temp_add_in_reg_0_1 = _RAND_45[23:0];
  _RAND_46 = {1{`RANDOM}};
  wire_temp_add_in_reg_1_0 = _RAND_46[23:0];
  _RAND_47 = {1{`RANDOM}};
  wire_temp_add_in_reg_1_1 = _RAND_47[23:0];
  _RAND_48 = {1{`RANDOM}};
  ref_s_reg_0 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  ref_s_reg_1 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  ref_s_reg_2 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  ref_s_reg_3 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  ref_s_reg_4 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  ref_s_reg_5 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  ref_s_reg_6 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  ref_s_reg_7 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  ref_frac_reg_0 = _RAND_56[22:0];
  _RAND_57 = {1{`RANDOM}};
  ref_frac_reg_1 = _RAND_57[22:0];
  _RAND_58 = {1{`RANDOM}};
  ref_frac_reg_2 = _RAND_58[22:0];
  _RAND_59 = {1{`RANDOM}};
  ref_frac_reg_3 = _RAND_59[22:0];
  _RAND_60 = {1{`RANDOM}};
  ref_frac_reg_4 = _RAND_60[22:0];
  _RAND_61 = {1{`RANDOM}};
  ref_frac_reg_5 = _RAND_61[22:0];
  _RAND_62 = {1{`RANDOM}};
  ref_frac_reg_6 = _RAND_62[22:0];
  _RAND_63 = {1{`RANDOM}};
  ref_frac_reg_7 = _RAND_63[22:0];
  _RAND_64 = {1{`RANDOM}};
  ref_exp_reg_0 = _RAND_64[7:0];
  _RAND_65 = {1{`RANDOM}};
  ref_exp_reg_1 = _RAND_65[7:0];
  _RAND_66 = {1{`RANDOM}};
  ref_exp_reg_2 = _RAND_66[7:0];
  _RAND_67 = {1{`RANDOM}};
  ref_exp_reg_3 = _RAND_67[7:0];
  _RAND_68 = {1{`RANDOM}};
  ref_exp_reg_4 = _RAND_68[7:0];
  _RAND_69 = {1{`RANDOM}};
  ref_exp_reg_5 = _RAND_69[7:0];
  _RAND_70 = {1{`RANDOM}};
  ref_exp_reg_6 = _RAND_70[7:0];
  _RAND_71 = {1{`RANDOM}};
  ref_exp_reg_7 = _RAND_71[7:0];
  _RAND_72 = {1{`RANDOM}};
  sub_exp_reg_0 = _RAND_72[7:0];
  _RAND_73 = {1{`RANDOM}};
  sub_exp_reg_1 = _RAND_73[7:0];
  _RAND_74 = {1{`RANDOM}};
  sub_exp_reg_2 = _RAND_74[7:0];
  _RAND_75 = {1{`RANDOM}};
  sub_exp_reg_3 = _RAND_75[7:0];
  _RAND_76 = {1{`RANDOM}};
  sub_exp_reg_4 = _RAND_76[7:0];
  _RAND_77 = {1{`RANDOM}};
  sub_exp_reg_5 = _RAND_77[7:0];
  _RAND_78 = {1{`RANDOM}};
  sub_exp_reg_6 = _RAND_78[7:0];
  _RAND_79 = {1{`RANDOM}};
  sub_exp_reg_7 = _RAND_79[7:0];
  _RAND_80 = {1{`RANDOM}};
  adder_io_out_s_reg_0 = _RAND_80[23:0];
  _RAND_81 = {1{`RANDOM}};
  adder_io_out_s_reg_1 = _RAND_81[23:0];
  _RAND_82 = {1{`RANDOM}};
  adder_io_out_s_reg_2 = _RAND_82[23:0];
  _RAND_83 = {1{`RANDOM}};
  adder_io_out_c_reg_0 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  new_s_reg_0 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  new_s_reg_1 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  new_s_reg_2 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  new_s_reg_3 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  new_s_reg_4 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  new_s_reg_5 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  new_out_frac_reg_0 = _RAND_90[22:0];
  _RAND_91 = {1{`RANDOM}};
  new_out_exp_reg_0 = _RAND_91[7:0];
  _RAND_92 = {1{`RANDOM}};
  E_reg_0 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  E_reg_1 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  E_reg_2 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  E_reg_3 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  E_reg_4 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  D_reg_0 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  D_reg_1 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  D_reg_2 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  D_reg_3 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  D_reg_4 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  adder_result_reg_0 = _RAND_102[23:0];
  _RAND_103 = {1{`RANDOM}};
  adder_result_reg_1 = _RAND_103[23:0];
  _RAND_104 = {1{`RANDOM}};
  adder_result_reg_2 = _RAND_104[23:0];
  _RAND_105 = {1{`RANDOM}};
  leadingOne_reg_0 = _RAND_105[5:0];
  _RAND_106 = {1{`RANDOM}};
  leadingOne_reg_1 = _RAND_106[5:0];
  _RAND_107 = {1{`RANDOM}};
  io_in_a_reg_0 = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  io_in_a_reg_1 = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  io_in_a_reg_2 = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  io_in_a_reg_3 = _RAND_110[31:0];
  _RAND_111 = {1{`RANDOM}};
  io_in_a_reg_4 = _RAND_111[31:0];
  _RAND_112 = {1{`RANDOM}};
  io_in_a_reg_5 = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  io_in_a_reg_6 = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  io_in_a_reg_7 = _RAND_114[31:0];
  _RAND_115 = {1{`RANDOM}};
  io_in_a_reg_8 = _RAND_115[31:0];
  _RAND_116 = {1{`RANDOM}};
  io_in_a_reg_9 = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  io_in_a_reg_10 = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  io_in_b_reg_0 = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  io_in_b_reg_1 = _RAND_119[31:0];
  _RAND_120 = {1{`RANDOM}};
  io_in_b_reg_2 = _RAND_120[31:0];
  _RAND_121 = {1{`RANDOM}};
  io_in_b_reg_3 = _RAND_121[31:0];
  _RAND_122 = {1{`RANDOM}};
  io_in_b_reg_4 = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  io_in_b_reg_5 = _RAND_123[31:0];
  _RAND_124 = {1{`RANDOM}};
  io_in_b_reg_6 = _RAND_124[31:0];
  _RAND_125 = {1{`RANDOM}};
  io_in_b_reg_7 = _RAND_125[31:0];
  _RAND_126 = {1{`RANDOM}};
  io_in_b_reg_8 = _RAND_126[31:0];
  _RAND_127 = {1{`RANDOM}};
  io_in_b_reg_9 = _RAND_127[31:0];
  _RAND_128 = {1{`RANDOM}};
  io_in_b_reg_10 = _RAND_128[31:0];
  _RAND_129 = {1{`RANDOM}};
  subber2_out_s_reg_0 = _RAND_129[7:0];
  _RAND_130 = {1{`RANDOM}};
  subber2_out_c_reg_0 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  cmpl_subber_out_s_reg_0 = _RAND_131[7:0];
  _RAND_132 = {1{`RANDOM}};
  cmpl_wire_temp_add_in_reg_0_0 = _RAND_132[23:0];
  _RAND_133 = {1{`RANDOM}};
  cmpl_wire_temp_add_in_reg_0_1 = _RAND_133[23:0];
  _RAND_134 = {1{`RANDOM}};
  cmpl_adder_io_out_s_reg_0 = _RAND_134[23:0];
  _RAND_135 = {1{`RANDOM}};
  reg_out_s = _RAND_135[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FP_DDOT_dp(
  input         clock,
  input         reset,
  input  [31:0] io_in_a_0,
  input  [31:0] io_in_a_1,
  input  [31:0] io_in_a_2,
  input  [31:0] io_in_a_3,
  input  [31:0] io_in_a_4,
  input  [31:0] io_in_a_5,
  input  [31:0] io_in_a_6,
  input  [31:0] io_in_a_7,
  input  [31:0] io_in_a_8,
  input  [31:0] io_in_a_9,
  input  [31:0] io_in_a_10,
  input  [31:0] io_in_a_11,
  input  [31:0] io_in_a_12,
  input  [31:0] io_in_a_13,
  input  [31:0] io_in_a_14,
  input  [31:0] io_in_a_15,
  input  [31:0] io_in_a_16,
  input  [31:0] io_in_a_17,
  input  [31:0] io_in_a_18,
  input  [31:0] io_in_a_19,
  input  [31:0] io_in_a_20,
  input  [31:0] io_in_a_21,
  input  [31:0] io_in_a_22,
  input  [31:0] io_in_a_23,
  input  [31:0] io_in_a_24,
  input  [31:0] io_in_a_25,
  input  [31:0] io_in_a_26,
  input  [31:0] io_in_a_27,
  input  [31:0] io_in_a_28,
  input  [31:0] io_in_a_29,
  input  [31:0] io_in_a_30,
  input  [31:0] io_in_a_31,
  input  [31:0] io_in_b_0,
  input  [31:0] io_in_b_1,
  input  [31:0] io_in_b_2,
  input  [31:0] io_in_b_3,
  input  [31:0] io_in_b_4,
  input  [31:0] io_in_b_5,
  input  [31:0] io_in_b_6,
  input  [31:0] io_in_b_7,
  input  [31:0] io_in_b_8,
  input  [31:0] io_in_b_9,
  input  [31:0] io_in_b_10,
  input  [31:0] io_in_b_11,
  input  [31:0] io_in_b_12,
  input  [31:0] io_in_b_13,
  input  [31:0] io_in_b_14,
  input  [31:0] io_in_b_15,
  input  [31:0] io_in_b_16,
  input  [31:0] io_in_b_17,
  input  [31:0] io_in_b_18,
  input  [31:0] io_in_b_19,
  input  [31:0] io_in_b_20,
  input  [31:0] io_in_b_21,
  input  [31:0] io_in_b_22,
  input  [31:0] io_in_b_23,
  input  [31:0] io_in_b_24,
  input  [31:0] io_in_b_25,
  input  [31:0] io_in_b_26,
  input  [31:0] io_in_b_27,
  input  [31:0] io_in_b_28,
  input  [31:0] io_in_b_29,
  input  [31:0] io_in_b_30,
  input  [31:0] io_in_b_31,
  output [31:0] io_out_s
);
  wire  FP_multiplier_10ccs_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_1_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_1_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_1_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_1_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_2_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_2_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_2_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_2_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_3_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_3_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_3_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_3_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_3_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_4_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_4_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_4_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_4_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_4_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_5_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_5_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_5_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_5_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_5_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_6_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_6_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_6_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_6_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_6_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_7_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_7_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_7_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_7_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_7_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_8_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_8_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_8_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_8_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_8_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_9_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_9_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_9_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_9_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_9_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_10_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_10_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_10_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_10_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_10_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_11_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_11_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_11_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_11_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_11_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_12_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_12_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_12_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_12_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_12_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_13_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_13_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_13_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_13_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_13_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_14_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_14_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_14_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_14_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_14_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_15_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_15_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_15_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_15_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_15_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_16_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_16_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_16_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_16_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_16_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_17_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_17_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_17_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_17_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_17_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_18_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_18_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_18_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_18_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_18_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_19_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_19_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_19_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_19_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_19_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_20_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_20_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_20_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_20_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_20_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_21_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_21_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_21_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_21_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_21_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_22_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_22_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_22_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_22_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_22_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_23_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_23_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_23_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_23_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_23_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_24_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_24_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_24_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_24_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_24_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_25_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_25_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_25_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_25_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_25_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_26_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_26_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_26_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_26_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_26_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_27_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_27_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_27_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_27_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_27_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_28_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_28_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_28_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_28_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_28_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_29_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_29_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_29_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_29_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_29_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_30_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_30_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_30_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_30_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_30_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_31_clock; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_multiplier_10ccs_31_reset; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_31_io_in_a; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_31_io_in_b; // @[FloatingPointDesigns.scala 2409:44]
  wire [31:0] FP_multiplier_10ccs_31_io_out_s; // @[FloatingPointDesigns.scala 2409:44]
  wire  FP_adder_13ccs_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_1_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_1_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_1_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_1_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_2_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_2_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_2_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_2_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_3_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_3_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_3_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_3_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_3_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_4_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_4_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_4_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_4_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_4_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_5_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_5_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_5_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_5_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_5_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_6_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_6_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_6_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_6_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_6_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_7_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_7_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_7_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_7_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_7_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_8_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_8_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_8_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_8_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_8_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_9_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_9_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_9_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_9_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_9_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_10_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_10_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_10_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_10_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_10_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_11_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_11_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_11_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_11_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_11_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_12_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_12_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_12_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_12_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_12_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_13_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_13_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_13_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_13_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_13_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_14_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_14_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_14_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_14_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_14_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_15_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_15_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_15_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_15_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_15_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_16_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_16_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_16_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_16_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_16_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_17_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_17_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_17_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_17_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_17_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_18_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_18_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_18_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_18_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_18_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_19_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_19_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_19_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_19_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_19_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_20_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_20_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_20_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_20_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_20_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_21_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_21_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_21_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_21_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_21_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_22_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_22_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_22_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_22_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_22_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_23_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_23_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_23_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_23_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_23_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_24_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_24_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_24_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_24_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_24_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_25_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_25_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_25_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_25_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_25_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_26_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_26_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_26_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_26_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_26_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_27_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_27_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_27_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_27_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_27_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_28_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_28_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_28_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_28_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_28_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_29_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_29_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_29_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_29_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_29_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_30_clock; // @[FloatingPointDesigns.scala 2417:17]
  wire  FP_adder_13ccs_30_reset; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_30_io_in_a; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_30_io_in_b; // @[FloatingPointDesigns.scala 2417:17]
  wire [31:0] FP_adder_13ccs_30_io_out_s; // @[FloatingPointDesigns.scala 2417:17]
  FP_multiplier_10ccs FP_multiplier_10ccs ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_clock),
    .reset(FP_multiplier_10ccs_reset),
    .io_in_a(FP_multiplier_10ccs_io_in_a),
    .io_in_b(FP_multiplier_10ccs_io_in_b),
    .io_out_s(FP_multiplier_10ccs_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_1 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_1_clock),
    .reset(FP_multiplier_10ccs_1_reset),
    .io_in_a(FP_multiplier_10ccs_1_io_in_a),
    .io_in_b(FP_multiplier_10ccs_1_io_in_b),
    .io_out_s(FP_multiplier_10ccs_1_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_2 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_2_clock),
    .reset(FP_multiplier_10ccs_2_reset),
    .io_in_a(FP_multiplier_10ccs_2_io_in_a),
    .io_in_b(FP_multiplier_10ccs_2_io_in_b),
    .io_out_s(FP_multiplier_10ccs_2_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_3 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_3_clock),
    .reset(FP_multiplier_10ccs_3_reset),
    .io_in_a(FP_multiplier_10ccs_3_io_in_a),
    .io_in_b(FP_multiplier_10ccs_3_io_in_b),
    .io_out_s(FP_multiplier_10ccs_3_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_4 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_4_clock),
    .reset(FP_multiplier_10ccs_4_reset),
    .io_in_a(FP_multiplier_10ccs_4_io_in_a),
    .io_in_b(FP_multiplier_10ccs_4_io_in_b),
    .io_out_s(FP_multiplier_10ccs_4_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_5 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_5_clock),
    .reset(FP_multiplier_10ccs_5_reset),
    .io_in_a(FP_multiplier_10ccs_5_io_in_a),
    .io_in_b(FP_multiplier_10ccs_5_io_in_b),
    .io_out_s(FP_multiplier_10ccs_5_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_6 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_6_clock),
    .reset(FP_multiplier_10ccs_6_reset),
    .io_in_a(FP_multiplier_10ccs_6_io_in_a),
    .io_in_b(FP_multiplier_10ccs_6_io_in_b),
    .io_out_s(FP_multiplier_10ccs_6_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_7 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_7_clock),
    .reset(FP_multiplier_10ccs_7_reset),
    .io_in_a(FP_multiplier_10ccs_7_io_in_a),
    .io_in_b(FP_multiplier_10ccs_7_io_in_b),
    .io_out_s(FP_multiplier_10ccs_7_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_8 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_8_clock),
    .reset(FP_multiplier_10ccs_8_reset),
    .io_in_a(FP_multiplier_10ccs_8_io_in_a),
    .io_in_b(FP_multiplier_10ccs_8_io_in_b),
    .io_out_s(FP_multiplier_10ccs_8_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_9 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_9_clock),
    .reset(FP_multiplier_10ccs_9_reset),
    .io_in_a(FP_multiplier_10ccs_9_io_in_a),
    .io_in_b(FP_multiplier_10ccs_9_io_in_b),
    .io_out_s(FP_multiplier_10ccs_9_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_10 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_10_clock),
    .reset(FP_multiplier_10ccs_10_reset),
    .io_in_a(FP_multiplier_10ccs_10_io_in_a),
    .io_in_b(FP_multiplier_10ccs_10_io_in_b),
    .io_out_s(FP_multiplier_10ccs_10_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_11 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_11_clock),
    .reset(FP_multiplier_10ccs_11_reset),
    .io_in_a(FP_multiplier_10ccs_11_io_in_a),
    .io_in_b(FP_multiplier_10ccs_11_io_in_b),
    .io_out_s(FP_multiplier_10ccs_11_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_12 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_12_clock),
    .reset(FP_multiplier_10ccs_12_reset),
    .io_in_a(FP_multiplier_10ccs_12_io_in_a),
    .io_in_b(FP_multiplier_10ccs_12_io_in_b),
    .io_out_s(FP_multiplier_10ccs_12_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_13 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_13_clock),
    .reset(FP_multiplier_10ccs_13_reset),
    .io_in_a(FP_multiplier_10ccs_13_io_in_a),
    .io_in_b(FP_multiplier_10ccs_13_io_in_b),
    .io_out_s(FP_multiplier_10ccs_13_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_14 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_14_clock),
    .reset(FP_multiplier_10ccs_14_reset),
    .io_in_a(FP_multiplier_10ccs_14_io_in_a),
    .io_in_b(FP_multiplier_10ccs_14_io_in_b),
    .io_out_s(FP_multiplier_10ccs_14_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_15 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_15_clock),
    .reset(FP_multiplier_10ccs_15_reset),
    .io_in_a(FP_multiplier_10ccs_15_io_in_a),
    .io_in_b(FP_multiplier_10ccs_15_io_in_b),
    .io_out_s(FP_multiplier_10ccs_15_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_16 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_16_clock),
    .reset(FP_multiplier_10ccs_16_reset),
    .io_in_a(FP_multiplier_10ccs_16_io_in_a),
    .io_in_b(FP_multiplier_10ccs_16_io_in_b),
    .io_out_s(FP_multiplier_10ccs_16_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_17 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_17_clock),
    .reset(FP_multiplier_10ccs_17_reset),
    .io_in_a(FP_multiplier_10ccs_17_io_in_a),
    .io_in_b(FP_multiplier_10ccs_17_io_in_b),
    .io_out_s(FP_multiplier_10ccs_17_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_18 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_18_clock),
    .reset(FP_multiplier_10ccs_18_reset),
    .io_in_a(FP_multiplier_10ccs_18_io_in_a),
    .io_in_b(FP_multiplier_10ccs_18_io_in_b),
    .io_out_s(FP_multiplier_10ccs_18_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_19 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_19_clock),
    .reset(FP_multiplier_10ccs_19_reset),
    .io_in_a(FP_multiplier_10ccs_19_io_in_a),
    .io_in_b(FP_multiplier_10ccs_19_io_in_b),
    .io_out_s(FP_multiplier_10ccs_19_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_20 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_20_clock),
    .reset(FP_multiplier_10ccs_20_reset),
    .io_in_a(FP_multiplier_10ccs_20_io_in_a),
    .io_in_b(FP_multiplier_10ccs_20_io_in_b),
    .io_out_s(FP_multiplier_10ccs_20_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_21 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_21_clock),
    .reset(FP_multiplier_10ccs_21_reset),
    .io_in_a(FP_multiplier_10ccs_21_io_in_a),
    .io_in_b(FP_multiplier_10ccs_21_io_in_b),
    .io_out_s(FP_multiplier_10ccs_21_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_22 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_22_clock),
    .reset(FP_multiplier_10ccs_22_reset),
    .io_in_a(FP_multiplier_10ccs_22_io_in_a),
    .io_in_b(FP_multiplier_10ccs_22_io_in_b),
    .io_out_s(FP_multiplier_10ccs_22_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_23 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_23_clock),
    .reset(FP_multiplier_10ccs_23_reset),
    .io_in_a(FP_multiplier_10ccs_23_io_in_a),
    .io_in_b(FP_multiplier_10ccs_23_io_in_b),
    .io_out_s(FP_multiplier_10ccs_23_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_24 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_24_clock),
    .reset(FP_multiplier_10ccs_24_reset),
    .io_in_a(FP_multiplier_10ccs_24_io_in_a),
    .io_in_b(FP_multiplier_10ccs_24_io_in_b),
    .io_out_s(FP_multiplier_10ccs_24_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_25 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_25_clock),
    .reset(FP_multiplier_10ccs_25_reset),
    .io_in_a(FP_multiplier_10ccs_25_io_in_a),
    .io_in_b(FP_multiplier_10ccs_25_io_in_b),
    .io_out_s(FP_multiplier_10ccs_25_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_26 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_26_clock),
    .reset(FP_multiplier_10ccs_26_reset),
    .io_in_a(FP_multiplier_10ccs_26_io_in_a),
    .io_in_b(FP_multiplier_10ccs_26_io_in_b),
    .io_out_s(FP_multiplier_10ccs_26_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_27 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_27_clock),
    .reset(FP_multiplier_10ccs_27_reset),
    .io_in_a(FP_multiplier_10ccs_27_io_in_a),
    .io_in_b(FP_multiplier_10ccs_27_io_in_b),
    .io_out_s(FP_multiplier_10ccs_27_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_28 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_28_clock),
    .reset(FP_multiplier_10ccs_28_reset),
    .io_in_a(FP_multiplier_10ccs_28_io_in_a),
    .io_in_b(FP_multiplier_10ccs_28_io_in_b),
    .io_out_s(FP_multiplier_10ccs_28_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_29 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_29_clock),
    .reset(FP_multiplier_10ccs_29_reset),
    .io_in_a(FP_multiplier_10ccs_29_io_in_a),
    .io_in_b(FP_multiplier_10ccs_29_io_in_b),
    .io_out_s(FP_multiplier_10ccs_29_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_30 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_30_clock),
    .reset(FP_multiplier_10ccs_30_reset),
    .io_in_a(FP_multiplier_10ccs_30_io_in_a),
    .io_in_b(FP_multiplier_10ccs_30_io_in_b),
    .io_out_s(FP_multiplier_10ccs_30_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_31 ( // @[FloatingPointDesigns.scala 2409:44]
    .clock(FP_multiplier_10ccs_31_clock),
    .reset(FP_multiplier_10ccs_31_reset),
    .io_in_a(FP_multiplier_10ccs_31_io_in_a),
    .io_in_b(FP_multiplier_10ccs_31_io_in_b),
    .io_out_s(FP_multiplier_10ccs_31_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_clock),
    .reset(FP_adder_13ccs_reset),
    .io_in_a(FP_adder_13ccs_io_in_a),
    .io_in_b(FP_adder_13ccs_io_in_b),
    .io_out_s(FP_adder_13ccs_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_1 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_1_clock),
    .reset(FP_adder_13ccs_1_reset),
    .io_in_a(FP_adder_13ccs_1_io_in_a),
    .io_in_b(FP_adder_13ccs_1_io_in_b),
    .io_out_s(FP_adder_13ccs_1_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_2 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_2_clock),
    .reset(FP_adder_13ccs_2_reset),
    .io_in_a(FP_adder_13ccs_2_io_in_a),
    .io_in_b(FP_adder_13ccs_2_io_in_b),
    .io_out_s(FP_adder_13ccs_2_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_3 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_3_clock),
    .reset(FP_adder_13ccs_3_reset),
    .io_in_a(FP_adder_13ccs_3_io_in_a),
    .io_in_b(FP_adder_13ccs_3_io_in_b),
    .io_out_s(FP_adder_13ccs_3_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_4 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_4_clock),
    .reset(FP_adder_13ccs_4_reset),
    .io_in_a(FP_adder_13ccs_4_io_in_a),
    .io_in_b(FP_adder_13ccs_4_io_in_b),
    .io_out_s(FP_adder_13ccs_4_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_5 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_5_clock),
    .reset(FP_adder_13ccs_5_reset),
    .io_in_a(FP_adder_13ccs_5_io_in_a),
    .io_in_b(FP_adder_13ccs_5_io_in_b),
    .io_out_s(FP_adder_13ccs_5_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_6 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_6_clock),
    .reset(FP_adder_13ccs_6_reset),
    .io_in_a(FP_adder_13ccs_6_io_in_a),
    .io_in_b(FP_adder_13ccs_6_io_in_b),
    .io_out_s(FP_adder_13ccs_6_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_7 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_7_clock),
    .reset(FP_adder_13ccs_7_reset),
    .io_in_a(FP_adder_13ccs_7_io_in_a),
    .io_in_b(FP_adder_13ccs_7_io_in_b),
    .io_out_s(FP_adder_13ccs_7_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_8 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_8_clock),
    .reset(FP_adder_13ccs_8_reset),
    .io_in_a(FP_adder_13ccs_8_io_in_a),
    .io_in_b(FP_adder_13ccs_8_io_in_b),
    .io_out_s(FP_adder_13ccs_8_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_9 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_9_clock),
    .reset(FP_adder_13ccs_9_reset),
    .io_in_a(FP_adder_13ccs_9_io_in_a),
    .io_in_b(FP_adder_13ccs_9_io_in_b),
    .io_out_s(FP_adder_13ccs_9_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_10 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_10_clock),
    .reset(FP_adder_13ccs_10_reset),
    .io_in_a(FP_adder_13ccs_10_io_in_a),
    .io_in_b(FP_adder_13ccs_10_io_in_b),
    .io_out_s(FP_adder_13ccs_10_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_11 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_11_clock),
    .reset(FP_adder_13ccs_11_reset),
    .io_in_a(FP_adder_13ccs_11_io_in_a),
    .io_in_b(FP_adder_13ccs_11_io_in_b),
    .io_out_s(FP_adder_13ccs_11_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_12 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_12_clock),
    .reset(FP_adder_13ccs_12_reset),
    .io_in_a(FP_adder_13ccs_12_io_in_a),
    .io_in_b(FP_adder_13ccs_12_io_in_b),
    .io_out_s(FP_adder_13ccs_12_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_13 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_13_clock),
    .reset(FP_adder_13ccs_13_reset),
    .io_in_a(FP_adder_13ccs_13_io_in_a),
    .io_in_b(FP_adder_13ccs_13_io_in_b),
    .io_out_s(FP_adder_13ccs_13_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_14 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_14_clock),
    .reset(FP_adder_13ccs_14_reset),
    .io_in_a(FP_adder_13ccs_14_io_in_a),
    .io_in_b(FP_adder_13ccs_14_io_in_b),
    .io_out_s(FP_adder_13ccs_14_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_15 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_15_clock),
    .reset(FP_adder_13ccs_15_reset),
    .io_in_a(FP_adder_13ccs_15_io_in_a),
    .io_in_b(FP_adder_13ccs_15_io_in_b),
    .io_out_s(FP_adder_13ccs_15_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_16 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_16_clock),
    .reset(FP_adder_13ccs_16_reset),
    .io_in_a(FP_adder_13ccs_16_io_in_a),
    .io_in_b(FP_adder_13ccs_16_io_in_b),
    .io_out_s(FP_adder_13ccs_16_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_17 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_17_clock),
    .reset(FP_adder_13ccs_17_reset),
    .io_in_a(FP_adder_13ccs_17_io_in_a),
    .io_in_b(FP_adder_13ccs_17_io_in_b),
    .io_out_s(FP_adder_13ccs_17_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_18 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_18_clock),
    .reset(FP_adder_13ccs_18_reset),
    .io_in_a(FP_adder_13ccs_18_io_in_a),
    .io_in_b(FP_adder_13ccs_18_io_in_b),
    .io_out_s(FP_adder_13ccs_18_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_19 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_19_clock),
    .reset(FP_adder_13ccs_19_reset),
    .io_in_a(FP_adder_13ccs_19_io_in_a),
    .io_in_b(FP_adder_13ccs_19_io_in_b),
    .io_out_s(FP_adder_13ccs_19_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_20 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_20_clock),
    .reset(FP_adder_13ccs_20_reset),
    .io_in_a(FP_adder_13ccs_20_io_in_a),
    .io_in_b(FP_adder_13ccs_20_io_in_b),
    .io_out_s(FP_adder_13ccs_20_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_21 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_21_clock),
    .reset(FP_adder_13ccs_21_reset),
    .io_in_a(FP_adder_13ccs_21_io_in_a),
    .io_in_b(FP_adder_13ccs_21_io_in_b),
    .io_out_s(FP_adder_13ccs_21_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_22 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_22_clock),
    .reset(FP_adder_13ccs_22_reset),
    .io_in_a(FP_adder_13ccs_22_io_in_a),
    .io_in_b(FP_adder_13ccs_22_io_in_b),
    .io_out_s(FP_adder_13ccs_22_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_23 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_23_clock),
    .reset(FP_adder_13ccs_23_reset),
    .io_in_a(FP_adder_13ccs_23_io_in_a),
    .io_in_b(FP_adder_13ccs_23_io_in_b),
    .io_out_s(FP_adder_13ccs_23_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_24 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_24_clock),
    .reset(FP_adder_13ccs_24_reset),
    .io_in_a(FP_adder_13ccs_24_io_in_a),
    .io_in_b(FP_adder_13ccs_24_io_in_b),
    .io_out_s(FP_adder_13ccs_24_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_25 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_25_clock),
    .reset(FP_adder_13ccs_25_reset),
    .io_in_a(FP_adder_13ccs_25_io_in_a),
    .io_in_b(FP_adder_13ccs_25_io_in_b),
    .io_out_s(FP_adder_13ccs_25_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_26 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_26_clock),
    .reset(FP_adder_13ccs_26_reset),
    .io_in_a(FP_adder_13ccs_26_io_in_a),
    .io_in_b(FP_adder_13ccs_26_io_in_b),
    .io_out_s(FP_adder_13ccs_26_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_27 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_27_clock),
    .reset(FP_adder_13ccs_27_reset),
    .io_in_a(FP_adder_13ccs_27_io_in_a),
    .io_in_b(FP_adder_13ccs_27_io_in_b),
    .io_out_s(FP_adder_13ccs_27_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_28 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_28_clock),
    .reset(FP_adder_13ccs_28_reset),
    .io_in_a(FP_adder_13ccs_28_io_in_a),
    .io_in_b(FP_adder_13ccs_28_io_in_b),
    .io_out_s(FP_adder_13ccs_28_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_29 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_29_clock),
    .reset(FP_adder_13ccs_29_reset),
    .io_in_a(FP_adder_13ccs_29_io_in_a),
    .io_in_b(FP_adder_13ccs_29_io_in_b),
    .io_out_s(FP_adder_13ccs_29_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_30 ( // @[FloatingPointDesigns.scala 2417:17]
    .clock(FP_adder_13ccs_30_clock),
    .reset(FP_adder_13ccs_30_reset),
    .io_in_a(FP_adder_13ccs_30_io_in_a),
    .io_in_b(FP_adder_13ccs_30_io_in_b),
    .io_out_s(FP_adder_13ccs_30_io_out_s)
  );
  assign io_out_s = FP_adder_13ccs_30_io_out_s; // @[FloatingPointDesigns.scala 2466:16]
  assign FP_multiplier_10ccs_clock = clock;
  assign FP_multiplier_10ccs_reset = reset;
  assign FP_multiplier_10ccs_io_in_a = io_in_a_0; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_io_in_b = io_in_b_0; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_1_clock = clock;
  assign FP_multiplier_10ccs_1_reset = reset;
  assign FP_multiplier_10ccs_1_io_in_a = io_in_a_1; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_1_io_in_b = io_in_b_1; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_2_clock = clock;
  assign FP_multiplier_10ccs_2_reset = reset;
  assign FP_multiplier_10ccs_2_io_in_a = io_in_a_2; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_2_io_in_b = io_in_b_2; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_3_clock = clock;
  assign FP_multiplier_10ccs_3_reset = reset;
  assign FP_multiplier_10ccs_3_io_in_a = io_in_a_3; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_3_io_in_b = io_in_b_3; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_4_clock = clock;
  assign FP_multiplier_10ccs_4_reset = reset;
  assign FP_multiplier_10ccs_4_io_in_a = io_in_a_4; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_4_io_in_b = io_in_b_4; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_5_clock = clock;
  assign FP_multiplier_10ccs_5_reset = reset;
  assign FP_multiplier_10ccs_5_io_in_a = io_in_a_5; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_5_io_in_b = io_in_b_5; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_6_clock = clock;
  assign FP_multiplier_10ccs_6_reset = reset;
  assign FP_multiplier_10ccs_6_io_in_a = io_in_a_6; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_6_io_in_b = io_in_b_6; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_7_clock = clock;
  assign FP_multiplier_10ccs_7_reset = reset;
  assign FP_multiplier_10ccs_7_io_in_a = io_in_a_7; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_7_io_in_b = io_in_b_7; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_8_clock = clock;
  assign FP_multiplier_10ccs_8_reset = reset;
  assign FP_multiplier_10ccs_8_io_in_a = io_in_a_8; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_8_io_in_b = io_in_b_8; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_9_clock = clock;
  assign FP_multiplier_10ccs_9_reset = reset;
  assign FP_multiplier_10ccs_9_io_in_a = io_in_a_9; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_9_io_in_b = io_in_b_9; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_10_clock = clock;
  assign FP_multiplier_10ccs_10_reset = reset;
  assign FP_multiplier_10ccs_10_io_in_a = io_in_a_10; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_10_io_in_b = io_in_b_10; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_11_clock = clock;
  assign FP_multiplier_10ccs_11_reset = reset;
  assign FP_multiplier_10ccs_11_io_in_a = io_in_a_11; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_11_io_in_b = io_in_b_11; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_12_clock = clock;
  assign FP_multiplier_10ccs_12_reset = reset;
  assign FP_multiplier_10ccs_12_io_in_a = io_in_a_12; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_12_io_in_b = io_in_b_12; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_13_clock = clock;
  assign FP_multiplier_10ccs_13_reset = reset;
  assign FP_multiplier_10ccs_13_io_in_a = io_in_a_13; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_13_io_in_b = io_in_b_13; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_14_clock = clock;
  assign FP_multiplier_10ccs_14_reset = reset;
  assign FP_multiplier_10ccs_14_io_in_a = io_in_a_14; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_14_io_in_b = io_in_b_14; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_15_clock = clock;
  assign FP_multiplier_10ccs_15_reset = reset;
  assign FP_multiplier_10ccs_15_io_in_a = io_in_a_15; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_15_io_in_b = io_in_b_15; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_16_clock = clock;
  assign FP_multiplier_10ccs_16_reset = reset;
  assign FP_multiplier_10ccs_16_io_in_a = io_in_a_16; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_16_io_in_b = io_in_b_16; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_17_clock = clock;
  assign FP_multiplier_10ccs_17_reset = reset;
  assign FP_multiplier_10ccs_17_io_in_a = io_in_a_17; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_17_io_in_b = io_in_b_17; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_18_clock = clock;
  assign FP_multiplier_10ccs_18_reset = reset;
  assign FP_multiplier_10ccs_18_io_in_a = io_in_a_18; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_18_io_in_b = io_in_b_18; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_19_clock = clock;
  assign FP_multiplier_10ccs_19_reset = reset;
  assign FP_multiplier_10ccs_19_io_in_a = io_in_a_19; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_19_io_in_b = io_in_b_19; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_20_clock = clock;
  assign FP_multiplier_10ccs_20_reset = reset;
  assign FP_multiplier_10ccs_20_io_in_a = io_in_a_20; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_20_io_in_b = io_in_b_20; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_21_clock = clock;
  assign FP_multiplier_10ccs_21_reset = reset;
  assign FP_multiplier_10ccs_21_io_in_a = io_in_a_21; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_21_io_in_b = io_in_b_21; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_22_clock = clock;
  assign FP_multiplier_10ccs_22_reset = reset;
  assign FP_multiplier_10ccs_22_io_in_a = io_in_a_22; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_22_io_in_b = io_in_b_22; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_23_clock = clock;
  assign FP_multiplier_10ccs_23_reset = reset;
  assign FP_multiplier_10ccs_23_io_in_a = io_in_a_23; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_23_io_in_b = io_in_b_23; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_24_clock = clock;
  assign FP_multiplier_10ccs_24_reset = reset;
  assign FP_multiplier_10ccs_24_io_in_a = io_in_a_24; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_24_io_in_b = io_in_b_24; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_25_clock = clock;
  assign FP_multiplier_10ccs_25_reset = reset;
  assign FP_multiplier_10ccs_25_io_in_a = io_in_a_25; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_25_io_in_b = io_in_b_25; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_26_clock = clock;
  assign FP_multiplier_10ccs_26_reset = reset;
  assign FP_multiplier_10ccs_26_io_in_a = io_in_a_26; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_26_io_in_b = io_in_b_26; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_27_clock = clock;
  assign FP_multiplier_10ccs_27_reset = reset;
  assign FP_multiplier_10ccs_27_io_in_a = io_in_a_27; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_27_io_in_b = io_in_b_27; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_28_clock = clock;
  assign FP_multiplier_10ccs_28_reset = reset;
  assign FP_multiplier_10ccs_28_io_in_a = io_in_a_28; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_28_io_in_b = io_in_b_28; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_29_clock = clock;
  assign FP_multiplier_10ccs_29_reset = reset;
  assign FP_multiplier_10ccs_29_io_in_a = io_in_a_29; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_29_io_in_b = io_in_b_29; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_30_clock = clock;
  assign FP_multiplier_10ccs_30_reset = reset;
  assign FP_multiplier_10ccs_30_io_in_a = io_in_a_30; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_30_io_in_b = io_in_b_30; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_multiplier_10ccs_31_clock = clock;
  assign FP_multiplier_10ccs_31_reset = reset;
  assign FP_multiplier_10ccs_31_io_in_a = io_in_a_31; // @[FloatingPointDesigns.scala 2411:47]
  assign FP_multiplier_10ccs_31_io_in_b = io_in_b_31; // @[FloatingPointDesigns.scala 2412:47]
  assign FP_adder_13ccs_clock = clock;
  assign FP_adder_13ccs_reset = reset;
  assign FP_adder_13ccs_io_in_a = FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_io_in_b = FP_multiplier_10ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_1_clock = clock;
  assign FP_adder_13ccs_1_reset = reset;
  assign FP_adder_13ccs_1_io_in_a = FP_multiplier_10ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_1_io_in_b = FP_multiplier_10ccs_3_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_2_clock = clock;
  assign FP_adder_13ccs_2_reset = reset;
  assign FP_adder_13ccs_2_io_in_a = FP_multiplier_10ccs_4_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_2_io_in_b = FP_multiplier_10ccs_5_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_3_clock = clock;
  assign FP_adder_13ccs_3_reset = reset;
  assign FP_adder_13ccs_3_io_in_a = FP_multiplier_10ccs_6_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_3_io_in_b = FP_multiplier_10ccs_7_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_4_clock = clock;
  assign FP_adder_13ccs_4_reset = reset;
  assign FP_adder_13ccs_4_io_in_a = FP_multiplier_10ccs_8_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_4_io_in_b = FP_multiplier_10ccs_9_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_5_clock = clock;
  assign FP_adder_13ccs_5_reset = reset;
  assign FP_adder_13ccs_5_io_in_a = FP_multiplier_10ccs_10_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_5_io_in_b = FP_multiplier_10ccs_11_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_6_clock = clock;
  assign FP_adder_13ccs_6_reset = reset;
  assign FP_adder_13ccs_6_io_in_a = FP_multiplier_10ccs_12_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_6_io_in_b = FP_multiplier_10ccs_13_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_7_clock = clock;
  assign FP_adder_13ccs_7_reset = reset;
  assign FP_adder_13ccs_7_io_in_a = FP_multiplier_10ccs_14_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_7_io_in_b = FP_multiplier_10ccs_15_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_8_clock = clock;
  assign FP_adder_13ccs_8_reset = reset;
  assign FP_adder_13ccs_8_io_in_a = FP_multiplier_10ccs_16_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_8_io_in_b = FP_multiplier_10ccs_17_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_9_clock = clock;
  assign FP_adder_13ccs_9_reset = reset;
  assign FP_adder_13ccs_9_io_in_a = FP_multiplier_10ccs_18_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_9_io_in_b = FP_multiplier_10ccs_19_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_10_clock = clock;
  assign FP_adder_13ccs_10_reset = reset;
  assign FP_adder_13ccs_10_io_in_a = FP_multiplier_10ccs_20_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_10_io_in_b = FP_multiplier_10ccs_21_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_11_clock = clock;
  assign FP_adder_13ccs_11_reset = reset;
  assign FP_adder_13ccs_11_io_in_a = FP_multiplier_10ccs_22_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_11_io_in_b = FP_multiplier_10ccs_23_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_12_clock = clock;
  assign FP_adder_13ccs_12_reset = reset;
  assign FP_adder_13ccs_12_io_in_a = FP_multiplier_10ccs_24_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_12_io_in_b = FP_multiplier_10ccs_25_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_13_clock = clock;
  assign FP_adder_13ccs_13_reset = reset;
  assign FP_adder_13ccs_13_io_in_a = FP_multiplier_10ccs_26_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_13_io_in_b = FP_multiplier_10ccs_27_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_14_clock = clock;
  assign FP_adder_13ccs_14_reset = reset;
  assign FP_adder_13ccs_14_io_in_a = FP_multiplier_10ccs_28_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_14_io_in_b = FP_multiplier_10ccs_29_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_15_clock = clock;
  assign FP_adder_13ccs_15_reset = reset;
  assign FP_adder_13ccs_15_io_in_a = FP_multiplier_10ccs_30_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_15_io_in_b = FP_multiplier_10ccs_31_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_16_clock = clock;
  assign FP_adder_13ccs_16_reset = reset;
  assign FP_adder_13ccs_16_io_in_a = FP_adder_13ccs_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_16_io_in_b = FP_adder_13ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_17_clock = clock;
  assign FP_adder_13ccs_17_reset = reset;
  assign FP_adder_13ccs_17_io_in_a = FP_adder_13ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_17_io_in_b = FP_adder_13ccs_3_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_18_clock = clock;
  assign FP_adder_13ccs_18_reset = reset;
  assign FP_adder_13ccs_18_io_in_a = FP_adder_13ccs_4_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_18_io_in_b = FP_adder_13ccs_5_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_19_clock = clock;
  assign FP_adder_13ccs_19_reset = reset;
  assign FP_adder_13ccs_19_io_in_a = FP_adder_13ccs_6_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_19_io_in_b = FP_adder_13ccs_7_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_20_clock = clock;
  assign FP_adder_13ccs_20_reset = reset;
  assign FP_adder_13ccs_20_io_in_a = FP_adder_13ccs_8_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_20_io_in_b = FP_adder_13ccs_9_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_21_clock = clock;
  assign FP_adder_13ccs_21_reset = reset;
  assign FP_adder_13ccs_21_io_in_a = FP_adder_13ccs_10_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_21_io_in_b = FP_adder_13ccs_11_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_22_clock = clock;
  assign FP_adder_13ccs_22_reset = reset;
  assign FP_adder_13ccs_22_io_in_a = FP_adder_13ccs_12_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_22_io_in_b = FP_adder_13ccs_13_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_23_clock = clock;
  assign FP_adder_13ccs_23_reset = reset;
  assign FP_adder_13ccs_23_io_in_a = FP_adder_13ccs_14_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_23_io_in_b = FP_adder_13ccs_15_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_24_clock = clock;
  assign FP_adder_13ccs_24_reset = reset;
  assign FP_adder_13ccs_24_io_in_a = FP_adder_13ccs_16_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_24_io_in_b = FP_adder_13ccs_17_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_25_clock = clock;
  assign FP_adder_13ccs_25_reset = reset;
  assign FP_adder_13ccs_25_io_in_a = FP_adder_13ccs_18_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_25_io_in_b = FP_adder_13ccs_19_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_26_clock = clock;
  assign FP_adder_13ccs_26_reset = reset;
  assign FP_adder_13ccs_26_io_in_a = FP_adder_13ccs_20_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_26_io_in_b = FP_adder_13ccs_21_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_27_clock = clock;
  assign FP_adder_13ccs_27_reset = reset;
  assign FP_adder_13ccs_27_io_in_a = FP_adder_13ccs_22_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_27_io_in_b = FP_adder_13ccs_23_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_28_clock = clock;
  assign FP_adder_13ccs_28_reset = reset;
  assign FP_adder_13ccs_28_io_in_a = FP_adder_13ccs_24_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_28_io_in_b = FP_adder_13ccs_25_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_29_clock = clock;
  assign FP_adder_13ccs_29_reset = reset;
  assign FP_adder_13ccs_29_io_in_a = FP_adder_13ccs_26_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_29_io_in_b = FP_adder_13ccs_27_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
  assign FP_adder_13ccs_30_clock = clock;
  assign FP_adder_13ccs_30_reset = reset;
  assign FP_adder_13ccs_30_io_in_a = FP_adder_13ccs_28_io_out_s; // @[FloatingPointDesigns.scala 2448:43]
  assign FP_adder_13ccs_30_io_in_b = FP_adder_13ccs_29_io_out_s; // @[FloatingPointDesigns.scala 2449:43]
endmodule
module FP_subtractor_13ccs(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
  wire  FP_adder_clock; // @[FloatingPointDesigns.scala 1650:26]
  wire  FP_adder_reset; // @[FloatingPointDesigns.scala 1650:26]
  wire [31:0] FP_adder_io_in_a; // @[FloatingPointDesigns.scala 1650:26]
  wire [31:0] FP_adder_io_in_b; // @[FloatingPointDesigns.scala 1650:26]
  wire [31:0] FP_adder_io_out_s; // @[FloatingPointDesigns.scala 1650:26]
  wire  _adjusted_in_b_T_1 = ~io_in_b[31]; // @[FloatingPointDesigns.scala 1653:23]
  FP_adder_13ccs FP_adder ( // @[FloatingPointDesigns.scala 1650:26]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  assign io_out_s = FP_adder_io_out_s; // @[FloatingPointDesigns.scala 1657:14]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 1655:22]
  assign FP_adder_io_in_b = {_adjusted_in_b_T_1,io_in_b[30:0]}; // @[FloatingPointDesigns.scala 1653:41]
endmodule
module FP_square_root_newfpu(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
`endif // RANDOMIZE_REG_INIT
  wire  FP_multiplier_10ccs_clock; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_reset; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_io_in_a; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_io_in_b; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_1_clock; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_1_reset; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_1_io_in_a; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_1_io_in_b; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_1_io_out_s; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_2_clock; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_2_reset; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_2_io_in_a; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_2_io_in_b; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_2_io_out_s; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_3_clock; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_3_reset; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_3_io_in_a; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_3_io_in_b; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_3_io_out_s; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_4_clock; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_4_reset; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_4_io_in_a; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_4_io_in_b; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_4_io_out_s; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_5_clock; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_5_reset; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_5_io_in_a; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_5_io_in_b; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_5_io_out_s; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_6_clock; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_6_reset; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_6_io_in_a; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_6_io_in_b; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_6_io_out_s; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_7_clock; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_7_reset; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_7_io_in_a; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_7_io_in_b; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_7_io_out_s; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_8_clock; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_multiplier_10ccs_8_reset; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_8_io_in_a; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_8_io_in_b; // @[FloatingPointDesigns.scala 1876:65]
  wire [31:0] FP_multiplier_10ccs_8_io_out_s; // @[FloatingPointDesigns.scala 1876:65]
  wire  FP_subtractor_13ccs_clock; // @[FloatingPointDesigns.scala 1877:50]
  wire  FP_subtractor_13ccs_reset; // @[FloatingPointDesigns.scala 1877:50]
  wire [31:0] FP_subtractor_13ccs_io_in_a; // @[FloatingPointDesigns.scala 1877:50]
  wire [31:0] FP_subtractor_13ccs_io_in_b; // @[FloatingPointDesigns.scala 1877:50]
  wire [31:0] FP_subtractor_13ccs_io_out_s; // @[FloatingPointDesigns.scala 1877:50]
  wire  FP_subtractor_13ccs_1_clock; // @[FloatingPointDesigns.scala 1877:50]
  wire  FP_subtractor_13ccs_1_reset; // @[FloatingPointDesigns.scala 1877:50]
  wire [31:0] FP_subtractor_13ccs_1_io_in_a; // @[FloatingPointDesigns.scala 1877:50]
  wire [31:0] FP_subtractor_13ccs_1_io_in_b; // @[FloatingPointDesigns.scala 1877:50]
  wire [31:0] FP_subtractor_13ccs_1_io_out_s; // @[FloatingPointDesigns.scala 1877:50]
  wire  FP_subtractor_13ccs_2_clock; // @[FloatingPointDesigns.scala 1877:50]
  wire  FP_subtractor_13ccs_2_reset; // @[FloatingPointDesigns.scala 1877:50]
  wire [31:0] FP_subtractor_13ccs_2_io_in_a; // @[FloatingPointDesigns.scala 1877:50]
  wire [31:0] FP_subtractor_13ccs_2_io_in_b; // @[FloatingPointDesigns.scala 1877:50]
  wire [31:0] FP_subtractor_13ccs_2_io_out_s; // @[FloatingPointDesigns.scala 1877:50]
  wire  multiplier4_clock; // @[FloatingPointDesigns.scala 1945:29]
  wire  multiplier4_reset; // @[FloatingPointDesigns.scala 1945:29]
  wire [31:0] multiplier4_io_in_a; // @[FloatingPointDesigns.scala 1945:29]
  wire [31:0] multiplier4_io_in_b; // @[FloatingPointDesigns.scala 1945:29]
  wire [31:0] multiplier4_io_out_s; // @[FloatingPointDesigns.scala 1945:29]
  wire [30:0] _number_T_1 = {{1'd0}, io_in_a[30:1]}; // @[FloatingPointDesigns.scala 1860:36]
  wire [30:0] _GEN_0 = io_in_a[30:0] > 31'h7ef477d4 ? 31'h3f7a3bea : _number_T_1; // @[FloatingPointDesigns.scala 1857:46 1858:14 1860:14]
  wire [31:0] number = {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 1854:22]
  wire [31:0] result = 32'h5f3759df - number; // @[FloatingPointDesigns.scala 1867:25]
  reg [31:0] x_n_0; // @[FloatingPointDesigns.scala 1869:22]
  reg [31:0] x_n_1; // @[FloatingPointDesigns.scala 1869:22]
  reg [31:0] x_n_2; // @[FloatingPointDesigns.scala 1869:22]
  reg [31:0] x_n_4; // @[FloatingPointDesigns.scala 1869:22]
  reg [31:0] x_n_5; // @[FloatingPointDesigns.scala 1869:22]
  reg [31:0] x_n_6; // @[FloatingPointDesigns.scala 1869:22]
  reg [31:0] x_n_8; // @[FloatingPointDesigns.scala 1869:22]
  reg [31:0] x_n_9; // @[FloatingPointDesigns.scala 1869:22]
  reg [31:0] x_n_10; // @[FloatingPointDesigns.scala 1869:22]
  reg [31:0] a_2_0; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_1; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_2; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_3; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_4; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_5; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_6; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_7; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_8; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_9; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_10; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] a_2_11; // @[FloatingPointDesigns.scala 1870:22]
  reg [31:0] stage1_regs_0_0_0; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_0_1; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_0_2; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_0_3; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_0_4; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_0_5; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_0_6; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_0_7; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_0_8; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_1_0; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_1_1; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_1_2; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_1_3; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_1_4; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_1_5; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_1_6; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_1_7; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_0_1_8; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_0_0; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_0_1; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_0_2; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_0_3; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_0_4; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_0_5; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_0_6; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_0_7; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_0_8; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_1_0; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_1_1; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_1_2; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_1_3; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_1_4; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_1_5; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_1_6; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_1_7; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_1_1_8; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_0_0; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_0_1; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_0_2; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_0_3; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_0_4; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_0_5; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_0_6; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_0_7; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_0_8; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_1_0; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_1_1; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_1_2; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_1_3; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_1_4; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_1_5; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_1_6; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_1_7; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage1_regs_2_1_8; // @[FloatingPointDesigns.scala 1871:30]
  reg [31:0] stage2_regs_0_0_0; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_0_1; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_0_2; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_0_3; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_0_4; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_0_5; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_0_6; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_0_7; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_0_8; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_1_0; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_1_1; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_1_2; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_1_3; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_1_4; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_1_5; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_1_6; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_1_7; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_0_1_8; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_0_0; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_0_1; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_0_2; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_0_3; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_0_4; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_0_5; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_0_6; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_0_7; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_0_8; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_1_0; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_1_1; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_1_2; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_1_3; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_1_4; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_1_5; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_1_6; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_1_7; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_1_1_8; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_0_0; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_0_1; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_0_2; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_0_3; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_0_4; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_0_5; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_0_6; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_0_7; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_0_8; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_1_0; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_1_1; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_1_2; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_1_3; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_1_4; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_1_5; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_1_6; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_1_7; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage2_regs_2_1_8; // @[FloatingPointDesigns.scala 1872:30]
  reg [31:0] stage3_regs_0_0_0; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_1; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_2; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_3; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_4; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_5; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_6; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_7; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_8; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_9; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_10; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_0_11; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_0; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_1; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_2; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_3; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_4; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_5; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_6; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_7; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_8; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_9; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_10; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_0_1_11; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_0; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_1; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_2; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_3; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_4; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_5; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_6; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_7; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_8; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_9; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_10; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_0_11; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_0; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_1; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_2; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_3; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_4; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_5; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_6; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_7; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_8; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_9; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_10; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_1_1_11; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_0; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_1; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_2; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_3; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_4; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_5; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_6; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_7; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_8; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_9; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_10; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_0_11; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_0; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_1; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_2; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_3; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_4; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_5; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_6; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_7; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_8; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_9; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_10; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage3_regs_2_1_11; // @[FloatingPointDesigns.scala 1873:30]
  reg [31:0] stage4_regs_0_1_0; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_0_1_1; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_0_1_2; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_0_1_3; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_0_1_4; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_0_1_5; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_0_1_6; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_0_1_7; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_0_1_8; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_1_1_0; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_1_1_1; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_1_1_2; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_1_1_3; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_1_1_4; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_1_1_5; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_1_1_6; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_1_1_7; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_1_1_8; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_2_1_0; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_2_1_1; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_2_1_2; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_2_1_3; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_2_1_4; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_2_1_5; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_2_1_6; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_2_1_7; // @[FloatingPointDesigns.scala 1874:30]
  reg [31:0] stage4_regs_2_1_8; // @[FloatingPointDesigns.scala 1874:30]
  wire [7:0] _a_2_0_T_3 = io_in_a[30:23] - 8'h1; // @[FloatingPointDesigns.scala 1899:75]
  wire [31:0] _a_2_0_T_6 = {io_in_a[31],_a_2_0_T_3,io_in_a[22:0]}; // @[FloatingPointDesigns.scala 1899:82]
  wire [31:0] _GEN_139 = FP_multiplier_10ccs_2_io_out_s; // @[FloatingPointDesigns.scala 1869:22 1906:28 1907:26]
  wire [31:0] _GEN_215 = FP_multiplier_10ccs_5_io_out_s; // @[FloatingPointDesigns.scala 1869:22 1906:28 1907:26]
  wire [7:0] _restore_a_T_3 = stage4_regs_2_1_8[30:23] + 8'h1; // @[FloatingPointDesigns.scala 1944:106]
  wire [8:0] _restore_a_T_4 = {stage4_regs_2_1_8[31],_restore_a_T_3}; // @[FloatingPointDesigns.scala 1944:55]
  FP_multiplier_10ccs FP_multiplier_10ccs ( // @[FloatingPointDesigns.scala 1876:65]
    .clock(FP_multiplier_10ccs_clock),
    .reset(FP_multiplier_10ccs_reset),
    .io_in_a(FP_multiplier_10ccs_io_in_a),
    .io_in_b(FP_multiplier_10ccs_io_in_b),
    .io_out_s(FP_multiplier_10ccs_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_1 ( // @[FloatingPointDesigns.scala 1876:65]
    .clock(FP_multiplier_10ccs_1_clock),
    .reset(FP_multiplier_10ccs_1_reset),
    .io_in_a(FP_multiplier_10ccs_1_io_in_a),
    .io_in_b(FP_multiplier_10ccs_1_io_in_b),
    .io_out_s(FP_multiplier_10ccs_1_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_2 ( // @[FloatingPointDesigns.scala 1876:65]
    .clock(FP_multiplier_10ccs_2_clock),
    .reset(FP_multiplier_10ccs_2_reset),
    .io_in_a(FP_multiplier_10ccs_2_io_in_a),
    .io_in_b(FP_multiplier_10ccs_2_io_in_b),
    .io_out_s(FP_multiplier_10ccs_2_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_3 ( // @[FloatingPointDesigns.scala 1876:65]
    .clock(FP_multiplier_10ccs_3_clock),
    .reset(FP_multiplier_10ccs_3_reset),
    .io_in_a(FP_multiplier_10ccs_3_io_in_a),
    .io_in_b(FP_multiplier_10ccs_3_io_in_b),
    .io_out_s(FP_multiplier_10ccs_3_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_4 ( // @[FloatingPointDesigns.scala 1876:65]
    .clock(FP_multiplier_10ccs_4_clock),
    .reset(FP_multiplier_10ccs_4_reset),
    .io_in_a(FP_multiplier_10ccs_4_io_in_a),
    .io_in_b(FP_multiplier_10ccs_4_io_in_b),
    .io_out_s(FP_multiplier_10ccs_4_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_5 ( // @[FloatingPointDesigns.scala 1876:65]
    .clock(FP_multiplier_10ccs_5_clock),
    .reset(FP_multiplier_10ccs_5_reset),
    .io_in_a(FP_multiplier_10ccs_5_io_in_a),
    .io_in_b(FP_multiplier_10ccs_5_io_in_b),
    .io_out_s(FP_multiplier_10ccs_5_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_6 ( // @[FloatingPointDesigns.scala 1876:65]
    .clock(FP_multiplier_10ccs_6_clock),
    .reset(FP_multiplier_10ccs_6_reset),
    .io_in_a(FP_multiplier_10ccs_6_io_in_a),
    .io_in_b(FP_multiplier_10ccs_6_io_in_b),
    .io_out_s(FP_multiplier_10ccs_6_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_7 ( // @[FloatingPointDesigns.scala 1876:65]
    .clock(FP_multiplier_10ccs_7_clock),
    .reset(FP_multiplier_10ccs_7_reset),
    .io_in_a(FP_multiplier_10ccs_7_io_in_a),
    .io_in_b(FP_multiplier_10ccs_7_io_in_b),
    .io_out_s(FP_multiplier_10ccs_7_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_8 ( // @[FloatingPointDesigns.scala 1876:65]
    .clock(FP_multiplier_10ccs_8_clock),
    .reset(FP_multiplier_10ccs_8_reset),
    .io_in_a(FP_multiplier_10ccs_8_io_in_a),
    .io_in_b(FP_multiplier_10ccs_8_io_in_b),
    .io_out_s(FP_multiplier_10ccs_8_io_out_s)
  );
  FP_subtractor_13ccs FP_subtractor_13ccs ( // @[FloatingPointDesigns.scala 1877:50]
    .clock(FP_subtractor_13ccs_clock),
    .reset(FP_subtractor_13ccs_reset),
    .io_in_a(FP_subtractor_13ccs_io_in_a),
    .io_in_b(FP_subtractor_13ccs_io_in_b),
    .io_out_s(FP_subtractor_13ccs_io_out_s)
  );
  FP_subtractor_13ccs FP_subtractor_13ccs_1 ( // @[FloatingPointDesigns.scala 1877:50]
    .clock(FP_subtractor_13ccs_1_clock),
    .reset(FP_subtractor_13ccs_1_reset),
    .io_in_a(FP_subtractor_13ccs_1_io_in_a),
    .io_in_b(FP_subtractor_13ccs_1_io_in_b),
    .io_out_s(FP_subtractor_13ccs_1_io_out_s)
  );
  FP_subtractor_13ccs FP_subtractor_13ccs_2 ( // @[FloatingPointDesigns.scala 1877:50]
    .clock(FP_subtractor_13ccs_2_clock),
    .reset(FP_subtractor_13ccs_2_reset),
    .io_in_a(FP_subtractor_13ccs_2_io_in_a),
    .io_in_b(FP_subtractor_13ccs_2_io_in_b),
    .io_out_s(FP_subtractor_13ccs_2_io_out_s)
  );
  FP_multiplier_10ccs multiplier4 ( // @[FloatingPointDesigns.scala 1945:29]
    .clock(multiplier4_clock),
    .reset(multiplier4_reset),
    .io_in_a(multiplier4_io_in_a),
    .io_in_b(multiplier4_io_in_b),
    .io_out_s(multiplier4_io_out_s)
  );
  assign io_out_s = {{1'd0}, multiplier4_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1949:14]
  assign FP_multiplier_10ccs_clock = clock;
  assign FP_multiplier_10ccs_reset = reset;
  assign FP_multiplier_10ccs_io_in_a = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 1903:48]
  assign FP_multiplier_10ccs_io_in_b = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 1904:48]
  assign FP_multiplier_10ccs_1_clock = clock;
  assign FP_multiplier_10ccs_1_reset = reset;
  assign FP_multiplier_10ccs_1_io_in_a = FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 1916:34]
  assign FP_multiplier_10ccs_1_io_in_b = {1'h0,stage1_regs_0_1_8[30:0]}; // @[FloatingPointDesigns.scala 1917:46]
  assign FP_multiplier_10ccs_2_clock = clock;
  assign FP_multiplier_10ccs_2_reset = reset;
  assign FP_multiplier_10ccs_2_io_in_a = {1'h0,stage3_regs_0_0_11[30:0]}; // @[FloatingPointDesigns.scala 1934:46]
  assign FP_multiplier_10ccs_2_io_in_b = FP_subtractor_13ccs_io_out_s; // @[FloatingPointDesigns.scala 1935:34]
  assign FP_multiplier_10ccs_3_clock = clock;
  assign FP_multiplier_10ccs_3_reset = reset;
  assign FP_multiplier_10ccs_3_io_in_a = {1'h0,FP_multiplier_10ccs_2_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1912:48]
  assign FP_multiplier_10ccs_3_io_in_b = {1'h0,FP_multiplier_10ccs_2_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1913:48]
  assign FP_multiplier_10ccs_4_clock = clock;
  assign FP_multiplier_10ccs_4_reset = reset;
  assign FP_multiplier_10ccs_4_io_in_a = FP_multiplier_10ccs_3_io_out_s; // @[FloatingPointDesigns.scala 1916:34]
  assign FP_multiplier_10ccs_4_io_in_b = {1'h0,stage1_regs_1_1_8[30:0]}; // @[FloatingPointDesigns.scala 1917:46]
  assign FP_multiplier_10ccs_5_clock = clock;
  assign FP_multiplier_10ccs_5_reset = reset;
  assign FP_multiplier_10ccs_5_io_in_a = {1'h0,stage3_regs_1_0_11[30:0]}; // @[FloatingPointDesigns.scala 1934:46]
  assign FP_multiplier_10ccs_5_io_in_b = FP_subtractor_13ccs_1_io_out_s; // @[FloatingPointDesigns.scala 1935:34]
  assign FP_multiplier_10ccs_6_clock = clock;
  assign FP_multiplier_10ccs_6_reset = reset;
  assign FP_multiplier_10ccs_6_io_in_a = {1'h0,FP_multiplier_10ccs_5_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1912:48]
  assign FP_multiplier_10ccs_6_io_in_b = {1'h0,FP_multiplier_10ccs_5_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1913:48]
  assign FP_multiplier_10ccs_7_clock = clock;
  assign FP_multiplier_10ccs_7_reset = reset;
  assign FP_multiplier_10ccs_7_io_in_a = FP_multiplier_10ccs_6_io_out_s; // @[FloatingPointDesigns.scala 1916:34]
  assign FP_multiplier_10ccs_7_io_in_b = {1'h0,stage1_regs_2_1_8[30:0]}; // @[FloatingPointDesigns.scala 1917:46]
  assign FP_multiplier_10ccs_8_clock = clock;
  assign FP_multiplier_10ccs_8_reset = reset;
  assign FP_multiplier_10ccs_8_io_in_a = {1'h0,stage3_regs_2_0_11[30:0]}; // @[FloatingPointDesigns.scala 1934:46]
  assign FP_multiplier_10ccs_8_io_in_b = FP_subtractor_13ccs_2_io_out_s; // @[FloatingPointDesigns.scala 1935:34]
  assign FP_subtractor_13ccs_clock = clock;
  assign FP_subtractor_13ccs_reset = reset;
  assign FP_subtractor_13ccs_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 1855:26 1856:16]
  assign FP_subtractor_13ccs_io_in_b = FP_multiplier_10ccs_1_io_out_s; // @[FloatingPointDesigns.scala 1926:31]
  assign FP_subtractor_13ccs_1_clock = clock;
  assign FP_subtractor_13ccs_1_reset = reset;
  assign FP_subtractor_13ccs_1_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 1855:26 1856:16]
  assign FP_subtractor_13ccs_1_io_in_b = FP_multiplier_10ccs_4_io_out_s; // @[FloatingPointDesigns.scala 1926:31]
  assign FP_subtractor_13ccs_2_clock = clock;
  assign FP_subtractor_13ccs_2_reset = reset;
  assign FP_subtractor_13ccs_2_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 1855:26 1856:16]
  assign FP_subtractor_13ccs_2_io_in_b = FP_multiplier_10ccs_7_io_out_s; // @[FloatingPointDesigns.scala 1926:31]
  assign multiplier4_clock = clock;
  assign multiplier4_reset = reset;
  assign multiplier4_io_in_a = {1'h0,FP_multiplier_10ccs_8_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1947:37]
  assign multiplier4_io_in_b = {_restore_a_T_4,stage4_regs_2_1_8[22:0]}; // @[FloatingPointDesigns.scala 1944:113]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 1869:22]
      x_n_0 <= 32'h0; // @[FloatingPointDesigns.scala 1869:22]
    end else begin
      x_n_0 <= result;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1869:22]
      x_n_1 <= 32'h0; // @[FloatingPointDesigns.scala 1869:22]
    end else begin
      x_n_1 <= stage1_regs_0_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1869:22]
      x_n_2 <= 32'h0; // @[FloatingPointDesigns.scala 1869:22]
    end else begin
      x_n_2 <= stage2_regs_0_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1869:22]
      x_n_4 <= 32'h0; // @[FloatingPointDesigns.scala 1869:22]
    end else begin
      x_n_4 <= _GEN_139;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1869:22]
      x_n_5 <= 32'h0; // @[FloatingPointDesigns.scala 1869:22]
    end else begin
      x_n_5 <= stage1_regs_1_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1869:22]
      x_n_6 <= 32'h0; // @[FloatingPointDesigns.scala 1869:22]
    end else begin
      x_n_6 <= stage2_regs_1_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1869:22]
      x_n_8 <= 32'h0; // @[FloatingPointDesigns.scala 1869:22]
    end else begin
      x_n_8 <= _GEN_215;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1869:22]
      x_n_9 <= 32'h0; // @[FloatingPointDesigns.scala 1869:22]
    end else begin
      x_n_9 <= stage1_regs_2_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1869:22]
      x_n_10 <= 32'h0; // @[FloatingPointDesigns.scala 1869:22]
    end else begin
      x_n_10 <= stage2_regs_2_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_0 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_0 <= _a_2_0_T_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_1 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_1 <= stage1_regs_0_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_2 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_2 <= stage2_regs_0_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_3 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_3 <= stage3_regs_0_1_11;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_4 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_4 <= stage4_regs_0_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_5 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_5 <= stage1_regs_1_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_6 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_6 <= stage2_regs_1_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_7 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_7 <= stage3_regs_1_1_11;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_8 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_8 <= stage4_regs_1_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_9 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_9 <= stage1_regs_2_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_10 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_10 <= stage2_regs_2_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1870:22]
      a_2_11 <= 32'h0; // @[FloatingPointDesigns.scala 1870:22]
    end else begin
      a_2_11 <= stage3_regs_2_1_11;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_0_0 <= x_n_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_0_1 <= stage1_regs_0_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_0_2 <= stage1_regs_0_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_0_3 <= stage1_regs_0_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_0_4 <= stage1_regs_0_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_0_5 <= stage1_regs_0_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_0_6 <= stage1_regs_0_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_0_7 <= stage1_regs_0_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_0_8 <= stage1_regs_0_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_1_0 <= a_2_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_1_1 <= stage1_regs_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_1_2 <= stage1_regs_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_1_3 <= stage1_regs_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_1_4 <= stage1_regs_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_1_5 <= stage1_regs_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_1_6 <= stage1_regs_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_1_7 <= stage1_regs_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_0_1_8 <= stage1_regs_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_0_0 <= x_n_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_0_1 <= stage1_regs_1_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_0_2 <= stage1_regs_1_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_0_3 <= stage1_regs_1_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_0_4 <= stage1_regs_1_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_0_5 <= stage1_regs_1_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_0_6 <= stage1_regs_1_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_0_7 <= stage1_regs_1_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_0_8 <= stage1_regs_1_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_1_0 <= a_2_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_1_1 <= stage1_regs_1_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_1_2 <= stage1_regs_1_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_1_3 <= stage1_regs_1_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_1_4 <= stage1_regs_1_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_1_5 <= stage1_regs_1_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_1_6 <= stage1_regs_1_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_1_7 <= stage1_regs_1_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_1_1_8 <= stage1_regs_1_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_0_0 <= x_n_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_0_1 <= stage1_regs_2_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_0_2 <= stage1_regs_2_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_0_3 <= stage1_regs_2_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_0_4 <= stage1_regs_2_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_0_5 <= stage1_regs_2_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_0_6 <= stage1_regs_2_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_0_7 <= stage1_regs_2_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_0_8 <= stage1_regs_2_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_1_0 <= a_2_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_1_1 <= stage1_regs_2_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_1_2 <= stage1_regs_2_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_1_3 <= stage1_regs_2_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_1_4 <= stage1_regs_2_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_1_5 <= stage1_regs_2_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_1_6 <= stage1_regs_2_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_1_7 <= stage1_regs_2_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1871:30]
      stage1_regs_2_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1871:30]
    end else begin
      stage1_regs_2_1_8 <= stage1_regs_2_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_0_0 <= x_n_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_0_1 <= stage2_regs_0_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_0_2 <= stage2_regs_0_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_0_3 <= stage2_regs_0_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_0_4 <= stage2_regs_0_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_0_5 <= stage2_regs_0_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_0_6 <= stage2_regs_0_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_0_7 <= stage2_regs_0_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_0_8 <= stage2_regs_0_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_1_0 <= a_2_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_1_1 <= stage2_regs_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_1_2 <= stage2_regs_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_1_3 <= stage2_regs_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_1_4 <= stage2_regs_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_1_5 <= stage2_regs_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_1_6 <= stage2_regs_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_1_7 <= stage2_regs_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_0_1_8 <= stage2_regs_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_0_0 <= x_n_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_0_1 <= stage2_regs_1_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_0_2 <= stage2_regs_1_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_0_3 <= stage2_regs_1_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_0_4 <= stage2_regs_1_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_0_5 <= stage2_regs_1_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_0_6 <= stage2_regs_1_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_0_7 <= stage2_regs_1_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_0_8 <= stage2_regs_1_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_1_0 <= a_2_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_1_1 <= stage2_regs_1_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_1_2 <= stage2_regs_1_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_1_3 <= stage2_regs_1_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_1_4 <= stage2_regs_1_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_1_5 <= stage2_regs_1_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_1_6 <= stage2_regs_1_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_1_7 <= stage2_regs_1_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_1_1_8 <= stage2_regs_1_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_0_0 <= x_n_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_0_1 <= stage2_regs_2_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_0_2 <= stage2_regs_2_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_0_3 <= stage2_regs_2_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_0_4 <= stage2_regs_2_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_0_5 <= stage2_regs_2_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_0_6 <= stage2_regs_2_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_0_7 <= stage2_regs_2_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_0_8 <= stage2_regs_2_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_1_0 <= a_2_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_1_1 <= stage2_regs_2_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_1_2 <= stage2_regs_2_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_1_3 <= stage2_regs_2_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_1_4 <= stage2_regs_2_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_1_5 <= stage2_regs_2_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_1_6 <= stage2_regs_2_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_1_7 <= stage2_regs_2_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1872:30]
      stage2_regs_2_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1872:30]
    end else begin
      stage2_regs_2_1_8 <= stage2_regs_2_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_0 <= x_n_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_1 <= stage3_regs_0_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_2 <= stage3_regs_0_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_3 <= stage3_regs_0_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_4 <= stage3_regs_0_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_5 <= stage3_regs_0_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_6 <= stage3_regs_0_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_7 <= stage3_regs_0_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_8 <= stage3_regs_0_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_9 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_9 <= stage3_regs_0_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_10 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_10 <= stage3_regs_0_0_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_0_11 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_0_11 <= stage3_regs_0_0_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_0 <= a_2_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_1 <= stage3_regs_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_2 <= stage3_regs_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_3 <= stage3_regs_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_4 <= stage3_regs_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_5 <= stage3_regs_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_6 <= stage3_regs_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_7 <= stage3_regs_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_8 <= stage3_regs_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_9 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_9 <= stage3_regs_0_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_10 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_10 <= stage3_regs_0_1_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_0_1_11 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_0_1_11 <= stage3_regs_0_1_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_0 <= x_n_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_1 <= stage3_regs_1_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_2 <= stage3_regs_1_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_3 <= stage3_regs_1_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_4 <= stage3_regs_1_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_5 <= stage3_regs_1_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_6 <= stage3_regs_1_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_7 <= stage3_regs_1_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_8 <= stage3_regs_1_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_9 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_9 <= stage3_regs_1_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_10 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_10 <= stage3_regs_1_0_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_0_11 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_0_11 <= stage3_regs_1_0_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_0 <= a_2_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_1 <= stage3_regs_1_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_2 <= stage3_regs_1_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_3 <= stage3_regs_1_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_4 <= stage3_regs_1_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_5 <= stage3_regs_1_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_6 <= stage3_regs_1_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_7 <= stage3_regs_1_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_8 <= stage3_regs_1_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_9 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_9 <= stage3_regs_1_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_10 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_10 <= stage3_regs_1_1_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_1_1_11 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_1_1_11 <= stage3_regs_1_1_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_0 <= x_n_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_1 <= stage3_regs_2_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_2 <= stage3_regs_2_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_3 <= stage3_regs_2_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_4 <= stage3_regs_2_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_5 <= stage3_regs_2_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_6 <= stage3_regs_2_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_7 <= stage3_regs_2_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_8 <= stage3_regs_2_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_9 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_9 <= stage3_regs_2_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_10 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_10 <= stage3_regs_2_0_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_0_11 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_0_11 <= stage3_regs_2_0_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_0 <= a_2_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_1 <= stage3_regs_2_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_2 <= stage3_regs_2_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_3 <= stage3_regs_2_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_4 <= stage3_regs_2_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_5 <= stage3_regs_2_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_6 <= stage3_regs_2_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_7 <= stage3_regs_2_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_8 <= stage3_regs_2_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_9 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_9 <= stage3_regs_2_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_10 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_10 <= stage3_regs_2_1_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:30]
      stage3_regs_2_1_11 <= 32'h0; // @[FloatingPointDesigns.scala 1873:30]
    end else begin
      stage3_regs_2_1_11 <= stage3_regs_2_1_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_0_1_0 <= a_2_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_0_1_1 <= stage4_regs_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_0_1_2 <= stage4_regs_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_0_1_3 <= stage4_regs_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_0_1_4 <= stage4_regs_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_0_1_5 <= stage4_regs_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_0_1_6 <= stage4_regs_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_0_1_7 <= stage4_regs_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_0_1_8 <= stage4_regs_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_1_1_0 <= a_2_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_1_1_1 <= stage4_regs_1_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_1_1_2 <= stage4_regs_1_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_1_1_3 <= stage4_regs_1_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_1_1_4 <= stage4_regs_1_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_1_1_5 <= stage4_regs_1_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_1_1_6 <= stage4_regs_1_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_1_1_7 <= stage4_regs_1_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_1_1_8 <= stage4_regs_1_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_2_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_2_1_0 <= a_2_11;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_2_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_2_1_1 <= stage4_regs_2_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_2_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_2_1_2 <= stage4_regs_2_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_2_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_2_1_3 <= stage4_regs_2_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_2_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_2_1_4 <= stage4_regs_2_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_2_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_2_1_5 <= stage4_regs_2_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_2_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_2_1_6 <= stage4_regs_2_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_2_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_2_1_7 <= stage4_regs_2_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:30]
      stage4_regs_2_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1874:30]
    end else begin
      stage4_regs_2_1_8 <= stage4_regs_2_1_7;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  x_n_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  x_n_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  x_n_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  x_n_4 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  x_n_5 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  x_n_6 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  x_n_8 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  x_n_9 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  x_n_10 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  a_2_0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  a_2_1 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  a_2_2 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  a_2_3 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  a_2_4 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  a_2_5 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  a_2_6 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  a_2_7 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  a_2_8 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  a_2_9 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  a_2_10 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  a_2_11 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  stage1_regs_0_0_0 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  stage1_regs_0_0_1 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  stage1_regs_0_0_2 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  stage1_regs_0_0_3 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  stage1_regs_0_0_4 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  stage1_regs_0_0_5 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  stage1_regs_0_0_6 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  stage1_regs_0_0_7 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  stage1_regs_0_0_8 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  stage1_regs_0_1_0 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  stage1_regs_0_1_1 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  stage1_regs_0_1_2 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  stage1_regs_0_1_3 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  stage1_regs_0_1_4 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  stage1_regs_0_1_5 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  stage1_regs_0_1_6 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  stage1_regs_0_1_7 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  stage1_regs_0_1_8 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  stage1_regs_1_0_0 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  stage1_regs_1_0_1 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  stage1_regs_1_0_2 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  stage1_regs_1_0_3 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  stage1_regs_1_0_4 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  stage1_regs_1_0_5 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  stage1_regs_1_0_6 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  stage1_regs_1_0_7 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  stage1_regs_1_0_8 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  stage1_regs_1_1_0 = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  stage1_regs_1_1_1 = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  stage1_regs_1_1_2 = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  stage1_regs_1_1_3 = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  stage1_regs_1_1_4 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  stage1_regs_1_1_5 = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  stage1_regs_1_1_6 = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  stage1_regs_1_1_7 = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  stage1_regs_1_1_8 = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  stage1_regs_2_0_0 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  stage1_regs_2_0_1 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  stage1_regs_2_0_2 = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  stage1_regs_2_0_3 = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  stage1_regs_2_0_4 = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  stage1_regs_2_0_5 = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  stage1_regs_2_0_6 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  stage1_regs_2_0_7 = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  stage1_regs_2_0_8 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  stage1_regs_2_1_0 = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  stage1_regs_2_1_1 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  stage1_regs_2_1_2 = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  stage1_regs_2_1_3 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  stage1_regs_2_1_4 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  stage1_regs_2_1_5 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  stage1_regs_2_1_6 = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  stage1_regs_2_1_7 = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  stage1_regs_2_1_8 = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  stage2_regs_0_0_0 = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  stage2_regs_0_0_1 = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  stage2_regs_0_0_2 = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  stage2_regs_0_0_3 = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  stage2_regs_0_0_4 = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  stage2_regs_0_0_5 = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  stage2_regs_0_0_6 = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  stage2_regs_0_0_7 = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  stage2_regs_0_0_8 = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  stage2_regs_0_1_0 = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  stage2_regs_0_1_1 = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  stage2_regs_0_1_2 = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  stage2_regs_0_1_3 = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  stage2_regs_0_1_4 = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  stage2_regs_0_1_5 = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  stage2_regs_0_1_6 = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  stage2_regs_0_1_7 = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  stage2_regs_0_1_8 = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  stage2_regs_1_0_0 = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  stage2_regs_1_0_1 = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  stage2_regs_1_0_2 = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  stage2_regs_1_0_3 = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  stage2_regs_1_0_4 = _RAND_97[31:0];
  _RAND_98 = {1{`RANDOM}};
  stage2_regs_1_0_5 = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  stage2_regs_1_0_6 = _RAND_99[31:0];
  _RAND_100 = {1{`RANDOM}};
  stage2_regs_1_0_7 = _RAND_100[31:0];
  _RAND_101 = {1{`RANDOM}};
  stage2_regs_1_0_8 = _RAND_101[31:0];
  _RAND_102 = {1{`RANDOM}};
  stage2_regs_1_1_0 = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  stage2_regs_1_1_1 = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  stage2_regs_1_1_2 = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  stage2_regs_1_1_3 = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  stage2_regs_1_1_4 = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  stage2_regs_1_1_5 = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  stage2_regs_1_1_6 = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  stage2_regs_1_1_7 = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  stage2_regs_1_1_8 = _RAND_110[31:0];
  _RAND_111 = {1{`RANDOM}};
  stage2_regs_2_0_0 = _RAND_111[31:0];
  _RAND_112 = {1{`RANDOM}};
  stage2_regs_2_0_1 = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  stage2_regs_2_0_2 = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  stage2_regs_2_0_3 = _RAND_114[31:0];
  _RAND_115 = {1{`RANDOM}};
  stage2_regs_2_0_4 = _RAND_115[31:0];
  _RAND_116 = {1{`RANDOM}};
  stage2_regs_2_0_5 = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  stage2_regs_2_0_6 = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  stage2_regs_2_0_7 = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  stage2_regs_2_0_8 = _RAND_119[31:0];
  _RAND_120 = {1{`RANDOM}};
  stage2_regs_2_1_0 = _RAND_120[31:0];
  _RAND_121 = {1{`RANDOM}};
  stage2_regs_2_1_1 = _RAND_121[31:0];
  _RAND_122 = {1{`RANDOM}};
  stage2_regs_2_1_2 = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  stage2_regs_2_1_3 = _RAND_123[31:0];
  _RAND_124 = {1{`RANDOM}};
  stage2_regs_2_1_4 = _RAND_124[31:0];
  _RAND_125 = {1{`RANDOM}};
  stage2_regs_2_1_5 = _RAND_125[31:0];
  _RAND_126 = {1{`RANDOM}};
  stage2_regs_2_1_6 = _RAND_126[31:0];
  _RAND_127 = {1{`RANDOM}};
  stage2_regs_2_1_7 = _RAND_127[31:0];
  _RAND_128 = {1{`RANDOM}};
  stage2_regs_2_1_8 = _RAND_128[31:0];
  _RAND_129 = {1{`RANDOM}};
  stage3_regs_0_0_0 = _RAND_129[31:0];
  _RAND_130 = {1{`RANDOM}};
  stage3_regs_0_0_1 = _RAND_130[31:0];
  _RAND_131 = {1{`RANDOM}};
  stage3_regs_0_0_2 = _RAND_131[31:0];
  _RAND_132 = {1{`RANDOM}};
  stage3_regs_0_0_3 = _RAND_132[31:0];
  _RAND_133 = {1{`RANDOM}};
  stage3_regs_0_0_4 = _RAND_133[31:0];
  _RAND_134 = {1{`RANDOM}};
  stage3_regs_0_0_5 = _RAND_134[31:0];
  _RAND_135 = {1{`RANDOM}};
  stage3_regs_0_0_6 = _RAND_135[31:0];
  _RAND_136 = {1{`RANDOM}};
  stage3_regs_0_0_7 = _RAND_136[31:0];
  _RAND_137 = {1{`RANDOM}};
  stage3_regs_0_0_8 = _RAND_137[31:0];
  _RAND_138 = {1{`RANDOM}};
  stage3_regs_0_0_9 = _RAND_138[31:0];
  _RAND_139 = {1{`RANDOM}};
  stage3_regs_0_0_10 = _RAND_139[31:0];
  _RAND_140 = {1{`RANDOM}};
  stage3_regs_0_0_11 = _RAND_140[31:0];
  _RAND_141 = {1{`RANDOM}};
  stage3_regs_0_1_0 = _RAND_141[31:0];
  _RAND_142 = {1{`RANDOM}};
  stage3_regs_0_1_1 = _RAND_142[31:0];
  _RAND_143 = {1{`RANDOM}};
  stage3_regs_0_1_2 = _RAND_143[31:0];
  _RAND_144 = {1{`RANDOM}};
  stage3_regs_0_1_3 = _RAND_144[31:0];
  _RAND_145 = {1{`RANDOM}};
  stage3_regs_0_1_4 = _RAND_145[31:0];
  _RAND_146 = {1{`RANDOM}};
  stage3_regs_0_1_5 = _RAND_146[31:0];
  _RAND_147 = {1{`RANDOM}};
  stage3_regs_0_1_6 = _RAND_147[31:0];
  _RAND_148 = {1{`RANDOM}};
  stage3_regs_0_1_7 = _RAND_148[31:0];
  _RAND_149 = {1{`RANDOM}};
  stage3_regs_0_1_8 = _RAND_149[31:0];
  _RAND_150 = {1{`RANDOM}};
  stage3_regs_0_1_9 = _RAND_150[31:0];
  _RAND_151 = {1{`RANDOM}};
  stage3_regs_0_1_10 = _RAND_151[31:0];
  _RAND_152 = {1{`RANDOM}};
  stage3_regs_0_1_11 = _RAND_152[31:0];
  _RAND_153 = {1{`RANDOM}};
  stage3_regs_1_0_0 = _RAND_153[31:0];
  _RAND_154 = {1{`RANDOM}};
  stage3_regs_1_0_1 = _RAND_154[31:0];
  _RAND_155 = {1{`RANDOM}};
  stage3_regs_1_0_2 = _RAND_155[31:0];
  _RAND_156 = {1{`RANDOM}};
  stage3_regs_1_0_3 = _RAND_156[31:0];
  _RAND_157 = {1{`RANDOM}};
  stage3_regs_1_0_4 = _RAND_157[31:0];
  _RAND_158 = {1{`RANDOM}};
  stage3_regs_1_0_5 = _RAND_158[31:0];
  _RAND_159 = {1{`RANDOM}};
  stage3_regs_1_0_6 = _RAND_159[31:0];
  _RAND_160 = {1{`RANDOM}};
  stage3_regs_1_0_7 = _RAND_160[31:0];
  _RAND_161 = {1{`RANDOM}};
  stage3_regs_1_0_8 = _RAND_161[31:0];
  _RAND_162 = {1{`RANDOM}};
  stage3_regs_1_0_9 = _RAND_162[31:0];
  _RAND_163 = {1{`RANDOM}};
  stage3_regs_1_0_10 = _RAND_163[31:0];
  _RAND_164 = {1{`RANDOM}};
  stage3_regs_1_0_11 = _RAND_164[31:0];
  _RAND_165 = {1{`RANDOM}};
  stage3_regs_1_1_0 = _RAND_165[31:0];
  _RAND_166 = {1{`RANDOM}};
  stage3_regs_1_1_1 = _RAND_166[31:0];
  _RAND_167 = {1{`RANDOM}};
  stage3_regs_1_1_2 = _RAND_167[31:0];
  _RAND_168 = {1{`RANDOM}};
  stage3_regs_1_1_3 = _RAND_168[31:0];
  _RAND_169 = {1{`RANDOM}};
  stage3_regs_1_1_4 = _RAND_169[31:0];
  _RAND_170 = {1{`RANDOM}};
  stage3_regs_1_1_5 = _RAND_170[31:0];
  _RAND_171 = {1{`RANDOM}};
  stage3_regs_1_1_6 = _RAND_171[31:0];
  _RAND_172 = {1{`RANDOM}};
  stage3_regs_1_1_7 = _RAND_172[31:0];
  _RAND_173 = {1{`RANDOM}};
  stage3_regs_1_1_8 = _RAND_173[31:0];
  _RAND_174 = {1{`RANDOM}};
  stage3_regs_1_1_9 = _RAND_174[31:0];
  _RAND_175 = {1{`RANDOM}};
  stage3_regs_1_1_10 = _RAND_175[31:0];
  _RAND_176 = {1{`RANDOM}};
  stage3_regs_1_1_11 = _RAND_176[31:0];
  _RAND_177 = {1{`RANDOM}};
  stage3_regs_2_0_0 = _RAND_177[31:0];
  _RAND_178 = {1{`RANDOM}};
  stage3_regs_2_0_1 = _RAND_178[31:0];
  _RAND_179 = {1{`RANDOM}};
  stage3_regs_2_0_2 = _RAND_179[31:0];
  _RAND_180 = {1{`RANDOM}};
  stage3_regs_2_0_3 = _RAND_180[31:0];
  _RAND_181 = {1{`RANDOM}};
  stage3_regs_2_0_4 = _RAND_181[31:0];
  _RAND_182 = {1{`RANDOM}};
  stage3_regs_2_0_5 = _RAND_182[31:0];
  _RAND_183 = {1{`RANDOM}};
  stage3_regs_2_0_6 = _RAND_183[31:0];
  _RAND_184 = {1{`RANDOM}};
  stage3_regs_2_0_7 = _RAND_184[31:0];
  _RAND_185 = {1{`RANDOM}};
  stage3_regs_2_0_8 = _RAND_185[31:0];
  _RAND_186 = {1{`RANDOM}};
  stage3_regs_2_0_9 = _RAND_186[31:0];
  _RAND_187 = {1{`RANDOM}};
  stage3_regs_2_0_10 = _RAND_187[31:0];
  _RAND_188 = {1{`RANDOM}};
  stage3_regs_2_0_11 = _RAND_188[31:0];
  _RAND_189 = {1{`RANDOM}};
  stage3_regs_2_1_0 = _RAND_189[31:0];
  _RAND_190 = {1{`RANDOM}};
  stage3_regs_2_1_1 = _RAND_190[31:0];
  _RAND_191 = {1{`RANDOM}};
  stage3_regs_2_1_2 = _RAND_191[31:0];
  _RAND_192 = {1{`RANDOM}};
  stage3_regs_2_1_3 = _RAND_192[31:0];
  _RAND_193 = {1{`RANDOM}};
  stage3_regs_2_1_4 = _RAND_193[31:0];
  _RAND_194 = {1{`RANDOM}};
  stage3_regs_2_1_5 = _RAND_194[31:0];
  _RAND_195 = {1{`RANDOM}};
  stage3_regs_2_1_6 = _RAND_195[31:0];
  _RAND_196 = {1{`RANDOM}};
  stage3_regs_2_1_7 = _RAND_196[31:0];
  _RAND_197 = {1{`RANDOM}};
  stage3_regs_2_1_8 = _RAND_197[31:0];
  _RAND_198 = {1{`RANDOM}};
  stage3_regs_2_1_9 = _RAND_198[31:0];
  _RAND_199 = {1{`RANDOM}};
  stage3_regs_2_1_10 = _RAND_199[31:0];
  _RAND_200 = {1{`RANDOM}};
  stage3_regs_2_1_11 = _RAND_200[31:0];
  _RAND_201 = {1{`RANDOM}};
  stage4_regs_0_1_0 = _RAND_201[31:0];
  _RAND_202 = {1{`RANDOM}};
  stage4_regs_0_1_1 = _RAND_202[31:0];
  _RAND_203 = {1{`RANDOM}};
  stage4_regs_0_1_2 = _RAND_203[31:0];
  _RAND_204 = {1{`RANDOM}};
  stage4_regs_0_1_3 = _RAND_204[31:0];
  _RAND_205 = {1{`RANDOM}};
  stage4_regs_0_1_4 = _RAND_205[31:0];
  _RAND_206 = {1{`RANDOM}};
  stage4_regs_0_1_5 = _RAND_206[31:0];
  _RAND_207 = {1{`RANDOM}};
  stage4_regs_0_1_6 = _RAND_207[31:0];
  _RAND_208 = {1{`RANDOM}};
  stage4_regs_0_1_7 = _RAND_208[31:0];
  _RAND_209 = {1{`RANDOM}};
  stage4_regs_0_1_8 = _RAND_209[31:0];
  _RAND_210 = {1{`RANDOM}};
  stage4_regs_1_1_0 = _RAND_210[31:0];
  _RAND_211 = {1{`RANDOM}};
  stage4_regs_1_1_1 = _RAND_211[31:0];
  _RAND_212 = {1{`RANDOM}};
  stage4_regs_1_1_2 = _RAND_212[31:0];
  _RAND_213 = {1{`RANDOM}};
  stage4_regs_1_1_3 = _RAND_213[31:0];
  _RAND_214 = {1{`RANDOM}};
  stage4_regs_1_1_4 = _RAND_214[31:0];
  _RAND_215 = {1{`RANDOM}};
  stage4_regs_1_1_5 = _RAND_215[31:0];
  _RAND_216 = {1{`RANDOM}};
  stage4_regs_1_1_6 = _RAND_216[31:0];
  _RAND_217 = {1{`RANDOM}};
  stage4_regs_1_1_7 = _RAND_217[31:0];
  _RAND_218 = {1{`RANDOM}};
  stage4_regs_1_1_8 = _RAND_218[31:0];
  _RAND_219 = {1{`RANDOM}};
  stage4_regs_2_1_0 = _RAND_219[31:0];
  _RAND_220 = {1{`RANDOM}};
  stage4_regs_2_1_1 = _RAND_220[31:0];
  _RAND_221 = {1{`RANDOM}};
  stage4_regs_2_1_2 = _RAND_221[31:0];
  _RAND_222 = {1{`RANDOM}};
  stage4_regs_2_1_3 = _RAND_222[31:0];
  _RAND_223 = {1{`RANDOM}};
  stage4_regs_2_1_4 = _RAND_223[31:0];
  _RAND_224 = {1{`RANDOM}};
  stage4_regs_2_1_5 = _RAND_224[31:0];
  _RAND_225 = {1{`RANDOM}};
  stage4_regs_2_1_6 = _RAND_225[31:0];
  _RAND_226 = {1{`RANDOM}};
  stage4_regs_2_1_7 = _RAND_226[31:0];
  _RAND_227 = {1{`RANDOM}};
  stage4_regs_2_1_8 = _RAND_227[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module hqr5(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
  wire  FP_adder_13ccs_clock; // @[FloatingPointDesigns.scala 2510:23]
  wire  FP_adder_13ccs_reset; // @[FloatingPointDesigns.scala 2510:23]
  wire [31:0] FP_adder_13ccs_io_in_a; // @[FloatingPointDesigns.scala 2510:23]
  wire [31:0] FP_adder_13ccs_io_in_b; // @[FloatingPointDesigns.scala 2510:23]
  wire [31:0] FP_adder_13ccs_io_out_s; // @[FloatingPointDesigns.scala 2510:23]
  wire  FP_subtractor_13ccs_clock; // @[FloatingPointDesigns.scala 2511:28]
  wire  FP_subtractor_13ccs_reset; // @[FloatingPointDesigns.scala 2511:28]
  wire [31:0] FP_subtractor_13ccs_io_in_a; // @[FloatingPointDesigns.scala 2511:28]
  wire [31:0] FP_subtractor_13ccs_io_in_b; // @[FloatingPointDesigns.scala 2511:28]
  wire [31:0] FP_subtractor_13ccs_io_out_s; // @[FloatingPointDesigns.scala 2511:28]
  FP_adder_13ccs FP_adder_13ccs ( // @[FloatingPointDesigns.scala 2510:23]
    .clock(FP_adder_13ccs_clock),
    .reset(FP_adder_13ccs_reset),
    .io_in_a(FP_adder_13ccs_io_in_a),
    .io_in_b(FP_adder_13ccs_io_in_b),
    .io_out_s(FP_adder_13ccs_io_out_s)
  );
  FP_subtractor_13ccs FP_subtractor_13ccs ( // @[FloatingPointDesigns.scala 2511:28]
    .clock(FP_subtractor_13ccs_clock),
    .reset(FP_subtractor_13ccs_reset),
    .io_in_a(FP_subtractor_13ccs_io_in_a),
    .io_in_b(FP_subtractor_13ccs_io_in_b),
    .io_out_s(FP_subtractor_13ccs_io_out_s)
  );
  assign io_out_s = io_in_a[31] ? FP_subtractor_13ccs_io_out_s : FP_adder_13ccs_io_out_s; // @[FloatingPointDesigns.scala 2519:24 2520:14 2522:14]
  assign FP_adder_13ccs_clock = clock;
  assign FP_adder_13ccs_reset = reset;
  assign FP_adder_13ccs_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2513:16]
  assign FP_adder_13ccs_io_in_b = io_in_b; // @[FloatingPointDesigns.scala 2514:16]
  assign FP_subtractor_13ccs_clock = clock;
  assign FP_subtractor_13ccs_reset = reset;
  assign FP_subtractor_13ccs_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2516:21]
  assign FP_subtractor_13ccs_io_in_b = io_in_b; // @[FloatingPointDesigns.scala 2517:21]
endmodule
module FP_reciprocal_newfpu(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
`endif // RANDOMIZE_REG_INIT
  wire  FP_multiplier_10ccs_clock; // @[FloatingPointDesigns.scala 2005:65]
  wire  FP_multiplier_10ccs_reset; // @[FloatingPointDesigns.scala 2005:65]
  wire [31:0] FP_multiplier_10ccs_io_in_a; // @[FloatingPointDesigns.scala 2005:65]
  wire [31:0] FP_multiplier_10ccs_io_in_b; // @[FloatingPointDesigns.scala 2005:65]
  wire [31:0] FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 2005:65]
  wire  FP_multiplier_10ccs_1_clock; // @[FloatingPointDesigns.scala 2005:65]
  wire  FP_multiplier_10ccs_1_reset; // @[FloatingPointDesigns.scala 2005:65]
  wire [31:0] FP_multiplier_10ccs_1_io_in_a; // @[FloatingPointDesigns.scala 2005:65]
  wire [31:0] FP_multiplier_10ccs_1_io_in_b; // @[FloatingPointDesigns.scala 2005:65]
  wire [31:0] FP_multiplier_10ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2005:65]
  wire  FP_multiplier_10ccs_2_clock; // @[FloatingPointDesigns.scala 2005:65]
  wire  FP_multiplier_10ccs_2_reset; // @[FloatingPointDesigns.scala 2005:65]
  wire [31:0] FP_multiplier_10ccs_2_io_in_a; // @[FloatingPointDesigns.scala 2005:65]
  wire [31:0] FP_multiplier_10ccs_2_io_in_b; // @[FloatingPointDesigns.scala 2005:65]
  wire [31:0] FP_multiplier_10ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2005:65]
  wire  FP_subtractor_13ccs_clock; // @[FloatingPointDesigns.scala 2006:50]
  wire  FP_subtractor_13ccs_reset; // @[FloatingPointDesigns.scala 2006:50]
  wire [31:0] FP_subtractor_13ccs_io_in_a; // @[FloatingPointDesigns.scala 2006:50]
  wire [31:0] FP_subtractor_13ccs_io_in_b; // @[FloatingPointDesigns.scala 2006:50]
  wire [31:0] FP_subtractor_13ccs_io_out_s; // @[FloatingPointDesigns.scala 2006:50]
  wire  multiplier4_clock; // @[FloatingPointDesigns.scala 2085:29]
  wire  multiplier4_reset; // @[FloatingPointDesigns.scala 2085:29]
  wire [31:0] multiplier4_io_in_a; // @[FloatingPointDesigns.scala 2085:29]
  wire [31:0] multiplier4_io_in_b; // @[FloatingPointDesigns.scala 2085:29]
  wire [31:0] multiplier4_io_out_s; // @[FloatingPointDesigns.scala 2085:29]
  wire  FP_multiplier_10ccs_3_clock; // @[FloatingPointDesigns.scala 2097:69]
  wire  FP_multiplier_10ccs_3_reset; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_3_io_in_a; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_3_io_in_b; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_3_io_out_s; // @[FloatingPointDesigns.scala 2097:69]
  wire  FP_multiplier_10ccs_4_clock; // @[FloatingPointDesigns.scala 2097:69]
  wire  FP_multiplier_10ccs_4_reset; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_4_io_in_a; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_4_io_in_b; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_4_io_out_s; // @[FloatingPointDesigns.scala 2097:69]
  wire  FP_multiplier_10ccs_5_clock; // @[FloatingPointDesigns.scala 2097:69]
  wire  FP_multiplier_10ccs_5_reset; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_5_io_in_a; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_5_io_in_b; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_5_io_out_s; // @[FloatingPointDesigns.scala 2097:69]
  wire  FP_multiplier_10ccs_6_clock; // @[FloatingPointDesigns.scala 2097:69]
  wire  FP_multiplier_10ccs_6_reset; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_6_io_in_a; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_6_io_in_b; // @[FloatingPointDesigns.scala 2097:69]
  wire [31:0] FP_multiplier_10ccs_6_io_out_s; // @[FloatingPointDesigns.scala 2097:69]
  wire  FP_subtractor_13ccs_1_clock; // @[FloatingPointDesigns.scala 2098:54]
  wire  FP_subtractor_13ccs_1_reset; // @[FloatingPointDesigns.scala 2098:54]
  wire [31:0] FP_subtractor_13ccs_1_io_in_a; // @[FloatingPointDesigns.scala 2098:54]
  wire [31:0] FP_subtractor_13ccs_1_io_in_b; // @[FloatingPointDesigns.scala 2098:54]
  wire [31:0] FP_subtractor_13ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2098:54]
  wire  FP_subtractor_13ccs_2_clock; // @[FloatingPointDesigns.scala 2098:54]
  wire  FP_subtractor_13ccs_2_reset; // @[FloatingPointDesigns.scala 2098:54]
  wire [31:0] FP_subtractor_13ccs_2_io_in_a; // @[FloatingPointDesigns.scala 2098:54]
  wire [31:0] FP_subtractor_13ccs_2_io_in_b; // @[FloatingPointDesigns.scala 2098:54]
  wire [31:0] FP_subtractor_13ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2098:54]
  wire [30:0] _number_T_1 = {{1'd0}, io_in_a[30:1]}; // @[FloatingPointDesigns.scala 1990:36]
  wire [30:0] _GEN_0 = io_in_a[30:0] > 31'h7ef477d4 ? 31'h3f7a3bea : _number_T_1; // @[FloatingPointDesigns.scala 1987:46 1988:14 1990:14]
  wire [31:0] number = {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 1982:22]
  wire [31:0] result = 32'h5f3759df - number; // @[FloatingPointDesigns.scala 1997:25]
  reg [31:0] x_n_0; // @[FloatingPointDesigns.scala 1999:22]
  reg [31:0] x_n_1; // @[FloatingPointDesigns.scala 1999:22]
  reg [31:0] x_n_2; // @[FloatingPointDesigns.scala 1999:22]
  reg [31:0] a_2_0; // @[FloatingPointDesigns.scala 2000:22]
  reg [31:0] a_2_1; // @[FloatingPointDesigns.scala 2000:22]
  reg [31:0] a_2_2; // @[FloatingPointDesigns.scala 2000:22]
  reg [31:0] a_2_3; // @[FloatingPointDesigns.scala 2000:22]
  reg [31:0] stage1_regs_0_0_0; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_0_1; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_0_2; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_0_3; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_0_4; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_0_5; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_0_6; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_0_7; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_0_8; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_1_0; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_1_1; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_1_2; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_1_3; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_1_4; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_1_5; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_1_6; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_1_7; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage1_regs_0_1_8; // @[FloatingPointDesigns.scala 2001:30]
  reg [31:0] stage2_regs_0_0_0; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_0_1; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_0_2; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_0_3; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_0_4; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_0_5; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_0_6; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_0_7; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_0_8; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_1_0; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_1_1; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_1_2; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_1_3; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_1_4; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_1_5; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_1_6; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_1_7; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage2_regs_0_1_8; // @[FloatingPointDesigns.scala 2002:30]
  reg [31:0] stage3_regs_0_0_0; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_1; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_2; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_3; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_4; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_5; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_6; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_7; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_8; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_9; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_10; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_0_11; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_0; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_1; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_2; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_3; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_4; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_5; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_6; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_7; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_8; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_9; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_10; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage3_regs_0_1_11; // @[FloatingPointDesigns.scala 2003:30]
  reg [31:0] stage4_regs_0_1_0; // @[FloatingPointDesigns.scala 2004:30]
  reg [31:0] stage4_regs_0_1_1; // @[FloatingPointDesigns.scala 2004:30]
  reg [31:0] stage4_regs_0_1_2; // @[FloatingPointDesigns.scala 2004:30]
  reg [31:0] stage4_regs_0_1_3; // @[FloatingPointDesigns.scala 2004:30]
  reg [31:0] stage4_regs_0_1_4; // @[FloatingPointDesigns.scala 2004:30]
  reg [31:0] stage4_regs_0_1_5; // @[FloatingPointDesigns.scala 2004:30]
  reg [31:0] stage4_regs_0_1_6; // @[FloatingPointDesigns.scala 2004:30]
  reg [31:0] stage4_regs_0_1_7; // @[FloatingPointDesigns.scala 2004:30]
  reg [31:0] stage4_regs_0_1_8; // @[FloatingPointDesigns.scala 2004:30]
  wire [7:0] _a_2_0_T_3 = io_in_a[30:23] - 8'h1; // @[FloatingPointDesigns.scala 2030:75]
  wire [31:0] _a_2_0_T_6 = {io_in_a[31],_a_2_0_T_3,io_in_a[22:0]}; // @[FloatingPointDesigns.scala 2030:82]
  reg [31:0] a_2_isr_to_r; // @[FloatingPointDesigns.scala 2075:31]
  reg [31:0] transition_regs_0; // @[FloatingPointDesigns.scala 2076:34]
  reg [31:0] transition_regs_1; // @[FloatingPointDesigns.scala 2076:34]
  reg [31:0] transition_regs_2; // @[FloatingPointDesigns.scala 2076:34]
  reg [31:0] transition_regs_3; // @[FloatingPointDesigns.scala 2076:34]
  reg [31:0] transition_regs_4; // @[FloatingPointDesigns.scala 2076:34]
  reg [31:0] transition_regs_5; // @[FloatingPointDesigns.scala 2076:34]
  reg [31:0] transition_regs_6; // @[FloatingPointDesigns.scala 2076:34]
  reg [31:0] transition_regs_7; // @[FloatingPointDesigns.scala 2076:34]
  reg [31:0] transition_regs_8; // @[FloatingPointDesigns.scala 2076:34]
  wire [7:0] _a_2_isr_to_r_T_3 = stage4_regs_0_1_8[30:23] + 8'h1; // @[FloatingPointDesigns.scala 2078:115]
  wire [31:0] _a_2_isr_to_r_T_6 = {stage4_regs_0_1_8[31],_a_2_isr_to_r_T_3,stage4_regs_0_1_8[22:0]}; // @[FloatingPointDesigns.scala 2078:122]
  reg [31:0] x_n_r_0; // @[FloatingPointDesigns.scala 2092:24]
  reg [31:0] x_n_r_1; // @[FloatingPointDesigns.scala 2092:24]
  reg [31:0] x_n_r_3; // @[FloatingPointDesigns.scala 2092:24]
  reg [31:0] x_n_r_4; // @[FloatingPointDesigns.scala 2092:24]
  reg [31:0] a_2_r_0; // @[FloatingPointDesigns.scala 2093:24]
  reg [31:0] a_2_r_1; // @[FloatingPointDesigns.scala 2093:24]
  reg [31:0] a_2_r_2; // @[FloatingPointDesigns.scala 2093:24]
  reg [31:0] a_2_r_3; // @[FloatingPointDesigns.scala 2093:24]
  reg [31:0] a_2_r_4; // @[FloatingPointDesigns.scala 2093:24]
  reg [31:0] a_2_r_5; // @[FloatingPointDesigns.scala 2093:24]
  reg [31:0] stage1_regs_r_0_0_0; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_0_1; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_0_2; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_0_3; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_0_4; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_0_5; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_0_6; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_0_7; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_0_8; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_1_0; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_1_1; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_1_2; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_1_3; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_1_4; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_1_5; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_1_6; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_1_7; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_0_1_8; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_0_0; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_0_1; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_0_2; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_0_3; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_0_4; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_0_5; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_0_6; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_0_7; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_0_8; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_1_0; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_1_1; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_1_2; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_1_3; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_1_4; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_1_5; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_1_6; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_1_7; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage1_regs_r_1_1_8; // @[FloatingPointDesigns.scala 2094:32]
  reg [31:0] stage2_regs_r_0_0_0; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_1; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_2; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_3; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_4; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_5; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_6; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_7; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_8; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_9; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_10; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_0_11; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_0; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_1; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_2; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_3; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_4; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_5; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_6; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_7; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_8; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_9; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_10; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_0_1_11; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_0; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_1; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_2; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_3; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_4; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_5; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_6; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_7; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_8; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_9; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_10; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_0_11; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_0; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_1; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_2; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_3; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_4; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_5; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_6; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_7; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_8; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_9; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_10; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage2_regs_r_1_1_11; // @[FloatingPointDesigns.scala 2095:32]
  reg [31:0] stage3_regs_r_0_1_0; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_0_1_1; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_0_1_2; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_0_1_3; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_0_1_4; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_0_1_5; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_0_1_6; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_0_1_7; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_0_1_8; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_1_1_0; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_1_1_1; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_1_1_2; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_1_1_3; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_1_1_4; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_1_1_5; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_1_1_6; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_1_1_7; // @[FloatingPointDesigns.scala 2096:32]
  reg [31:0] stage3_regs_r_1_1_8; // @[FloatingPointDesigns.scala 2096:32]
  wire [31:0] _GEN_133 = multiplier4_io_out_s; // @[FloatingPointDesigns.scala 2092:24 2117:28 2118:28]
  wire [31:0] _GEN_189 = FP_multiplier_10ccs_4_io_out_s; // @[FloatingPointDesigns.scala 2092:24 2126:28 2127:28]
  FP_multiplier_10ccs FP_multiplier_10ccs ( // @[FloatingPointDesigns.scala 2005:65]
    .clock(FP_multiplier_10ccs_clock),
    .reset(FP_multiplier_10ccs_reset),
    .io_in_a(FP_multiplier_10ccs_io_in_a),
    .io_in_b(FP_multiplier_10ccs_io_in_b),
    .io_out_s(FP_multiplier_10ccs_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_1 ( // @[FloatingPointDesigns.scala 2005:65]
    .clock(FP_multiplier_10ccs_1_clock),
    .reset(FP_multiplier_10ccs_1_reset),
    .io_in_a(FP_multiplier_10ccs_1_io_in_a),
    .io_in_b(FP_multiplier_10ccs_1_io_in_b),
    .io_out_s(FP_multiplier_10ccs_1_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_2 ( // @[FloatingPointDesigns.scala 2005:65]
    .clock(FP_multiplier_10ccs_2_clock),
    .reset(FP_multiplier_10ccs_2_reset),
    .io_in_a(FP_multiplier_10ccs_2_io_in_a),
    .io_in_b(FP_multiplier_10ccs_2_io_in_b),
    .io_out_s(FP_multiplier_10ccs_2_io_out_s)
  );
  FP_subtractor_13ccs FP_subtractor_13ccs ( // @[FloatingPointDesigns.scala 2006:50]
    .clock(FP_subtractor_13ccs_clock),
    .reset(FP_subtractor_13ccs_reset),
    .io_in_a(FP_subtractor_13ccs_io_in_a),
    .io_in_b(FP_subtractor_13ccs_io_in_b),
    .io_out_s(FP_subtractor_13ccs_io_out_s)
  );
  FP_multiplier_10ccs multiplier4 ( // @[FloatingPointDesigns.scala 2085:29]
    .clock(multiplier4_clock),
    .reset(multiplier4_reset),
    .io_in_a(multiplier4_io_in_a),
    .io_in_b(multiplier4_io_in_b),
    .io_out_s(multiplier4_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_3 ( // @[FloatingPointDesigns.scala 2097:69]
    .clock(FP_multiplier_10ccs_3_clock),
    .reset(FP_multiplier_10ccs_3_reset),
    .io_in_a(FP_multiplier_10ccs_3_io_in_a),
    .io_in_b(FP_multiplier_10ccs_3_io_in_b),
    .io_out_s(FP_multiplier_10ccs_3_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_4 ( // @[FloatingPointDesigns.scala 2097:69]
    .clock(FP_multiplier_10ccs_4_clock),
    .reset(FP_multiplier_10ccs_4_reset),
    .io_in_a(FP_multiplier_10ccs_4_io_in_a),
    .io_in_b(FP_multiplier_10ccs_4_io_in_b),
    .io_out_s(FP_multiplier_10ccs_4_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_5 ( // @[FloatingPointDesigns.scala 2097:69]
    .clock(FP_multiplier_10ccs_5_clock),
    .reset(FP_multiplier_10ccs_5_reset),
    .io_in_a(FP_multiplier_10ccs_5_io_in_a),
    .io_in_b(FP_multiplier_10ccs_5_io_in_b),
    .io_out_s(FP_multiplier_10ccs_5_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_6 ( // @[FloatingPointDesigns.scala 2097:69]
    .clock(FP_multiplier_10ccs_6_clock),
    .reset(FP_multiplier_10ccs_6_reset),
    .io_in_a(FP_multiplier_10ccs_6_io_in_a),
    .io_in_b(FP_multiplier_10ccs_6_io_in_b),
    .io_out_s(FP_multiplier_10ccs_6_io_out_s)
  );
  FP_subtractor_13ccs FP_subtractor_13ccs_1 ( // @[FloatingPointDesigns.scala 2098:54]
    .clock(FP_subtractor_13ccs_1_clock),
    .reset(FP_subtractor_13ccs_1_reset),
    .io_in_a(FP_subtractor_13ccs_1_io_in_a),
    .io_in_b(FP_subtractor_13ccs_1_io_in_b),
    .io_out_s(FP_subtractor_13ccs_1_io_out_s)
  );
  FP_subtractor_13ccs FP_subtractor_13ccs_2 ( // @[FloatingPointDesigns.scala 2098:54]
    .clock(FP_subtractor_13ccs_2_clock),
    .reset(FP_subtractor_13ccs_2_reset),
    .io_in_a(FP_subtractor_13ccs_2_io_in_a),
    .io_in_b(FP_subtractor_13ccs_2_io_in_b),
    .io_out_s(FP_subtractor_13ccs_2_io_out_s)
  );
  assign io_out_s = {stage3_regs_r_1_1_8[31],FP_multiplier_10ccs_6_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 2154:58]
  assign FP_multiplier_10ccs_clock = clock;
  assign FP_multiplier_10ccs_reset = reset;
  assign FP_multiplier_10ccs_io_in_a = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 2034:48]
  assign FP_multiplier_10ccs_io_in_b = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 2035:48]
  assign FP_multiplier_10ccs_1_clock = clock;
  assign FP_multiplier_10ccs_1_reset = reset;
  assign FP_multiplier_10ccs_1_io_in_a = FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 2047:34]
  assign FP_multiplier_10ccs_1_io_in_b = {1'h0,stage1_regs_0_1_8[30:0]}; // @[FloatingPointDesigns.scala 2048:46]
  assign FP_multiplier_10ccs_2_clock = clock;
  assign FP_multiplier_10ccs_2_reset = reset;
  assign FP_multiplier_10ccs_2_io_in_a = {1'h0,stage3_regs_0_0_11[30:0]}; // @[FloatingPointDesigns.scala 2065:46]
  assign FP_multiplier_10ccs_2_io_in_b = FP_subtractor_13ccs_io_out_s; // @[FloatingPointDesigns.scala 2066:34]
  assign FP_subtractor_13ccs_clock = clock;
  assign FP_subtractor_13ccs_reset = reset;
  assign FP_subtractor_13ccs_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 1983:26 1984:16]
  assign FP_subtractor_13ccs_io_in_b = FP_multiplier_10ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2057:31]
  assign multiplier4_clock = clock;
  assign multiplier4_reset = reset;
  assign multiplier4_io_in_a = {1'h0,FP_multiplier_10ccs_2_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 2087:37]
  assign multiplier4_io_in_b = {1'h0,FP_multiplier_10ccs_2_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 2088:37]
  assign FP_multiplier_10ccs_3_clock = clock;
  assign FP_multiplier_10ccs_3_reset = reset;
  assign FP_multiplier_10ccs_3_io_in_a = {1'h0,multiplier4_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 2123:50]
  assign FP_multiplier_10ccs_3_io_in_b = {1'h0,transition_regs_8[30:0]}; // @[FloatingPointDesigns.scala 2124:50]
  assign FP_multiplier_10ccs_4_clock = clock;
  assign FP_multiplier_10ccs_4_reset = reset;
  assign FP_multiplier_10ccs_4_io_in_a = {1'h0,stage2_regs_r_0_0_11[30:0]}; // @[FloatingPointDesigns.scala 2145:48]
  assign FP_multiplier_10ccs_4_io_in_b = FP_subtractor_13ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2146:36]
  assign FP_multiplier_10ccs_5_clock = clock;
  assign FP_multiplier_10ccs_5_reset = reset;
  assign FP_multiplier_10ccs_5_io_in_a = {1'h0,FP_multiplier_10ccs_4_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 2132:50]
  assign FP_multiplier_10ccs_5_io_in_b = {1'h0,stage3_regs_r_0_1_8[30:0]}; // @[FloatingPointDesigns.scala 2133:50]
  assign FP_multiplier_10ccs_6_clock = clock;
  assign FP_multiplier_10ccs_6_reset = reset;
  assign FP_multiplier_10ccs_6_io_in_a = {1'h0,stage2_regs_r_1_0_11[30:0]}; // @[FloatingPointDesigns.scala 2145:48]
  assign FP_multiplier_10ccs_6_io_in_b = FP_subtractor_13ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2146:36]
  assign FP_subtractor_13ccs_1_clock = clock;
  assign FP_subtractor_13ccs_1_reset = reset;
  assign FP_subtractor_13ccs_1_io_in_a = 32'h40000000; // @[FloatingPointDesigns.scala 1985:19 1986:9]
  assign FP_subtractor_13ccs_1_io_in_b = FP_multiplier_10ccs_3_io_out_s; // @[FloatingPointDesigns.scala 2137:33]
  assign FP_subtractor_13ccs_2_clock = clock;
  assign FP_subtractor_13ccs_2_reset = reset;
  assign FP_subtractor_13ccs_2_io_in_a = 32'h40000000; // @[FloatingPointDesigns.scala 1985:19 1986:9]
  assign FP_subtractor_13ccs_2_io_in_b = FP_multiplier_10ccs_5_io_out_s; // @[FloatingPointDesigns.scala 2137:33]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 1999:22]
      x_n_0 <= 32'h0; // @[FloatingPointDesigns.scala 1999:22]
    end else begin
      x_n_0 <= result;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1999:22]
      x_n_1 <= 32'h0; // @[FloatingPointDesigns.scala 1999:22]
    end else begin
      x_n_1 <= stage1_regs_0_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1999:22]
      x_n_2 <= 32'h0; // @[FloatingPointDesigns.scala 1999:22]
    end else begin
      x_n_2 <= stage2_regs_0_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2000:22]
      a_2_0 <= 32'h0; // @[FloatingPointDesigns.scala 2000:22]
    end else begin
      a_2_0 <= _a_2_0_T_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2000:22]
      a_2_1 <= 32'h0; // @[FloatingPointDesigns.scala 2000:22]
    end else begin
      a_2_1 <= stage1_regs_0_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2000:22]
      a_2_2 <= 32'h0; // @[FloatingPointDesigns.scala 2000:22]
    end else begin
      a_2_2 <= stage2_regs_0_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2000:22]
      a_2_3 <= 32'h0; // @[FloatingPointDesigns.scala 2000:22]
    end else begin
      a_2_3 <= stage3_regs_0_1_11;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_0_0 <= x_n_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_0_1 <= stage1_regs_0_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_0_2 <= stage1_regs_0_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_0_3 <= stage1_regs_0_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_0_4 <= stage1_regs_0_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_0_5 <= stage1_regs_0_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_0_6 <= stage1_regs_0_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_0_7 <= stage1_regs_0_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_0_8 <= stage1_regs_0_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_1_0 <= a_2_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_1_1 <= stage1_regs_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_1_2 <= stage1_regs_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_1_3 <= stage1_regs_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_1_4 <= stage1_regs_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_1_5 <= stage1_regs_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_1_6 <= stage1_regs_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_1_7 <= stage1_regs_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2001:30]
      stage1_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 2001:30]
    end else begin
      stage1_regs_0_1_8 <= stage1_regs_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_0_0 <= x_n_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_0_1 <= stage2_regs_0_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_0_2 <= stage2_regs_0_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_0_3 <= stage2_regs_0_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_0_4 <= stage2_regs_0_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_0_5 <= stage2_regs_0_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_0_6 <= stage2_regs_0_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_0_7 <= stage2_regs_0_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_0_8 <= stage2_regs_0_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_1_0 <= a_2_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_1_1 <= stage2_regs_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_1_2 <= stage2_regs_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_1_3 <= stage2_regs_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_1_4 <= stage2_regs_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_1_5 <= stage2_regs_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_1_6 <= stage2_regs_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_1_7 <= stage2_regs_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2002:30]
      stage2_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 2002:30]
    end else begin
      stage2_regs_0_1_8 <= stage2_regs_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_0 <= x_n_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_1 <= stage3_regs_0_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_2 <= stage3_regs_0_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_3 <= stage3_regs_0_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_4 <= stage3_regs_0_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_5 <= stage3_regs_0_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_6 <= stage3_regs_0_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_7 <= stage3_regs_0_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_8 <= stage3_regs_0_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_9 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_9 <= stage3_regs_0_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_10 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_10 <= stage3_regs_0_0_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_0_11 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_0_11 <= stage3_regs_0_0_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_0 <= a_2_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_1 <= stage3_regs_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_2 <= stage3_regs_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_3 <= stage3_regs_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_4 <= stage3_regs_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_5 <= stage3_regs_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_6 <= stage3_regs_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_7 <= stage3_regs_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_8 <= stage3_regs_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_9 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_9 <= stage3_regs_0_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_10 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_10 <= stage3_regs_0_1_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2003:30]
      stage3_regs_0_1_11 <= 32'h0; // @[FloatingPointDesigns.scala 2003:30]
    end else begin
      stage3_regs_0_1_11 <= stage3_regs_0_1_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2004:30]
      stage4_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 2004:30]
    end else begin
      stage4_regs_0_1_0 <= a_2_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2004:30]
      stage4_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 2004:30]
    end else begin
      stage4_regs_0_1_1 <= stage4_regs_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2004:30]
      stage4_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 2004:30]
    end else begin
      stage4_regs_0_1_2 <= stage4_regs_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2004:30]
      stage4_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 2004:30]
    end else begin
      stage4_regs_0_1_3 <= stage4_regs_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2004:30]
      stage4_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 2004:30]
    end else begin
      stage4_regs_0_1_4 <= stage4_regs_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2004:30]
      stage4_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 2004:30]
    end else begin
      stage4_regs_0_1_5 <= stage4_regs_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2004:30]
      stage4_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 2004:30]
    end else begin
      stage4_regs_0_1_6 <= stage4_regs_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2004:30]
      stage4_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 2004:30]
    end else begin
      stage4_regs_0_1_7 <= stage4_regs_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2004:30]
      stage4_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 2004:30]
    end else begin
      stage4_regs_0_1_8 <= stage4_regs_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2075:31]
      a_2_isr_to_r <= 32'h0; // @[FloatingPointDesigns.scala 2075:31]
    end else begin
      a_2_isr_to_r <= _a_2_isr_to_r_T_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2076:34]
      transition_regs_0 <= 32'h0; // @[FloatingPointDesigns.scala 2076:34]
    end else begin
      transition_regs_0 <= a_2_isr_to_r;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2076:34]
      transition_regs_1 <= 32'h0; // @[FloatingPointDesigns.scala 2076:34]
    end else begin
      transition_regs_1 <= transition_regs_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2076:34]
      transition_regs_2 <= 32'h0; // @[FloatingPointDesigns.scala 2076:34]
    end else begin
      transition_regs_2 <= transition_regs_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2076:34]
      transition_regs_3 <= 32'h0; // @[FloatingPointDesigns.scala 2076:34]
    end else begin
      transition_regs_3 <= transition_regs_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2076:34]
      transition_regs_4 <= 32'h0; // @[FloatingPointDesigns.scala 2076:34]
    end else begin
      transition_regs_4 <= transition_regs_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2076:34]
      transition_regs_5 <= 32'h0; // @[FloatingPointDesigns.scala 2076:34]
    end else begin
      transition_regs_5 <= transition_regs_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2076:34]
      transition_regs_6 <= 32'h0; // @[FloatingPointDesigns.scala 2076:34]
    end else begin
      transition_regs_6 <= transition_regs_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2076:34]
      transition_regs_7 <= 32'h0; // @[FloatingPointDesigns.scala 2076:34]
    end else begin
      transition_regs_7 <= transition_regs_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2076:34]
      transition_regs_8 <= 32'h0; // @[FloatingPointDesigns.scala 2076:34]
    end else begin
      transition_regs_8 <= transition_regs_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2092:24]
      x_n_r_0 <= 32'h0; // @[FloatingPointDesigns.scala 2092:24]
    end else begin
      x_n_r_0 <= _GEN_133;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2092:24]
      x_n_r_1 <= 32'h0; // @[FloatingPointDesigns.scala 2092:24]
    end else begin
      x_n_r_1 <= stage1_regs_r_0_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2092:24]
      x_n_r_3 <= 32'h0; // @[FloatingPointDesigns.scala 2092:24]
    end else begin
      x_n_r_3 <= _GEN_189;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2092:24]
      x_n_r_4 <= 32'h0; // @[FloatingPointDesigns.scala 2092:24]
    end else begin
      x_n_r_4 <= stage1_regs_r_1_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2093:24]
      a_2_r_0 <= 32'h0; // @[FloatingPointDesigns.scala 2093:24]
    end else begin
      a_2_r_0 <= transition_regs_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2093:24]
      a_2_r_1 <= 32'h0; // @[FloatingPointDesigns.scala 2093:24]
    end else begin
      a_2_r_1 <= stage1_regs_r_0_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2093:24]
      a_2_r_2 <= 32'h0; // @[FloatingPointDesigns.scala 2093:24]
    end else begin
      a_2_r_2 <= stage2_regs_r_0_1_11;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2093:24]
      a_2_r_3 <= 32'h0; // @[FloatingPointDesigns.scala 2093:24]
    end else begin
      a_2_r_3 <= stage3_regs_r_0_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2093:24]
      a_2_r_4 <= 32'h0; // @[FloatingPointDesigns.scala 2093:24]
    end else begin
      a_2_r_4 <= stage1_regs_r_1_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2093:24]
      a_2_r_5 <= 32'h0; // @[FloatingPointDesigns.scala 2093:24]
    end else begin
      a_2_r_5 <= stage2_regs_r_1_1_11;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_0_0 <= x_n_r_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_0_1 <= stage1_regs_r_0_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_0_2 <= stage1_regs_r_0_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_0_3 <= stage1_regs_r_0_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_0_4 <= stage1_regs_r_0_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_0_5 <= stage1_regs_r_0_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_0_6 <= stage1_regs_r_0_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_0_7 <= stage1_regs_r_0_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_0_8 <= stage1_regs_r_0_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_1_0 <= a_2_r_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_1_1 <= stage1_regs_r_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_1_2 <= stage1_regs_r_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_1_3 <= stage1_regs_r_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_1_4 <= stage1_regs_r_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_1_5 <= stage1_regs_r_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_1_6 <= stage1_regs_r_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_1_7 <= stage1_regs_r_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_0_1_8 <= stage1_regs_r_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_0_0 <= x_n_r_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_0_1 <= stage1_regs_r_1_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_0_2 <= stage1_regs_r_1_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_0_3 <= stage1_regs_r_1_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_0_4 <= stage1_regs_r_1_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_0_5 <= stage1_regs_r_1_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_0_6 <= stage1_regs_r_1_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_0_7 <= stage1_regs_r_1_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_0_8 <= stage1_regs_r_1_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_1_0 <= a_2_r_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_1_1 <= stage1_regs_r_1_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_1_2 <= stage1_regs_r_1_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_1_3 <= stage1_regs_r_1_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_1_4 <= stage1_regs_r_1_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_1_5 <= stage1_regs_r_1_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_1_6 <= stage1_regs_r_1_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_1_7 <= stage1_regs_r_1_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2094:32]
      stage1_regs_r_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 2094:32]
    end else begin
      stage1_regs_r_1_1_8 <= stage1_regs_r_1_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_0 <= x_n_r_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_1 <= stage2_regs_r_0_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_2 <= stage2_regs_r_0_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_3 <= stage2_regs_r_0_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_4 <= stage2_regs_r_0_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_5 <= stage2_regs_r_0_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_6 <= stage2_regs_r_0_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_7 <= stage2_regs_r_0_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_8 <= stage2_regs_r_0_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_9 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_9 <= stage2_regs_r_0_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_10 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_10 <= stage2_regs_r_0_0_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_0_11 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_0_11 <= stage2_regs_r_0_0_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_0 <= a_2_r_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_1 <= stage2_regs_r_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_2 <= stage2_regs_r_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_3 <= stage2_regs_r_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_4 <= stage2_regs_r_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_5 <= stage2_regs_r_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_6 <= stage2_regs_r_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_7 <= stage2_regs_r_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_8 <= stage2_regs_r_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_9 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_9 <= stage2_regs_r_0_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_10 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_10 <= stage2_regs_r_0_1_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_0_1_11 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_0_1_11 <= stage2_regs_r_0_1_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_0 <= x_n_r_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_1 <= stage2_regs_r_1_0_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_2 <= stage2_regs_r_1_0_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_3 <= stage2_regs_r_1_0_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_4 <= stage2_regs_r_1_0_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_5 <= stage2_regs_r_1_0_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_6 <= stage2_regs_r_1_0_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_7 <= stage2_regs_r_1_0_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_8 <= stage2_regs_r_1_0_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_9 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_9 <= stage2_regs_r_1_0_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_10 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_10 <= stage2_regs_r_1_0_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_0_11 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_0_11 <= stage2_regs_r_1_0_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_0 <= a_2_r_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_1 <= stage2_regs_r_1_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_2 <= stage2_regs_r_1_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_3 <= stage2_regs_r_1_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_4 <= stage2_regs_r_1_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_5 <= stage2_regs_r_1_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_6 <= stage2_regs_r_1_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_7 <= stage2_regs_r_1_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_8 <= stage2_regs_r_1_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_9 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_9 <= stage2_regs_r_1_1_8;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_10 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_10 <= stage2_regs_r_1_1_9;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2095:32]
      stage2_regs_r_1_1_11 <= 32'h0; // @[FloatingPointDesigns.scala 2095:32]
    end else begin
      stage2_regs_r_1_1_11 <= stage2_regs_r_1_1_10;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_0_1_0 <= a_2_r_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_0_1_1 <= stage3_regs_r_0_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_0_1_2 <= stage3_regs_r_0_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_0_1_3 <= stage3_regs_r_0_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_0_1_4 <= stage3_regs_r_0_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_0_1_5 <= stage3_regs_r_0_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_0_1_6 <= stage3_regs_r_0_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_0_1_7 <= stage3_regs_r_0_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_0_1_8 <= stage3_regs_r_0_1_7;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_1_1_0 <= a_2_r_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_1_1_1 <= stage3_regs_r_1_1_0;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_1_1_2 <= stage3_regs_r_1_1_1;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_1_1_3 <= stage3_regs_r_1_1_2;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_1_1_4 <= stage3_regs_r_1_1_3;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_1_1_5 <= stage3_regs_r_1_1_4;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_1_1_6 <= stage3_regs_r_1_1_5;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_1_1_7 <= stage3_regs_r_1_1_6;
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2096:32]
      stage3_regs_r_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 2096:32]
    end else begin
      stage3_regs_r_1_1_8 <= stage3_regs_r_1_1_7;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  x_n_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  x_n_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  x_n_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  a_2_0 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  a_2_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  a_2_2 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  a_2_3 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  stage1_regs_0_0_0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  stage1_regs_0_0_1 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  stage1_regs_0_0_2 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stage1_regs_0_0_3 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  stage1_regs_0_0_4 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  stage1_regs_0_0_5 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  stage1_regs_0_0_6 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stage1_regs_0_0_7 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  stage1_regs_0_0_8 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  stage1_regs_0_1_0 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  stage1_regs_0_1_1 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  stage1_regs_0_1_2 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  stage1_regs_0_1_3 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  stage1_regs_0_1_4 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  stage1_regs_0_1_5 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  stage1_regs_0_1_6 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  stage1_regs_0_1_7 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  stage1_regs_0_1_8 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  stage2_regs_0_0_0 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  stage2_regs_0_0_1 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  stage2_regs_0_0_2 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  stage2_regs_0_0_3 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  stage2_regs_0_0_4 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  stage2_regs_0_0_5 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  stage2_regs_0_0_6 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  stage2_regs_0_0_7 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  stage2_regs_0_0_8 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  stage2_regs_0_1_0 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  stage2_regs_0_1_1 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  stage2_regs_0_1_2 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  stage2_regs_0_1_3 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  stage2_regs_0_1_4 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  stage2_regs_0_1_5 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  stage2_regs_0_1_6 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  stage2_regs_0_1_7 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  stage2_regs_0_1_8 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  stage3_regs_0_0_0 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  stage3_regs_0_0_1 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  stage3_regs_0_0_2 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  stage3_regs_0_0_3 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  stage3_regs_0_0_4 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  stage3_regs_0_0_5 = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  stage3_regs_0_0_6 = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  stage3_regs_0_0_7 = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  stage3_regs_0_0_8 = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  stage3_regs_0_0_9 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  stage3_regs_0_0_10 = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  stage3_regs_0_0_11 = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  stage3_regs_0_1_0 = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  stage3_regs_0_1_1 = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  stage3_regs_0_1_2 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  stage3_regs_0_1_3 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  stage3_regs_0_1_4 = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  stage3_regs_0_1_5 = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  stage3_regs_0_1_6 = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  stage3_regs_0_1_7 = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  stage3_regs_0_1_8 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  stage3_regs_0_1_9 = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  stage3_regs_0_1_10 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  stage3_regs_0_1_11 = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  stage4_regs_0_1_0 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  stage4_regs_0_1_1 = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  stage4_regs_0_1_2 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  stage4_regs_0_1_3 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  stage4_regs_0_1_4 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  stage4_regs_0_1_5 = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  stage4_regs_0_1_6 = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  stage4_regs_0_1_7 = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  stage4_regs_0_1_8 = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  a_2_isr_to_r = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  transition_regs_0 = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  transition_regs_1 = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  transition_regs_2 = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  transition_regs_3 = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  transition_regs_4 = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  transition_regs_5 = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  transition_regs_6 = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  transition_regs_7 = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  transition_regs_8 = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  x_n_r_0 = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  x_n_r_1 = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  x_n_r_3 = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  x_n_r_4 = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  a_2_r_0 = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  a_2_r_1 = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  a_2_r_2 = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  a_2_r_3 = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  a_2_r_4 = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  a_2_r_5 = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  stage1_regs_r_0_0_0 = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  stage1_regs_r_0_0_1 = _RAND_97[31:0];
  _RAND_98 = {1{`RANDOM}};
  stage1_regs_r_0_0_2 = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  stage1_regs_r_0_0_3 = _RAND_99[31:0];
  _RAND_100 = {1{`RANDOM}};
  stage1_regs_r_0_0_4 = _RAND_100[31:0];
  _RAND_101 = {1{`RANDOM}};
  stage1_regs_r_0_0_5 = _RAND_101[31:0];
  _RAND_102 = {1{`RANDOM}};
  stage1_regs_r_0_0_6 = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  stage1_regs_r_0_0_7 = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  stage1_regs_r_0_0_8 = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  stage1_regs_r_0_1_0 = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  stage1_regs_r_0_1_1 = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  stage1_regs_r_0_1_2 = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  stage1_regs_r_0_1_3 = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  stage1_regs_r_0_1_4 = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  stage1_regs_r_0_1_5 = _RAND_110[31:0];
  _RAND_111 = {1{`RANDOM}};
  stage1_regs_r_0_1_6 = _RAND_111[31:0];
  _RAND_112 = {1{`RANDOM}};
  stage1_regs_r_0_1_7 = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  stage1_regs_r_0_1_8 = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  stage1_regs_r_1_0_0 = _RAND_114[31:0];
  _RAND_115 = {1{`RANDOM}};
  stage1_regs_r_1_0_1 = _RAND_115[31:0];
  _RAND_116 = {1{`RANDOM}};
  stage1_regs_r_1_0_2 = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  stage1_regs_r_1_0_3 = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  stage1_regs_r_1_0_4 = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  stage1_regs_r_1_0_5 = _RAND_119[31:0];
  _RAND_120 = {1{`RANDOM}};
  stage1_regs_r_1_0_6 = _RAND_120[31:0];
  _RAND_121 = {1{`RANDOM}};
  stage1_regs_r_1_0_7 = _RAND_121[31:0];
  _RAND_122 = {1{`RANDOM}};
  stage1_regs_r_1_0_8 = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  stage1_regs_r_1_1_0 = _RAND_123[31:0];
  _RAND_124 = {1{`RANDOM}};
  stage1_regs_r_1_1_1 = _RAND_124[31:0];
  _RAND_125 = {1{`RANDOM}};
  stage1_regs_r_1_1_2 = _RAND_125[31:0];
  _RAND_126 = {1{`RANDOM}};
  stage1_regs_r_1_1_3 = _RAND_126[31:0];
  _RAND_127 = {1{`RANDOM}};
  stage1_regs_r_1_1_4 = _RAND_127[31:0];
  _RAND_128 = {1{`RANDOM}};
  stage1_regs_r_1_1_5 = _RAND_128[31:0];
  _RAND_129 = {1{`RANDOM}};
  stage1_regs_r_1_1_6 = _RAND_129[31:0];
  _RAND_130 = {1{`RANDOM}};
  stage1_regs_r_1_1_7 = _RAND_130[31:0];
  _RAND_131 = {1{`RANDOM}};
  stage1_regs_r_1_1_8 = _RAND_131[31:0];
  _RAND_132 = {1{`RANDOM}};
  stage2_regs_r_0_0_0 = _RAND_132[31:0];
  _RAND_133 = {1{`RANDOM}};
  stage2_regs_r_0_0_1 = _RAND_133[31:0];
  _RAND_134 = {1{`RANDOM}};
  stage2_regs_r_0_0_2 = _RAND_134[31:0];
  _RAND_135 = {1{`RANDOM}};
  stage2_regs_r_0_0_3 = _RAND_135[31:0];
  _RAND_136 = {1{`RANDOM}};
  stage2_regs_r_0_0_4 = _RAND_136[31:0];
  _RAND_137 = {1{`RANDOM}};
  stage2_regs_r_0_0_5 = _RAND_137[31:0];
  _RAND_138 = {1{`RANDOM}};
  stage2_regs_r_0_0_6 = _RAND_138[31:0];
  _RAND_139 = {1{`RANDOM}};
  stage2_regs_r_0_0_7 = _RAND_139[31:0];
  _RAND_140 = {1{`RANDOM}};
  stage2_regs_r_0_0_8 = _RAND_140[31:0];
  _RAND_141 = {1{`RANDOM}};
  stage2_regs_r_0_0_9 = _RAND_141[31:0];
  _RAND_142 = {1{`RANDOM}};
  stage2_regs_r_0_0_10 = _RAND_142[31:0];
  _RAND_143 = {1{`RANDOM}};
  stage2_regs_r_0_0_11 = _RAND_143[31:0];
  _RAND_144 = {1{`RANDOM}};
  stage2_regs_r_0_1_0 = _RAND_144[31:0];
  _RAND_145 = {1{`RANDOM}};
  stage2_regs_r_0_1_1 = _RAND_145[31:0];
  _RAND_146 = {1{`RANDOM}};
  stage2_regs_r_0_1_2 = _RAND_146[31:0];
  _RAND_147 = {1{`RANDOM}};
  stage2_regs_r_0_1_3 = _RAND_147[31:0];
  _RAND_148 = {1{`RANDOM}};
  stage2_regs_r_0_1_4 = _RAND_148[31:0];
  _RAND_149 = {1{`RANDOM}};
  stage2_regs_r_0_1_5 = _RAND_149[31:0];
  _RAND_150 = {1{`RANDOM}};
  stage2_regs_r_0_1_6 = _RAND_150[31:0];
  _RAND_151 = {1{`RANDOM}};
  stage2_regs_r_0_1_7 = _RAND_151[31:0];
  _RAND_152 = {1{`RANDOM}};
  stage2_regs_r_0_1_8 = _RAND_152[31:0];
  _RAND_153 = {1{`RANDOM}};
  stage2_regs_r_0_1_9 = _RAND_153[31:0];
  _RAND_154 = {1{`RANDOM}};
  stage2_regs_r_0_1_10 = _RAND_154[31:0];
  _RAND_155 = {1{`RANDOM}};
  stage2_regs_r_0_1_11 = _RAND_155[31:0];
  _RAND_156 = {1{`RANDOM}};
  stage2_regs_r_1_0_0 = _RAND_156[31:0];
  _RAND_157 = {1{`RANDOM}};
  stage2_regs_r_1_0_1 = _RAND_157[31:0];
  _RAND_158 = {1{`RANDOM}};
  stage2_regs_r_1_0_2 = _RAND_158[31:0];
  _RAND_159 = {1{`RANDOM}};
  stage2_regs_r_1_0_3 = _RAND_159[31:0];
  _RAND_160 = {1{`RANDOM}};
  stage2_regs_r_1_0_4 = _RAND_160[31:0];
  _RAND_161 = {1{`RANDOM}};
  stage2_regs_r_1_0_5 = _RAND_161[31:0];
  _RAND_162 = {1{`RANDOM}};
  stage2_regs_r_1_0_6 = _RAND_162[31:0];
  _RAND_163 = {1{`RANDOM}};
  stage2_regs_r_1_0_7 = _RAND_163[31:0];
  _RAND_164 = {1{`RANDOM}};
  stage2_regs_r_1_0_8 = _RAND_164[31:0];
  _RAND_165 = {1{`RANDOM}};
  stage2_regs_r_1_0_9 = _RAND_165[31:0];
  _RAND_166 = {1{`RANDOM}};
  stage2_regs_r_1_0_10 = _RAND_166[31:0];
  _RAND_167 = {1{`RANDOM}};
  stage2_regs_r_1_0_11 = _RAND_167[31:0];
  _RAND_168 = {1{`RANDOM}};
  stage2_regs_r_1_1_0 = _RAND_168[31:0];
  _RAND_169 = {1{`RANDOM}};
  stage2_regs_r_1_1_1 = _RAND_169[31:0];
  _RAND_170 = {1{`RANDOM}};
  stage2_regs_r_1_1_2 = _RAND_170[31:0];
  _RAND_171 = {1{`RANDOM}};
  stage2_regs_r_1_1_3 = _RAND_171[31:0];
  _RAND_172 = {1{`RANDOM}};
  stage2_regs_r_1_1_4 = _RAND_172[31:0];
  _RAND_173 = {1{`RANDOM}};
  stage2_regs_r_1_1_5 = _RAND_173[31:0];
  _RAND_174 = {1{`RANDOM}};
  stage2_regs_r_1_1_6 = _RAND_174[31:0];
  _RAND_175 = {1{`RANDOM}};
  stage2_regs_r_1_1_7 = _RAND_175[31:0];
  _RAND_176 = {1{`RANDOM}};
  stage2_regs_r_1_1_8 = _RAND_176[31:0];
  _RAND_177 = {1{`RANDOM}};
  stage2_regs_r_1_1_9 = _RAND_177[31:0];
  _RAND_178 = {1{`RANDOM}};
  stage2_regs_r_1_1_10 = _RAND_178[31:0];
  _RAND_179 = {1{`RANDOM}};
  stage2_regs_r_1_1_11 = _RAND_179[31:0];
  _RAND_180 = {1{`RANDOM}};
  stage3_regs_r_0_1_0 = _RAND_180[31:0];
  _RAND_181 = {1{`RANDOM}};
  stage3_regs_r_0_1_1 = _RAND_181[31:0];
  _RAND_182 = {1{`RANDOM}};
  stage3_regs_r_0_1_2 = _RAND_182[31:0];
  _RAND_183 = {1{`RANDOM}};
  stage3_regs_r_0_1_3 = _RAND_183[31:0];
  _RAND_184 = {1{`RANDOM}};
  stage3_regs_r_0_1_4 = _RAND_184[31:0];
  _RAND_185 = {1{`RANDOM}};
  stage3_regs_r_0_1_5 = _RAND_185[31:0];
  _RAND_186 = {1{`RANDOM}};
  stage3_regs_r_0_1_6 = _RAND_186[31:0];
  _RAND_187 = {1{`RANDOM}};
  stage3_regs_r_0_1_7 = _RAND_187[31:0];
  _RAND_188 = {1{`RANDOM}};
  stage3_regs_r_0_1_8 = _RAND_188[31:0];
  _RAND_189 = {1{`RANDOM}};
  stage3_regs_r_1_1_0 = _RAND_189[31:0];
  _RAND_190 = {1{`RANDOM}};
  stage3_regs_r_1_1_1 = _RAND_190[31:0];
  _RAND_191 = {1{`RANDOM}};
  stage3_regs_r_1_1_2 = _RAND_191[31:0];
  _RAND_192 = {1{`RANDOM}};
  stage3_regs_r_1_1_3 = _RAND_192[31:0];
  _RAND_193 = {1{`RANDOM}};
  stage3_regs_r_1_1_4 = _RAND_193[31:0];
  _RAND_194 = {1{`RANDOM}};
  stage3_regs_r_1_1_5 = _RAND_194[31:0];
  _RAND_195 = {1{`RANDOM}};
  stage3_regs_r_1_1_6 = _RAND_195[31:0];
  _RAND_196 = {1{`RANDOM}};
  stage3_regs_r_1_1_7 = _RAND_196[31:0];
  _RAND_197 = {1{`RANDOM}};
  stage3_regs_r_1_1_8 = _RAND_197[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module hqr7(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  output [31:0] io_out_s
);
  wire  FP_multiplier_10ccs_clock; // @[FloatingPointDesigns.scala 2531:28]
  wire  FP_multiplier_10ccs_reset; // @[FloatingPointDesigns.scala 2531:28]
  wire [31:0] FP_multiplier_10ccs_io_in_a; // @[FloatingPointDesigns.scala 2531:28]
  wire [31:0] FP_multiplier_10ccs_io_in_b; // @[FloatingPointDesigns.scala 2531:28]
  wire [31:0] FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 2531:28]
  wire  FP_reciprocal_newfpu_clock; // @[FloatingPointDesigns.scala 2532:28]
  wire  FP_reciprocal_newfpu_reset; // @[FloatingPointDesigns.scala 2532:28]
  wire [31:0] FP_reciprocal_newfpu_io_in_a; // @[FloatingPointDesigns.scala 2532:28]
  wire [31:0] FP_reciprocal_newfpu_io_out_s; // @[FloatingPointDesigns.scala 2532:28]
  FP_multiplier_10ccs FP_multiplier_10ccs ( // @[FloatingPointDesigns.scala 2531:28]
    .clock(FP_multiplier_10ccs_clock),
    .reset(FP_multiplier_10ccs_reset),
    .io_in_a(FP_multiplier_10ccs_io_in_a),
    .io_in_b(FP_multiplier_10ccs_io_in_b),
    .io_out_s(FP_multiplier_10ccs_io_out_s)
  );
  FP_reciprocal_newfpu FP_reciprocal_newfpu ( // @[FloatingPointDesigns.scala 2532:28]
    .clock(FP_reciprocal_newfpu_clock),
    .reset(FP_reciprocal_newfpu_reset),
    .io_in_a(FP_reciprocal_newfpu_io_in_a),
    .io_out_s(FP_reciprocal_newfpu_io_out_s)
  );
  assign io_out_s = FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 2542:14]
  assign FP_multiplier_10ccs_clock = clock;
  assign FP_multiplier_10ccs_reset = reset;
  assign FP_multiplier_10ccs_io_in_a = 32'hc0000000; // @[FloatingPointDesigns.scala 2539:21]
  assign FP_multiplier_10ccs_io_in_b = FP_reciprocal_newfpu_io_out_s; // @[FloatingPointDesigns.scala 2540:21]
  assign FP_reciprocal_newfpu_clock = clock;
  assign FP_reciprocal_newfpu_reset = reset;
  assign FP_reciprocal_newfpu_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2537:21]
endmodule
module FPReg(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_0; // @[FloatingPointDesigns.scala 2268:22]
  reg [31:0] reg_1; // @[FloatingPointDesigns.scala 2268:22]
  reg [31:0] reg_2; // @[FloatingPointDesigns.scala 2268:22]
  reg [31:0] reg_3; // @[FloatingPointDesigns.scala 2268:22]
  reg [31:0] reg_4; // @[FloatingPointDesigns.scala 2268:22]
  reg [31:0] reg_5; // @[FloatingPointDesigns.scala 2268:22]
  reg [31:0] reg_6; // @[FloatingPointDesigns.scala 2268:22]
  reg [31:0] reg_7; // @[FloatingPointDesigns.scala 2268:22]
  reg [31:0] reg_8; // @[FloatingPointDesigns.scala 2268:22]
  reg [31:0] reg_9; // @[FloatingPointDesigns.scala 2268:22]
  assign io_out = reg_9; // @[FloatingPointDesigns.scala 2274:12]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 2268:22]
      reg_0 <= 32'h0; // @[FloatingPointDesigns.scala 2268:22]
    end else begin
      reg_0 <= io_in; // @[FloatingPointDesigns.scala 2270:14]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2268:22]
      reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 2268:22]
    end else begin
      reg_1 <= reg_0; // @[FloatingPointDesigns.scala 2272:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2268:22]
      reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 2268:22]
    end else begin
      reg_2 <= reg_1; // @[FloatingPointDesigns.scala 2272:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2268:22]
      reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 2268:22]
    end else begin
      reg_3 <= reg_2; // @[FloatingPointDesigns.scala 2272:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2268:22]
      reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 2268:22]
    end else begin
      reg_4 <= reg_3; // @[FloatingPointDesigns.scala 2272:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2268:22]
      reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 2268:22]
    end else begin
      reg_5 <= reg_4; // @[FloatingPointDesigns.scala 2272:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2268:22]
      reg_6 <= 32'h0; // @[FloatingPointDesigns.scala 2268:22]
    end else begin
      reg_6 <= reg_5; // @[FloatingPointDesigns.scala 2272:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2268:22]
      reg_7 <= 32'h0; // @[FloatingPointDesigns.scala 2268:22]
    end else begin
      reg_7 <= reg_6; // @[FloatingPointDesigns.scala 2272:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2268:22]
      reg_8 <= 32'h0; // @[FloatingPointDesigns.scala 2268:22]
    end else begin
      reg_8 <= reg_7; // @[FloatingPointDesigns.scala 2272:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 2268:22]
      reg_9 <= 32'h0; // @[FloatingPointDesigns.scala 2268:22]
    end else begin
      reg_9 <= reg_8; // @[FloatingPointDesigns.scala 2272:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  reg_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reg_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  reg_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  reg_9 = _RAND_9[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module axpy_dp(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b_0,
  input  [31:0] io_in_b_1,
  input  [31:0] io_in_b_2,
  input  [31:0] io_in_b_3,
  input  [31:0] io_in_b_4,
  input  [31:0] io_in_b_5,
  input  [31:0] io_in_b_6,
  input  [31:0] io_in_b_7,
  input  [31:0] io_in_b_8,
  input  [31:0] io_in_b_9,
  input  [31:0] io_in_b_10,
  input  [31:0] io_in_b_11,
  input  [31:0] io_in_b_12,
  input  [31:0] io_in_b_13,
  input  [31:0] io_in_b_14,
  input  [31:0] io_in_b_15,
  input  [31:0] io_in_b_16,
  input  [31:0] io_in_b_17,
  input  [31:0] io_in_b_18,
  input  [31:0] io_in_b_19,
  input  [31:0] io_in_b_20,
  input  [31:0] io_in_b_21,
  input  [31:0] io_in_b_22,
  input  [31:0] io_in_b_23,
  input  [31:0] io_in_b_24,
  input  [31:0] io_in_b_25,
  input  [31:0] io_in_b_26,
  input  [31:0] io_in_b_27,
  input  [31:0] io_in_b_28,
  input  [31:0] io_in_b_29,
  input  [31:0] io_in_b_30,
  input  [31:0] io_in_b_31,
  input  [31:0] io_in_c_0,
  input  [31:0] io_in_c_1,
  input  [31:0] io_in_c_2,
  input  [31:0] io_in_c_3,
  input  [31:0] io_in_c_4,
  input  [31:0] io_in_c_5,
  input  [31:0] io_in_c_6,
  input  [31:0] io_in_c_7,
  input  [31:0] io_in_c_8,
  input  [31:0] io_in_c_9,
  input  [31:0] io_in_c_10,
  input  [31:0] io_in_c_11,
  input  [31:0] io_in_c_12,
  input  [31:0] io_in_c_13,
  input  [31:0] io_in_c_14,
  input  [31:0] io_in_c_15,
  input  [31:0] io_in_c_16,
  input  [31:0] io_in_c_17,
  input  [31:0] io_in_c_18,
  input  [31:0] io_in_c_19,
  input  [31:0] io_in_c_20,
  input  [31:0] io_in_c_21,
  input  [31:0] io_in_c_22,
  input  [31:0] io_in_c_23,
  input  [31:0] io_in_c_24,
  input  [31:0] io_in_c_25,
  input  [31:0] io_in_c_26,
  input  [31:0] io_in_c_27,
  input  [31:0] io_in_c_28,
  input  [31:0] io_in_c_29,
  input  [31:0] io_in_c_30,
  input  [31:0] io_in_c_31,
  output [31:0] io_out_s_0,
  output [31:0] io_out_s_1,
  output [31:0] io_out_s_2,
  output [31:0] io_out_s_3,
  output [31:0] io_out_s_4,
  output [31:0] io_out_s_5,
  output [31:0] io_out_s_6,
  output [31:0] io_out_s_7,
  output [31:0] io_out_s_8,
  output [31:0] io_out_s_9,
  output [31:0] io_out_s_10,
  output [31:0] io_out_s_11,
  output [31:0] io_out_s_12,
  output [31:0] io_out_s_13,
  output [31:0] io_out_s_14,
  output [31:0] io_out_s_15,
  output [31:0] io_out_s_16,
  output [31:0] io_out_s_17,
  output [31:0] io_out_s_18,
  output [31:0] io_out_s_19,
  output [31:0] io_out_s_20,
  output [31:0] io_out_s_21,
  output [31:0] io_out_s_22,
  output [31:0] io_out_s_23,
  output [31:0] io_out_s_24,
  output [31:0] io_out_s_25,
  output [31:0] io_out_s_26,
  output [31:0] io_out_s_27,
  output [31:0] io_out_s_28,
  output [31:0] io_out_s_29,
  output [31:0] io_out_s_30,
  output [31:0] io_out_s_31
);
  wire  FP_multiplier_10ccs_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_1_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_1_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_1_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_1_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_2_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_2_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_2_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_2_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_3_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_3_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_3_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_3_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_3_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_4_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_4_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_4_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_4_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_4_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_5_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_5_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_5_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_5_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_5_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_6_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_6_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_6_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_6_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_6_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_7_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_7_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_7_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_7_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_7_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_8_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_8_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_8_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_8_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_8_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_9_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_9_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_9_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_9_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_9_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_10_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_10_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_10_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_10_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_10_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_11_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_11_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_11_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_11_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_11_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_12_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_12_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_12_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_12_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_12_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_13_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_13_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_13_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_13_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_13_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_14_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_14_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_14_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_14_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_14_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_15_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_15_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_15_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_15_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_15_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_16_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_16_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_16_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_16_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_16_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_17_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_17_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_17_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_17_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_17_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_18_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_18_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_18_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_18_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_18_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_19_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_19_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_19_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_19_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_19_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_20_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_20_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_20_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_20_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_20_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_21_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_21_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_21_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_21_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_21_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_22_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_22_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_22_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_22_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_22_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_23_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_23_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_23_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_23_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_23_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_24_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_24_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_24_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_24_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_24_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_25_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_25_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_25_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_25_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_25_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_26_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_26_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_26_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_26_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_26_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_27_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_27_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_27_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_27_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_27_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_28_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_28_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_28_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_28_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_28_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_29_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_29_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_29_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_29_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_29_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_30_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_30_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_30_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_30_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_30_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_31_clock; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_multiplier_10ccs_31_reset; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_31_io_in_a; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_31_io_in_b; // @[FloatingPointDesigns.scala 2483:28]
  wire [31:0] FP_multiplier_10ccs_31_io_out_s; // @[FloatingPointDesigns.scala 2483:28]
  wire  FP_adder_13ccs_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_1_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_1_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_1_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_1_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_2_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_2_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_2_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_2_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_3_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_3_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_3_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_3_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_3_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_4_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_4_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_4_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_4_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_4_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_5_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_5_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_5_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_5_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_5_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_6_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_6_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_6_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_6_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_6_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_7_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_7_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_7_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_7_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_7_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_8_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_8_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_8_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_8_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_8_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_9_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_9_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_9_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_9_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_9_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_10_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_10_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_10_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_10_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_10_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_11_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_11_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_11_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_11_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_11_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_12_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_12_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_12_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_12_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_12_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_13_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_13_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_13_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_13_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_13_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_14_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_14_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_14_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_14_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_14_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_15_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_15_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_15_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_15_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_15_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_16_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_16_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_16_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_16_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_16_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_17_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_17_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_17_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_17_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_17_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_18_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_18_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_18_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_18_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_18_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_19_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_19_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_19_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_19_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_19_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_20_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_20_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_20_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_20_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_20_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_21_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_21_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_21_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_21_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_21_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_22_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_22_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_22_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_22_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_22_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_23_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_23_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_23_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_23_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_23_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_24_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_24_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_24_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_24_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_24_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_25_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_25_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_25_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_25_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_25_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_26_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_26_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_26_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_26_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_26_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_27_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_27_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_27_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_27_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_27_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_28_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_28_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_28_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_28_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_28_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_29_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_29_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_29_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_29_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_29_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_30_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_30_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_30_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_30_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_30_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_31_clock; // @[FloatingPointDesigns.scala 2488:25]
  wire  FP_adder_13ccs_31_reset; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_31_io_in_a; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_31_io_in_b; // @[FloatingPointDesigns.scala 2488:25]
  wire [31:0] FP_adder_13ccs_31_io_out_s; // @[FloatingPointDesigns.scala 2488:25]
  wire  FPReg_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_1_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_1_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_1_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_1_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_2_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_2_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_2_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_2_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_3_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_3_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_3_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_3_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_4_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_4_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_4_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_4_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_5_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_5_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_5_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_5_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_6_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_6_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_6_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_6_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_7_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_7_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_7_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_7_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_8_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_8_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_8_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_8_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_9_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_9_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_9_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_9_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_10_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_10_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_10_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_10_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_11_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_11_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_11_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_11_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_12_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_12_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_12_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_12_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_13_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_13_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_13_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_13_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_14_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_14_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_14_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_14_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_15_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_15_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_15_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_15_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_16_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_16_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_16_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_16_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_17_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_17_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_17_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_17_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_18_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_18_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_18_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_18_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_19_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_19_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_19_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_19_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_20_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_20_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_20_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_20_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_21_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_21_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_21_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_21_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_22_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_22_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_22_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_22_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_23_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_23_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_23_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_23_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_24_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_24_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_24_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_24_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_25_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_25_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_25_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_25_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_26_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_26_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_26_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_26_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_27_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_27_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_27_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_27_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_28_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_28_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_28_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_28_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_29_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_29_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_29_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_29_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_30_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_30_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_30_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_30_io_out; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_31_clock; // @[FloatingPointDesigns.scala 2492:48]
  wire  FPReg_31_reset; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_31_io_in; // @[FloatingPointDesigns.scala 2492:48]
  wire [31:0] FPReg_31_io_out; // @[FloatingPointDesigns.scala 2492:48]
  FP_multiplier_10ccs FP_multiplier_10ccs ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_clock),
    .reset(FP_multiplier_10ccs_reset),
    .io_in_a(FP_multiplier_10ccs_io_in_a),
    .io_in_b(FP_multiplier_10ccs_io_in_b),
    .io_out_s(FP_multiplier_10ccs_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_1 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_1_clock),
    .reset(FP_multiplier_10ccs_1_reset),
    .io_in_a(FP_multiplier_10ccs_1_io_in_a),
    .io_in_b(FP_multiplier_10ccs_1_io_in_b),
    .io_out_s(FP_multiplier_10ccs_1_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_2 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_2_clock),
    .reset(FP_multiplier_10ccs_2_reset),
    .io_in_a(FP_multiplier_10ccs_2_io_in_a),
    .io_in_b(FP_multiplier_10ccs_2_io_in_b),
    .io_out_s(FP_multiplier_10ccs_2_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_3 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_3_clock),
    .reset(FP_multiplier_10ccs_3_reset),
    .io_in_a(FP_multiplier_10ccs_3_io_in_a),
    .io_in_b(FP_multiplier_10ccs_3_io_in_b),
    .io_out_s(FP_multiplier_10ccs_3_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_4 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_4_clock),
    .reset(FP_multiplier_10ccs_4_reset),
    .io_in_a(FP_multiplier_10ccs_4_io_in_a),
    .io_in_b(FP_multiplier_10ccs_4_io_in_b),
    .io_out_s(FP_multiplier_10ccs_4_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_5 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_5_clock),
    .reset(FP_multiplier_10ccs_5_reset),
    .io_in_a(FP_multiplier_10ccs_5_io_in_a),
    .io_in_b(FP_multiplier_10ccs_5_io_in_b),
    .io_out_s(FP_multiplier_10ccs_5_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_6 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_6_clock),
    .reset(FP_multiplier_10ccs_6_reset),
    .io_in_a(FP_multiplier_10ccs_6_io_in_a),
    .io_in_b(FP_multiplier_10ccs_6_io_in_b),
    .io_out_s(FP_multiplier_10ccs_6_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_7 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_7_clock),
    .reset(FP_multiplier_10ccs_7_reset),
    .io_in_a(FP_multiplier_10ccs_7_io_in_a),
    .io_in_b(FP_multiplier_10ccs_7_io_in_b),
    .io_out_s(FP_multiplier_10ccs_7_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_8 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_8_clock),
    .reset(FP_multiplier_10ccs_8_reset),
    .io_in_a(FP_multiplier_10ccs_8_io_in_a),
    .io_in_b(FP_multiplier_10ccs_8_io_in_b),
    .io_out_s(FP_multiplier_10ccs_8_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_9 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_9_clock),
    .reset(FP_multiplier_10ccs_9_reset),
    .io_in_a(FP_multiplier_10ccs_9_io_in_a),
    .io_in_b(FP_multiplier_10ccs_9_io_in_b),
    .io_out_s(FP_multiplier_10ccs_9_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_10 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_10_clock),
    .reset(FP_multiplier_10ccs_10_reset),
    .io_in_a(FP_multiplier_10ccs_10_io_in_a),
    .io_in_b(FP_multiplier_10ccs_10_io_in_b),
    .io_out_s(FP_multiplier_10ccs_10_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_11 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_11_clock),
    .reset(FP_multiplier_10ccs_11_reset),
    .io_in_a(FP_multiplier_10ccs_11_io_in_a),
    .io_in_b(FP_multiplier_10ccs_11_io_in_b),
    .io_out_s(FP_multiplier_10ccs_11_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_12 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_12_clock),
    .reset(FP_multiplier_10ccs_12_reset),
    .io_in_a(FP_multiplier_10ccs_12_io_in_a),
    .io_in_b(FP_multiplier_10ccs_12_io_in_b),
    .io_out_s(FP_multiplier_10ccs_12_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_13 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_13_clock),
    .reset(FP_multiplier_10ccs_13_reset),
    .io_in_a(FP_multiplier_10ccs_13_io_in_a),
    .io_in_b(FP_multiplier_10ccs_13_io_in_b),
    .io_out_s(FP_multiplier_10ccs_13_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_14 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_14_clock),
    .reset(FP_multiplier_10ccs_14_reset),
    .io_in_a(FP_multiplier_10ccs_14_io_in_a),
    .io_in_b(FP_multiplier_10ccs_14_io_in_b),
    .io_out_s(FP_multiplier_10ccs_14_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_15 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_15_clock),
    .reset(FP_multiplier_10ccs_15_reset),
    .io_in_a(FP_multiplier_10ccs_15_io_in_a),
    .io_in_b(FP_multiplier_10ccs_15_io_in_b),
    .io_out_s(FP_multiplier_10ccs_15_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_16 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_16_clock),
    .reset(FP_multiplier_10ccs_16_reset),
    .io_in_a(FP_multiplier_10ccs_16_io_in_a),
    .io_in_b(FP_multiplier_10ccs_16_io_in_b),
    .io_out_s(FP_multiplier_10ccs_16_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_17 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_17_clock),
    .reset(FP_multiplier_10ccs_17_reset),
    .io_in_a(FP_multiplier_10ccs_17_io_in_a),
    .io_in_b(FP_multiplier_10ccs_17_io_in_b),
    .io_out_s(FP_multiplier_10ccs_17_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_18 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_18_clock),
    .reset(FP_multiplier_10ccs_18_reset),
    .io_in_a(FP_multiplier_10ccs_18_io_in_a),
    .io_in_b(FP_multiplier_10ccs_18_io_in_b),
    .io_out_s(FP_multiplier_10ccs_18_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_19 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_19_clock),
    .reset(FP_multiplier_10ccs_19_reset),
    .io_in_a(FP_multiplier_10ccs_19_io_in_a),
    .io_in_b(FP_multiplier_10ccs_19_io_in_b),
    .io_out_s(FP_multiplier_10ccs_19_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_20 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_20_clock),
    .reset(FP_multiplier_10ccs_20_reset),
    .io_in_a(FP_multiplier_10ccs_20_io_in_a),
    .io_in_b(FP_multiplier_10ccs_20_io_in_b),
    .io_out_s(FP_multiplier_10ccs_20_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_21 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_21_clock),
    .reset(FP_multiplier_10ccs_21_reset),
    .io_in_a(FP_multiplier_10ccs_21_io_in_a),
    .io_in_b(FP_multiplier_10ccs_21_io_in_b),
    .io_out_s(FP_multiplier_10ccs_21_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_22 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_22_clock),
    .reset(FP_multiplier_10ccs_22_reset),
    .io_in_a(FP_multiplier_10ccs_22_io_in_a),
    .io_in_b(FP_multiplier_10ccs_22_io_in_b),
    .io_out_s(FP_multiplier_10ccs_22_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_23 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_23_clock),
    .reset(FP_multiplier_10ccs_23_reset),
    .io_in_a(FP_multiplier_10ccs_23_io_in_a),
    .io_in_b(FP_multiplier_10ccs_23_io_in_b),
    .io_out_s(FP_multiplier_10ccs_23_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_24 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_24_clock),
    .reset(FP_multiplier_10ccs_24_reset),
    .io_in_a(FP_multiplier_10ccs_24_io_in_a),
    .io_in_b(FP_multiplier_10ccs_24_io_in_b),
    .io_out_s(FP_multiplier_10ccs_24_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_25 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_25_clock),
    .reset(FP_multiplier_10ccs_25_reset),
    .io_in_a(FP_multiplier_10ccs_25_io_in_a),
    .io_in_b(FP_multiplier_10ccs_25_io_in_b),
    .io_out_s(FP_multiplier_10ccs_25_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_26 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_26_clock),
    .reset(FP_multiplier_10ccs_26_reset),
    .io_in_a(FP_multiplier_10ccs_26_io_in_a),
    .io_in_b(FP_multiplier_10ccs_26_io_in_b),
    .io_out_s(FP_multiplier_10ccs_26_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_27 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_27_clock),
    .reset(FP_multiplier_10ccs_27_reset),
    .io_in_a(FP_multiplier_10ccs_27_io_in_a),
    .io_in_b(FP_multiplier_10ccs_27_io_in_b),
    .io_out_s(FP_multiplier_10ccs_27_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_28 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_28_clock),
    .reset(FP_multiplier_10ccs_28_reset),
    .io_in_a(FP_multiplier_10ccs_28_io_in_a),
    .io_in_b(FP_multiplier_10ccs_28_io_in_b),
    .io_out_s(FP_multiplier_10ccs_28_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_29 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_29_clock),
    .reset(FP_multiplier_10ccs_29_reset),
    .io_in_a(FP_multiplier_10ccs_29_io_in_a),
    .io_in_b(FP_multiplier_10ccs_29_io_in_b),
    .io_out_s(FP_multiplier_10ccs_29_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_30 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_30_clock),
    .reset(FP_multiplier_10ccs_30_reset),
    .io_in_a(FP_multiplier_10ccs_30_io_in_a),
    .io_in_b(FP_multiplier_10ccs_30_io_in_b),
    .io_out_s(FP_multiplier_10ccs_30_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_31 ( // @[FloatingPointDesigns.scala 2483:28]
    .clock(FP_multiplier_10ccs_31_clock),
    .reset(FP_multiplier_10ccs_31_reset),
    .io_in_a(FP_multiplier_10ccs_31_io_in_a),
    .io_in_b(FP_multiplier_10ccs_31_io_in_b),
    .io_out_s(FP_multiplier_10ccs_31_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_clock),
    .reset(FP_adder_13ccs_reset),
    .io_in_a(FP_adder_13ccs_io_in_a),
    .io_in_b(FP_adder_13ccs_io_in_b),
    .io_out_s(FP_adder_13ccs_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_1 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_1_clock),
    .reset(FP_adder_13ccs_1_reset),
    .io_in_a(FP_adder_13ccs_1_io_in_a),
    .io_in_b(FP_adder_13ccs_1_io_in_b),
    .io_out_s(FP_adder_13ccs_1_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_2 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_2_clock),
    .reset(FP_adder_13ccs_2_reset),
    .io_in_a(FP_adder_13ccs_2_io_in_a),
    .io_in_b(FP_adder_13ccs_2_io_in_b),
    .io_out_s(FP_adder_13ccs_2_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_3 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_3_clock),
    .reset(FP_adder_13ccs_3_reset),
    .io_in_a(FP_adder_13ccs_3_io_in_a),
    .io_in_b(FP_adder_13ccs_3_io_in_b),
    .io_out_s(FP_adder_13ccs_3_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_4 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_4_clock),
    .reset(FP_adder_13ccs_4_reset),
    .io_in_a(FP_adder_13ccs_4_io_in_a),
    .io_in_b(FP_adder_13ccs_4_io_in_b),
    .io_out_s(FP_adder_13ccs_4_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_5 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_5_clock),
    .reset(FP_adder_13ccs_5_reset),
    .io_in_a(FP_adder_13ccs_5_io_in_a),
    .io_in_b(FP_adder_13ccs_5_io_in_b),
    .io_out_s(FP_adder_13ccs_5_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_6 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_6_clock),
    .reset(FP_adder_13ccs_6_reset),
    .io_in_a(FP_adder_13ccs_6_io_in_a),
    .io_in_b(FP_adder_13ccs_6_io_in_b),
    .io_out_s(FP_adder_13ccs_6_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_7 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_7_clock),
    .reset(FP_adder_13ccs_7_reset),
    .io_in_a(FP_adder_13ccs_7_io_in_a),
    .io_in_b(FP_adder_13ccs_7_io_in_b),
    .io_out_s(FP_adder_13ccs_7_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_8 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_8_clock),
    .reset(FP_adder_13ccs_8_reset),
    .io_in_a(FP_adder_13ccs_8_io_in_a),
    .io_in_b(FP_adder_13ccs_8_io_in_b),
    .io_out_s(FP_adder_13ccs_8_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_9 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_9_clock),
    .reset(FP_adder_13ccs_9_reset),
    .io_in_a(FP_adder_13ccs_9_io_in_a),
    .io_in_b(FP_adder_13ccs_9_io_in_b),
    .io_out_s(FP_adder_13ccs_9_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_10 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_10_clock),
    .reset(FP_adder_13ccs_10_reset),
    .io_in_a(FP_adder_13ccs_10_io_in_a),
    .io_in_b(FP_adder_13ccs_10_io_in_b),
    .io_out_s(FP_adder_13ccs_10_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_11 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_11_clock),
    .reset(FP_adder_13ccs_11_reset),
    .io_in_a(FP_adder_13ccs_11_io_in_a),
    .io_in_b(FP_adder_13ccs_11_io_in_b),
    .io_out_s(FP_adder_13ccs_11_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_12 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_12_clock),
    .reset(FP_adder_13ccs_12_reset),
    .io_in_a(FP_adder_13ccs_12_io_in_a),
    .io_in_b(FP_adder_13ccs_12_io_in_b),
    .io_out_s(FP_adder_13ccs_12_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_13 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_13_clock),
    .reset(FP_adder_13ccs_13_reset),
    .io_in_a(FP_adder_13ccs_13_io_in_a),
    .io_in_b(FP_adder_13ccs_13_io_in_b),
    .io_out_s(FP_adder_13ccs_13_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_14 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_14_clock),
    .reset(FP_adder_13ccs_14_reset),
    .io_in_a(FP_adder_13ccs_14_io_in_a),
    .io_in_b(FP_adder_13ccs_14_io_in_b),
    .io_out_s(FP_adder_13ccs_14_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_15 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_15_clock),
    .reset(FP_adder_13ccs_15_reset),
    .io_in_a(FP_adder_13ccs_15_io_in_a),
    .io_in_b(FP_adder_13ccs_15_io_in_b),
    .io_out_s(FP_adder_13ccs_15_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_16 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_16_clock),
    .reset(FP_adder_13ccs_16_reset),
    .io_in_a(FP_adder_13ccs_16_io_in_a),
    .io_in_b(FP_adder_13ccs_16_io_in_b),
    .io_out_s(FP_adder_13ccs_16_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_17 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_17_clock),
    .reset(FP_adder_13ccs_17_reset),
    .io_in_a(FP_adder_13ccs_17_io_in_a),
    .io_in_b(FP_adder_13ccs_17_io_in_b),
    .io_out_s(FP_adder_13ccs_17_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_18 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_18_clock),
    .reset(FP_adder_13ccs_18_reset),
    .io_in_a(FP_adder_13ccs_18_io_in_a),
    .io_in_b(FP_adder_13ccs_18_io_in_b),
    .io_out_s(FP_adder_13ccs_18_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_19 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_19_clock),
    .reset(FP_adder_13ccs_19_reset),
    .io_in_a(FP_adder_13ccs_19_io_in_a),
    .io_in_b(FP_adder_13ccs_19_io_in_b),
    .io_out_s(FP_adder_13ccs_19_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_20 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_20_clock),
    .reset(FP_adder_13ccs_20_reset),
    .io_in_a(FP_adder_13ccs_20_io_in_a),
    .io_in_b(FP_adder_13ccs_20_io_in_b),
    .io_out_s(FP_adder_13ccs_20_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_21 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_21_clock),
    .reset(FP_adder_13ccs_21_reset),
    .io_in_a(FP_adder_13ccs_21_io_in_a),
    .io_in_b(FP_adder_13ccs_21_io_in_b),
    .io_out_s(FP_adder_13ccs_21_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_22 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_22_clock),
    .reset(FP_adder_13ccs_22_reset),
    .io_in_a(FP_adder_13ccs_22_io_in_a),
    .io_in_b(FP_adder_13ccs_22_io_in_b),
    .io_out_s(FP_adder_13ccs_22_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_23 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_23_clock),
    .reset(FP_adder_13ccs_23_reset),
    .io_in_a(FP_adder_13ccs_23_io_in_a),
    .io_in_b(FP_adder_13ccs_23_io_in_b),
    .io_out_s(FP_adder_13ccs_23_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_24 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_24_clock),
    .reset(FP_adder_13ccs_24_reset),
    .io_in_a(FP_adder_13ccs_24_io_in_a),
    .io_in_b(FP_adder_13ccs_24_io_in_b),
    .io_out_s(FP_adder_13ccs_24_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_25 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_25_clock),
    .reset(FP_adder_13ccs_25_reset),
    .io_in_a(FP_adder_13ccs_25_io_in_a),
    .io_in_b(FP_adder_13ccs_25_io_in_b),
    .io_out_s(FP_adder_13ccs_25_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_26 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_26_clock),
    .reset(FP_adder_13ccs_26_reset),
    .io_in_a(FP_adder_13ccs_26_io_in_a),
    .io_in_b(FP_adder_13ccs_26_io_in_b),
    .io_out_s(FP_adder_13ccs_26_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_27 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_27_clock),
    .reset(FP_adder_13ccs_27_reset),
    .io_in_a(FP_adder_13ccs_27_io_in_a),
    .io_in_b(FP_adder_13ccs_27_io_in_b),
    .io_out_s(FP_adder_13ccs_27_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_28 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_28_clock),
    .reset(FP_adder_13ccs_28_reset),
    .io_in_a(FP_adder_13ccs_28_io_in_a),
    .io_in_b(FP_adder_13ccs_28_io_in_b),
    .io_out_s(FP_adder_13ccs_28_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_29 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_29_clock),
    .reset(FP_adder_13ccs_29_reset),
    .io_in_a(FP_adder_13ccs_29_io_in_a),
    .io_in_b(FP_adder_13ccs_29_io_in_b),
    .io_out_s(FP_adder_13ccs_29_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_30 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_30_clock),
    .reset(FP_adder_13ccs_30_reset),
    .io_in_a(FP_adder_13ccs_30_io_in_a),
    .io_in_b(FP_adder_13ccs_30_io_in_b),
    .io_out_s(FP_adder_13ccs_30_io_out_s)
  );
  FP_adder_13ccs FP_adder_13ccs_31 ( // @[FloatingPointDesigns.scala 2488:25]
    .clock(FP_adder_13ccs_31_clock),
    .reset(FP_adder_13ccs_31_reset),
    .io_in_a(FP_adder_13ccs_31_io_in_a),
    .io_in_b(FP_adder_13ccs_31_io_in_b),
    .io_out_s(FP_adder_13ccs_31_io_out_s)
  );
  FPReg FPReg ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_clock),
    .reset(FPReg_reset),
    .io_in(FPReg_io_in),
    .io_out(FPReg_io_out)
  );
  FPReg FPReg_1 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_1_clock),
    .reset(FPReg_1_reset),
    .io_in(FPReg_1_io_in),
    .io_out(FPReg_1_io_out)
  );
  FPReg FPReg_2 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_2_clock),
    .reset(FPReg_2_reset),
    .io_in(FPReg_2_io_in),
    .io_out(FPReg_2_io_out)
  );
  FPReg FPReg_3 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_3_clock),
    .reset(FPReg_3_reset),
    .io_in(FPReg_3_io_in),
    .io_out(FPReg_3_io_out)
  );
  FPReg FPReg_4 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_4_clock),
    .reset(FPReg_4_reset),
    .io_in(FPReg_4_io_in),
    .io_out(FPReg_4_io_out)
  );
  FPReg FPReg_5 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_5_clock),
    .reset(FPReg_5_reset),
    .io_in(FPReg_5_io_in),
    .io_out(FPReg_5_io_out)
  );
  FPReg FPReg_6 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_6_clock),
    .reset(FPReg_6_reset),
    .io_in(FPReg_6_io_in),
    .io_out(FPReg_6_io_out)
  );
  FPReg FPReg_7 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_7_clock),
    .reset(FPReg_7_reset),
    .io_in(FPReg_7_io_in),
    .io_out(FPReg_7_io_out)
  );
  FPReg FPReg_8 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_8_clock),
    .reset(FPReg_8_reset),
    .io_in(FPReg_8_io_in),
    .io_out(FPReg_8_io_out)
  );
  FPReg FPReg_9 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_9_clock),
    .reset(FPReg_9_reset),
    .io_in(FPReg_9_io_in),
    .io_out(FPReg_9_io_out)
  );
  FPReg FPReg_10 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_10_clock),
    .reset(FPReg_10_reset),
    .io_in(FPReg_10_io_in),
    .io_out(FPReg_10_io_out)
  );
  FPReg FPReg_11 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_11_clock),
    .reset(FPReg_11_reset),
    .io_in(FPReg_11_io_in),
    .io_out(FPReg_11_io_out)
  );
  FPReg FPReg_12 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_12_clock),
    .reset(FPReg_12_reset),
    .io_in(FPReg_12_io_in),
    .io_out(FPReg_12_io_out)
  );
  FPReg FPReg_13 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_13_clock),
    .reset(FPReg_13_reset),
    .io_in(FPReg_13_io_in),
    .io_out(FPReg_13_io_out)
  );
  FPReg FPReg_14 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_14_clock),
    .reset(FPReg_14_reset),
    .io_in(FPReg_14_io_in),
    .io_out(FPReg_14_io_out)
  );
  FPReg FPReg_15 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_15_clock),
    .reset(FPReg_15_reset),
    .io_in(FPReg_15_io_in),
    .io_out(FPReg_15_io_out)
  );
  FPReg FPReg_16 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_16_clock),
    .reset(FPReg_16_reset),
    .io_in(FPReg_16_io_in),
    .io_out(FPReg_16_io_out)
  );
  FPReg FPReg_17 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_17_clock),
    .reset(FPReg_17_reset),
    .io_in(FPReg_17_io_in),
    .io_out(FPReg_17_io_out)
  );
  FPReg FPReg_18 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_18_clock),
    .reset(FPReg_18_reset),
    .io_in(FPReg_18_io_in),
    .io_out(FPReg_18_io_out)
  );
  FPReg FPReg_19 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_19_clock),
    .reset(FPReg_19_reset),
    .io_in(FPReg_19_io_in),
    .io_out(FPReg_19_io_out)
  );
  FPReg FPReg_20 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_20_clock),
    .reset(FPReg_20_reset),
    .io_in(FPReg_20_io_in),
    .io_out(FPReg_20_io_out)
  );
  FPReg FPReg_21 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_21_clock),
    .reset(FPReg_21_reset),
    .io_in(FPReg_21_io_in),
    .io_out(FPReg_21_io_out)
  );
  FPReg FPReg_22 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_22_clock),
    .reset(FPReg_22_reset),
    .io_in(FPReg_22_io_in),
    .io_out(FPReg_22_io_out)
  );
  FPReg FPReg_23 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_23_clock),
    .reset(FPReg_23_reset),
    .io_in(FPReg_23_io_in),
    .io_out(FPReg_23_io_out)
  );
  FPReg FPReg_24 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_24_clock),
    .reset(FPReg_24_reset),
    .io_in(FPReg_24_io_in),
    .io_out(FPReg_24_io_out)
  );
  FPReg FPReg_25 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_25_clock),
    .reset(FPReg_25_reset),
    .io_in(FPReg_25_io_in),
    .io_out(FPReg_25_io_out)
  );
  FPReg FPReg_26 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_26_clock),
    .reset(FPReg_26_reset),
    .io_in(FPReg_26_io_in),
    .io_out(FPReg_26_io_out)
  );
  FPReg FPReg_27 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_27_clock),
    .reset(FPReg_27_reset),
    .io_in(FPReg_27_io_in),
    .io_out(FPReg_27_io_out)
  );
  FPReg FPReg_28 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_28_clock),
    .reset(FPReg_28_reset),
    .io_in(FPReg_28_io_in),
    .io_out(FPReg_28_io_out)
  );
  FPReg FPReg_29 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_29_clock),
    .reset(FPReg_29_reset),
    .io_in(FPReg_29_io_in),
    .io_out(FPReg_29_io_out)
  );
  FPReg FPReg_30 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_30_clock),
    .reset(FPReg_30_reset),
    .io_in(FPReg_30_io_in),
    .io_out(FPReg_30_io_out)
  );
  FPReg FPReg_31 ( // @[FloatingPointDesigns.scala 2492:48]
    .clock(FPReg_31_clock),
    .reset(FPReg_31_reset),
    .io_in(FPReg_31_io_in),
    .io_out(FPReg_31_io_out)
  );
  assign io_out_s_0 = FP_adder_13ccs_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_1 = FP_adder_13ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_2 = FP_adder_13ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_3 = FP_adder_13ccs_3_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_4 = FP_adder_13ccs_4_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_5 = FP_adder_13ccs_5_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_6 = FP_adder_13ccs_6_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_7 = FP_adder_13ccs_7_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_8 = FP_adder_13ccs_8_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_9 = FP_adder_13ccs_9_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_10 = FP_adder_13ccs_10_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_11 = FP_adder_13ccs_11_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_12 = FP_adder_13ccs_12_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_13 = FP_adder_13ccs_13_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_14 = FP_adder_13ccs_14_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_15 = FP_adder_13ccs_15_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_16 = FP_adder_13ccs_16_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_17 = FP_adder_13ccs_17_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_18 = FP_adder_13ccs_18_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_19 = FP_adder_13ccs_19_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_20 = FP_adder_13ccs_20_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_21 = FP_adder_13ccs_21_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_22 = FP_adder_13ccs_22_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_23 = FP_adder_13ccs_23_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_24 = FP_adder_13ccs_24_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_25 = FP_adder_13ccs_25_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_26 = FP_adder_13ccs_26_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_27 = FP_adder_13ccs_27_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_28 = FP_adder_13ccs_28_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_29 = FP_adder_13ccs_29_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_30 = FP_adder_13ccs_30_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign io_out_s_31 = FP_adder_13ccs_31_io_out_s; // @[FloatingPointDesigns.scala 2499:19]
  assign FP_multiplier_10ccs_clock = clock;
  assign FP_multiplier_10ccs_reset = reset;
  assign FP_multiplier_10ccs_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_io_in_b = io_in_b_0; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_1_clock = clock;
  assign FP_multiplier_10ccs_1_reset = reset;
  assign FP_multiplier_10ccs_1_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_1_io_in_b = io_in_b_1; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_2_clock = clock;
  assign FP_multiplier_10ccs_2_reset = reset;
  assign FP_multiplier_10ccs_2_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_2_io_in_b = io_in_b_2; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_3_clock = clock;
  assign FP_multiplier_10ccs_3_reset = reset;
  assign FP_multiplier_10ccs_3_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_3_io_in_b = io_in_b_3; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_4_clock = clock;
  assign FP_multiplier_10ccs_4_reset = reset;
  assign FP_multiplier_10ccs_4_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_4_io_in_b = io_in_b_4; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_5_clock = clock;
  assign FP_multiplier_10ccs_5_reset = reset;
  assign FP_multiplier_10ccs_5_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_5_io_in_b = io_in_b_5; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_6_clock = clock;
  assign FP_multiplier_10ccs_6_reset = reset;
  assign FP_multiplier_10ccs_6_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_6_io_in_b = io_in_b_6; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_7_clock = clock;
  assign FP_multiplier_10ccs_7_reset = reset;
  assign FP_multiplier_10ccs_7_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_7_io_in_b = io_in_b_7; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_8_clock = clock;
  assign FP_multiplier_10ccs_8_reset = reset;
  assign FP_multiplier_10ccs_8_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_8_io_in_b = io_in_b_8; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_9_clock = clock;
  assign FP_multiplier_10ccs_9_reset = reset;
  assign FP_multiplier_10ccs_9_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_9_io_in_b = io_in_b_9; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_10_clock = clock;
  assign FP_multiplier_10ccs_10_reset = reset;
  assign FP_multiplier_10ccs_10_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_10_io_in_b = io_in_b_10; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_11_clock = clock;
  assign FP_multiplier_10ccs_11_reset = reset;
  assign FP_multiplier_10ccs_11_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_11_io_in_b = io_in_b_11; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_12_clock = clock;
  assign FP_multiplier_10ccs_12_reset = reset;
  assign FP_multiplier_10ccs_12_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_12_io_in_b = io_in_b_12; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_13_clock = clock;
  assign FP_multiplier_10ccs_13_reset = reset;
  assign FP_multiplier_10ccs_13_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_13_io_in_b = io_in_b_13; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_14_clock = clock;
  assign FP_multiplier_10ccs_14_reset = reset;
  assign FP_multiplier_10ccs_14_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_14_io_in_b = io_in_b_14; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_15_clock = clock;
  assign FP_multiplier_10ccs_15_reset = reset;
  assign FP_multiplier_10ccs_15_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_15_io_in_b = io_in_b_15; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_16_clock = clock;
  assign FP_multiplier_10ccs_16_reset = reset;
  assign FP_multiplier_10ccs_16_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_16_io_in_b = io_in_b_16; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_17_clock = clock;
  assign FP_multiplier_10ccs_17_reset = reset;
  assign FP_multiplier_10ccs_17_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_17_io_in_b = io_in_b_17; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_18_clock = clock;
  assign FP_multiplier_10ccs_18_reset = reset;
  assign FP_multiplier_10ccs_18_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_18_io_in_b = io_in_b_18; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_19_clock = clock;
  assign FP_multiplier_10ccs_19_reset = reset;
  assign FP_multiplier_10ccs_19_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_19_io_in_b = io_in_b_19; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_20_clock = clock;
  assign FP_multiplier_10ccs_20_reset = reset;
  assign FP_multiplier_10ccs_20_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_20_io_in_b = io_in_b_20; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_21_clock = clock;
  assign FP_multiplier_10ccs_21_reset = reset;
  assign FP_multiplier_10ccs_21_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_21_io_in_b = io_in_b_21; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_22_clock = clock;
  assign FP_multiplier_10ccs_22_reset = reset;
  assign FP_multiplier_10ccs_22_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_22_io_in_b = io_in_b_22; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_23_clock = clock;
  assign FP_multiplier_10ccs_23_reset = reset;
  assign FP_multiplier_10ccs_23_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_23_io_in_b = io_in_b_23; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_24_clock = clock;
  assign FP_multiplier_10ccs_24_reset = reset;
  assign FP_multiplier_10ccs_24_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_24_io_in_b = io_in_b_24; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_25_clock = clock;
  assign FP_multiplier_10ccs_25_reset = reset;
  assign FP_multiplier_10ccs_25_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_25_io_in_b = io_in_b_25; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_26_clock = clock;
  assign FP_multiplier_10ccs_26_reset = reset;
  assign FP_multiplier_10ccs_26_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_26_io_in_b = io_in_b_26; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_27_clock = clock;
  assign FP_multiplier_10ccs_27_reset = reset;
  assign FP_multiplier_10ccs_27_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_27_io_in_b = io_in_b_27; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_28_clock = clock;
  assign FP_multiplier_10ccs_28_reset = reset;
  assign FP_multiplier_10ccs_28_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_28_io_in_b = io_in_b_28; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_29_clock = clock;
  assign FP_multiplier_10ccs_29_reset = reset;
  assign FP_multiplier_10ccs_29_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_29_io_in_b = io_in_b_29; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_30_clock = clock;
  assign FP_multiplier_10ccs_30_reset = reset;
  assign FP_multiplier_10ccs_30_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_30_io_in_b = io_in_b_30; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_multiplier_10ccs_31_clock = clock;
  assign FP_multiplier_10ccs_31_reset = reset;
  assign FP_multiplier_10ccs_31_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 2494:30]
  assign FP_multiplier_10ccs_31_io_in_b = io_in_b_31; // @[FloatingPointDesigns.scala 2495:30]
  assign FP_adder_13ccs_clock = clock;
  assign FP_adder_13ccs_reset = reset;
  assign FP_adder_13ccs_io_in_a = FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_io_in_b = FPReg_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_1_clock = clock;
  assign FP_adder_13ccs_1_reset = reset;
  assign FP_adder_13ccs_1_io_in_a = FP_multiplier_10ccs_1_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_1_io_in_b = FPReg_1_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_2_clock = clock;
  assign FP_adder_13ccs_2_reset = reset;
  assign FP_adder_13ccs_2_io_in_a = FP_multiplier_10ccs_2_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_2_io_in_b = FPReg_2_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_3_clock = clock;
  assign FP_adder_13ccs_3_reset = reset;
  assign FP_adder_13ccs_3_io_in_a = FP_multiplier_10ccs_3_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_3_io_in_b = FPReg_3_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_4_clock = clock;
  assign FP_adder_13ccs_4_reset = reset;
  assign FP_adder_13ccs_4_io_in_a = FP_multiplier_10ccs_4_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_4_io_in_b = FPReg_4_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_5_clock = clock;
  assign FP_adder_13ccs_5_reset = reset;
  assign FP_adder_13ccs_5_io_in_a = FP_multiplier_10ccs_5_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_5_io_in_b = FPReg_5_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_6_clock = clock;
  assign FP_adder_13ccs_6_reset = reset;
  assign FP_adder_13ccs_6_io_in_a = FP_multiplier_10ccs_6_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_6_io_in_b = FPReg_6_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_7_clock = clock;
  assign FP_adder_13ccs_7_reset = reset;
  assign FP_adder_13ccs_7_io_in_a = FP_multiplier_10ccs_7_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_7_io_in_b = FPReg_7_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_8_clock = clock;
  assign FP_adder_13ccs_8_reset = reset;
  assign FP_adder_13ccs_8_io_in_a = FP_multiplier_10ccs_8_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_8_io_in_b = FPReg_8_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_9_clock = clock;
  assign FP_adder_13ccs_9_reset = reset;
  assign FP_adder_13ccs_9_io_in_a = FP_multiplier_10ccs_9_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_9_io_in_b = FPReg_9_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_10_clock = clock;
  assign FP_adder_13ccs_10_reset = reset;
  assign FP_adder_13ccs_10_io_in_a = FP_multiplier_10ccs_10_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_10_io_in_b = FPReg_10_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_11_clock = clock;
  assign FP_adder_13ccs_11_reset = reset;
  assign FP_adder_13ccs_11_io_in_a = FP_multiplier_10ccs_11_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_11_io_in_b = FPReg_11_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_12_clock = clock;
  assign FP_adder_13ccs_12_reset = reset;
  assign FP_adder_13ccs_12_io_in_a = FP_multiplier_10ccs_12_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_12_io_in_b = FPReg_12_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_13_clock = clock;
  assign FP_adder_13ccs_13_reset = reset;
  assign FP_adder_13ccs_13_io_in_a = FP_multiplier_10ccs_13_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_13_io_in_b = FPReg_13_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_14_clock = clock;
  assign FP_adder_13ccs_14_reset = reset;
  assign FP_adder_13ccs_14_io_in_a = FP_multiplier_10ccs_14_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_14_io_in_b = FPReg_14_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_15_clock = clock;
  assign FP_adder_13ccs_15_reset = reset;
  assign FP_adder_13ccs_15_io_in_a = FP_multiplier_10ccs_15_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_15_io_in_b = FPReg_15_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_16_clock = clock;
  assign FP_adder_13ccs_16_reset = reset;
  assign FP_adder_13ccs_16_io_in_a = FP_multiplier_10ccs_16_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_16_io_in_b = FPReg_16_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_17_clock = clock;
  assign FP_adder_13ccs_17_reset = reset;
  assign FP_adder_13ccs_17_io_in_a = FP_multiplier_10ccs_17_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_17_io_in_b = FPReg_17_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_18_clock = clock;
  assign FP_adder_13ccs_18_reset = reset;
  assign FP_adder_13ccs_18_io_in_a = FP_multiplier_10ccs_18_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_18_io_in_b = FPReg_18_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_19_clock = clock;
  assign FP_adder_13ccs_19_reset = reset;
  assign FP_adder_13ccs_19_io_in_a = FP_multiplier_10ccs_19_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_19_io_in_b = FPReg_19_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_20_clock = clock;
  assign FP_adder_13ccs_20_reset = reset;
  assign FP_adder_13ccs_20_io_in_a = FP_multiplier_10ccs_20_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_20_io_in_b = FPReg_20_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_21_clock = clock;
  assign FP_adder_13ccs_21_reset = reset;
  assign FP_adder_13ccs_21_io_in_a = FP_multiplier_10ccs_21_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_21_io_in_b = FPReg_21_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_22_clock = clock;
  assign FP_adder_13ccs_22_reset = reset;
  assign FP_adder_13ccs_22_io_in_a = FP_multiplier_10ccs_22_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_22_io_in_b = FPReg_22_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_23_clock = clock;
  assign FP_adder_13ccs_23_reset = reset;
  assign FP_adder_13ccs_23_io_in_a = FP_multiplier_10ccs_23_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_23_io_in_b = FPReg_23_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_24_clock = clock;
  assign FP_adder_13ccs_24_reset = reset;
  assign FP_adder_13ccs_24_io_in_a = FP_multiplier_10ccs_24_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_24_io_in_b = FPReg_24_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_25_clock = clock;
  assign FP_adder_13ccs_25_reset = reset;
  assign FP_adder_13ccs_25_io_in_a = FP_multiplier_10ccs_25_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_25_io_in_b = FPReg_25_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_26_clock = clock;
  assign FP_adder_13ccs_26_reset = reset;
  assign FP_adder_13ccs_26_io_in_a = FP_multiplier_10ccs_26_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_26_io_in_b = FPReg_26_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_27_clock = clock;
  assign FP_adder_13ccs_27_reset = reset;
  assign FP_adder_13ccs_27_io_in_a = FP_multiplier_10ccs_27_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_27_io_in_b = FPReg_27_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_28_clock = clock;
  assign FP_adder_13ccs_28_reset = reset;
  assign FP_adder_13ccs_28_io_in_a = FP_multiplier_10ccs_28_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_28_io_in_b = FPReg_28_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_29_clock = clock;
  assign FP_adder_13ccs_29_reset = reset;
  assign FP_adder_13ccs_29_io_in_a = FP_multiplier_10ccs_29_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_29_io_in_b = FPReg_29_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_30_clock = clock;
  assign FP_adder_13ccs_30_reset = reset;
  assign FP_adder_13ccs_30_io_in_a = FP_multiplier_10ccs_30_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_30_io_in_b = FPReg_30_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FP_adder_13ccs_31_clock = clock;
  assign FP_adder_13ccs_31_reset = reset;
  assign FP_adder_13ccs_31_io_in_a = FP_multiplier_10ccs_31_io_out_s; // @[FloatingPointDesigns.scala 2497:27]
  assign FP_adder_13ccs_31_io_in_b = FPReg_31_io_out; // @[FloatingPointDesigns.scala 2498:27]
  assign FPReg_clock = clock;
  assign FPReg_reset = reset;
  assign FPReg_io_in = io_in_c_0; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_1_clock = clock;
  assign FPReg_1_reset = reset;
  assign FPReg_1_io_in = io_in_c_1; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_2_clock = clock;
  assign FPReg_2_reset = reset;
  assign FPReg_2_io_in = io_in_c_2; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_3_clock = clock;
  assign FPReg_3_reset = reset;
  assign FPReg_3_io_in = io_in_c_3; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_4_clock = clock;
  assign FPReg_4_reset = reset;
  assign FPReg_4_io_in = io_in_c_4; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_5_clock = clock;
  assign FPReg_5_reset = reset;
  assign FPReg_5_io_in = io_in_c_5; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_6_clock = clock;
  assign FPReg_6_reset = reset;
  assign FPReg_6_io_in = io_in_c_6; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_7_clock = clock;
  assign FPReg_7_reset = reset;
  assign FPReg_7_io_in = io_in_c_7; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_8_clock = clock;
  assign FPReg_8_reset = reset;
  assign FPReg_8_io_in = io_in_c_8; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_9_clock = clock;
  assign FPReg_9_reset = reset;
  assign FPReg_9_io_in = io_in_c_9; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_10_clock = clock;
  assign FPReg_10_reset = reset;
  assign FPReg_10_io_in = io_in_c_10; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_11_clock = clock;
  assign FPReg_11_reset = reset;
  assign FPReg_11_io_in = io_in_c_11; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_12_clock = clock;
  assign FPReg_12_reset = reset;
  assign FPReg_12_io_in = io_in_c_12; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_13_clock = clock;
  assign FPReg_13_reset = reset;
  assign FPReg_13_io_in = io_in_c_13; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_14_clock = clock;
  assign FPReg_14_reset = reset;
  assign FPReg_14_io_in = io_in_c_14; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_15_clock = clock;
  assign FPReg_15_reset = reset;
  assign FPReg_15_io_in = io_in_c_15; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_16_clock = clock;
  assign FPReg_16_reset = reset;
  assign FPReg_16_io_in = io_in_c_16; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_17_clock = clock;
  assign FPReg_17_reset = reset;
  assign FPReg_17_io_in = io_in_c_17; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_18_clock = clock;
  assign FPReg_18_reset = reset;
  assign FPReg_18_io_in = io_in_c_18; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_19_clock = clock;
  assign FPReg_19_reset = reset;
  assign FPReg_19_io_in = io_in_c_19; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_20_clock = clock;
  assign FPReg_20_reset = reset;
  assign FPReg_20_io_in = io_in_c_20; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_21_clock = clock;
  assign FPReg_21_reset = reset;
  assign FPReg_21_io_in = io_in_c_21; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_22_clock = clock;
  assign FPReg_22_reset = reset;
  assign FPReg_22_io_in = io_in_c_22; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_23_clock = clock;
  assign FPReg_23_reset = reset;
  assign FPReg_23_io_in = io_in_c_23; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_24_clock = clock;
  assign FPReg_24_reset = reset;
  assign FPReg_24_io_in = io_in_c_24; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_25_clock = clock;
  assign FPReg_25_reset = reset;
  assign FPReg_25_io_in = io_in_c_25; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_26_clock = clock;
  assign FPReg_26_reset = reset;
  assign FPReg_26_io_in = io_in_c_26; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_27_clock = clock;
  assign FPReg_27_reset = reset;
  assign FPReg_27_io_in = io_in_c_27; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_28_clock = clock;
  assign FPReg_28_reset = reset;
  assign FPReg_28_io_in = io_in_c_28; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_29_clock = clock;
  assign FPReg_29_reset = reset;
  assign FPReg_29_io_in = io_in_c_29; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_30_clock = clock;
  assign FPReg_30_reset = reset;
  assign FPReg_30_io_in = io_in_c_30; // @[FloatingPointDesigns.scala 2496:25]
  assign FPReg_31_clock = clock;
  assign FPReg_31_reset = reset;
  assign FPReg_31_io_in = io_in_c_31; // @[FloatingPointDesigns.scala 2496:25]
endmodule
module hh_datapath_1(
  input           io_clk,
  input           io_rst,
  input  [15:0]   io_hh_cnt,
  input           io_d1_rdy,
  input           io_d1_vld,
  input           io_d2_vld,
  input           io_vk1_vld,
  input           io_d3_rdy,
  input           io_d3_vld,
  input           io_tk_vld,
  input           io_d4_rdy,
  input           io_d5_rdy,
  input           io_d5_vld,
  input           io_yj_sft,
  input           io_d4_sft,
  input  [1023:0] io_hh_din,
  output [1023:0] io_hh_dout
);
`ifdef RANDOMIZE_REG_INIT
  reg [1023:0] _RAND_0;
  reg [54271:0] _RAND_1;
  reg [54271:0] _RAND_2;
  reg [54271:0] _RAND_3;
  reg [54271:0] _RAND_4;
  reg [1023:0] _RAND_5;
  reg [1023:0] _RAND_6;
  reg [1023:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [4063:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  wire  FP_DDOT_dp_clock; // @[hh_datapath_chisel.scala 248:21]
  wire  FP_DDOT_dp_reset; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_0; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_1; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_2; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_3; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_4; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_5; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_6; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_7; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_8; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_9; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_10; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_11; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_12; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_13; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_14; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_15; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_16; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_17; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_18; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_19; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_20; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_21; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_22; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_23; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_24; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_25; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_26; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_27; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_28; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_29; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_30; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_a_31; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_0; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_1; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_2; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_3; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_4; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_5; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_6; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_7; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_8; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_9; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_10; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_11; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_12; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_13; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_14; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_15; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_16; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_17; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_18; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_19; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_20; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_21; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_22; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_23; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_24; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_25; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_26; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_27; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_28; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_29; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_30; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_in_b_31; // @[hh_datapath_chisel.scala 248:21]
  wire [31:0] FP_DDOT_dp_io_out_s; // @[hh_datapath_chisel.scala 248:21]
  wire  FP_square_root_newfpu_clock; // @[hh_datapath_chisel.scala 256:22]
  wire  FP_square_root_newfpu_reset; // @[hh_datapath_chisel.scala 256:22]
  wire [31:0] FP_square_root_newfpu_io_in_a; // @[hh_datapath_chisel.scala 256:22]
  wire [31:0] FP_square_root_newfpu_io_out_s; // @[hh_datapath_chisel.scala 256:22]
  wire  hqr5_clock; // @[hh_datapath_chisel.scala 261:20]
  wire  hqr5_reset; // @[hh_datapath_chisel.scala 261:20]
  wire [31:0] hqr5_io_in_a; // @[hh_datapath_chisel.scala 261:20]
  wire [31:0] hqr5_io_in_b; // @[hh_datapath_chisel.scala 261:20]
  wire [31:0] hqr5_io_out_s; // @[hh_datapath_chisel.scala 261:20]
  wire  hqr7_clock; // @[hh_datapath_chisel.scala 266:20]
  wire  hqr7_reset; // @[hh_datapath_chisel.scala 266:20]
  wire [31:0] hqr7_io_in_a; // @[hh_datapath_chisel.scala 266:20]
  wire [31:0] hqr7_io_out_s; // @[hh_datapath_chisel.scala 266:20]
  wire  FP_multiplier_10ccs_clock; // @[hh_datapath_chisel.scala 270:21]
  wire  FP_multiplier_10ccs_reset; // @[hh_datapath_chisel.scala 270:21]
  wire [31:0] FP_multiplier_10ccs_io_in_a; // @[hh_datapath_chisel.scala 270:21]
  wire [31:0] FP_multiplier_10ccs_io_in_b; // @[hh_datapath_chisel.scala 270:21]
  wire [31:0] FP_multiplier_10ccs_io_out_s; // @[hh_datapath_chisel.scala 270:21]
  wire  axpy_dp_clock; // @[hh_datapath_chisel.scala 276:20]
  wire  axpy_dp_reset; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_a; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_0; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_1; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_2; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_3; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_4; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_5; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_6; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_7; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_8; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_9; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_10; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_11; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_12; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_13; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_14; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_15; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_16; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_17; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_18; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_19; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_20; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_21; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_22; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_23; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_24; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_25; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_26; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_27; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_28; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_29; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_30; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_b_31; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_0; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_1; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_2; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_3; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_4; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_5; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_6; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_7; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_8; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_9; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_10; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_11; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_12; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_13; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_14; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_15; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_16; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_17; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_18; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_19; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_20; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_21; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_22; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_23; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_24; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_25; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_26; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_27; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_28; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_29; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_30; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_in_c_31; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_0; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_1; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_2; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_3; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_4; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_5; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_6; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_7; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_8; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_9; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_10; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_11; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_12; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_13; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_14; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_15; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_16; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_17; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_18; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_19; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_20; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_21; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_22; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_23; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_24; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_25; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_26; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_27; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_28; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_29; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_30; // @[hh_datapath_chisel.scala 276:20]
  wire [31:0] axpy_dp_io_out_s_31; // @[hh_datapath_chisel.scala 276:20]
  reg [1023:0] yj0; // @[hh_datapath_chisel.scala 53:18]
  reg [54271:0] yj_reg_1; // @[hh_datapath_chisel.scala 54:23]
  reg [54271:0] yj_reg_2; // @[hh_datapath_chisel.scala 55:23]
  reg [54271:0] yj_reg_3; // @[hh_datapath_chisel.scala 56:23]
  reg [54271:0] yj_reg_4; // @[hh_datapath_chisel.scala 57:23]
  wire [55295:0] _yj_reg_4_T_1 = {yj_reg_3[1023:0],yj_reg_4}; // @[Cat.scala 31:58]
  wire [55295:0] _yj_reg_3_T_1 = {yj_reg_2[1023:0],yj_reg_3}; // @[Cat.scala 31:58]
  wire [55295:0] _yj_reg_2_T_1 = {yj_reg_1[1023:0],yj_reg_2}; // @[Cat.scala 31:58]
  wire [55295:0] _yj_reg_1_T = {io_hh_din,yj_reg_1}; // @[Cat.scala 31:58]
  reg [1023:0] ddot_din_a_reg; // @[hh_datapath_chisel.scala 82:29]
  reg [1023:0] ddot_din_b_reg; // @[hh_datapath_chisel.scala 83:29]
  reg [1023:0] vk_reg; // @[hh_datapath_chisel.scala 85:21]
  reg [31:0] d1_reg; // @[hh_datapath_chisel.scala 86:21]
  reg [31:0] d3_reg; // @[hh_datapath_chisel.scala 87:21]
  reg [31:0] d4_update; // @[hh_datapath_chisel.scala 93:24]
  reg [31:0] x1_reg; // @[hh_datapath_chisel.scala 102:21]
  reg [31:0] d2_reg; // @[hh_datapath_chisel.scala 103:21]
  reg [31:0] vk1_reg; // @[hh_datapath_chisel.scala 104:22]
  reg [31:0] tk_reg; // @[hh_datapath_chisel.scala 105:21]
  reg [31:0] d4_reg; // @[hh_datapath_chisel.scala 106:21]
  reg [31:0] d5_reg; // @[hh_datapath_chisel.scala 107:21]
  wire [31:0] vk1_update = hqr5_io_out_s; // @[hh_datapath_chisel.scala 264:15 91:26]
  wire [31:0] vk1 = io_vk1_vld ? vk1_update : vk1_reg; // @[hh_datapath_chisel.scala 195:21 196:11 198:11]
  wire [15:0] _myNewVec_31_T_1 = io_hh_cnt + 16'h1; // @[hh_datapath_chisel.scala 234:55]
  wire [16:0] _myNewVec_31_T_2 = {{1'd0}, _myNewVec_31_T_1}; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] myVec_31 = io_hh_din[31:0]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_30 = io_hh_din[63:32]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_29 = io_hh_din[95:64]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_28 = io_hh_din[127:96]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_27 = io_hh_din[159:128]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_26 = io_hh_din[191:160]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_25 = io_hh_din[223:192]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_24 = io_hh_din[255:224]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_23 = io_hh_din[287:256]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_22 = io_hh_din[319:288]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_21 = io_hh_din[351:320]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_20 = io_hh_din[383:352]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_19 = io_hh_din[415:384]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_18 = io_hh_din[447:416]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_17 = io_hh_din[479:448]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_16 = io_hh_din[511:480]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_15 = io_hh_din[543:512]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_14 = io_hh_din[575:544]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_13 = io_hh_din[607:576]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_12 = io_hh_din[639:608]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_11 = io_hh_din[671:640]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_10 = io_hh_din[703:672]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_9 = io_hh_din[735:704]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_8 = io_hh_din[767:736]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_7 = io_hh_din[799:768]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_6 = io_hh_din[831:800]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_5 = io_hh_din[863:832]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_4 = io_hh_din[895:864]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_3 = io_hh_din[927:896]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_2 = io_hh_din[959:928]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_1 = io_hh_din[991:960]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] myVec_0 = io_hh_din[1023:992]; // @[hh_datapath_chisel.scala 221:28]
  wire [31:0] _GEN_75 = 5'h1 == _myNewVec_31_T_2[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_76 = 5'h2 == _myNewVec_31_T_2[4:0] ? myVec_2 : _GEN_75; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_77 = 5'h3 == _myNewVec_31_T_2[4:0] ? myVec_3 : _GEN_76; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_78 = 5'h4 == _myNewVec_31_T_2[4:0] ? myVec_4 : _GEN_77; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_79 = 5'h5 == _myNewVec_31_T_2[4:0] ? myVec_5 : _GEN_78; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_80 = 5'h6 == _myNewVec_31_T_2[4:0] ? myVec_6 : _GEN_79; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_81 = 5'h7 == _myNewVec_31_T_2[4:0] ? myVec_7 : _GEN_80; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_82 = 5'h8 == _myNewVec_31_T_2[4:0] ? myVec_8 : _GEN_81; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_83 = 5'h9 == _myNewVec_31_T_2[4:0] ? myVec_9 : _GEN_82; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_84 = 5'ha == _myNewVec_31_T_2[4:0] ? myVec_10 : _GEN_83; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_85 = 5'hb == _myNewVec_31_T_2[4:0] ? myVec_11 : _GEN_84; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_86 = 5'hc == _myNewVec_31_T_2[4:0] ? myVec_12 : _GEN_85; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_87 = 5'hd == _myNewVec_31_T_2[4:0] ? myVec_13 : _GEN_86; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_88 = 5'he == _myNewVec_31_T_2[4:0] ? myVec_14 : _GEN_87; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_89 = 5'hf == _myNewVec_31_T_2[4:0] ? myVec_15 : _GEN_88; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_90 = 5'h10 == _myNewVec_31_T_2[4:0] ? myVec_16 : _GEN_89; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_91 = 5'h11 == _myNewVec_31_T_2[4:0] ? myVec_17 : _GEN_90; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_92 = 5'h12 == _myNewVec_31_T_2[4:0] ? myVec_18 : _GEN_91; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_93 = 5'h13 == _myNewVec_31_T_2[4:0] ? myVec_19 : _GEN_92; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_94 = 5'h14 == _myNewVec_31_T_2[4:0] ? myVec_20 : _GEN_93; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_95 = 5'h15 == _myNewVec_31_T_2[4:0] ? myVec_21 : _GEN_94; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_96 = 5'h16 == _myNewVec_31_T_2[4:0] ? myVec_22 : _GEN_95; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_97 = 5'h17 == _myNewVec_31_T_2[4:0] ? myVec_23 : _GEN_96; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_98 = 5'h18 == _myNewVec_31_T_2[4:0] ? myVec_24 : _GEN_97; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_99 = 5'h19 == _myNewVec_31_T_2[4:0] ? myVec_25 : _GEN_98; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_100 = 5'h1a == _myNewVec_31_T_2[4:0] ? myVec_26 : _GEN_99; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_101 = 5'h1b == _myNewVec_31_T_2[4:0] ? myVec_27 : _GEN_100; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_102 = 5'h1c == _myNewVec_31_T_2[4:0] ? myVec_28 : _GEN_101; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_103 = 5'h1d == _myNewVec_31_T_2[4:0] ? myVec_29 : _GEN_102; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_104 = 5'h1e == _myNewVec_31_T_2[4:0] ? myVec_30 : _GEN_103; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_31 = 5'h1f == _myNewVec_31_T_2[4:0] ? myVec_31 : _GEN_104; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_30_T_3 = _myNewVec_31_T_1 + 16'h1; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_107 = 5'h1 == _myNewVec_30_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_108 = 5'h2 == _myNewVec_30_T_3[4:0] ? myVec_2 : _GEN_107; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_109 = 5'h3 == _myNewVec_30_T_3[4:0] ? myVec_3 : _GEN_108; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_110 = 5'h4 == _myNewVec_30_T_3[4:0] ? myVec_4 : _GEN_109; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_111 = 5'h5 == _myNewVec_30_T_3[4:0] ? myVec_5 : _GEN_110; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_112 = 5'h6 == _myNewVec_30_T_3[4:0] ? myVec_6 : _GEN_111; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_113 = 5'h7 == _myNewVec_30_T_3[4:0] ? myVec_7 : _GEN_112; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_114 = 5'h8 == _myNewVec_30_T_3[4:0] ? myVec_8 : _GEN_113; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_115 = 5'h9 == _myNewVec_30_T_3[4:0] ? myVec_9 : _GEN_114; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_116 = 5'ha == _myNewVec_30_T_3[4:0] ? myVec_10 : _GEN_115; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_117 = 5'hb == _myNewVec_30_T_3[4:0] ? myVec_11 : _GEN_116; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_118 = 5'hc == _myNewVec_30_T_3[4:0] ? myVec_12 : _GEN_117; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_119 = 5'hd == _myNewVec_30_T_3[4:0] ? myVec_13 : _GEN_118; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_120 = 5'he == _myNewVec_30_T_3[4:0] ? myVec_14 : _GEN_119; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_121 = 5'hf == _myNewVec_30_T_3[4:0] ? myVec_15 : _GEN_120; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_122 = 5'h10 == _myNewVec_30_T_3[4:0] ? myVec_16 : _GEN_121; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_123 = 5'h11 == _myNewVec_30_T_3[4:0] ? myVec_17 : _GEN_122; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_124 = 5'h12 == _myNewVec_30_T_3[4:0] ? myVec_18 : _GEN_123; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_125 = 5'h13 == _myNewVec_30_T_3[4:0] ? myVec_19 : _GEN_124; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_126 = 5'h14 == _myNewVec_30_T_3[4:0] ? myVec_20 : _GEN_125; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_127 = 5'h15 == _myNewVec_30_T_3[4:0] ? myVec_21 : _GEN_126; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_128 = 5'h16 == _myNewVec_30_T_3[4:0] ? myVec_22 : _GEN_127; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_129 = 5'h17 == _myNewVec_30_T_3[4:0] ? myVec_23 : _GEN_128; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_130 = 5'h18 == _myNewVec_30_T_3[4:0] ? myVec_24 : _GEN_129; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_131 = 5'h19 == _myNewVec_30_T_3[4:0] ? myVec_25 : _GEN_130; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_132 = 5'h1a == _myNewVec_30_T_3[4:0] ? myVec_26 : _GEN_131; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_133 = 5'h1b == _myNewVec_30_T_3[4:0] ? myVec_27 : _GEN_132; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_134 = 5'h1c == _myNewVec_30_T_3[4:0] ? myVec_28 : _GEN_133; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_135 = 5'h1d == _myNewVec_30_T_3[4:0] ? myVec_29 : _GEN_134; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_136 = 5'h1e == _myNewVec_30_T_3[4:0] ? myVec_30 : _GEN_135; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_30 = 5'h1f == _myNewVec_30_T_3[4:0] ? myVec_31 : _GEN_136; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_29_T_3 = _myNewVec_31_T_1 + 16'h2; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_139 = 5'h1 == _myNewVec_29_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_140 = 5'h2 == _myNewVec_29_T_3[4:0] ? myVec_2 : _GEN_139; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_141 = 5'h3 == _myNewVec_29_T_3[4:0] ? myVec_3 : _GEN_140; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_142 = 5'h4 == _myNewVec_29_T_3[4:0] ? myVec_4 : _GEN_141; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_143 = 5'h5 == _myNewVec_29_T_3[4:0] ? myVec_5 : _GEN_142; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_144 = 5'h6 == _myNewVec_29_T_3[4:0] ? myVec_6 : _GEN_143; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_145 = 5'h7 == _myNewVec_29_T_3[4:0] ? myVec_7 : _GEN_144; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_146 = 5'h8 == _myNewVec_29_T_3[4:0] ? myVec_8 : _GEN_145; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_147 = 5'h9 == _myNewVec_29_T_3[4:0] ? myVec_9 : _GEN_146; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_148 = 5'ha == _myNewVec_29_T_3[4:0] ? myVec_10 : _GEN_147; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_149 = 5'hb == _myNewVec_29_T_3[4:0] ? myVec_11 : _GEN_148; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_150 = 5'hc == _myNewVec_29_T_3[4:0] ? myVec_12 : _GEN_149; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_151 = 5'hd == _myNewVec_29_T_3[4:0] ? myVec_13 : _GEN_150; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_152 = 5'he == _myNewVec_29_T_3[4:0] ? myVec_14 : _GEN_151; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_153 = 5'hf == _myNewVec_29_T_3[4:0] ? myVec_15 : _GEN_152; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_154 = 5'h10 == _myNewVec_29_T_3[4:0] ? myVec_16 : _GEN_153; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_155 = 5'h11 == _myNewVec_29_T_3[4:0] ? myVec_17 : _GEN_154; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_156 = 5'h12 == _myNewVec_29_T_3[4:0] ? myVec_18 : _GEN_155; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_157 = 5'h13 == _myNewVec_29_T_3[4:0] ? myVec_19 : _GEN_156; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_158 = 5'h14 == _myNewVec_29_T_3[4:0] ? myVec_20 : _GEN_157; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_159 = 5'h15 == _myNewVec_29_T_3[4:0] ? myVec_21 : _GEN_158; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_160 = 5'h16 == _myNewVec_29_T_3[4:0] ? myVec_22 : _GEN_159; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_161 = 5'h17 == _myNewVec_29_T_3[4:0] ? myVec_23 : _GEN_160; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_162 = 5'h18 == _myNewVec_29_T_3[4:0] ? myVec_24 : _GEN_161; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_163 = 5'h19 == _myNewVec_29_T_3[4:0] ? myVec_25 : _GEN_162; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_164 = 5'h1a == _myNewVec_29_T_3[4:0] ? myVec_26 : _GEN_163; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_165 = 5'h1b == _myNewVec_29_T_3[4:0] ? myVec_27 : _GEN_164; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_166 = 5'h1c == _myNewVec_29_T_3[4:0] ? myVec_28 : _GEN_165; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_167 = 5'h1d == _myNewVec_29_T_3[4:0] ? myVec_29 : _GEN_166; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_168 = 5'h1e == _myNewVec_29_T_3[4:0] ? myVec_30 : _GEN_167; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_29 = 5'h1f == _myNewVec_29_T_3[4:0] ? myVec_31 : _GEN_168; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_28_T_3 = _myNewVec_31_T_1 + 16'h3; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_171 = 5'h1 == _myNewVec_28_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_172 = 5'h2 == _myNewVec_28_T_3[4:0] ? myVec_2 : _GEN_171; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_173 = 5'h3 == _myNewVec_28_T_3[4:0] ? myVec_3 : _GEN_172; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_174 = 5'h4 == _myNewVec_28_T_3[4:0] ? myVec_4 : _GEN_173; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_175 = 5'h5 == _myNewVec_28_T_3[4:0] ? myVec_5 : _GEN_174; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_176 = 5'h6 == _myNewVec_28_T_3[4:0] ? myVec_6 : _GEN_175; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_177 = 5'h7 == _myNewVec_28_T_3[4:0] ? myVec_7 : _GEN_176; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_178 = 5'h8 == _myNewVec_28_T_3[4:0] ? myVec_8 : _GEN_177; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_179 = 5'h9 == _myNewVec_28_T_3[4:0] ? myVec_9 : _GEN_178; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_180 = 5'ha == _myNewVec_28_T_3[4:0] ? myVec_10 : _GEN_179; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_181 = 5'hb == _myNewVec_28_T_3[4:0] ? myVec_11 : _GEN_180; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_182 = 5'hc == _myNewVec_28_T_3[4:0] ? myVec_12 : _GEN_181; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_183 = 5'hd == _myNewVec_28_T_3[4:0] ? myVec_13 : _GEN_182; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_184 = 5'he == _myNewVec_28_T_3[4:0] ? myVec_14 : _GEN_183; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_185 = 5'hf == _myNewVec_28_T_3[4:0] ? myVec_15 : _GEN_184; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_186 = 5'h10 == _myNewVec_28_T_3[4:0] ? myVec_16 : _GEN_185; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_187 = 5'h11 == _myNewVec_28_T_3[4:0] ? myVec_17 : _GEN_186; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_188 = 5'h12 == _myNewVec_28_T_3[4:0] ? myVec_18 : _GEN_187; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_189 = 5'h13 == _myNewVec_28_T_3[4:0] ? myVec_19 : _GEN_188; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_190 = 5'h14 == _myNewVec_28_T_3[4:0] ? myVec_20 : _GEN_189; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_191 = 5'h15 == _myNewVec_28_T_3[4:0] ? myVec_21 : _GEN_190; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_192 = 5'h16 == _myNewVec_28_T_3[4:0] ? myVec_22 : _GEN_191; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_193 = 5'h17 == _myNewVec_28_T_3[4:0] ? myVec_23 : _GEN_192; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_194 = 5'h18 == _myNewVec_28_T_3[4:0] ? myVec_24 : _GEN_193; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_195 = 5'h19 == _myNewVec_28_T_3[4:0] ? myVec_25 : _GEN_194; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_196 = 5'h1a == _myNewVec_28_T_3[4:0] ? myVec_26 : _GEN_195; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_197 = 5'h1b == _myNewVec_28_T_3[4:0] ? myVec_27 : _GEN_196; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_198 = 5'h1c == _myNewVec_28_T_3[4:0] ? myVec_28 : _GEN_197; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_199 = 5'h1d == _myNewVec_28_T_3[4:0] ? myVec_29 : _GEN_198; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_200 = 5'h1e == _myNewVec_28_T_3[4:0] ? myVec_30 : _GEN_199; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_28 = 5'h1f == _myNewVec_28_T_3[4:0] ? myVec_31 : _GEN_200; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_27_T_3 = _myNewVec_31_T_1 + 16'h4; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_203 = 5'h1 == _myNewVec_27_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_204 = 5'h2 == _myNewVec_27_T_3[4:0] ? myVec_2 : _GEN_203; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_205 = 5'h3 == _myNewVec_27_T_3[4:0] ? myVec_3 : _GEN_204; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_206 = 5'h4 == _myNewVec_27_T_3[4:0] ? myVec_4 : _GEN_205; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_207 = 5'h5 == _myNewVec_27_T_3[4:0] ? myVec_5 : _GEN_206; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_208 = 5'h6 == _myNewVec_27_T_3[4:0] ? myVec_6 : _GEN_207; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_209 = 5'h7 == _myNewVec_27_T_3[4:0] ? myVec_7 : _GEN_208; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_210 = 5'h8 == _myNewVec_27_T_3[4:0] ? myVec_8 : _GEN_209; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_211 = 5'h9 == _myNewVec_27_T_3[4:0] ? myVec_9 : _GEN_210; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_212 = 5'ha == _myNewVec_27_T_3[4:0] ? myVec_10 : _GEN_211; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_213 = 5'hb == _myNewVec_27_T_3[4:0] ? myVec_11 : _GEN_212; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_214 = 5'hc == _myNewVec_27_T_3[4:0] ? myVec_12 : _GEN_213; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_215 = 5'hd == _myNewVec_27_T_3[4:0] ? myVec_13 : _GEN_214; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_216 = 5'he == _myNewVec_27_T_3[4:0] ? myVec_14 : _GEN_215; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_217 = 5'hf == _myNewVec_27_T_3[4:0] ? myVec_15 : _GEN_216; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_218 = 5'h10 == _myNewVec_27_T_3[4:0] ? myVec_16 : _GEN_217; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_219 = 5'h11 == _myNewVec_27_T_3[4:0] ? myVec_17 : _GEN_218; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_220 = 5'h12 == _myNewVec_27_T_3[4:0] ? myVec_18 : _GEN_219; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_221 = 5'h13 == _myNewVec_27_T_3[4:0] ? myVec_19 : _GEN_220; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_222 = 5'h14 == _myNewVec_27_T_3[4:0] ? myVec_20 : _GEN_221; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_223 = 5'h15 == _myNewVec_27_T_3[4:0] ? myVec_21 : _GEN_222; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_224 = 5'h16 == _myNewVec_27_T_3[4:0] ? myVec_22 : _GEN_223; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_225 = 5'h17 == _myNewVec_27_T_3[4:0] ? myVec_23 : _GEN_224; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_226 = 5'h18 == _myNewVec_27_T_3[4:0] ? myVec_24 : _GEN_225; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_227 = 5'h19 == _myNewVec_27_T_3[4:0] ? myVec_25 : _GEN_226; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_228 = 5'h1a == _myNewVec_27_T_3[4:0] ? myVec_26 : _GEN_227; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_229 = 5'h1b == _myNewVec_27_T_3[4:0] ? myVec_27 : _GEN_228; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_230 = 5'h1c == _myNewVec_27_T_3[4:0] ? myVec_28 : _GEN_229; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_231 = 5'h1d == _myNewVec_27_T_3[4:0] ? myVec_29 : _GEN_230; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_232 = 5'h1e == _myNewVec_27_T_3[4:0] ? myVec_30 : _GEN_231; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_27 = 5'h1f == _myNewVec_27_T_3[4:0] ? myVec_31 : _GEN_232; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_26_T_3 = _myNewVec_31_T_1 + 16'h5; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_235 = 5'h1 == _myNewVec_26_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_236 = 5'h2 == _myNewVec_26_T_3[4:0] ? myVec_2 : _GEN_235; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_237 = 5'h3 == _myNewVec_26_T_3[4:0] ? myVec_3 : _GEN_236; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_238 = 5'h4 == _myNewVec_26_T_3[4:0] ? myVec_4 : _GEN_237; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_239 = 5'h5 == _myNewVec_26_T_3[4:0] ? myVec_5 : _GEN_238; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_240 = 5'h6 == _myNewVec_26_T_3[4:0] ? myVec_6 : _GEN_239; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_241 = 5'h7 == _myNewVec_26_T_3[4:0] ? myVec_7 : _GEN_240; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_242 = 5'h8 == _myNewVec_26_T_3[4:0] ? myVec_8 : _GEN_241; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_243 = 5'h9 == _myNewVec_26_T_3[4:0] ? myVec_9 : _GEN_242; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_244 = 5'ha == _myNewVec_26_T_3[4:0] ? myVec_10 : _GEN_243; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_245 = 5'hb == _myNewVec_26_T_3[4:0] ? myVec_11 : _GEN_244; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_246 = 5'hc == _myNewVec_26_T_3[4:0] ? myVec_12 : _GEN_245; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_247 = 5'hd == _myNewVec_26_T_3[4:0] ? myVec_13 : _GEN_246; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_248 = 5'he == _myNewVec_26_T_3[4:0] ? myVec_14 : _GEN_247; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_249 = 5'hf == _myNewVec_26_T_3[4:0] ? myVec_15 : _GEN_248; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_250 = 5'h10 == _myNewVec_26_T_3[4:0] ? myVec_16 : _GEN_249; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_251 = 5'h11 == _myNewVec_26_T_3[4:0] ? myVec_17 : _GEN_250; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_252 = 5'h12 == _myNewVec_26_T_3[4:0] ? myVec_18 : _GEN_251; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_253 = 5'h13 == _myNewVec_26_T_3[4:0] ? myVec_19 : _GEN_252; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_254 = 5'h14 == _myNewVec_26_T_3[4:0] ? myVec_20 : _GEN_253; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_255 = 5'h15 == _myNewVec_26_T_3[4:0] ? myVec_21 : _GEN_254; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_256 = 5'h16 == _myNewVec_26_T_3[4:0] ? myVec_22 : _GEN_255; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_257 = 5'h17 == _myNewVec_26_T_3[4:0] ? myVec_23 : _GEN_256; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_258 = 5'h18 == _myNewVec_26_T_3[4:0] ? myVec_24 : _GEN_257; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_259 = 5'h19 == _myNewVec_26_T_3[4:0] ? myVec_25 : _GEN_258; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_260 = 5'h1a == _myNewVec_26_T_3[4:0] ? myVec_26 : _GEN_259; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_261 = 5'h1b == _myNewVec_26_T_3[4:0] ? myVec_27 : _GEN_260; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_262 = 5'h1c == _myNewVec_26_T_3[4:0] ? myVec_28 : _GEN_261; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_263 = 5'h1d == _myNewVec_26_T_3[4:0] ? myVec_29 : _GEN_262; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_264 = 5'h1e == _myNewVec_26_T_3[4:0] ? myVec_30 : _GEN_263; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_26 = 5'h1f == _myNewVec_26_T_3[4:0] ? myVec_31 : _GEN_264; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_25_T_3 = _myNewVec_31_T_1 + 16'h6; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_267 = 5'h1 == _myNewVec_25_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_268 = 5'h2 == _myNewVec_25_T_3[4:0] ? myVec_2 : _GEN_267; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_269 = 5'h3 == _myNewVec_25_T_3[4:0] ? myVec_3 : _GEN_268; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_270 = 5'h4 == _myNewVec_25_T_3[4:0] ? myVec_4 : _GEN_269; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_271 = 5'h5 == _myNewVec_25_T_3[4:0] ? myVec_5 : _GEN_270; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_272 = 5'h6 == _myNewVec_25_T_3[4:0] ? myVec_6 : _GEN_271; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_273 = 5'h7 == _myNewVec_25_T_3[4:0] ? myVec_7 : _GEN_272; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_274 = 5'h8 == _myNewVec_25_T_3[4:0] ? myVec_8 : _GEN_273; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_275 = 5'h9 == _myNewVec_25_T_3[4:0] ? myVec_9 : _GEN_274; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_276 = 5'ha == _myNewVec_25_T_3[4:0] ? myVec_10 : _GEN_275; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_277 = 5'hb == _myNewVec_25_T_3[4:0] ? myVec_11 : _GEN_276; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_278 = 5'hc == _myNewVec_25_T_3[4:0] ? myVec_12 : _GEN_277; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_279 = 5'hd == _myNewVec_25_T_3[4:0] ? myVec_13 : _GEN_278; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_280 = 5'he == _myNewVec_25_T_3[4:0] ? myVec_14 : _GEN_279; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_281 = 5'hf == _myNewVec_25_T_3[4:0] ? myVec_15 : _GEN_280; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_282 = 5'h10 == _myNewVec_25_T_3[4:0] ? myVec_16 : _GEN_281; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_283 = 5'h11 == _myNewVec_25_T_3[4:0] ? myVec_17 : _GEN_282; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_284 = 5'h12 == _myNewVec_25_T_3[4:0] ? myVec_18 : _GEN_283; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_285 = 5'h13 == _myNewVec_25_T_3[4:0] ? myVec_19 : _GEN_284; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_286 = 5'h14 == _myNewVec_25_T_3[4:0] ? myVec_20 : _GEN_285; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_287 = 5'h15 == _myNewVec_25_T_3[4:0] ? myVec_21 : _GEN_286; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_288 = 5'h16 == _myNewVec_25_T_3[4:0] ? myVec_22 : _GEN_287; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_289 = 5'h17 == _myNewVec_25_T_3[4:0] ? myVec_23 : _GEN_288; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_290 = 5'h18 == _myNewVec_25_T_3[4:0] ? myVec_24 : _GEN_289; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_291 = 5'h19 == _myNewVec_25_T_3[4:0] ? myVec_25 : _GEN_290; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_292 = 5'h1a == _myNewVec_25_T_3[4:0] ? myVec_26 : _GEN_291; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_293 = 5'h1b == _myNewVec_25_T_3[4:0] ? myVec_27 : _GEN_292; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_294 = 5'h1c == _myNewVec_25_T_3[4:0] ? myVec_28 : _GEN_293; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_295 = 5'h1d == _myNewVec_25_T_3[4:0] ? myVec_29 : _GEN_294; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_296 = 5'h1e == _myNewVec_25_T_3[4:0] ? myVec_30 : _GEN_295; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_25 = 5'h1f == _myNewVec_25_T_3[4:0] ? myVec_31 : _GEN_296; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_24_T_3 = _myNewVec_31_T_1 + 16'h7; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_299 = 5'h1 == _myNewVec_24_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_300 = 5'h2 == _myNewVec_24_T_3[4:0] ? myVec_2 : _GEN_299; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_301 = 5'h3 == _myNewVec_24_T_3[4:0] ? myVec_3 : _GEN_300; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_302 = 5'h4 == _myNewVec_24_T_3[4:0] ? myVec_4 : _GEN_301; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_303 = 5'h5 == _myNewVec_24_T_3[4:0] ? myVec_5 : _GEN_302; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_304 = 5'h6 == _myNewVec_24_T_3[4:0] ? myVec_6 : _GEN_303; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_305 = 5'h7 == _myNewVec_24_T_3[4:0] ? myVec_7 : _GEN_304; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_306 = 5'h8 == _myNewVec_24_T_3[4:0] ? myVec_8 : _GEN_305; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_307 = 5'h9 == _myNewVec_24_T_3[4:0] ? myVec_9 : _GEN_306; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_308 = 5'ha == _myNewVec_24_T_3[4:0] ? myVec_10 : _GEN_307; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_309 = 5'hb == _myNewVec_24_T_3[4:0] ? myVec_11 : _GEN_308; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_310 = 5'hc == _myNewVec_24_T_3[4:0] ? myVec_12 : _GEN_309; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_311 = 5'hd == _myNewVec_24_T_3[4:0] ? myVec_13 : _GEN_310; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_312 = 5'he == _myNewVec_24_T_3[4:0] ? myVec_14 : _GEN_311; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_313 = 5'hf == _myNewVec_24_T_3[4:0] ? myVec_15 : _GEN_312; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_314 = 5'h10 == _myNewVec_24_T_3[4:0] ? myVec_16 : _GEN_313; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_315 = 5'h11 == _myNewVec_24_T_3[4:0] ? myVec_17 : _GEN_314; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_316 = 5'h12 == _myNewVec_24_T_3[4:0] ? myVec_18 : _GEN_315; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_317 = 5'h13 == _myNewVec_24_T_3[4:0] ? myVec_19 : _GEN_316; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_318 = 5'h14 == _myNewVec_24_T_3[4:0] ? myVec_20 : _GEN_317; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_319 = 5'h15 == _myNewVec_24_T_3[4:0] ? myVec_21 : _GEN_318; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_320 = 5'h16 == _myNewVec_24_T_3[4:0] ? myVec_22 : _GEN_319; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_321 = 5'h17 == _myNewVec_24_T_3[4:0] ? myVec_23 : _GEN_320; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_322 = 5'h18 == _myNewVec_24_T_3[4:0] ? myVec_24 : _GEN_321; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_323 = 5'h19 == _myNewVec_24_T_3[4:0] ? myVec_25 : _GEN_322; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_324 = 5'h1a == _myNewVec_24_T_3[4:0] ? myVec_26 : _GEN_323; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_325 = 5'h1b == _myNewVec_24_T_3[4:0] ? myVec_27 : _GEN_324; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_326 = 5'h1c == _myNewVec_24_T_3[4:0] ? myVec_28 : _GEN_325; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_327 = 5'h1d == _myNewVec_24_T_3[4:0] ? myVec_29 : _GEN_326; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_328 = 5'h1e == _myNewVec_24_T_3[4:0] ? myVec_30 : _GEN_327; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_24 = 5'h1f == _myNewVec_24_T_3[4:0] ? myVec_31 : _GEN_328; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_23_T_3 = _myNewVec_31_T_1 + 16'h8; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_331 = 5'h1 == _myNewVec_23_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_332 = 5'h2 == _myNewVec_23_T_3[4:0] ? myVec_2 : _GEN_331; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_333 = 5'h3 == _myNewVec_23_T_3[4:0] ? myVec_3 : _GEN_332; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_334 = 5'h4 == _myNewVec_23_T_3[4:0] ? myVec_4 : _GEN_333; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_335 = 5'h5 == _myNewVec_23_T_3[4:0] ? myVec_5 : _GEN_334; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_336 = 5'h6 == _myNewVec_23_T_3[4:0] ? myVec_6 : _GEN_335; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_337 = 5'h7 == _myNewVec_23_T_3[4:0] ? myVec_7 : _GEN_336; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_338 = 5'h8 == _myNewVec_23_T_3[4:0] ? myVec_8 : _GEN_337; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_339 = 5'h9 == _myNewVec_23_T_3[4:0] ? myVec_9 : _GEN_338; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_340 = 5'ha == _myNewVec_23_T_3[4:0] ? myVec_10 : _GEN_339; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_341 = 5'hb == _myNewVec_23_T_3[4:0] ? myVec_11 : _GEN_340; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_342 = 5'hc == _myNewVec_23_T_3[4:0] ? myVec_12 : _GEN_341; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_343 = 5'hd == _myNewVec_23_T_3[4:0] ? myVec_13 : _GEN_342; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_344 = 5'he == _myNewVec_23_T_3[4:0] ? myVec_14 : _GEN_343; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_345 = 5'hf == _myNewVec_23_T_3[4:0] ? myVec_15 : _GEN_344; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_346 = 5'h10 == _myNewVec_23_T_3[4:0] ? myVec_16 : _GEN_345; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_347 = 5'h11 == _myNewVec_23_T_3[4:0] ? myVec_17 : _GEN_346; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_348 = 5'h12 == _myNewVec_23_T_3[4:0] ? myVec_18 : _GEN_347; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_349 = 5'h13 == _myNewVec_23_T_3[4:0] ? myVec_19 : _GEN_348; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_350 = 5'h14 == _myNewVec_23_T_3[4:0] ? myVec_20 : _GEN_349; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_351 = 5'h15 == _myNewVec_23_T_3[4:0] ? myVec_21 : _GEN_350; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_352 = 5'h16 == _myNewVec_23_T_3[4:0] ? myVec_22 : _GEN_351; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_353 = 5'h17 == _myNewVec_23_T_3[4:0] ? myVec_23 : _GEN_352; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_354 = 5'h18 == _myNewVec_23_T_3[4:0] ? myVec_24 : _GEN_353; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_355 = 5'h19 == _myNewVec_23_T_3[4:0] ? myVec_25 : _GEN_354; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_356 = 5'h1a == _myNewVec_23_T_3[4:0] ? myVec_26 : _GEN_355; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_357 = 5'h1b == _myNewVec_23_T_3[4:0] ? myVec_27 : _GEN_356; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_358 = 5'h1c == _myNewVec_23_T_3[4:0] ? myVec_28 : _GEN_357; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_359 = 5'h1d == _myNewVec_23_T_3[4:0] ? myVec_29 : _GEN_358; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_360 = 5'h1e == _myNewVec_23_T_3[4:0] ? myVec_30 : _GEN_359; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_23 = 5'h1f == _myNewVec_23_T_3[4:0] ? myVec_31 : _GEN_360; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_22_T_3 = _myNewVec_31_T_1 + 16'h9; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_363 = 5'h1 == _myNewVec_22_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_364 = 5'h2 == _myNewVec_22_T_3[4:0] ? myVec_2 : _GEN_363; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_365 = 5'h3 == _myNewVec_22_T_3[4:0] ? myVec_3 : _GEN_364; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_366 = 5'h4 == _myNewVec_22_T_3[4:0] ? myVec_4 : _GEN_365; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_367 = 5'h5 == _myNewVec_22_T_3[4:0] ? myVec_5 : _GEN_366; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_368 = 5'h6 == _myNewVec_22_T_3[4:0] ? myVec_6 : _GEN_367; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_369 = 5'h7 == _myNewVec_22_T_3[4:0] ? myVec_7 : _GEN_368; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_370 = 5'h8 == _myNewVec_22_T_3[4:0] ? myVec_8 : _GEN_369; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_371 = 5'h9 == _myNewVec_22_T_3[4:0] ? myVec_9 : _GEN_370; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_372 = 5'ha == _myNewVec_22_T_3[4:0] ? myVec_10 : _GEN_371; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_373 = 5'hb == _myNewVec_22_T_3[4:0] ? myVec_11 : _GEN_372; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_374 = 5'hc == _myNewVec_22_T_3[4:0] ? myVec_12 : _GEN_373; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_375 = 5'hd == _myNewVec_22_T_3[4:0] ? myVec_13 : _GEN_374; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_376 = 5'he == _myNewVec_22_T_3[4:0] ? myVec_14 : _GEN_375; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_377 = 5'hf == _myNewVec_22_T_3[4:0] ? myVec_15 : _GEN_376; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_378 = 5'h10 == _myNewVec_22_T_3[4:0] ? myVec_16 : _GEN_377; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_379 = 5'h11 == _myNewVec_22_T_3[4:0] ? myVec_17 : _GEN_378; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_380 = 5'h12 == _myNewVec_22_T_3[4:0] ? myVec_18 : _GEN_379; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_381 = 5'h13 == _myNewVec_22_T_3[4:0] ? myVec_19 : _GEN_380; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_382 = 5'h14 == _myNewVec_22_T_3[4:0] ? myVec_20 : _GEN_381; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_383 = 5'h15 == _myNewVec_22_T_3[4:0] ? myVec_21 : _GEN_382; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_384 = 5'h16 == _myNewVec_22_T_3[4:0] ? myVec_22 : _GEN_383; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_385 = 5'h17 == _myNewVec_22_T_3[4:0] ? myVec_23 : _GEN_384; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_386 = 5'h18 == _myNewVec_22_T_3[4:0] ? myVec_24 : _GEN_385; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_387 = 5'h19 == _myNewVec_22_T_3[4:0] ? myVec_25 : _GEN_386; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_388 = 5'h1a == _myNewVec_22_T_3[4:0] ? myVec_26 : _GEN_387; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_389 = 5'h1b == _myNewVec_22_T_3[4:0] ? myVec_27 : _GEN_388; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_390 = 5'h1c == _myNewVec_22_T_3[4:0] ? myVec_28 : _GEN_389; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_391 = 5'h1d == _myNewVec_22_T_3[4:0] ? myVec_29 : _GEN_390; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_392 = 5'h1e == _myNewVec_22_T_3[4:0] ? myVec_30 : _GEN_391; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_22 = 5'h1f == _myNewVec_22_T_3[4:0] ? myVec_31 : _GEN_392; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_21_T_3 = _myNewVec_31_T_1 + 16'ha; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_395 = 5'h1 == _myNewVec_21_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_396 = 5'h2 == _myNewVec_21_T_3[4:0] ? myVec_2 : _GEN_395; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_397 = 5'h3 == _myNewVec_21_T_3[4:0] ? myVec_3 : _GEN_396; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_398 = 5'h4 == _myNewVec_21_T_3[4:0] ? myVec_4 : _GEN_397; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_399 = 5'h5 == _myNewVec_21_T_3[4:0] ? myVec_5 : _GEN_398; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_400 = 5'h6 == _myNewVec_21_T_3[4:0] ? myVec_6 : _GEN_399; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_401 = 5'h7 == _myNewVec_21_T_3[4:0] ? myVec_7 : _GEN_400; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_402 = 5'h8 == _myNewVec_21_T_3[4:0] ? myVec_8 : _GEN_401; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_403 = 5'h9 == _myNewVec_21_T_3[4:0] ? myVec_9 : _GEN_402; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_404 = 5'ha == _myNewVec_21_T_3[4:0] ? myVec_10 : _GEN_403; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_405 = 5'hb == _myNewVec_21_T_3[4:0] ? myVec_11 : _GEN_404; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_406 = 5'hc == _myNewVec_21_T_3[4:0] ? myVec_12 : _GEN_405; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_407 = 5'hd == _myNewVec_21_T_3[4:0] ? myVec_13 : _GEN_406; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_408 = 5'he == _myNewVec_21_T_3[4:0] ? myVec_14 : _GEN_407; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_409 = 5'hf == _myNewVec_21_T_3[4:0] ? myVec_15 : _GEN_408; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_410 = 5'h10 == _myNewVec_21_T_3[4:0] ? myVec_16 : _GEN_409; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_411 = 5'h11 == _myNewVec_21_T_3[4:0] ? myVec_17 : _GEN_410; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_412 = 5'h12 == _myNewVec_21_T_3[4:0] ? myVec_18 : _GEN_411; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_413 = 5'h13 == _myNewVec_21_T_3[4:0] ? myVec_19 : _GEN_412; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_414 = 5'h14 == _myNewVec_21_T_3[4:0] ? myVec_20 : _GEN_413; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_415 = 5'h15 == _myNewVec_21_T_3[4:0] ? myVec_21 : _GEN_414; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_416 = 5'h16 == _myNewVec_21_T_3[4:0] ? myVec_22 : _GEN_415; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_417 = 5'h17 == _myNewVec_21_T_3[4:0] ? myVec_23 : _GEN_416; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_418 = 5'h18 == _myNewVec_21_T_3[4:0] ? myVec_24 : _GEN_417; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_419 = 5'h19 == _myNewVec_21_T_3[4:0] ? myVec_25 : _GEN_418; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_420 = 5'h1a == _myNewVec_21_T_3[4:0] ? myVec_26 : _GEN_419; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_421 = 5'h1b == _myNewVec_21_T_3[4:0] ? myVec_27 : _GEN_420; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_422 = 5'h1c == _myNewVec_21_T_3[4:0] ? myVec_28 : _GEN_421; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_423 = 5'h1d == _myNewVec_21_T_3[4:0] ? myVec_29 : _GEN_422; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_424 = 5'h1e == _myNewVec_21_T_3[4:0] ? myVec_30 : _GEN_423; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_21 = 5'h1f == _myNewVec_21_T_3[4:0] ? myVec_31 : _GEN_424; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_20_T_3 = _myNewVec_31_T_1 + 16'hb; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_427 = 5'h1 == _myNewVec_20_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_428 = 5'h2 == _myNewVec_20_T_3[4:0] ? myVec_2 : _GEN_427; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_429 = 5'h3 == _myNewVec_20_T_3[4:0] ? myVec_3 : _GEN_428; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_430 = 5'h4 == _myNewVec_20_T_3[4:0] ? myVec_4 : _GEN_429; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_431 = 5'h5 == _myNewVec_20_T_3[4:0] ? myVec_5 : _GEN_430; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_432 = 5'h6 == _myNewVec_20_T_3[4:0] ? myVec_6 : _GEN_431; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_433 = 5'h7 == _myNewVec_20_T_3[4:0] ? myVec_7 : _GEN_432; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_434 = 5'h8 == _myNewVec_20_T_3[4:0] ? myVec_8 : _GEN_433; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_435 = 5'h9 == _myNewVec_20_T_3[4:0] ? myVec_9 : _GEN_434; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_436 = 5'ha == _myNewVec_20_T_3[4:0] ? myVec_10 : _GEN_435; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_437 = 5'hb == _myNewVec_20_T_3[4:0] ? myVec_11 : _GEN_436; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_438 = 5'hc == _myNewVec_20_T_3[4:0] ? myVec_12 : _GEN_437; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_439 = 5'hd == _myNewVec_20_T_3[4:0] ? myVec_13 : _GEN_438; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_440 = 5'he == _myNewVec_20_T_3[4:0] ? myVec_14 : _GEN_439; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_441 = 5'hf == _myNewVec_20_T_3[4:0] ? myVec_15 : _GEN_440; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_442 = 5'h10 == _myNewVec_20_T_3[4:0] ? myVec_16 : _GEN_441; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_443 = 5'h11 == _myNewVec_20_T_3[4:0] ? myVec_17 : _GEN_442; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_444 = 5'h12 == _myNewVec_20_T_3[4:0] ? myVec_18 : _GEN_443; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_445 = 5'h13 == _myNewVec_20_T_3[4:0] ? myVec_19 : _GEN_444; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_446 = 5'h14 == _myNewVec_20_T_3[4:0] ? myVec_20 : _GEN_445; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_447 = 5'h15 == _myNewVec_20_T_3[4:0] ? myVec_21 : _GEN_446; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_448 = 5'h16 == _myNewVec_20_T_3[4:0] ? myVec_22 : _GEN_447; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_449 = 5'h17 == _myNewVec_20_T_3[4:0] ? myVec_23 : _GEN_448; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_450 = 5'h18 == _myNewVec_20_T_3[4:0] ? myVec_24 : _GEN_449; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_451 = 5'h19 == _myNewVec_20_T_3[4:0] ? myVec_25 : _GEN_450; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_452 = 5'h1a == _myNewVec_20_T_3[4:0] ? myVec_26 : _GEN_451; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_453 = 5'h1b == _myNewVec_20_T_3[4:0] ? myVec_27 : _GEN_452; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_454 = 5'h1c == _myNewVec_20_T_3[4:0] ? myVec_28 : _GEN_453; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_455 = 5'h1d == _myNewVec_20_T_3[4:0] ? myVec_29 : _GEN_454; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_456 = 5'h1e == _myNewVec_20_T_3[4:0] ? myVec_30 : _GEN_455; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_20 = 5'h1f == _myNewVec_20_T_3[4:0] ? myVec_31 : _GEN_456; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_19_T_3 = _myNewVec_31_T_1 + 16'hc; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_459 = 5'h1 == _myNewVec_19_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_460 = 5'h2 == _myNewVec_19_T_3[4:0] ? myVec_2 : _GEN_459; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_461 = 5'h3 == _myNewVec_19_T_3[4:0] ? myVec_3 : _GEN_460; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_462 = 5'h4 == _myNewVec_19_T_3[4:0] ? myVec_4 : _GEN_461; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_463 = 5'h5 == _myNewVec_19_T_3[4:0] ? myVec_5 : _GEN_462; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_464 = 5'h6 == _myNewVec_19_T_3[4:0] ? myVec_6 : _GEN_463; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_465 = 5'h7 == _myNewVec_19_T_3[4:0] ? myVec_7 : _GEN_464; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_466 = 5'h8 == _myNewVec_19_T_3[4:0] ? myVec_8 : _GEN_465; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_467 = 5'h9 == _myNewVec_19_T_3[4:0] ? myVec_9 : _GEN_466; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_468 = 5'ha == _myNewVec_19_T_3[4:0] ? myVec_10 : _GEN_467; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_469 = 5'hb == _myNewVec_19_T_3[4:0] ? myVec_11 : _GEN_468; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_470 = 5'hc == _myNewVec_19_T_3[4:0] ? myVec_12 : _GEN_469; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_471 = 5'hd == _myNewVec_19_T_3[4:0] ? myVec_13 : _GEN_470; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_472 = 5'he == _myNewVec_19_T_3[4:0] ? myVec_14 : _GEN_471; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_473 = 5'hf == _myNewVec_19_T_3[4:0] ? myVec_15 : _GEN_472; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_474 = 5'h10 == _myNewVec_19_T_3[4:0] ? myVec_16 : _GEN_473; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_475 = 5'h11 == _myNewVec_19_T_3[4:0] ? myVec_17 : _GEN_474; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_476 = 5'h12 == _myNewVec_19_T_3[4:0] ? myVec_18 : _GEN_475; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_477 = 5'h13 == _myNewVec_19_T_3[4:0] ? myVec_19 : _GEN_476; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_478 = 5'h14 == _myNewVec_19_T_3[4:0] ? myVec_20 : _GEN_477; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_479 = 5'h15 == _myNewVec_19_T_3[4:0] ? myVec_21 : _GEN_478; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_480 = 5'h16 == _myNewVec_19_T_3[4:0] ? myVec_22 : _GEN_479; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_481 = 5'h17 == _myNewVec_19_T_3[4:0] ? myVec_23 : _GEN_480; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_482 = 5'h18 == _myNewVec_19_T_3[4:0] ? myVec_24 : _GEN_481; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_483 = 5'h19 == _myNewVec_19_T_3[4:0] ? myVec_25 : _GEN_482; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_484 = 5'h1a == _myNewVec_19_T_3[4:0] ? myVec_26 : _GEN_483; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_485 = 5'h1b == _myNewVec_19_T_3[4:0] ? myVec_27 : _GEN_484; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_486 = 5'h1c == _myNewVec_19_T_3[4:0] ? myVec_28 : _GEN_485; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_487 = 5'h1d == _myNewVec_19_T_3[4:0] ? myVec_29 : _GEN_486; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_488 = 5'h1e == _myNewVec_19_T_3[4:0] ? myVec_30 : _GEN_487; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_19 = 5'h1f == _myNewVec_19_T_3[4:0] ? myVec_31 : _GEN_488; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_18_T_3 = _myNewVec_31_T_1 + 16'hd; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_491 = 5'h1 == _myNewVec_18_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_492 = 5'h2 == _myNewVec_18_T_3[4:0] ? myVec_2 : _GEN_491; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_493 = 5'h3 == _myNewVec_18_T_3[4:0] ? myVec_3 : _GEN_492; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_494 = 5'h4 == _myNewVec_18_T_3[4:0] ? myVec_4 : _GEN_493; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_495 = 5'h5 == _myNewVec_18_T_3[4:0] ? myVec_5 : _GEN_494; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_496 = 5'h6 == _myNewVec_18_T_3[4:0] ? myVec_6 : _GEN_495; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_497 = 5'h7 == _myNewVec_18_T_3[4:0] ? myVec_7 : _GEN_496; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_498 = 5'h8 == _myNewVec_18_T_3[4:0] ? myVec_8 : _GEN_497; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_499 = 5'h9 == _myNewVec_18_T_3[4:0] ? myVec_9 : _GEN_498; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_500 = 5'ha == _myNewVec_18_T_3[4:0] ? myVec_10 : _GEN_499; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_501 = 5'hb == _myNewVec_18_T_3[4:0] ? myVec_11 : _GEN_500; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_502 = 5'hc == _myNewVec_18_T_3[4:0] ? myVec_12 : _GEN_501; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_503 = 5'hd == _myNewVec_18_T_3[4:0] ? myVec_13 : _GEN_502; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_504 = 5'he == _myNewVec_18_T_3[4:0] ? myVec_14 : _GEN_503; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_505 = 5'hf == _myNewVec_18_T_3[4:0] ? myVec_15 : _GEN_504; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_506 = 5'h10 == _myNewVec_18_T_3[4:0] ? myVec_16 : _GEN_505; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_507 = 5'h11 == _myNewVec_18_T_3[4:0] ? myVec_17 : _GEN_506; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_508 = 5'h12 == _myNewVec_18_T_3[4:0] ? myVec_18 : _GEN_507; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_509 = 5'h13 == _myNewVec_18_T_3[4:0] ? myVec_19 : _GEN_508; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_510 = 5'h14 == _myNewVec_18_T_3[4:0] ? myVec_20 : _GEN_509; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_511 = 5'h15 == _myNewVec_18_T_3[4:0] ? myVec_21 : _GEN_510; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_512 = 5'h16 == _myNewVec_18_T_3[4:0] ? myVec_22 : _GEN_511; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_513 = 5'h17 == _myNewVec_18_T_3[4:0] ? myVec_23 : _GEN_512; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_514 = 5'h18 == _myNewVec_18_T_3[4:0] ? myVec_24 : _GEN_513; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_515 = 5'h19 == _myNewVec_18_T_3[4:0] ? myVec_25 : _GEN_514; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_516 = 5'h1a == _myNewVec_18_T_3[4:0] ? myVec_26 : _GEN_515; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_517 = 5'h1b == _myNewVec_18_T_3[4:0] ? myVec_27 : _GEN_516; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_518 = 5'h1c == _myNewVec_18_T_3[4:0] ? myVec_28 : _GEN_517; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_519 = 5'h1d == _myNewVec_18_T_3[4:0] ? myVec_29 : _GEN_518; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_520 = 5'h1e == _myNewVec_18_T_3[4:0] ? myVec_30 : _GEN_519; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_18 = 5'h1f == _myNewVec_18_T_3[4:0] ? myVec_31 : _GEN_520; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_17_T_3 = _myNewVec_31_T_1 + 16'he; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_523 = 5'h1 == _myNewVec_17_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_524 = 5'h2 == _myNewVec_17_T_3[4:0] ? myVec_2 : _GEN_523; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_525 = 5'h3 == _myNewVec_17_T_3[4:0] ? myVec_3 : _GEN_524; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_526 = 5'h4 == _myNewVec_17_T_3[4:0] ? myVec_4 : _GEN_525; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_527 = 5'h5 == _myNewVec_17_T_3[4:0] ? myVec_5 : _GEN_526; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_528 = 5'h6 == _myNewVec_17_T_3[4:0] ? myVec_6 : _GEN_527; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_529 = 5'h7 == _myNewVec_17_T_3[4:0] ? myVec_7 : _GEN_528; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_530 = 5'h8 == _myNewVec_17_T_3[4:0] ? myVec_8 : _GEN_529; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_531 = 5'h9 == _myNewVec_17_T_3[4:0] ? myVec_9 : _GEN_530; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_532 = 5'ha == _myNewVec_17_T_3[4:0] ? myVec_10 : _GEN_531; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_533 = 5'hb == _myNewVec_17_T_3[4:0] ? myVec_11 : _GEN_532; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_534 = 5'hc == _myNewVec_17_T_3[4:0] ? myVec_12 : _GEN_533; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_535 = 5'hd == _myNewVec_17_T_3[4:0] ? myVec_13 : _GEN_534; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_536 = 5'he == _myNewVec_17_T_3[4:0] ? myVec_14 : _GEN_535; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_537 = 5'hf == _myNewVec_17_T_3[4:0] ? myVec_15 : _GEN_536; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_538 = 5'h10 == _myNewVec_17_T_3[4:0] ? myVec_16 : _GEN_537; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_539 = 5'h11 == _myNewVec_17_T_3[4:0] ? myVec_17 : _GEN_538; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_540 = 5'h12 == _myNewVec_17_T_3[4:0] ? myVec_18 : _GEN_539; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_541 = 5'h13 == _myNewVec_17_T_3[4:0] ? myVec_19 : _GEN_540; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_542 = 5'h14 == _myNewVec_17_T_3[4:0] ? myVec_20 : _GEN_541; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_543 = 5'h15 == _myNewVec_17_T_3[4:0] ? myVec_21 : _GEN_542; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_544 = 5'h16 == _myNewVec_17_T_3[4:0] ? myVec_22 : _GEN_543; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_545 = 5'h17 == _myNewVec_17_T_3[4:0] ? myVec_23 : _GEN_544; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_546 = 5'h18 == _myNewVec_17_T_3[4:0] ? myVec_24 : _GEN_545; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_547 = 5'h19 == _myNewVec_17_T_3[4:0] ? myVec_25 : _GEN_546; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_548 = 5'h1a == _myNewVec_17_T_3[4:0] ? myVec_26 : _GEN_547; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_549 = 5'h1b == _myNewVec_17_T_3[4:0] ? myVec_27 : _GEN_548; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_550 = 5'h1c == _myNewVec_17_T_3[4:0] ? myVec_28 : _GEN_549; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_551 = 5'h1d == _myNewVec_17_T_3[4:0] ? myVec_29 : _GEN_550; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_552 = 5'h1e == _myNewVec_17_T_3[4:0] ? myVec_30 : _GEN_551; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_17 = 5'h1f == _myNewVec_17_T_3[4:0] ? myVec_31 : _GEN_552; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_16_T_3 = _myNewVec_31_T_1 + 16'hf; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_555 = 5'h1 == _myNewVec_16_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_556 = 5'h2 == _myNewVec_16_T_3[4:0] ? myVec_2 : _GEN_555; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_557 = 5'h3 == _myNewVec_16_T_3[4:0] ? myVec_3 : _GEN_556; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_558 = 5'h4 == _myNewVec_16_T_3[4:0] ? myVec_4 : _GEN_557; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_559 = 5'h5 == _myNewVec_16_T_3[4:0] ? myVec_5 : _GEN_558; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_560 = 5'h6 == _myNewVec_16_T_3[4:0] ? myVec_6 : _GEN_559; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_561 = 5'h7 == _myNewVec_16_T_3[4:0] ? myVec_7 : _GEN_560; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_562 = 5'h8 == _myNewVec_16_T_3[4:0] ? myVec_8 : _GEN_561; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_563 = 5'h9 == _myNewVec_16_T_3[4:0] ? myVec_9 : _GEN_562; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_564 = 5'ha == _myNewVec_16_T_3[4:0] ? myVec_10 : _GEN_563; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_565 = 5'hb == _myNewVec_16_T_3[4:0] ? myVec_11 : _GEN_564; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_566 = 5'hc == _myNewVec_16_T_3[4:0] ? myVec_12 : _GEN_565; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_567 = 5'hd == _myNewVec_16_T_3[4:0] ? myVec_13 : _GEN_566; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_568 = 5'he == _myNewVec_16_T_3[4:0] ? myVec_14 : _GEN_567; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_569 = 5'hf == _myNewVec_16_T_3[4:0] ? myVec_15 : _GEN_568; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_570 = 5'h10 == _myNewVec_16_T_3[4:0] ? myVec_16 : _GEN_569; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_571 = 5'h11 == _myNewVec_16_T_3[4:0] ? myVec_17 : _GEN_570; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_572 = 5'h12 == _myNewVec_16_T_3[4:0] ? myVec_18 : _GEN_571; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_573 = 5'h13 == _myNewVec_16_T_3[4:0] ? myVec_19 : _GEN_572; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_574 = 5'h14 == _myNewVec_16_T_3[4:0] ? myVec_20 : _GEN_573; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_575 = 5'h15 == _myNewVec_16_T_3[4:0] ? myVec_21 : _GEN_574; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_576 = 5'h16 == _myNewVec_16_T_3[4:0] ? myVec_22 : _GEN_575; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_577 = 5'h17 == _myNewVec_16_T_3[4:0] ? myVec_23 : _GEN_576; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_578 = 5'h18 == _myNewVec_16_T_3[4:0] ? myVec_24 : _GEN_577; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_579 = 5'h19 == _myNewVec_16_T_3[4:0] ? myVec_25 : _GEN_578; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_580 = 5'h1a == _myNewVec_16_T_3[4:0] ? myVec_26 : _GEN_579; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_581 = 5'h1b == _myNewVec_16_T_3[4:0] ? myVec_27 : _GEN_580; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_582 = 5'h1c == _myNewVec_16_T_3[4:0] ? myVec_28 : _GEN_581; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_583 = 5'h1d == _myNewVec_16_T_3[4:0] ? myVec_29 : _GEN_582; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_584 = 5'h1e == _myNewVec_16_T_3[4:0] ? myVec_30 : _GEN_583; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_16 = 5'h1f == _myNewVec_16_T_3[4:0] ? myVec_31 : _GEN_584; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [255:0] myNewWire_hi_lo = {myNewVec_23,myNewVec_22,myNewVec_21,myNewVec_20,myNewVec_19,myNewVec_18,myNewVec_17,
    myNewVec_16}; // @[hh_datapath_chisel.scala 238:27]
  wire [15:0] _myNewVec_15_T_3 = _myNewVec_31_T_1 + 16'h10; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_587 = 5'h1 == _myNewVec_15_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_588 = 5'h2 == _myNewVec_15_T_3[4:0] ? myVec_2 : _GEN_587; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_589 = 5'h3 == _myNewVec_15_T_3[4:0] ? myVec_3 : _GEN_588; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_590 = 5'h4 == _myNewVec_15_T_3[4:0] ? myVec_4 : _GEN_589; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_591 = 5'h5 == _myNewVec_15_T_3[4:0] ? myVec_5 : _GEN_590; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_592 = 5'h6 == _myNewVec_15_T_3[4:0] ? myVec_6 : _GEN_591; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_593 = 5'h7 == _myNewVec_15_T_3[4:0] ? myVec_7 : _GEN_592; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_594 = 5'h8 == _myNewVec_15_T_3[4:0] ? myVec_8 : _GEN_593; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_595 = 5'h9 == _myNewVec_15_T_3[4:0] ? myVec_9 : _GEN_594; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_596 = 5'ha == _myNewVec_15_T_3[4:0] ? myVec_10 : _GEN_595; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_597 = 5'hb == _myNewVec_15_T_3[4:0] ? myVec_11 : _GEN_596; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_598 = 5'hc == _myNewVec_15_T_3[4:0] ? myVec_12 : _GEN_597; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_599 = 5'hd == _myNewVec_15_T_3[4:0] ? myVec_13 : _GEN_598; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_600 = 5'he == _myNewVec_15_T_3[4:0] ? myVec_14 : _GEN_599; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_601 = 5'hf == _myNewVec_15_T_3[4:0] ? myVec_15 : _GEN_600; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_602 = 5'h10 == _myNewVec_15_T_3[4:0] ? myVec_16 : _GEN_601; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_603 = 5'h11 == _myNewVec_15_T_3[4:0] ? myVec_17 : _GEN_602; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_604 = 5'h12 == _myNewVec_15_T_3[4:0] ? myVec_18 : _GEN_603; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_605 = 5'h13 == _myNewVec_15_T_3[4:0] ? myVec_19 : _GEN_604; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_606 = 5'h14 == _myNewVec_15_T_3[4:0] ? myVec_20 : _GEN_605; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_607 = 5'h15 == _myNewVec_15_T_3[4:0] ? myVec_21 : _GEN_606; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_608 = 5'h16 == _myNewVec_15_T_3[4:0] ? myVec_22 : _GEN_607; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_609 = 5'h17 == _myNewVec_15_T_3[4:0] ? myVec_23 : _GEN_608; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_610 = 5'h18 == _myNewVec_15_T_3[4:0] ? myVec_24 : _GEN_609; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_611 = 5'h19 == _myNewVec_15_T_3[4:0] ? myVec_25 : _GEN_610; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_612 = 5'h1a == _myNewVec_15_T_3[4:0] ? myVec_26 : _GEN_611; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_613 = 5'h1b == _myNewVec_15_T_3[4:0] ? myVec_27 : _GEN_612; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_614 = 5'h1c == _myNewVec_15_T_3[4:0] ? myVec_28 : _GEN_613; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_615 = 5'h1d == _myNewVec_15_T_3[4:0] ? myVec_29 : _GEN_614; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_616 = 5'h1e == _myNewVec_15_T_3[4:0] ? myVec_30 : _GEN_615; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_15 = 5'h1f == _myNewVec_15_T_3[4:0] ? myVec_31 : _GEN_616; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_14_T_3 = _myNewVec_31_T_1 + 16'h11; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_619 = 5'h1 == _myNewVec_14_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_620 = 5'h2 == _myNewVec_14_T_3[4:0] ? myVec_2 : _GEN_619; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_621 = 5'h3 == _myNewVec_14_T_3[4:0] ? myVec_3 : _GEN_620; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_622 = 5'h4 == _myNewVec_14_T_3[4:0] ? myVec_4 : _GEN_621; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_623 = 5'h5 == _myNewVec_14_T_3[4:0] ? myVec_5 : _GEN_622; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_624 = 5'h6 == _myNewVec_14_T_3[4:0] ? myVec_6 : _GEN_623; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_625 = 5'h7 == _myNewVec_14_T_3[4:0] ? myVec_7 : _GEN_624; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_626 = 5'h8 == _myNewVec_14_T_3[4:0] ? myVec_8 : _GEN_625; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_627 = 5'h9 == _myNewVec_14_T_3[4:0] ? myVec_9 : _GEN_626; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_628 = 5'ha == _myNewVec_14_T_3[4:0] ? myVec_10 : _GEN_627; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_629 = 5'hb == _myNewVec_14_T_3[4:0] ? myVec_11 : _GEN_628; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_630 = 5'hc == _myNewVec_14_T_3[4:0] ? myVec_12 : _GEN_629; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_631 = 5'hd == _myNewVec_14_T_3[4:0] ? myVec_13 : _GEN_630; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_632 = 5'he == _myNewVec_14_T_3[4:0] ? myVec_14 : _GEN_631; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_633 = 5'hf == _myNewVec_14_T_3[4:0] ? myVec_15 : _GEN_632; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_634 = 5'h10 == _myNewVec_14_T_3[4:0] ? myVec_16 : _GEN_633; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_635 = 5'h11 == _myNewVec_14_T_3[4:0] ? myVec_17 : _GEN_634; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_636 = 5'h12 == _myNewVec_14_T_3[4:0] ? myVec_18 : _GEN_635; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_637 = 5'h13 == _myNewVec_14_T_3[4:0] ? myVec_19 : _GEN_636; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_638 = 5'h14 == _myNewVec_14_T_3[4:0] ? myVec_20 : _GEN_637; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_639 = 5'h15 == _myNewVec_14_T_3[4:0] ? myVec_21 : _GEN_638; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_640 = 5'h16 == _myNewVec_14_T_3[4:0] ? myVec_22 : _GEN_639; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_641 = 5'h17 == _myNewVec_14_T_3[4:0] ? myVec_23 : _GEN_640; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_642 = 5'h18 == _myNewVec_14_T_3[4:0] ? myVec_24 : _GEN_641; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_643 = 5'h19 == _myNewVec_14_T_3[4:0] ? myVec_25 : _GEN_642; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_644 = 5'h1a == _myNewVec_14_T_3[4:0] ? myVec_26 : _GEN_643; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_645 = 5'h1b == _myNewVec_14_T_3[4:0] ? myVec_27 : _GEN_644; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_646 = 5'h1c == _myNewVec_14_T_3[4:0] ? myVec_28 : _GEN_645; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_647 = 5'h1d == _myNewVec_14_T_3[4:0] ? myVec_29 : _GEN_646; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_648 = 5'h1e == _myNewVec_14_T_3[4:0] ? myVec_30 : _GEN_647; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_14 = 5'h1f == _myNewVec_14_T_3[4:0] ? myVec_31 : _GEN_648; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_13_T_3 = _myNewVec_31_T_1 + 16'h12; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_651 = 5'h1 == _myNewVec_13_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_652 = 5'h2 == _myNewVec_13_T_3[4:0] ? myVec_2 : _GEN_651; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_653 = 5'h3 == _myNewVec_13_T_3[4:0] ? myVec_3 : _GEN_652; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_654 = 5'h4 == _myNewVec_13_T_3[4:0] ? myVec_4 : _GEN_653; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_655 = 5'h5 == _myNewVec_13_T_3[4:0] ? myVec_5 : _GEN_654; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_656 = 5'h6 == _myNewVec_13_T_3[4:0] ? myVec_6 : _GEN_655; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_657 = 5'h7 == _myNewVec_13_T_3[4:0] ? myVec_7 : _GEN_656; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_658 = 5'h8 == _myNewVec_13_T_3[4:0] ? myVec_8 : _GEN_657; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_659 = 5'h9 == _myNewVec_13_T_3[4:0] ? myVec_9 : _GEN_658; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_660 = 5'ha == _myNewVec_13_T_3[4:0] ? myVec_10 : _GEN_659; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_661 = 5'hb == _myNewVec_13_T_3[4:0] ? myVec_11 : _GEN_660; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_662 = 5'hc == _myNewVec_13_T_3[4:0] ? myVec_12 : _GEN_661; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_663 = 5'hd == _myNewVec_13_T_3[4:0] ? myVec_13 : _GEN_662; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_664 = 5'he == _myNewVec_13_T_3[4:0] ? myVec_14 : _GEN_663; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_665 = 5'hf == _myNewVec_13_T_3[4:0] ? myVec_15 : _GEN_664; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_666 = 5'h10 == _myNewVec_13_T_3[4:0] ? myVec_16 : _GEN_665; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_667 = 5'h11 == _myNewVec_13_T_3[4:0] ? myVec_17 : _GEN_666; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_668 = 5'h12 == _myNewVec_13_T_3[4:0] ? myVec_18 : _GEN_667; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_669 = 5'h13 == _myNewVec_13_T_3[4:0] ? myVec_19 : _GEN_668; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_670 = 5'h14 == _myNewVec_13_T_3[4:0] ? myVec_20 : _GEN_669; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_671 = 5'h15 == _myNewVec_13_T_3[4:0] ? myVec_21 : _GEN_670; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_672 = 5'h16 == _myNewVec_13_T_3[4:0] ? myVec_22 : _GEN_671; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_673 = 5'h17 == _myNewVec_13_T_3[4:0] ? myVec_23 : _GEN_672; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_674 = 5'h18 == _myNewVec_13_T_3[4:0] ? myVec_24 : _GEN_673; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_675 = 5'h19 == _myNewVec_13_T_3[4:0] ? myVec_25 : _GEN_674; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_676 = 5'h1a == _myNewVec_13_T_3[4:0] ? myVec_26 : _GEN_675; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_677 = 5'h1b == _myNewVec_13_T_3[4:0] ? myVec_27 : _GEN_676; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_678 = 5'h1c == _myNewVec_13_T_3[4:0] ? myVec_28 : _GEN_677; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_679 = 5'h1d == _myNewVec_13_T_3[4:0] ? myVec_29 : _GEN_678; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_680 = 5'h1e == _myNewVec_13_T_3[4:0] ? myVec_30 : _GEN_679; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_13 = 5'h1f == _myNewVec_13_T_3[4:0] ? myVec_31 : _GEN_680; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_12_T_3 = _myNewVec_31_T_1 + 16'h13; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_683 = 5'h1 == _myNewVec_12_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_684 = 5'h2 == _myNewVec_12_T_3[4:0] ? myVec_2 : _GEN_683; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_685 = 5'h3 == _myNewVec_12_T_3[4:0] ? myVec_3 : _GEN_684; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_686 = 5'h4 == _myNewVec_12_T_3[4:0] ? myVec_4 : _GEN_685; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_687 = 5'h5 == _myNewVec_12_T_3[4:0] ? myVec_5 : _GEN_686; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_688 = 5'h6 == _myNewVec_12_T_3[4:0] ? myVec_6 : _GEN_687; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_689 = 5'h7 == _myNewVec_12_T_3[4:0] ? myVec_7 : _GEN_688; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_690 = 5'h8 == _myNewVec_12_T_3[4:0] ? myVec_8 : _GEN_689; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_691 = 5'h9 == _myNewVec_12_T_3[4:0] ? myVec_9 : _GEN_690; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_692 = 5'ha == _myNewVec_12_T_3[4:0] ? myVec_10 : _GEN_691; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_693 = 5'hb == _myNewVec_12_T_3[4:0] ? myVec_11 : _GEN_692; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_694 = 5'hc == _myNewVec_12_T_3[4:0] ? myVec_12 : _GEN_693; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_695 = 5'hd == _myNewVec_12_T_3[4:0] ? myVec_13 : _GEN_694; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_696 = 5'he == _myNewVec_12_T_3[4:0] ? myVec_14 : _GEN_695; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_697 = 5'hf == _myNewVec_12_T_3[4:0] ? myVec_15 : _GEN_696; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_698 = 5'h10 == _myNewVec_12_T_3[4:0] ? myVec_16 : _GEN_697; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_699 = 5'h11 == _myNewVec_12_T_3[4:0] ? myVec_17 : _GEN_698; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_700 = 5'h12 == _myNewVec_12_T_3[4:0] ? myVec_18 : _GEN_699; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_701 = 5'h13 == _myNewVec_12_T_3[4:0] ? myVec_19 : _GEN_700; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_702 = 5'h14 == _myNewVec_12_T_3[4:0] ? myVec_20 : _GEN_701; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_703 = 5'h15 == _myNewVec_12_T_3[4:0] ? myVec_21 : _GEN_702; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_704 = 5'h16 == _myNewVec_12_T_3[4:0] ? myVec_22 : _GEN_703; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_705 = 5'h17 == _myNewVec_12_T_3[4:0] ? myVec_23 : _GEN_704; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_706 = 5'h18 == _myNewVec_12_T_3[4:0] ? myVec_24 : _GEN_705; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_707 = 5'h19 == _myNewVec_12_T_3[4:0] ? myVec_25 : _GEN_706; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_708 = 5'h1a == _myNewVec_12_T_3[4:0] ? myVec_26 : _GEN_707; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_709 = 5'h1b == _myNewVec_12_T_3[4:0] ? myVec_27 : _GEN_708; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_710 = 5'h1c == _myNewVec_12_T_3[4:0] ? myVec_28 : _GEN_709; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_711 = 5'h1d == _myNewVec_12_T_3[4:0] ? myVec_29 : _GEN_710; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_712 = 5'h1e == _myNewVec_12_T_3[4:0] ? myVec_30 : _GEN_711; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_12 = 5'h1f == _myNewVec_12_T_3[4:0] ? myVec_31 : _GEN_712; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_11_T_3 = _myNewVec_31_T_1 + 16'h14; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_715 = 5'h1 == _myNewVec_11_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_716 = 5'h2 == _myNewVec_11_T_3[4:0] ? myVec_2 : _GEN_715; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_717 = 5'h3 == _myNewVec_11_T_3[4:0] ? myVec_3 : _GEN_716; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_718 = 5'h4 == _myNewVec_11_T_3[4:0] ? myVec_4 : _GEN_717; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_719 = 5'h5 == _myNewVec_11_T_3[4:0] ? myVec_5 : _GEN_718; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_720 = 5'h6 == _myNewVec_11_T_3[4:0] ? myVec_6 : _GEN_719; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_721 = 5'h7 == _myNewVec_11_T_3[4:0] ? myVec_7 : _GEN_720; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_722 = 5'h8 == _myNewVec_11_T_3[4:0] ? myVec_8 : _GEN_721; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_723 = 5'h9 == _myNewVec_11_T_3[4:0] ? myVec_9 : _GEN_722; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_724 = 5'ha == _myNewVec_11_T_3[4:0] ? myVec_10 : _GEN_723; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_725 = 5'hb == _myNewVec_11_T_3[4:0] ? myVec_11 : _GEN_724; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_726 = 5'hc == _myNewVec_11_T_3[4:0] ? myVec_12 : _GEN_725; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_727 = 5'hd == _myNewVec_11_T_3[4:0] ? myVec_13 : _GEN_726; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_728 = 5'he == _myNewVec_11_T_3[4:0] ? myVec_14 : _GEN_727; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_729 = 5'hf == _myNewVec_11_T_3[4:0] ? myVec_15 : _GEN_728; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_730 = 5'h10 == _myNewVec_11_T_3[4:0] ? myVec_16 : _GEN_729; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_731 = 5'h11 == _myNewVec_11_T_3[4:0] ? myVec_17 : _GEN_730; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_732 = 5'h12 == _myNewVec_11_T_3[4:0] ? myVec_18 : _GEN_731; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_733 = 5'h13 == _myNewVec_11_T_3[4:0] ? myVec_19 : _GEN_732; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_734 = 5'h14 == _myNewVec_11_T_3[4:0] ? myVec_20 : _GEN_733; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_735 = 5'h15 == _myNewVec_11_T_3[4:0] ? myVec_21 : _GEN_734; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_736 = 5'h16 == _myNewVec_11_T_3[4:0] ? myVec_22 : _GEN_735; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_737 = 5'h17 == _myNewVec_11_T_3[4:0] ? myVec_23 : _GEN_736; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_738 = 5'h18 == _myNewVec_11_T_3[4:0] ? myVec_24 : _GEN_737; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_739 = 5'h19 == _myNewVec_11_T_3[4:0] ? myVec_25 : _GEN_738; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_740 = 5'h1a == _myNewVec_11_T_3[4:0] ? myVec_26 : _GEN_739; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_741 = 5'h1b == _myNewVec_11_T_3[4:0] ? myVec_27 : _GEN_740; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_742 = 5'h1c == _myNewVec_11_T_3[4:0] ? myVec_28 : _GEN_741; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_743 = 5'h1d == _myNewVec_11_T_3[4:0] ? myVec_29 : _GEN_742; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_744 = 5'h1e == _myNewVec_11_T_3[4:0] ? myVec_30 : _GEN_743; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_11 = 5'h1f == _myNewVec_11_T_3[4:0] ? myVec_31 : _GEN_744; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_10_T_3 = _myNewVec_31_T_1 + 16'h15; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_747 = 5'h1 == _myNewVec_10_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_748 = 5'h2 == _myNewVec_10_T_3[4:0] ? myVec_2 : _GEN_747; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_749 = 5'h3 == _myNewVec_10_T_3[4:0] ? myVec_3 : _GEN_748; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_750 = 5'h4 == _myNewVec_10_T_3[4:0] ? myVec_4 : _GEN_749; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_751 = 5'h5 == _myNewVec_10_T_3[4:0] ? myVec_5 : _GEN_750; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_752 = 5'h6 == _myNewVec_10_T_3[4:0] ? myVec_6 : _GEN_751; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_753 = 5'h7 == _myNewVec_10_T_3[4:0] ? myVec_7 : _GEN_752; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_754 = 5'h8 == _myNewVec_10_T_3[4:0] ? myVec_8 : _GEN_753; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_755 = 5'h9 == _myNewVec_10_T_3[4:0] ? myVec_9 : _GEN_754; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_756 = 5'ha == _myNewVec_10_T_3[4:0] ? myVec_10 : _GEN_755; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_757 = 5'hb == _myNewVec_10_T_3[4:0] ? myVec_11 : _GEN_756; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_758 = 5'hc == _myNewVec_10_T_3[4:0] ? myVec_12 : _GEN_757; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_759 = 5'hd == _myNewVec_10_T_3[4:0] ? myVec_13 : _GEN_758; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_760 = 5'he == _myNewVec_10_T_3[4:0] ? myVec_14 : _GEN_759; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_761 = 5'hf == _myNewVec_10_T_3[4:0] ? myVec_15 : _GEN_760; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_762 = 5'h10 == _myNewVec_10_T_3[4:0] ? myVec_16 : _GEN_761; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_763 = 5'h11 == _myNewVec_10_T_3[4:0] ? myVec_17 : _GEN_762; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_764 = 5'h12 == _myNewVec_10_T_3[4:0] ? myVec_18 : _GEN_763; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_765 = 5'h13 == _myNewVec_10_T_3[4:0] ? myVec_19 : _GEN_764; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_766 = 5'h14 == _myNewVec_10_T_3[4:0] ? myVec_20 : _GEN_765; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_767 = 5'h15 == _myNewVec_10_T_3[4:0] ? myVec_21 : _GEN_766; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_768 = 5'h16 == _myNewVec_10_T_3[4:0] ? myVec_22 : _GEN_767; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_769 = 5'h17 == _myNewVec_10_T_3[4:0] ? myVec_23 : _GEN_768; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_770 = 5'h18 == _myNewVec_10_T_3[4:0] ? myVec_24 : _GEN_769; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_771 = 5'h19 == _myNewVec_10_T_3[4:0] ? myVec_25 : _GEN_770; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_772 = 5'h1a == _myNewVec_10_T_3[4:0] ? myVec_26 : _GEN_771; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_773 = 5'h1b == _myNewVec_10_T_3[4:0] ? myVec_27 : _GEN_772; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_774 = 5'h1c == _myNewVec_10_T_3[4:0] ? myVec_28 : _GEN_773; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_775 = 5'h1d == _myNewVec_10_T_3[4:0] ? myVec_29 : _GEN_774; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_776 = 5'h1e == _myNewVec_10_T_3[4:0] ? myVec_30 : _GEN_775; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_10 = 5'h1f == _myNewVec_10_T_3[4:0] ? myVec_31 : _GEN_776; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_9_T_3 = _myNewVec_31_T_1 + 16'h16; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_779 = 5'h1 == _myNewVec_9_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_780 = 5'h2 == _myNewVec_9_T_3[4:0] ? myVec_2 : _GEN_779; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_781 = 5'h3 == _myNewVec_9_T_3[4:0] ? myVec_3 : _GEN_780; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_782 = 5'h4 == _myNewVec_9_T_3[4:0] ? myVec_4 : _GEN_781; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_783 = 5'h5 == _myNewVec_9_T_3[4:0] ? myVec_5 : _GEN_782; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_784 = 5'h6 == _myNewVec_9_T_3[4:0] ? myVec_6 : _GEN_783; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_785 = 5'h7 == _myNewVec_9_T_3[4:0] ? myVec_7 : _GEN_784; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_786 = 5'h8 == _myNewVec_9_T_3[4:0] ? myVec_8 : _GEN_785; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_787 = 5'h9 == _myNewVec_9_T_3[4:0] ? myVec_9 : _GEN_786; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_788 = 5'ha == _myNewVec_9_T_3[4:0] ? myVec_10 : _GEN_787; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_789 = 5'hb == _myNewVec_9_T_3[4:0] ? myVec_11 : _GEN_788; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_790 = 5'hc == _myNewVec_9_T_3[4:0] ? myVec_12 : _GEN_789; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_791 = 5'hd == _myNewVec_9_T_3[4:0] ? myVec_13 : _GEN_790; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_792 = 5'he == _myNewVec_9_T_3[4:0] ? myVec_14 : _GEN_791; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_793 = 5'hf == _myNewVec_9_T_3[4:0] ? myVec_15 : _GEN_792; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_794 = 5'h10 == _myNewVec_9_T_3[4:0] ? myVec_16 : _GEN_793; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_795 = 5'h11 == _myNewVec_9_T_3[4:0] ? myVec_17 : _GEN_794; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_796 = 5'h12 == _myNewVec_9_T_3[4:0] ? myVec_18 : _GEN_795; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_797 = 5'h13 == _myNewVec_9_T_3[4:0] ? myVec_19 : _GEN_796; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_798 = 5'h14 == _myNewVec_9_T_3[4:0] ? myVec_20 : _GEN_797; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_799 = 5'h15 == _myNewVec_9_T_3[4:0] ? myVec_21 : _GEN_798; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_800 = 5'h16 == _myNewVec_9_T_3[4:0] ? myVec_22 : _GEN_799; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_801 = 5'h17 == _myNewVec_9_T_3[4:0] ? myVec_23 : _GEN_800; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_802 = 5'h18 == _myNewVec_9_T_3[4:0] ? myVec_24 : _GEN_801; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_803 = 5'h19 == _myNewVec_9_T_3[4:0] ? myVec_25 : _GEN_802; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_804 = 5'h1a == _myNewVec_9_T_3[4:0] ? myVec_26 : _GEN_803; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_805 = 5'h1b == _myNewVec_9_T_3[4:0] ? myVec_27 : _GEN_804; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_806 = 5'h1c == _myNewVec_9_T_3[4:0] ? myVec_28 : _GEN_805; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_807 = 5'h1d == _myNewVec_9_T_3[4:0] ? myVec_29 : _GEN_806; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_808 = 5'h1e == _myNewVec_9_T_3[4:0] ? myVec_30 : _GEN_807; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_9 = 5'h1f == _myNewVec_9_T_3[4:0] ? myVec_31 : _GEN_808; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_8_T_3 = _myNewVec_31_T_1 + 16'h17; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_811 = 5'h1 == _myNewVec_8_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_812 = 5'h2 == _myNewVec_8_T_3[4:0] ? myVec_2 : _GEN_811; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_813 = 5'h3 == _myNewVec_8_T_3[4:0] ? myVec_3 : _GEN_812; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_814 = 5'h4 == _myNewVec_8_T_3[4:0] ? myVec_4 : _GEN_813; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_815 = 5'h5 == _myNewVec_8_T_3[4:0] ? myVec_5 : _GEN_814; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_816 = 5'h6 == _myNewVec_8_T_3[4:0] ? myVec_6 : _GEN_815; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_817 = 5'h7 == _myNewVec_8_T_3[4:0] ? myVec_7 : _GEN_816; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_818 = 5'h8 == _myNewVec_8_T_3[4:0] ? myVec_8 : _GEN_817; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_819 = 5'h9 == _myNewVec_8_T_3[4:0] ? myVec_9 : _GEN_818; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_820 = 5'ha == _myNewVec_8_T_3[4:0] ? myVec_10 : _GEN_819; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_821 = 5'hb == _myNewVec_8_T_3[4:0] ? myVec_11 : _GEN_820; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_822 = 5'hc == _myNewVec_8_T_3[4:0] ? myVec_12 : _GEN_821; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_823 = 5'hd == _myNewVec_8_T_3[4:0] ? myVec_13 : _GEN_822; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_824 = 5'he == _myNewVec_8_T_3[4:0] ? myVec_14 : _GEN_823; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_825 = 5'hf == _myNewVec_8_T_3[4:0] ? myVec_15 : _GEN_824; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_826 = 5'h10 == _myNewVec_8_T_3[4:0] ? myVec_16 : _GEN_825; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_827 = 5'h11 == _myNewVec_8_T_3[4:0] ? myVec_17 : _GEN_826; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_828 = 5'h12 == _myNewVec_8_T_3[4:0] ? myVec_18 : _GEN_827; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_829 = 5'h13 == _myNewVec_8_T_3[4:0] ? myVec_19 : _GEN_828; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_830 = 5'h14 == _myNewVec_8_T_3[4:0] ? myVec_20 : _GEN_829; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_831 = 5'h15 == _myNewVec_8_T_3[4:0] ? myVec_21 : _GEN_830; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_832 = 5'h16 == _myNewVec_8_T_3[4:0] ? myVec_22 : _GEN_831; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_833 = 5'h17 == _myNewVec_8_T_3[4:0] ? myVec_23 : _GEN_832; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_834 = 5'h18 == _myNewVec_8_T_3[4:0] ? myVec_24 : _GEN_833; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_835 = 5'h19 == _myNewVec_8_T_3[4:0] ? myVec_25 : _GEN_834; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_836 = 5'h1a == _myNewVec_8_T_3[4:0] ? myVec_26 : _GEN_835; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_837 = 5'h1b == _myNewVec_8_T_3[4:0] ? myVec_27 : _GEN_836; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_838 = 5'h1c == _myNewVec_8_T_3[4:0] ? myVec_28 : _GEN_837; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_839 = 5'h1d == _myNewVec_8_T_3[4:0] ? myVec_29 : _GEN_838; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_840 = 5'h1e == _myNewVec_8_T_3[4:0] ? myVec_30 : _GEN_839; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_8 = 5'h1f == _myNewVec_8_T_3[4:0] ? myVec_31 : _GEN_840; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_7_T_3 = _myNewVec_31_T_1 + 16'h18; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_843 = 5'h1 == _myNewVec_7_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_844 = 5'h2 == _myNewVec_7_T_3[4:0] ? myVec_2 : _GEN_843; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_845 = 5'h3 == _myNewVec_7_T_3[4:0] ? myVec_3 : _GEN_844; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_846 = 5'h4 == _myNewVec_7_T_3[4:0] ? myVec_4 : _GEN_845; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_847 = 5'h5 == _myNewVec_7_T_3[4:0] ? myVec_5 : _GEN_846; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_848 = 5'h6 == _myNewVec_7_T_3[4:0] ? myVec_6 : _GEN_847; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_849 = 5'h7 == _myNewVec_7_T_3[4:0] ? myVec_7 : _GEN_848; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_850 = 5'h8 == _myNewVec_7_T_3[4:0] ? myVec_8 : _GEN_849; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_851 = 5'h9 == _myNewVec_7_T_3[4:0] ? myVec_9 : _GEN_850; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_852 = 5'ha == _myNewVec_7_T_3[4:0] ? myVec_10 : _GEN_851; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_853 = 5'hb == _myNewVec_7_T_3[4:0] ? myVec_11 : _GEN_852; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_854 = 5'hc == _myNewVec_7_T_3[4:0] ? myVec_12 : _GEN_853; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_855 = 5'hd == _myNewVec_7_T_3[4:0] ? myVec_13 : _GEN_854; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_856 = 5'he == _myNewVec_7_T_3[4:0] ? myVec_14 : _GEN_855; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_857 = 5'hf == _myNewVec_7_T_3[4:0] ? myVec_15 : _GEN_856; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_858 = 5'h10 == _myNewVec_7_T_3[4:0] ? myVec_16 : _GEN_857; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_859 = 5'h11 == _myNewVec_7_T_3[4:0] ? myVec_17 : _GEN_858; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_860 = 5'h12 == _myNewVec_7_T_3[4:0] ? myVec_18 : _GEN_859; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_861 = 5'h13 == _myNewVec_7_T_3[4:0] ? myVec_19 : _GEN_860; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_862 = 5'h14 == _myNewVec_7_T_3[4:0] ? myVec_20 : _GEN_861; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_863 = 5'h15 == _myNewVec_7_T_3[4:0] ? myVec_21 : _GEN_862; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_864 = 5'h16 == _myNewVec_7_T_3[4:0] ? myVec_22 : _GEN_863; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_865 = 5'h17 == _myNewVec_7_T_3[4:0] ? myVec_23 : _GEN_864; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_866 = 5'h18 == _myNewVec_7_T_3[4:0] ? myVec_24 : _GEN_865; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_867 = 5'h19 == _myNewVec_7_T_3[4:0] ? myVec_25 : _GEN_866; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_868 = 5'h1a == _myNewVec_7_T_3[4:0] ? myVec_26 : _GEN_867; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_869 = 5'h1b == _myNewVec_7_T_3[4:0] ? myVec_27 : _GEN_868; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_870 = 5'h1c == _myNewVec_7_T_3[4:0] ? myVec_28 : _GEN_869; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_871 = 5'h1d == _myNewVec_7_T_3[4:0] ? myVec_29 : _GEN_870; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_872 = 5'h1e == _myNewVec_7_T_3[4:0] ? myVec_30 : _GEN_871; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_7 = 5'h1f == _myNewVec_7_T_3[4:0] ? myVec_31 : _GEN_872; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_6_T_3 = _myNewVec_31_T_1 + 16'h19; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_875 = 5'h1 == _myNewVec_6_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_876 = 5'h2 == _myNewVec_6_T_3[4:0] ? myVec_2 : _GEN_875; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_877 = 5'h3 == _myNewVec_6_T_3[4:0] ? myVec_3 : _GEN_876; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_878 = 5'h4 == _myNewVec_6_T_3[4:0] ? myVec_4 : _GEN_877; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_879 = 5'h5 == _myNewVec_6_T_3[4:0] ? myVec_5 : _GEN_878; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_880 = 5'h6 == _myNewVec_6_T_3[4:0] ? myVec_6 : _GEN_879; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_881 = 5'h7 == _myNewVec_6_T_3[4:0] ? myVec_7 : _GEN_880; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_882 = 5'h8 == _myNewVec_6_T_3[4:0] ? myVec_8 : _GEN_881; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_883 = 5'h9 == _myNewVec_6_T_3[4:0] ? myVec_9 : _GEN_882; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_884 = 5'ha == _myNewVec_6_T_3[4:0] ? myVec_10 : _GEN_883; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_885 = 5'hb == _myNewVec_6_T_3[4:0] ? myVec_11 : _GEN_884; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_886 = 5'hc == _myNewVec_6_T_3[4:0] ? myVec_12 : _GEN_885; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_887 = 5'hd == _myNewVec_6_T_3[4:0] ? myVec_13 : _GEN_886; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_888 = 5'he == _myNewVec_6_T_3[4:0] ? myVec_14 : _GEN_887; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_889 = 5'hf == _myNewVec_6_T_3[4:0] ? myVec_15 : _GEN_888; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_890 = 5'h10 == _myNewVec_6_T_3[4:0] ? myVec_16 : _GEN_889; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_891 = 5'h11 == _myNewVec_6_T_3[4:0] ? myVec_17 : _GEN_890; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_892 = 5'h12 == _myNewVec_6_T_3[4:0] ? myVec_18 : _GEN_891; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_893 = 5'h13 == _myNewVec_6_T_3[4:0] ? myVec_19 : _GEN_892; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_894 = 5'h14 == _myNewVec_6_T_3[4:0] ? myVec_20 : _GEN_893; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_895 = 5'h15 == _myNewVec_6_T_3[4:0] ? myVec_21 : _GEN_894; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_896 = 5'h16 == _myNewVec_6_T_3[4:0] ? myVec_22 : _GEN_895; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_897 = 5'h17 == _myNewVec_6_T_3[4:0] ? myVec_23 : _GEN_896; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_898 = 5'h18 == _myNewVec_6_T_3[4:0] ? myVec_24 : _GEN_897; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_899 = 5'h19 == _myNewVec_6_T_3[4:0] ? myVec_25 : _GEN_898; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_900 = 5'h1a == _myNewVec_6_T_3[4:0] ? myVec_26 : _GEN_899; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_901 = 5'h1b == _myNewVec_6_T_3[4:0] ? myVec_27 : _GEN_900; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_902 = 5'h1c == _myNewVec_6_T_3[4:0] ? myVec_28 : _GEN_901; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_903 = 5'h1d == _myNewVec_6_T_3[4:0] ? myVec_29 : _GEN_902; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_904 = 5'h1e == _myNewVec_6_T_3[4:0] ? myVec_30 : _GEN_903; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_6 = 5'h1f == _myNewVec_6_T_3[4:0] ? myVec_31 : _GEN_904; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_5_T_3 = _myNewVec_31_T_1 + 16'h1a; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_907 = 5'h1 == _myNewVec_5_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_908 = 5'h2 == _myNewVec_5_T_3[4:0] ? myVec_2 : _GEN_907; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_909 = 5'h3 == _myNewVec_5_T_3[4:0] ? myVec_3 : _GEN_908; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_910 = 5'h4 == _myNewVec_5_T_3[4:0] ? myVec_4 : _GEN_909; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_911 = 5'h5 == _myNewVec_5_T_3[4:0] ? myVec_5 : _GEN_910; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_912 = 5'h6 == _myNewVec_5_T_3[4:0] ? myVec_6 : _GEN_911; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_913 = 5'h7 == _myNewVec_5_T_3[4:0] ? myVec_7 : _GEN_912; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_914 = 5'h8 == _myNewVec_5_T_3[4:0] ? myVec_8 : _GEN_913; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_915 = 5'h9 == _myNewVec_5_T_3[4:0] ? myVec_9 : _GEN_914; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_916 = 5'ha == _myNewVec_5_T_3[4:0] ? myVec_10 : _GEN_915; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_917 = 5'hb == _myNewVec_5_T_3[4:0] ? myVec_11 : _GEN_916; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_918 = 5'hc == _myNewVec_5_T_3[4:0] ? myVec_12 : _GEN_917; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_919 = 5'hd == _myNewVec_5_T_3[4:0] ? myVec_13 : _GEN_918; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_920 = 5'he == _myNewVec_5_T_3[4:0] ? myVec_14 : _GEN_919; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_921 = 5'hf == _myNewVec_5_T_3[4:0] ? myVec_15 : _GEN_920; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_922 = 5'h10 == _myNewVec_5_T_3[4:0] ? myVec_16 : _GEN_921; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_923 = 5'h11 == _myNewVec_5_T_3[4:0] ? myVec_17 : _GEN_922; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_924 = 5'h12 == _myNewVec_5_T_3[4:0] ? myVec_18 : _GEN_923; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_925 = 5'h13 == _myNewVec_5_T_3[4:0] ? myVec_19 : _GEN_924; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_926 = 5'h14 == _myNewVec_5_T_3[4:0] ? myVec_20 : _GEN_925; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_927 = 5'h15 == _myNewVec_5_T_3[4:0] ? myVec_21 : _GEN_926; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_928 = 5'h16 == _myNewVec_5_T_3[4:0] ? myVec_22 : _GEN_927; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_929 = 5'h17 == _myNewVec_5_T_3[4:0] ? myVec_23 : _GEN_928; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_930 = 5'h18 == _myNewVec_5_T_3[4:0] ? myVec_24 : _GEN_929; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_931 = 5'h19 == _myNewVec_5_T_3[4:0] ? myVec_25 : _GEN_930; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_932 = 5'h1a == _myNewVec_5_T_3[4:0] ? myVec_26 : _GEN_931; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_933 = 5'h1b == _myNewVec_5_T_3[4:0] ? myVec_27 : _GEN_932; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_934 = 5'h1c == _myNewVec_5_T_3[4:0] ? myVec_28 : _GEN_933; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_935 = 5'h1d == _myNewVec_5_T_3[4:0] ? myVec_29 : _GEN_934; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_936 = 5'h1e == _myNewVec_5_T_3[4:0] ? myVec_30 : _GEN_935; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_5 = 5'h1f == _myNewVec_5_T_3[4:0] ? myVec_31 : _GEN_936; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_4_T_3 = _myNewVec_31_T_1 + 16'h1b; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_939 = 5'h1 == _myNewVec_4_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_940 = 5'h2 == _myNewVec_4_T_3[4:0] ? myVec_2 : _GEN_939; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_941 = 5'h3 == _myNewVec_4_T_3[4:0] ? myVec_3 : _GEN_940; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_942 = 5'h4 == _myNewVec_4_T_3[4:0] ? myVec_4 : _GEN_941; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_943 = 5'h5 == _myNewVec_4_T_3[4:0] ? myVec_5 : _GEN_942; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_944 = 5'h6 == _myNewVec_4_T_3[4:0] ? myVec_6 : _GEN_943; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_945 = 5'h7 == _myNewVec_4_T_3[4:0] ? myVec_7 : _GEN_944; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_946 = 5'h8 == _myNewVec_4_T_3[4:0] ? myVec_8 : _GEN_945; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_947 = 5'h9 == _myNewVec_4_T_3[4:0] ? myVec_9 : _GEN_946; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_948 = 5'ha == _myNewVec_4_T_3[4:0] ? myVec_10 : _GEN_947; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_949 = 5'hb == _myNewVec_4_T_3[4:0] ? myVec_11 : _GEN_948; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_950 = 5'hc == _myNewVec_4_T_3[4:0] ? myVec_12 : _GEN_949; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_951 = 5'hd == _myNewVec_4_T_3[4:0] ? myVec_13 : _GEN_950; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_952 = 5'he == _myNewVec_4_T_3[4:0] ? myVec_14 : _GEN_951; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_953 = 5'hf == _myNewVec_4_T_3[4:0] ? myVec_15 : _GEN_952; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_954 = 5'h10 == _myNewVec_4_T_3[4:0] ? myVec_16 : _GEN_953; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_955 = 5'h11 == _myNewVec_4_T_3[4:0] ? myVec_17 : _GEN_954; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_956 = 5'h12 == _myNewVec_4_T_3[4:0] ? myVec_18 : _GEN_955; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_957 = 5'h13 == _myNewVec_4_T_3[4:0] ? myVec_19 : _GEN_956; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_958 = 5'h14 == _myNewVec_4_T_3[4:0] ? myVec_20 : _GEN_957; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_959 = 5'h15 == _myNewVec_4_T_3[4:0] ? myVec_21 : _GEN_958; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_960 = 5'h16 == _myNewVec_4_T_3[4:0] ? myVec_22 : _GEN_959; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_961 = 5'h17 == _myNewVec_4_T_3[4:0] ? myVec_23 : _GEN_960; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_962 = 5'h18 == _myNewVec_4_T_3[4:0] ? myVec_24 : _GEN_961; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_963 = 5'h19 == _myNewVec_4_T_3[4:0] ? myVec_25 : _GEN_962; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_964 = 5'h1a == _myNewVec_4_T_3[4:0] ? myVec_26 : _GEN_963; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_965 = 5'h1b == _myNewVec_4_T_3[4:0] ? myVec_27 : _GEN_964; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_966 = 5'h1c == _myNewVec_4_T_3[4:0] ? myVec_28 : _GEN_965; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_967 = 5'h1d == _myNewVec_4_T_3[4:0] ? myVec_29 : _GEN_966; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_968 = 5'h1e == _myNewVec_4_T_3[4:0] ? myVec_30 : _GEN_967; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_4 = 5'h1f == _myNewVec_4_T_3[4:0] ? myVec_31 : _GEN_968; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_3_T_3 = _myNewVec_31_T_1 + 16'h1c; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_971 = 5'h1 == _myNewVec_3_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_972 = 5'h2 == _myNewVec_3_T_3[4:0] ? myVec_2 : _GEN_971; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_973 = 5'h3 == _myNewVec_3_T_3[4:0] ? myVec_3 : _GEN_972; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_974 = 5'h4 == _myNewVec_3_T_3[4:0] ? myVec_4 : _GEN_973; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_975 = 5'h5 == _myNewVec_3_T_3[4:0] ? myVec_5 : _GEN_974; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_976 = 5'h6 == _myNewVec_3_T_3[4:0] ? myVec_6 : _GEN_975; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_977 = 5'h7 == _myNewVec_3_T_3[4:0] ? myVec_7 : _GEN_976; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_978 = 5'h8 == _myNewVec_3_T_3[4:0] ? myVec_8 : _GEN_977; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_979 = 5'h9 == _myNewVec_3_T_3[4:0] ? myVec_9 : _GEN_978; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_980 = 5'ha == _myNewVec_3_T_3[4:0] ? myVec_10 : _GEN_979; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_981 = 5'hb == _myNewVec_3_T_3[4:0] ? myVec_11 : _GEN_980; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_982 = 5'hc == _myNewVec_3_T_3[4:0] ? myVec_12 : _GEN_981; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_983 = 5'hd == _myNewVec_3_T_3[4:0] ? myVec_13 : _GEN_982; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_984 = 5'he == _myNewVec_3_T_3[4:0] ? myVec_14 : _GEN_983; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_985 = 5'hf == _myNewVec_3_T_3[4:0] ? myVec_15 : _GEN_984; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_986 = 5'h10 == _myNewVec_3_T_3[4:0] ? myVec_16 : _GEN_985; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_987 = 5'h11 == _myNewVec_3_T_3[4:0] ? myVec_17 : _GEN_986; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_988 = 5'h12 == _myNewVec_3_T_3[4:0] ? myVec_18 : _GEN_987; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_989 = 5'h13 == _myNewVec_3_T_3[4:0] ? myVec_19 : _GEN_988; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_990 = 5'h14 == _myNewVec_3_T_3[4:0] ? myVec_20 : _GEN_989; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_991 = 5'h15 == _myNewVec_3_T_3[4:0] ? myVec_21 : _GEN_990; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_992 = 5'h16 == _myNewVec_3_T_3[4:0] ? myVec_22 : _GEN_991; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_993 = 5'h17 == _myNewVec_3_T_3[4:0] ? myVec_23 : _GEN_992; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_994 = 5'h18 == _myNewVec_3_T_3[4:0] ? myVec_24 : _GEN_993; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_995 = 5'h19 == _myNewVec_3_T_3[4:0] ? myVec_25 : _GEN_994; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_996 = 5'h1a == _myNewVec_3_T_3[4:0] ? myVec_26 : _GEN_995; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_997 = 5'h1b == _myNewVec_3_T_3[4:0] ? myVec_27 : _GEN_996; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_998 = 5'h1c == _myNewVec_3_T_3[4:0] ? myVec_28 : _GEN_997; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_999 = 5'h1d == _myNewVec_3_T_3[4:0] ? myVec_29 : _GEN_998; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1000 = 5'h1e == _myNewVec_3_T_3[4:0] ? myVec_30 : _GEN_999; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_3 = 5'h1f == _myNewVec_3_T_3[4:0] ? myVec_31 : _GEN_1000; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_2_T_3 = _myNewVec_31_T_1 + 16'h1d; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_1003 = 5'h1 == _myNewVec_2_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1004 = 5'h2 == _myNewVec_2_T_3[4:0] ? myVec_2 : _GEN_1003; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1005 = 5'h3 == _myNewVec_2_T_3[4:0] ? myVec_3 : _GEN_1004; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1006 = 5'h4 == _myNewVec_2_T_3[4:0] ? myVec_4 : _GEN_1005; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1007 = 5'h5 == _myNewVec_2_T_3[4:0] ? myVec_5 : _GEN_1006; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1008 = 5'h6 == _myNewVec_2_T_3[4:0] ? myVec_6 : _GEN_1007; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1009 = 5'h7 == _myNewVec_2_T_3[4:0] ? myVec_7 : _GEN_1008; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1010 = 5'h8 == _myNewVec_2_T_3[4:0] ? myVec_8 : _GEN_1009; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1011 = 5'h9 == _myNewVec_2_T_3[4:0] ? myVec_9 : _GEN_1010; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1012 = 5'ha == _myNewVec_2_T_3[4:0] ? myVec_10 : _GEN_1011; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1013 = 5'hb == _myNewVec_2_T_3[4:0] ? myVec_11 : _GEN_1012; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1014 = 5'hc == _myNewVec_2_T_3[4:0] ? myVec_12 : _GEN_1013; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1015 = 5'hd == _myNewVec_2_T_3[4:0] ? myVec_13 : _GEN_1014; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1016 = 5'he == _myNewVec_2_T_3[4:0] ? myVec_14 : _GEN_1015; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1017 = 5'hf == _myNewVec_2_T_3[4:0] ? myVec_15 : _GEN_1016; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1018 = 5'h10 == _myNewVec_2_T_3[4:0] ? myVec_16 : _GEN_1017; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1019 = 5'h11 == _myNewVec_2_T_3[4:0] ? myVec_17 : _GEN_1018; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1020 = 5'h12 == _myNewVec_2_T_3[4:0] ? myVec_18 : _GEN_1019; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1021 = 5'h13 == _myNewVec_2_T_3[4:0] ? myVec_19 : _GEN_1020; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1022 = 5'h14 == _myNewVec_2_T_3[4:0] ? myVec_20 : _GEN_1021; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1023 = 5'h15 == _myNewVec_2_T_3[4:0] ? myVec_21 : _GEN_1022; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1024 = 5'h16 == _myNewVec_2_T_3[4:0] ? myVec_22 : _GEN_1023; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1025 = 5'h17 == _myNewVec_2_T_3[4:0] ? myVec_23 : _GEN_1024; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1026 = 5'h18 == _myNewVec_2_T_3[4:0] ? myVec_24 : _GEN_1025; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1027 = 5'h19 == _myNewVec_2_T_3[4:0] ? myVec_25 : _GEN_1026; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1028 = 5'h1a == _myNewVec_2_T_3[4:0] ? myVec_26 : _GEN_1027; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1029 = 5'h1b == _myNewVec_2_T_3[4:0] ? myVec_27 : _GEN_1028; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1030 = 5'h1c == _myNewVec_2_T_3[4:0] ? myVec_28 : _GEN_1029; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1031 = 5'h1d == _myNewVec_2_T_3[4:0] ? myVec_29 : _GEN_1030; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1032 = 5'h1e == _myNewVec_2_T_3[4:0] ? myVec_30 : _GEN_1031; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_2 = 5'h1f == _myNewVec_2_T_3[4:0] ? myVec_31 : _GEN_1032; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_1_T_3 = _myNewVec_31_T_1 + 16'h1e; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_1035 = 5'h1 == _myNewVec_1_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1036 = 5'h2 == _myNewVec_1_T_3[4:0] ? myVec_2 : _GEN_1035; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1037 = 5'h3 == _myNewVec_1_T_3[4:0] ? myVec_3 : _GEN_1036; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1038 = 5'h4 == _myNewVec_1_T_3[4:0] ? myVec_4 : _GEN_1037; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1039 = 5'h5 == _myNewVec_1_T_3[4:0] ? myVec_5 : _GEN_1038; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1040 = 5'h6 == _myNewVec_1_T_3[4:0] ? myVec_6 : _GEN_1039; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1041 = 5'h7 == _myNewVec_1_T_3[4:0] ? myVec_7 : _GEN_1040; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1042 = 5'h8 == _myNewVec_1_T_3[4:0] ? myVec_8 : _GEN_1041; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1043 = 5'h9 == _myNewVec_1_T_3[4:0] ? myVec_9 : _GEN_1042; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1044 = 5'ha == _myNewVec_1_T_3[4:0] ? myVec_10 : _GEN_1043; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1045 = 5'hb == _myNewVec_1_T_3[4:0] ? myVec_11 : _GEN_1044; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1046 = 5'hc == _myNewVec_1_T_3[4:0] ? myVec_12 : _GEN_1045; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1047 = 5'hd == _myNewVec_1_T_3[4:0] ? myVec_13 : _GEN_1046; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1048 = 5'he == _myNewVec_1_T_3[4:0] ? myVec_14 : _GEN_1047; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1049 = 5'hf == _myNewVec_1_T_3[4:0] ? myVec_15 : _GEN_1048; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1050 = 5'h10 == _myNewVec_1_T_3[4:0] ? myVec_16 : _GEN_1049; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1051 = 5'h11 == _myNewVec_1_T_3[4:0] ? myVec_17 : _GEN_1050; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1052 = 5'h12 == _myNewVec_1_T_3[4:0] ? myVec_18 : _GEN_1051; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1053 = 5'h13 == _myNewVec_1_T_3[4:0] ? myVec_19 : _GEN_1052; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1054 = 5'h14 == _myNewVec_1_T_3[4:0] ? myVec_20 : _GEN_1053; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1055 = 5'h15 == _myNewVec_1_T_3[4:0] ? myVec_21 : _GEN_1054; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1056 = 5'h16 == _myNewVec_1_T_3[4:0] ? myVec_22 : _GEN_1055; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1057 = 5'h17 == _myNewVec_1_T_3[4:0] ? myVec_23 : _GEN_1056; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1058 = 5'h18 == _myNewVec_1_T_3[4:0] ? myVec_24 : _GEN_1057; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1059 = 5'h19 == _myNewVec_1_T_3[4:0] ? myVec_25 : _GEN_1058; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1060 = 5'h1a == _myNewVec_1_T_3[4:0] ? myVec_26 : _GEN_1059; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1061 = 5'h1b == _myNewVec_1_T_3[4:0] ? myVec_27 : _GEN_1060; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1062 = 5'h1c == _myNewVec_1_T_3[4:0] ? myVec_28 : _GEN_1061; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1063 = 5'h1d == _myNewVec_1_T_3[4:0] ? myVec_29 : _GEN_1062; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1064 = 5'h1e == _myNewVec_1_T_3[4:0] ? myVec_30 : _GEN_1063; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_1 = 5'h1f == _myNewVec_1_T_3[4:0] ? myVec_31 : _GEN_1064; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [15:0] _myNewVec_0_T_3 = _myNewVec_31_T_1 + 16'h1f; // @[hh_datapath_chisel.scala 234:60]
  wire [31:0] _GEN_1067 = 5'h1 == _myNewVec_0_T_3[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1068 = 5'h2 == _myNewVec_0_T_3[4:0] ? myVec_2 : _GEN_1067; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1069 = 5'h3 == _myNewVec_0_T_3[4:0] ? myVec_3 : _GEN_1068; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1070 = 5'h4 == _myNewVec_0_T_3[4:0] ? myVec_4 : _GEN_1069; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1071 = 5'h5 == _myNewVec_0_T_3[4:0] ? myVec_5 : _GEN_1070; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1072 = 5'h6 == _myNewVec_0_T_3[4:0] ? myVec_6 : _GEN_1071; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1073 = 5'h7 == _myNewVec_0_T_3[4:0] ? myVec_7 : _GEN_1072; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1074 = 5'h8 == _myNewVec_0_T_3[4:0] ? myVec_8 : _GEN_1073; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1075 = 5'h9 == _myNewVec_0_T_3[4:0] ? myVec_9 : _GEN_1074; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1076 = 5'ha == _myNewVec_0_T_3[4:0] ? myVec_10 : _GEN_1075; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1077 = 5'hb == _myNewVec_0_T_3[4:0] ? myVec_11 : _GEN_1076; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1078 = 5'hc == _myNewVec_0_T_3[4:0] ? myVec_12 : _GEN_1077; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1079 = 5'hd == _myNewVec_0_T_3[4:0] ? myVec_13 : _GEN_1078; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1080 = 5'he == _myNewVec_0_T_3[4:0] ? myVec_14 : _GEN_1079; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1081 = 5'hf == _myNewVec_0_T_3[4:0] ? myVec_15 : _GEN_1080; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1082 = 5'h10 == _myNewVec_0_T_3[4:0] ? myVec_16 : _GEN_1081; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1083 = 5'h11 == _myNewVec_0_T_3[4:0] ? myVec_17 : _GEN_1082; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1084 = 5'h12 == _myNewVec_0_T_3[4:0] ? myVec_18 : _GEN_1083; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1085 = 5'h13 == _myNewVec_0_T_3[4:0] ? myVec_19 : _GEN_1084; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1086 = 5'h14 == _myNewVec_0_T_3[4:0] ? myVec_20 : _GEN_1085; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1087 = 5'h15 == _myNewVec_0_T_3[4:0] ? myVec_21 : _GEN_1086; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1088 = 5'h16 == _myNewVec_0_T_3[4:0] ? myVec_22 : _GEN_1087; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1089 = 5'h17 == _myNewVec_0_T_3[4:0] ? myVec_23 : _GEN_1088; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1090 = 5'h18 == _myNewVec_0_T_3[4:0] ? myVec_24 : _GEN_1089; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1091 = 5'h19 == _myNewVec_0_T_3[4:0] ? myVec_25 : _GEN_1090; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1092 = 5'h1a == _myNewVec_0_T_3[4:0] ? myVec_26 : _GEN_1091; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1093 = 5'h1b == _myNewVec_0_T_3[4:0] ? myVec_27 : _GEN_1092; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1094 = 5'h1c == _myNewVec_0_T_3[4:0] ? myVec_28 : _GEN_1093; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1095 = 5'h1d == _myNewVec_0_T_3[4:0] ? myVec_29 : _GEN_1094; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] _GEN_1096 = 5'h1e == _myNewVec_0_T_3[4:0] ? myVec_30 : _GEN_1095; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [31:0] myNewVec_0 = 5'h1f == _myNewVec_0_T_3[4:0] ? myVec_31 : _GEN_1096; // @[hh_datapath_chisel.scala 234:{37,37}]
  wire [255:0] myNewWire_lo_lo = {myNewVec_7,myNewVec_6,myNewVec_5,myNewVec_4,myNewVec_3,myNewVec_2,myNewVec_1,
    myNewVec_0}; // @[hh_datapath_chisel.scala 238:27]
  wire [511:0] myNewWire_lo = {myNewVec_15,myNewVec_14,myNewVec_13,myNewVec_12,myNewVec_11,myNewVec_10,myNewVec_9,
    myNewVec_8,myNewWire_lo_lo}; // @[hh_datapath_chisel.scala 238:27]
  wire [1023:0] myNewWire = {myNewVec_31,myNewVec_30,myNewVec_29,myNewVec_28,myNewVec_27,myNewVec_26,myNewVec_25,
    myNewVec_24,myNewWire_hi_lo,myNewWire_lo}; // @[hh_datapath_chisel.scala 238:27]
  wire [1055:0] _vk_update_T = {vk1,myNewWire}; // @[Cat.scala 31:58]
  wire [21:0] _vk_update_T_3 = _myNewVec_31_T_1 * 6'h20; // @[hh_datapath_chisel.scala 242:57]
  wire [1055:0] _vk_update_T_4 = _vk_update_T >> _vk_update_T_3; // @[hh_datapath_chisel.scala 242:39]
  wire [1055:0] _GEN_1098 = io_vk1_vld ? _vk_update_T_4 : 1056'h0; // @[hh_datapath_chisel.scala 241:27 242:17 245:17]
  wire [1055:0] _GEN_1099 = io_rst ? 1056'h0 : _GEN_1098; // @[hh_datapath_chisel.scala 239:17 240:17]
  wire [1023:0] vk_update = _GEN_1099[1023:0]; // @[hh_datapath_chisel.scala 81:25]
  wire [1023:0] vk = io_vk1_vld ? vk_update : vk_reg; // @[hh_datapath_chisel.scala 155:21 156:10 158:10]
  wire [1023:0] _GEN_21 = io_d4_rdy ? io_hh_din : ddot_din_a_reg; // @[hh_datapath_chisel.scala 139:26 140:18 142:18]
  wire [1023:0] _GEN_22 = io_d3_rdy ? vk : _GEN_21; // @[hh_datapath_chisel.scala 137:26 138:18]
  wire [1023:0] ddot_din_a = io_d1_rdy ? io_hh_din : _GEN_22; // @[hh_datapath_chisel.scala 135:20 136:18]
  wire [1023:0] _GEN_24 = io_d4_rdy ? vk : ddot_din_b_reg; // @[hh_datapath_chisel.scala 149:26 150:18 152:18]
  wire [1023:0] _GEN_25 = io_d3_rdy ? vk : _GEN_24; // @[hh_datapath_chisel.scala 147:26 148:18]
  wire [1023:0] ddot_din_b = io_d1_rdy ? io_hh_din : _GEN_25; // @[hh_datapath_chisel.scala 145:20 146:18]
  wire [31:0] ddot_dout = FP_DDOT_dp_io_out_s; // @[hh_datapath_chisel.scala 254:15 75:25]
  wire [31:0] _GEN_41 = 5'h1 == io_hh_cnt[4:0] ? myVec_1 : myVec_0; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_42 = 5'h2 == io_hh_cnt[4:0] ? myVec_2 : _GEN_41; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_43 = 5'h3 == io_hh_cnt[4:0] ? myVec_3 : _GEN_42; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_44 = 5'h4 == io_hh_cnt[4:0] ? myVec_4 : _GEN_43; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_45 = 5'h5 == io_hh_cnt[4:0] ? myVec_5 : _GEN_44; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_46 = 5'h6 == io_hh_cnt[4:0] ? myVec_6 : _GEN_45; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_47 = 5'h7 == io_hh_cnt[4:0] ? myVec_7 : _GEN_46; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_48 = 5'h8 == io_hh_cnt[4:0] ? myVec_8 : _GEN_47; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_49 = 5'h9 == io_hh_cnt[4:0] ? myVec_9 : _GEN_48; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_50 = 5'ha == io_hh_cnt[4:0] ? myVec_10 : _GEN_49; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_51 = 5'hb == io_hh_cnt[4:0] ? myVec_11 : _GEN_50; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_52 = 5'hc == io_hh_cnt[4:0] ? myVec_12 : _GEN_51; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_53 = 5'hd == io_hh_cnt[4:0] ? myVec_13 : _GEN_52; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_54 = 5'he == io_hh_cnt[4:0] ? myVec_14 : _GEN_53; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_55 = 5'hf == io_hh_cnt[4:0] ? myVec_15 : _GEN_54; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_56 = 5'h10 == io_hh_cnt[4:0] ? myVec_16 : _GEN_55; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_57 = 5'h11 == io_hh_cnt[4:0] ? myVec_17 : _GEN_56; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_58 = 5'h12 == io_hh_cnt[4:0] ? myVec_18 : _GEN_57; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_59 = 5'h13 == io_hh_cnt[4:0] ? myVec_19 : _GEN_58; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_60 = 5'h14 == io_hh_cnt[4:0] ? myVec_20 : _GEN_59; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_61 = 5'h15 == io_hh_cnt[4:0] ? myVec_21 : _GEN_60; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_62 = 5'h16 == io_hh_cnt[4:0] ? myVec_22 : _GEN_61; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_63 = 5'h17 == io_hh_cnt[4:0] ? myVec_23 : _GEN_62; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_64 = 5'h18 == io_hh_cnt[4:0] ? myVec_24 : _GEN_63; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_65 = 5'h19 == io_hh_cnt[4:0] ? myVec_25 : _GEN_64; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_66 = 5'h1a == io_hh_cnt[4:0] ? myVec_26 : _GEN_65; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_67 = 5'h1b == io_hh_cnt[4:0] ? myVec_27 : _GEN_66; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_68 = 5'h1c == io_hh_cnt[4:0] ? myVec_28 : _GEN_67; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_69 = 5'h1d == io_hh_cnt[4:0] ? myVec_29 : _GEN_68; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_70 = 5'h1e == io_hh_cnt[4:0] ? myVec_30 : _GEN_69; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_71 = 5'h1f == io_hh_cnt[4:0] ? myVec_31 : _GEN_70; // @[hh_datapath_chisel.scala 226:{17,17}]
  wire [31:0] _GEN_72 = io_d1_rdy ? _GEN_71 : 32'h0; // @[hh_datapath_chisel.scala 225:26 226:17 228:17]
  wire [31:0] x1_update = io_rst ? 32'h0 : _GEN_72; // @[hh_datapath_chisel.scala 223:17 224:17]
  wire [31:0] d2_update = FP_square_root_newfpu_io_out_s; // @[hh_datapath_chisel.scala 259:15 90:25]
  wire [31:0] tk_update = hqr7_io_out_s; // @[hh_datapath_chisel.scala 268:14 92:25]
  wire [31:0] d5_update = FP_multiplier_10ccs_io_out_s; // @[hh_datapath_chisel.scala 274:14 94:25]
  reg [4063:0] d4_update_reg; // @[hh_datapath_chisel.scala 161:28]
  wire [4095:0] _d4_update_reg_T = {ddot_dout,d4_update_reg}; // @[Cat.scala 31:58]
  wire [31:0] myAxpyVec_1 = axpy_dp_io_out_s_30; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_0 = axpy_dp_io_out_s_31; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_3 = axpy_dp_io_out_s_28; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_2 = axpy_dp_io_out_s_29; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_5 = axpy_dp_io_out_s_26; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_4 = axpy_dp_io_out_s_27; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_7 = axpy_dp_io_out_s_24; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_6 = axpy_dp_io_out_s_25; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [255:0] io_hh_dout_lo_lo = {myAxpyVec_7,myAxpyVec_6,myAxpyVec_5,myAxpyVec_4,myAxpyVec_3,myAxpyVec_2,myAxpyVec_1,
    myAxpyVec_0}; // @[hh_datapath_chisel.scala 286:28]
  wire [31:0] myAxpyVec_9 = axpy_dp_io_out_s_22; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_8 = axpy_dp_io_out_s_23; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_11 = axpy_dp_io_out_s_20; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_10 = axpy_dp_io_out_s_21; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_13 = axpy_dp_io_out_s_18; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_12 = axpy_dp_io_out_s_19; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_15 = axpy_dp_io_out_s_16; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_14 = axpy_dp_io_out_s_17; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [511:0] io_hh_dout_lo = {myAxpyVec_15,myAxpyVec_14,myAxpyVec_13,myAxpyVec_12,myAxpyVec_11,myAxpyVec_10,
    myAxpyVec_9,myAxpyVec_8,io_hh_dout_lo_lo}; // @[hh_datapath_chisel.scala 286:28]
  wire [31:0] myAxpyVec_17 = axpy_dp_io_out_s_14; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_16 = axpy_dp_io_out_s_15; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_19 = axpy_dp_io_out_s_12; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_18 = axpy_dp_io_out_s_13; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_21 = axpy_dp_io_out_s_10; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_20 = axpy_dp_io_out_s_11; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_23 = axpy_dp_io_out_s_8; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_22 = axpy_dp_io_out_s_9; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [255:0] io_hh_dout_hi_lo = {myAxpyVec_23,myAxpyVec_22,myAxpyVec_21,myAxpyVec_20,myAxpyVec_19,myAxpyVec_18,
    myAxpyVec_17,myAxpyVec_16}; // @[hh_datapath_chisel.scala 286:28]
  wire [31:0] myAxpyVec_25 = axpy_dp_io_out_s_6; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_24 = axpy_dp_io_out_s_7; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_27 = axpy_dp_io_out_s_4; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_26 = axpy_dp_io_out_s_5; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_29 = axpy_dp_io_out_s_2; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_28 = axpy_dp_io_out_s_3; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_31 = axpy_dp_io_out_s_0; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [31:0] myAxpyVec_30 = axpy_dp_io_out_s_1; // @[hh_datapath_chisel.scala 282:24 284:36]
  wire [511:0] io_hh_dout_hi = {myAxpyVec_31,myAxpyVec_30,myAxpyVec_29,myAxpyVec_28,myAxpyVec_27,myAxpyVec_26,
    myAxpyVec_25,myAxpyVec_24,io_hh_dout_hi_lo}; // @[hh_datapath_chisel.scala 286:28]
  FP_DDOT_dp FP_DDOT_dp ( // @[hh_datapath_chisel.scala 248:21]
    .clock(FP_DDOT_dp_clock),
    .reset(FP_DDOT_dp_reset),
    .io_in_a_0(FP_DDOT_dp_io_in_a_0),
    .io_in_a_1(FP_DDOT_dp_io_in_a_1),
    .io_in_a_2(FP_DDOT_dp_io_in_a_2),
    .io_in_a_3(FP_DDOT_dp_io_in_a_3),
    .io_in_a_4(FP_DDOT_dp_io_in_a_4),
    .io_in_a_5(FP_DDOT_dp_io_in_a_5),
    .io_in_a_6(FP_DDOT_dp_io_in_a_6),
    .io_in_a_7(FP_DDOT_dp_io_in_a_7),
    .io_in_a_8(FP_DDOT_dp_io_in_a_8),
    .io_in_a_9(FP_DDOT_dp_io_in_a_9),
    .io_in_a_10(FP_DDOT_dp_io_in_a_10),
    .io_in_a_11(FP_DDOT_dp_io_in_a_11),
    .io_in_a_12(FP_DDOT_dp_io_in_a_12),
    .io_in_a_13(FP_DDOT_dp_io_in_a_13),
    .io_in_a_14(FP_DDOT_dp_io_in_a_14),
    .io_in_a_15(FP_DDOT_dp_io_in_a_15),
    .io_in_a_16(FP_DDOT_dp_io_in_a_16),
    .io_in_a_17(FP_DDOT_dp_io_in_a_17),
    .io_in_a_18(FP_DDOT_dp_io_in_a_18),
    .io_in_a_19(FP_DDOT_dp_io_in_a_19),
    .io_in_a_20(FP_DDOT_dp_io_in_a_20),
    .io_in_a_21(FP_DDOT_dp_io_in_a_21),
    .io_in_a_22(FP_DDOT_dp_io_in_a_22),
    .io_in_a_23(FP_DDOT_dp_io_in_a_23),
    .io_in_a_24(FP_DDOT_dp_io_in_a_24),
    .io_in_a_25(FP_DDOT_dp_io_in_a_25),
    .io_in_a_26(FP_DDOT_dp_io_in_a_26),
    .io_in_a_27(FP_DDOT_dp_io_in_a_27),
    .io_in_a_28(FP_DDOT_dp_io_in_a_28),
    .io_in_a_29(FP_DDOT_dp_io_in_a_29),
    .io_in_a_30(FP_DDOT_dp_io_in_a_30),
    .io_in_a_31(FP_DDOT_dp_io_in_a_31),
    .io_in_b_0(FP_DDOT_dp_io_in_b_0),
    .io_in_b_1(FP_DDOT_dp_io_in_b_1),
    .io_in_b_2(FP_DDOT_dp_io_in_b_2),
    .io_in_b_3(FP_DDOT_dp_io_in_b_3),
    .io_in_b_4(FP_DDOT_dp_io_in_b_4),
    .io_in_b_5(FP_DDOT_dp_io_in_b_5),
    .io_in_b_6(FP_DDOT_dp_io_in_b_6),
    .io_in_b_7(FP_DDOT_dp_io_in_b_7),
    .io_in_b_8(FP_DDOT_dp_io_in_b_8),
    .io_in_b_9(FP_DDOT_dp_io_in_b_9),
    .io_in_b_10(FP_DDOT_dp_io_in_b_10),
    .io_in_b_11(FP_DDOT_dp_io_in_b_11),
    .io_in_b_12(FP_DDOT_dp_io_in_b_12),
    .io_in_b_13(FP_DDOT_dp_io_in_b_13),
    .io_in_b_14(FP_DDOT_dp_io_in_b_14),
    .io_in_b_15(FP_DDOT_dp_io_in_b_15),
    .io_in_b_16(FP_DDOT_dp_io_in_b_16),
    .io_in_b_17(FP_DDOT_dp_io_in_b_17),
    .io_in_b_18(FP_DDOT_dp_io_in_b_18),
    .io_in_b_19(FP_DDOT_dp_io_in_b_19),
    .io_in_b_20(FP_DDOT_dp_io_in_b_20),
    .io_in_b_21(FP_DDOT_dp_io_in_b_21),
    .io_in_b_22(FP_DDOT_dp_io_in_b_22),
    .io_in_b_23(FP_DDOT_dp_io_in_b_23),
    .io_in_b_24(FP_DDOT_dp_io_in_b_24),
    .io_in_b_25(FP_DDOT_dp_io_in_b_25),
    .io_in_b_26(FP_DDOT_dp_io_in_b_26),
    .io_in_b_27(FP_DDOT_dp_io_in_b_27),
    .io_in_b_28(FP_DDOT_dp_io_in_b_28),
    .io_in_b_29(FP_DDOT_dp_io_in_b_29),
    .io_in_b_30(FP_DDOT_dp_io_in_b_30),
    .io_in_b_31(FP_DDOT_dp_io_in_b_31),
    .io_out_s(FP_DDOT_dp_io_out_s)
  );
  FP_square_root_newfpu FP_square_root_newfpu ( // @[hh_datapath_chisel.scala 256:22]
    .clock(FP_square_root_newfpu_clock),
    .reset(FP_square_root_newfpu_reset),
    .io_in_a(FP_square_root_newfpu_io_in_a),
    .io_out_s(FP_square_root_newfpu_io_out_s)
  );
  hqr5 hqr5 ( // @[hh_datapath_chisel.scala 261:20]
    .clock(hqr5_clock),
    .reset(hqr5_reset),
    .io_in_a(hqr5_io_in_a),
    .io_in_b(hqr5_io_in_b),
    .io_out_s(hqr5_io_out_s)
  );
  hqr7 hqr7 ( // @[hh_datapath_chisel.scala 266:20]
    .clock(hqr7_clock),
    .reset(hqr7_reset),
    .io_in_a(hqr7_io_in_a),
    .io_out_s(hqr7_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs ( // @[hh_datapath_chisel.scala 270:21]
    .clock(FP_multiplier_10ccs_clock),
    .reset(FP_multiplier_10ccs_reset),
    .io_in_a(FP_multiplier_10ccs_io_in_a),
    .io_in_b(FP_multiplier_10ccs_io_in_b),
    .io_out_s(FP_multiplier_10ccs_io_out_s)
  );
  axpy_dp axpy_dp ( // @[hh_datapath_chisel.scala 276:20]
    .clock(axpy_dp_clock),
    .reset(axpy_dp_reset),
    .io_in_a(axpy_dp_io_in_a),
    .io_in_b_0(axpy_dp_io_in_b_0),
    .io_in_b_1(axpy_dp_io_in_b_1),
    .io_in_b_2(axpy_dp_io_in_b_2),
    .io_in_b_3(axpy_dp_io_in_b_3),
    .io_in_b_4(axpy_dp_io_in_b_4),
    .io_in_b_5(axpy_dp_io_in_b_5),
    .io_in_b_6(axpy_dp_io_in_b_6),
    .io_in_b_7(axpy_dp_io_in_b_7),
    .io_in_b_8(axpy_dp_io_in_b_8),
    .io_in_b_9(axpy_dp_io_in_b_9),
    .io_in_b_10(axpy_dp_io_in_b_10),
    .io_in_b_11(axpy_dp_io_in_b_11),
    .io_in_b_12(axpy_dp_io_in_b_12),
    .io_in_b_13(axpy_dp_io_in_b_13),
    .io_in_b_14(axpy_dp_io_in_b_14),
    .io_in_b_15(axpy_dp_io_in_b_15),
    .io_in_b_16(axpy_dp_io_in_b_16),
    .io_in_b_17(axpy_dp_io_in_b_17),
    .io_in_b_18(axpy_dp_io_in_b_18),
    .io_in_b_19(axpy_dp_io_in_b_19),
    .io_in_b_20(axpy_dp_io_in_b_20),
    .io_in_b_21(axpy_dp_io_in_b_21),
    .io_in_b_22(axpy_dp_io_in_b_22),
    .io_in_b_23(axpy_dp_io_in_b_23),
    .io_in_b_24(axpy_dp_io_in_b_24),
    .io_in_b_25(axpy_dp_io_in_b_25),
    .io_in_b_26(axpy_dp_io_in_b_26),
    .io_in_b_27(axpy_dp_io_in_b_27),
    .io_in_b_28(axpy_dp_io_in_b_28),
    .io_in_b_29(axpy_dp_io_in_b_29),
    .io_in_b_30(axpy_dp_io_in_b_30),
    .io_in_b_31(axpy_dp_io_in_b_31),
    .io_in_c_0(axpy_dp_io_in_c_0),
    .io_in_c_1(axpy_dp_io_in_c_1),
    .io_in_c_2(axpy_dp_io_in_c_2),
    .io_in_c_3(axpy_dp_io_in_c_3),
    .io_in_c_4(axpy_dp_io_in_c_4),
    .io_in_c_5(axpy_dp_io_in_c_5),
    .io_in_c_6(axpy_dp_io_in_c_6),
    .io_in_c_7(axpy_dp_io_in_c_7),
    .io_in_c_8(axpy_dp_io_in_c_8),
    .io_in_c_9(axpy_dp_io_in_c_9),
    .io_in_c_10(axpy_dp_io_in_c_10),
    .io_in_c_11(axpy_dp_io_in_c_11),
    .io_in_c_12(axpy_dp_io_in_c_12),
    .io_in_c_13(axpy_dp_io_in_c_13),
    .io_in_c_14(axpy_dp_io_in_c_14),
    .io_in_c_15(axpy_dp_io_in_c_15),
    .io_in_c_16(axpy_dp_io_in_c_16),
    .io_in_c_17(axpy_dp_io_in_c_17),
    .io_in_c_18(axpy_dp_io_in_c_18),
    .io_in_c_19(axpy_dp_io_in_c_19),
    .io_in_c_20(axpy_dp_io_in_c_20),
    .io_in_c_21(axpy_dp_io_in_c_21),
    .io_in_c_22(axpy_dp_io_in_c_22),
    .io_in_c_23(axpy_dp_io_in_c_23),
    .io_in_c_24(axpy_dp_io_in_c_24),
    .io_in_c_25(axpy_dp_io_in_c_25),
    .io_in_c_26(axpy_dp_io_in_c_26),
    .io_in_c_27(axpy_dp_io_in_c_27),
    .io_in_c_28(axpy_dp_io_in_c_28),
    .io_in_c_29(axpy_dp_io_in_c_29),
    .io_in_c_30(axpy_dp_io_in_c_30),
    .io_in_c_31(axpy_dp_io_in_c_31),
    .io_out_s_0(axpy_dp_io_out_s_0),
    .io_out_s_1(axpy_dp_io_out_s_1),
    .io_out_s_2(axpy_dp_io_out_s_2),
    .io_out_s_3(axpy_dp_io_out_s_3),
    .io_out_s_4(axpy_dp_io_out_s_4),
    .io_out_s_5(axpy_dp_io_out_s_5),
    .io_out_s_6(axpy_dp_io_out_s_6),
    .io_out_s_7(axpy_dp_io_out_s_7),
    .io_out_s_8(axpy_dp_io_out_s_8),
    .io_out_s_9(axpy_dp_io_out_s_9),
    .io_out_s_10(axpy_dp_io_out_s_10),
    .io_out_s_11(axpy_dp_io_out_s_11),
    .io_out_s_12(axpy_dp_io_out_s_12),
    .io_out_s_13(axpy_dp_io_out_s_13),
    .io_out_s_14(axpy_dp_io_out_s_14),
    .io_out_s_15(axpy_dp_io_out_s_15),
    .io_out_s_16(axpy_dp_io_out_s_16),
    .io_out_s_17(axpy_dp_io_out_s_17),
    .io_out_s_18(axpy_dp_io_out_s_18),
    .io_out_s_19(axpy_dp_io_out_s_19),
    .io_out_s_20(axpy_dp_io_out_s_20),
    .io_out_s_21(axpy_dp_io_out_s_21),
    .io_out_s_22(axpy_dp_io_out_s_22),
    .io_out_s_23(axpy_dp_io_out_s_23),
    .io_out_s_24(axpy_dp_io_out_s_24),
    .io_out_s_25(axpy_dp_io_out_s_25),
    .io_out_s_26(axpy_dp_io_out_s_26),
    .io_out_s_27(axpy_dp_io_out_s_27),
    .io_out_s_28(axpy_dp_io_out_s_28),
    .io_out_s_29(axpy_dp_io_out_s_29),
    .io_out_s_30(axpy_dp_io_out_s_30),
    .io_out_s_31(axpy_dp_io_out_s_31)
  );
  assign io_hh_dout = {io_hh_dout_hi,io_hh_dout_lo}; // @[hh_datapath_chisel.scala 286:28]
  assign FP_DDOT_dp_clock = io_clk;
  assign FP_DDOT_dp_reset = io_rst;
  assign FP_DDOT_dp_io_in_a_0 = ddot_din_a[1023:992]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_1 = ddot_din_a[991:960]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_2 = ddot_din_a[959:928]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_3 = ddot_din_a[927:896]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_4 = ddot_din_a[895:864]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_5 = ddot_din_a[863:832]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_6 = ddot_din_a[831:800]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_7 = ddot_din_a[799:768]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_8 = ddot_din_a[767:736]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_9 = ddot_din_a[735:704]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_10 = ddot_din_a[703:672]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_11 = ddot_din_a[671:640]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_12 = ddot_din_a[639:608]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_13 = ddot_din_a[607:576]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_14 = ddot_din_a[575:544]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_15 = ddot_din_a[543:512]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_16 = ddot_din_a[511:480]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_17 = ddot_din_a[479:448]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_18 = ddot_din_a[447:416]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_19 = ddot_din_a[415:384]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_20 = ddot_din_a[383:352]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_21 = ddot_din_a[351:320]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_22 = ddot_din_a[319:288]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_23 = ddot_din_a[287:256]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_24 = ddot_din_a[255:224]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_25 = ddot_din_a[223:192]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_26 = ddot_din_a[191:160]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_27 = ddot_din_a[159:128]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_28 = ddot_din_a[127:96]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_29 = ddot_din_a[95:64]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_30 = ddot_din_a[63:32]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_a_31 = ddot_din_a[31:0]; // @[hh_datapath_chisel.scala 251:33]
  assign FP_DDOT_dp_io_in_b_0 = ddot_din_b[1023:992]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_1 = ddot_din_b[991:960]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_2 = ddot_din_b[959:928]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_3 = ddot_din_b[927:896]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_4 = ddot_din_b[895:864]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_5 = ddot_din_b[863:832]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_6 = ddot_din_b[831:800]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_7 = ddot_din_b[799:768]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_8 = ddot_din_b[767:736]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_9 = ddot_din_b[735:704]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_10 = ddot_din_b[703:672]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_11 = ddot_din_b[671:640]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_12 = ddot_din_b[639:608]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_13 = ddot_din_b[607:576]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_14 = ddot_din_b[575:544]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_15 = ddot_din_b[543:512]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_16 = ddot_din_b[511:480]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_17 = ddot_din_b[479:448]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_18 = ddot_din_b[447:416]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_19 = ddot_din_b[415:384]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_20 = ddot_din_b[383:352]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_21 = ddot_din_b[351:320]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_22 = ddot_din_b[319:288]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_23 = ddot_din_b[287:256]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_24 = ddot_din_b[255:224]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_25 = ddot_din_b[223:192]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_26 = ddot_din_b[191:160]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_27 = ddot_din_b[159:128]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_28 = ddot_din_b[127:96]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_29 = ddot_din_b[95:64]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_30 = ddot_din_b[63:32]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_DDOT_dp_io_in_b_31 = ddot_din_b[31:0]; // @[hh_datapath_chisel.scala 252:33]
  assign FP_square_root_newfpu_clock = io_clk;
  assign FP_square_root_newfpu_reset = io_rst;
  assign FP_square_root_newfpu_io_in_a = io_d1_vld ? ddot_dout : d1_reg; // @[hh_datapath_chisel.scala 171:20 172:10 174:10]
  assign hqr5_clock = io_clk;
  assign hqr5_reset = io_rst;
  assign hqr5_io_in_a = io_d1_rdy ? x1_update : x1_reg; // @[hh_datapath_chisel.scala 183:20 184:10 186:10]
  assign hqr5_io_in_b = io_d2_vld ? d2_update : d2_reg; // @[hh_datapath_chisel.scala 189:20 190:10 192:10]
  assign hqr7_clock = io_clk;
  assign hqr7_reset = io_rst;
  assign hqr7_io_in_a = io_d3_vld ? ddot_dout : d3_reg; // @[hh_datapath_chisel.scala 177:20 178:10 180:10]
  assign FP_multiplier_10ccs_clock = io_clk;
  assign FP_multiplier_10ccs_reset = io_rst;
  assign FP_multiplier_10ccs_io_in_a = io_d5_rdy ? d4_update : d4_reg; // @[hh_datapath_chisel.scala 207:20 208:10 210:10]
  assign FP_multiplier_10ccs_io_in_b = io_tk_vld ? tk_update : tk_reg; // @[hh_datapath_chisel.scala 201:20 202:10 204:10]
  assign axpy_dp_clock = io_clk;
  assign axpy_dp_reset = io_rst;
  assign axpy_dp_io_in_a = io_d5_vld ? d5_update : d5_reg; // @[hh_datapath_chisel.scala 213:20 214:10 216:10]
  assign axpy_dp_io_in_b_0 = vk[1023:992]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_1 = vk[991:960]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_2 = vk[959:928]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_3 = vk[927:896]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_4 = vk[895:864]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_5 = vk[863:832]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_6 = vk[831:800]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_7 = vk[799:768]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_8 = vk[767:736]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_9 = vk[735:704]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_10 = vk[703:672]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_11 = vk[671:640]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_12 = vk[639:608]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_13 = vk[607:576]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_14 = vk[575:544]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_15 = vk[543:512]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_16 = vk[511:480]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_17 = vk[479:448]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_18 = vk[447:416]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_19 = vk[415:384]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_20 = vk[383:352]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_21 = vk[351:320]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_22 = vk[319:288]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_23 = vk[287:256]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_24 = vk[255:224]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_25 = vk[223:192]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_26 = vk[191:160]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_27 = vk[159:128]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_28 = vk[127:96]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_29 = vk[95:64]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_30 = vk[63:32]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_b_31 = vk[31:0]; // @[hh_datapath_chisel.scala 279:25]
  assign axpy_dp_io_in_c_0 = yj0[1023:992]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_1 = yj0[991:960]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_2 = yj0[959:928]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_3 = yj0[927:896]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_4 = yj0[895:864]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_5 = yj0[863:832]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_6 = yj0[831:800]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_7 = yj0[799:768]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_8 = yj0[767:736]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_9 = yj0[735:704]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_10 = yj0[703:672]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_11 = yj0[671:640]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_12 = yj0[639:608]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_13 = yj0[607:576]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_14 = yj0[575:544]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_15 = yj0[543:512]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_16 = yj0[511:480]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_17 = yj0[479:448]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_18 = yj0[447:416]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_19 = yj0[415:384]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_20 = yj0[383:352]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_21 = yj0[351:320]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_22 = yj0[319:288]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_23 = yj0[287:256]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_24 = yj0[255:224]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_25 = yj0[223:192]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_26 = yj0[191:160]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_27 = yj0[159:128]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_28 = yj0[127:96]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_29 = yj0[95:64]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_30 = yj0[63:32]; // @[hh_datapath_chisel.scala 280:26]
  assign axpy_dp_io_in_c_31 = yj0[31:0]; // @[hh_datapath_chisel.scala 280:26]
  always @(posedge io_clk) begin
    if (io_rst) begin // @[hh_datapath_chisel.scala 59:17]
      yj0 <= 1024'h0; // @[hh_datapath_chisel.scala 64:11]
    end else if (io_yj_sft) begin // @[hh_datapath_chisel.scala 65:26]
      yj0 <= yj_reg_4[1023:0]; // @[hh_datapath_chisel.scala 70:11]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 59:17]
      yj_reg_1 <= 54272'h0; // @[hh_datapath_chisel.scala 60:16]
    end else if (io_yj_sft) begin // @[hh_datapath_chisel.scala 65:26]
      yj_reg_1 <= _yj_reg_1_T[55295:1024]; // @[hh_datapath_chisel.scala 69:16]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 59:17]
      yj_reg_2 <= 54272'h0; // @[hh_datapath_chisel.scala 61:16]
    end else if (io_yj_sft) begin // @[hh_datapath_chisel.scala 65:26]
      yj_reg_2 <= _yj_reg_2_T_1[55295:1024]; // @[hh_datapath_chisel.scala 68:16]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 59:17]
      yj_reg_3 <= 54272'h0; // @[hh_datapath_chisel.scala 62:16]
    end else if (io_yj_sft) begin // @[hh_datapath_chisel.scala 65:26]
      yj_reg_3 <= _yj_reg_3_T_1[55295:1024]; // @[hh_datapath_chisel.scala 67:16]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 59:17]
      yj_reg_4 <= 54272'h0; // @[hh_datapath_chisel.scala 63:16]
    end else if (io_yj_sft) begin // @[hh_datapath_chisel.scala 65:26]
      yj_reg_4 <= _yj_reg_4_T_1[55295:1024]; // @[hh_datapath_chisel.scala 66:16]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      ddot_din_a_reg <= 1024'h0; // @[hh_datapath_chisel.scala 110:22]
    end else if (io_d1_rdy) begin // @[hh_datapath_chisel.scala 135:20]
      ddot_din_a_reg <= io_hh_din; // @[hh_datapath_chisel.scala 136:18]
    end else if (io_d3_rdy) begin // @[hh_datapath_chisel.scala 137:26]
      if (io_vk1_vld) begin // @[hh_datapath_chisel.scala 155:21]
        ddot_din_a_reg <= vk_update; // @[hh_datapath_chisel.scala 156:10]
      end else begin
        ddot_din_a_reg <= vk_reg; // @[hh_datapath_chisel.scala 158:10]
      end
    end else if (io_d4_rdy) begin // @[hh_datapath_chisel.scala 139:26]
      ddot_din_a_reg <= io_hh_din; // @[hh_datapath_chisel.scala 140:18]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      ddot_din_b_reg <= 1024'h0; // @[hh_datapath_chisel.scala 111:22]
    end else if (io_d1_rdy) begin // @[hh_datapath_chisel.scala 145:20]
      ddot_din_b_reg <= io_hh_din; // @[hh_datapath_chisel.scala 146:18]
    end else if (io_d3_rdy) begin // @[hh_datapath_chisel.scala 147:26]
      ddot_din_b_reg <= vk; // @[hh_datapath_chisel.scala 148:18]
    end else if (io_d4_rdy) begin // @[hh_datapath_chisel.scala 149:26]
      ddot_din_b_reg <= vk; // @[hh_datapath_chisel.scala 150:18]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      vk_reg <= 1024'h0; // @[hh_datapath_chisel.scala 112:14]
    end else if (io_vk1_vld) begin // @[hh_datapath_chisel.scala 155:21]
      vk_reg <= vk_update; // @[hh_datapath_chisel.scala 156:10]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      d1_reg <= 32'h0; // @[hh_datapath_chisel.scala 113:14]
    end else if (io_d1_vld) begin // @[hh_datapath_chisel.scala 171:20]
      d1_reg <= ddot_dout; // @[hh_datapath_chisel.scala 172:10]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      d3_reg <= 32'h0; // @[hh_datapath_chisel.scala 114:14]
    end else if (io_d3_vld) begin // @[hh_datapath_chisel.scala 177:20]
      d3_reg <= ddot_dout; // @[hh_datapath_chisel.scala 178:10]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 162:17]
      d4_update <= 32'h0; // @[hh_datapath_chisel.scala 163:17]
    end else if (io_d4_sft) begin // @[hh_datapath_chisel.scala 165:26]
      d4_update <= d4_update_reg[31:0]; // @[hh_datapath_chisel.scala 168:17]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      x1_reg <= 32'h0; // @[hh_datapath_chisel.scala 115:14]
    end else if (io_d1_rdy) begin // @[hh_datapath_chisel.scala 183:20]
      if (io_rst) begin // @[hh_datapath_chisel.scala 223:17]
        x1_reg <= 32'h0; // @[hh_datapath_chisel.scala 224:17]
      end else if (io_d1_rdy) begin // @[hh_datapath_chisel.scala 225:26]
        x1_reg <= _GEN_71; // @[hh_datapath_chisel.scala 226:17]
      end else begin
        x1_reg <= 32'h0; // @[hh_datapath_chisel.scala 228:17]
      end
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      d2_reg <= 32'h0; // @[hh_datapath_chisel.scala 116:14]
    end else if (io_d2_vld) begin // @[hh_datapath_chisel.scala 189:20]
      d2_reg <= d2_update; // @[hh_datapath_chisel.scala 190:10]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      vk1_reg <= 32'h0; // @[hh_datapath_chisel.scala 117:15]
    end else if (io_vk1_vld) begin // @[hh_datapath_chisel.scala 195:21]
      vk1_reg <= vk1_update; // @[hh_datapath_chisel.scala 196:11]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      tk_reg <= 32'h0; // @[hh_datapath_chisel.scala 118:14]
    end else if (io_tk_vld) begin // @[hh_datapath_chisel.scala 201:20]
      tk_reg <= tk_update; // @[hh_datapath_chisel.scala 202:10]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      d4_reg <= 32'h0; // @[hh_datapath_chisel.scala 119:14]
    end else if (io_d5_rdy) begin // @[hh_datapath_chisel.scala 207:20]
      d4_reg <= d4_update; // @[hh_datapath_chisel.scala 208:10]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 109:18]
      d5_reg <= 32'h0; // @[hh_datapath_chisel.scala 120:14]
    end else if (io_d5_vld) begin // @[hh_datapath_chisel.scala 213:20]
      d5_reg <= d5_update; // @[hh_datapath_chisel.scala 214:10]
    end
    if (io_rst) begin // @[hh_datapath_chisel.scala 162:17]
      d4_update_reg <= 4064'h0; // @[hh_datapath_chisel.scala 164:21]
    end else if (io_d4_sft) begin // @[hh_datapath_chisel.scala 165:26]
      d4_update_reg <= _d4_update_reg_T[4095:32]; // @[hh_datapath_chisel.scala 167:21]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {32{`RANDOM}};
  yj0 = _RAND_0[1023:0];
  _RAND_1 = {1696{`RANDOM}};
  yj_reg_1 = _RAND_1[54271:0];
  _RAND_2 = {1696{`RANDOM}};
  yj_reg_2 = _RAND_2[54271:0];
  _RAND_3 = {1696{`RANDOM}};
  yj_reg_3 = _RAND_3[54271:0];
  _RAND_4 = {1696{`RANDOM}};
  yj_reg_4 = _RAND_4[54271:0];
  _RAND_5 = {32{`RANDOM}};
  ddot_din_a_reg = _RAND_5[1023:0];
  _RAND_6 = {32{`RANDOM}};
  ddot_din_b_reg = _RAND_6[1023:0];
  _RAND_7 = {32{`RANDOM}};
  vk_reg = _RAND_7[1023:0];
  _RAND_8 = {1{`RANDOM}};
  d1_reg = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  d3_reg = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  d4_update = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  x1_reg = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  d2_reg = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  vk1_reg = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  tk_reg = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  d4_reg = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  d5_reg = _RAND_16[31:0];
  _RAND_17 = {127{`RANDOM}};
  d4_update_reg = _RAND_17[4063:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module hh_datapath(
  input           clk,
  input           rst,
  input  [15:0]   hh_cnt,
  input           d1_rdy,
  input           d1_vld,
  input           d2_rdy,
  input           d2_vld,
  input           vk1_rdy,
  input           vk1_vld,
  input           d3_rdy,
  input           d3_vld,
  input           tk_rdy,
  input           tk_vld,
  input           d4_rdy,
  input           d4_vld,
  input           d5_rdy,
  input           d5_vld,
  input           yjp_rdy,
  input           yjp_vld,
  input           yj_sft,
  input           d4_sft,
  input  [1023:0] hh_din,
  output [1023:0] hh_dout
);
  wire  hh_datapath_1_io_clk; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_rst; // @[hh_datapath_chisel.scala 315:62]
  wire [15:0] hh_datapath_1_io_hh_cnt; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_d1_rdy; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_d1_vld; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_d2_vld; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_vk1_vld; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_d3_rdy; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_d3_vld; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_tk_vld; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_d4_rdy; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_d5_rdy; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_d5_vld; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_yj_sft; // @[hh_datapath_chisel.scala 315:62]
  wire  hh_datapath_1_io_d4_sft; // @[hh_datapath_chisel.scala 315:62]
  wire [1023:0] hh_datapath_1_io_hh_din; // @[hh_datapath_chisel.scala 315:62]
  wire [1023:0] hh_datapath_1_io_hh_dout; // @[hh_datapath_chisel.scala 315:62]
  hh_datapath_1 hh_datapath_1 ( // @[hh_datapath_chisel.scala 315:62]
    .io_clk(hh_datapath_1_io_clk),
    .io_rst(hh_datapath_1_io_rst),
    .io_hh_cnt(hh_datapath_1_io_hh_cnt),
    .io_d1_rdy(hh_datapath_1_io_d1_rdy),
    .io_d1_vld(hh_datapath_1_io_d1_vld),
    .io_d2_vld(hh_datapath_1_io_d2_vld),
    .io_vk1_vld(hh_datapath_1_io_vk1_vld),
    .io_d3_rdy(hh_datapath_1_io_d3_rdy),
    .io_d3_vld(hh_datapath_1_io_d3_vld),
    .io_tk_vld(hh_datapath_1_io_tk_vld),
    .io_d4_rdy(hh_datapath_1_io_d4_rdy),
    .io_d5_rdy(hh_datapath_1_io_d5_rdy),
    .io_d5_vld(hh_datapath_1_io_d5_vld),
    .io_yj_sft(hh_datapath_1_io_yj_sft),
    .io_d4_sft(hh_datapath_1_io_d4_sft),
    .io_hh_din(hh_datapath_1_io_hh_din),
    .io_hh_dout(hh_datapath_1_io_hh_dout)
  );
  assign hh_dout = hh_datapath_1_io_hh_dout; // @[hh_datapath_chisel.scala 338:17]
  assign hh_datapath_1_io_clk = clk; // @[hh_datapath_chisel.scala 316:30]
  assign hh_datapath_1_io_rst = rst; // @[hh_datapath_chisel.scala 317:30]
  assign hh_datapath_1_io_hh_cnt = hh_cnt; // @[hh_datapath_chisel.scala 318:33]
  assign hh_datapath_1_io_d1_rdy = d1_rdy; // @[hh_datapath_chisel.scala 319:33]
  assign hh_datapath_1_io_d1_vld = d1_vld; // @[hh_datapath_chisel.scala 320:33]
  assign hh_datapath_1_io_d2_vld = d2_vld; // @[hh_datapath_chisel.scala 322:33]
  assign hh_datapath_1_io_vk1_vld = vk1_vld; // @[hh_datapath_chisel.scala 324:34]
  assign hh_datapath_1_io_d3_rdy = d3_rdy; // @[hh_datapath_chisel.scala 325:33]
  assign hh_datapath_1_io_d3_vld = d3_vld; // @[hh_datapath_chisel.scala 326:33]
  assign hh_datapath_1_io_tk_vld = tk_vld; // @[hh_datapath_chisel.scala 328:33]
  assign hh_datapath_1_io_d4_rdy = d4_rdy; // @[hh_datapath_chisel.scala 329:33]
  assign hh_datapath_1_io_d5_rdy = d5_rdy; // @[hh_datapath_chisel.scala 331:33]
  assign hh_datapath_1_io_d5_vld = d5_vld; // @[hh_datapath_chisel.scala 332:33]
  assign hh_datapath_1_io_yj_sft = yj_sft; // @[hh_datapath_chisel.scala 335:33]
  assign hh_datapath_1_io_d4_sft = d4_sft; // @[hh_datapath_chisel.scala 336:33]
  assign hh_datapath_1_io_hh_din = hh_din; // @[hh_datapath_chisel.scala 337:33]
endmodule

