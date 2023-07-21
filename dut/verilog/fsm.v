//*********************************************************************************************//
//----------------    tsqr_top DUT ----------------------------------------------------------////
//---------------- Author: Xiaokun Yang  ----------------------------------------------------////
//---------------- Lawrence Berkeley Lab ----------------------------------------------------////
//---------------- Date: 8/29/2022 ----------------------------------------------------------//// 
//----- Version 1: FSM Timing Diagram -------------------------------------------------------////
//----- Date: 8/29/2022 ---------------------------------------------------------------------////
//----- Version 2:                                                   ------------------------////
//----- Date:           ---------------------------------------------------------------------////
//*********************************************************************************************//
//----- This design-under-test provides functions for FSM and Datapath                         //
//---------------------------------------------------------------------------------------------//
//----- FSM                                                                                    //
//----- The dut is non-streaming TSQR based on the instances                                   //
//----- Latency:  clock cycles                                                                 //
//----- Hardware cost: FP Adders, FP Multipliers, -Word Memory                                 //
//---------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------//
//*********************************************************************************************//
module fsm  (input                              clk           ,
             input                              rst           ,
	     input                              tsqr_en       ,
             input      [`CNT_WIDTH-1:0]        tile_no       ,
             output reg [`CNT_WIDTH-1:0]        hh_cnt        ,
             output reg [`CNT_WIDTH-1:0]        mx_cnt        ,
             output                             d1_rdy      ,
             output                             d1_vld      ,
             output                             d2_rdy      ,
             output                             d2_vld      ,
             output                             vk1_rdy      ,
             output                             vk1_vld      ,
             output                             d3_rdy      ,
             output                             d3_vld      ,
             output                             tk_rdy      ,
             output                             tk_vld      ,
             output                             d4_rdy      ,
             output                             d4_vld      ,
             output                             d5_rdy     ,
             output                             d5_vld     ,
             output                             yjp_rdy     ,
             output                             yjp_vld     ,
             output                             yj_sft        ,
             output                             d4_sft        ,
             output                             hh_st         ,
             output                             mem0_fi       ,
             output                             mem1_fi       ,
             output                             tsqr_fi       ,
	     // mem_ctl signals
             output                             dmx0_mem_ena  ,
             output     [`RAM_WEA_WIDTH-1:0]    dmx0_mem_wea  ,
             output     [`RAM_ADDR_WIDTH-1:0]   dmx0_mem_addra,
             output                             dmx0_mem_enb  ,
             output     [`RAM_ADDR_WIDTH-1:0]   dmx0_mem_addrb,
             output                             dmx1_mem_ena  ,
             output     [`RAM_WEA_WIDTH-1:0]    dmx1_mem_wea  ,
             output     [`RAM_ADDR_WIDTH-1:0]   dmx1_mem_addra,
             output                             dmx1_mem_enb  ,
             output     [`RAM_ADDR_WIDTH-1:0]   dmx1_mem_addrb,
             output                             rtri_mem_ena  ,
             output     [`RAM_WEA_WIDTH-1:0]    rtri_mem_wea  ,
             output     [`RAM_ADDR_WIDTH-1:0]   rtri_mem_addra,
             output                             rtri_mem_enb  ,
             output     [`RAM_ADDR_WIDTH-1:0]   rtri_mem_addrb);

//**************************************************
//-------------HH Counters -------------------------
//**************************************************
reg hh_en; 
always @(posedge clk) begin
  if(rst) begin
    hh_en      <= 1'b0;
  end else if(mem0_fi|mem1_fi) begin
    hh_en      <= 1'b0;
  end else if(tsqr_en) begin
    hh_en      <= 1'b1;
  end
end

reg [`CNT_WIDTH-1:0] cnt;
wire [`CNT_WIDTH-1:0] nxt_cnt    = (cnt==`HH_CY) ? `CNT_WIDTH'd0 : 
                                                              hh_en ? (cnt+`CNT_WIDTH'd1) : cnt ;
wire [`CNT_WIDTH-1:0] nxt_hh_cnt = (hh_cnt==`MATRIX_WIDTH-1)&(cnt==`HH_CY) ? `CNT_WIDTH'd0 : 
                                                                       hh_en&(cnt==`HH_CY) ? (hh_cnt+`CNT_WIDTH'd1) : hh_cnt;
wire [`CNT_WIDTH-1:0] nxt_mx_cnt = (mx_cnt==tile_no-`CNT_WIDTH'd1)&(hh_cnt==`MATRIX_WIDTH-1)&(cnt==`HH_CY) ? `CNT_WIDTH'd0 : 
                                                                             hh_en&(hh_cnt==`MATRIX_WIDTH-1)&(cnt==`HH_CY) ? (mx_cnt+`CNT_WIDTH'd1) : mx_cnt;

//always @(posedge clk, negedge rst) begin
always @(posedge clk) begin
  if(rst) begin
    cnt         <= `CNT_WIDTH'd0;
    hh_cnt      <= `CNT_WIDTH'd0;
    mx_cnt      <= `CNT_WIDTH'd0;
  end else begin
    cnt         <= nxt_cnt           ;
    hh_cnt      <= nxt_hh_cnt        ;
    mx_cnt      <= nxt_mx_cnt        ;
  end
end

//**************************************************
//------------- Trailing Counter--------------------
//**************************************************
reg  [`CNT_WIDTH-1:0] tr_cy_reg  ; 
reg                   tr_cnt_en  ;
reg  [`CNT_WIDTH-1:0] tr_cnt     ; 
wire    rd_mem_fst = rst ? 1'b0 : tsqr_en & ~hh_en     ;
assign  wr_mem_st  = rst ? 1'b0 : hh_en & tr_cnt==`TR_CY  ;
assign  hh_st      = rst ? 1'b0 : hh_en & tr_cnt==`TR_CY+`CNT_WIDTH'd1  ;
wire    rd_mem_st  = rst ? 1'b0 : hh_en & cnt==`VK_CY  ;

wire [`CNT_WIDTH-1:0] tr_cy  = rd_mem_st ? `MATRIX_WIDTH-hh_cnt: tr_cy_reg ;

wire                  hh_fi = tr_cnt == `TR_CY+tr_cy-`CNT_WIDTH'd1; 
wire [`CNT_WIDTH-1:0] nxt_tr_cnt = hh_fi ? `CNT_WIDTH'd0 :
                                               tr_cnt_en ? tr_cnt+`CNT_WIDTH'd1 : tr_cnt ;
always @(posedge clk) begin
  if(rst) begin
    tr_cnt    <= `CNT_WIDTH'd0;
    tr_cy_reg <= `CNT_WIDTH'd0;
  end else begin
    tr_cnt    <= nxt_tr_cnt   ;
    tr_cy_reg <= tr_cy        ;
  end
end

always @(posedge clk) begin
  if(rst) begin
    tr_cnt_en = 1'b0;
  end else if(hh_fi) begin
    tr_cnt_en = 1'b0;
  end else if(rd_mem_st) begin
    tr_cnt_en = 1'b1;
  end
end

//**************************************************
//------------- rdy/vld ----------------------------
//**************************************************
// householder reflector
assign d1_rdy  = (hh_en & ~|cnt & ~|hh_cnt) | hh_st;
assign d1_vld  = hh_en & (cnt==`DDOT_CY         );
assign d2_rdy  = hh_en & (cnt==`DDOT_CY         );
assign d2_vld  = hh_en & (cnt==`DDOT_CY+`HQR3_CY);
assign vk1_rdy  = hh_en & (cnt==`DDOT_CY+`HQR3_CY);
assign vk1_vld  = hh_en & (cnt==`VK_CY           );  
assign d3_rdy  = hh_en & (cnt==`VK_CY           );
assign d3_vld  = hh_en & (cnt==`VK_CY+`DDOT_CY  );
assign tk_rdy  = hh_en & (cnt==`VK_CY+`DDOT_CY  );
assign tk_vld  = hh_en & (cnt==`TK_CY           );  
// householder trailing
assign d4_rdy  = tr_cnt_en & (tr_cnt<tr_cy);
assign d4_vld  = tr_cnt_en & (tr_cnt>=`DDOT_CY) & (tr_cnt<`DDOT_CY+tr_cy); 
assign d5_rdy  = tr_cnt_en & (tr_cnt>=`DDOT_CY+`D4_SFT_NO) & (tr_cnt<`DDOT_CY+tr_cy+`D4_SFT_NO);
assign d5_vld  = tr_cnt_en & (tr_cnt>=`DDOT_CY+`D4_SFT_NO+`HQR10_CY) & (tr_cnt<`DDOT_CY+`D4_SFT_NO+`HQR10_CY+tr_cy);
assign yjp_rdy = tr_cnt_en & (tr_cnt>=`DDOT_CY+`D4_SFT_NO+`HQR10_CY) & (tr_cnt<`DDOT_CY+`D4_SFT_NO+`HQR10_CY+tr_cy);
assign yjp_vld = tr_cnt_en & (tr_cnt>=`DDOT_CY+`D4_SFT_NO+`HQR10_CY+`HQR11_CY) & (tr_cnt<`DDOT_CY+`D4_SFT_NO+`HQR10_CY+`HQR11_CY+tr_cy);

// register shifter
assign d4_sft = tr_cnt_en & tr_cnt>=`DDOT_CY & tr_cnt<`DDOT_CY+`D4_SFT_NO+tr_cy;
assign yj_sft = tr_cnt_en & tr_cnt<`YJ_SFT_NO+tr_cy;

//**************************************************
//------------- Memory Controller ------------------
//**************************************************
// read matrics memory command
wire   rd_dmx0_en   = rst ? 1'b0 : ~mx_cnt[0] & (cnt>=`VK_CY & cnt<`VK_CY+tr_cy);
wire   rd_dmx1_en   = rst ? 1'b0 : mx_cnt[0]  & (cnt>=`VK_CY & cnt<`VK_CY+tr_cy);
wire   rd_rtri_en   = rst ? 1'b0 : cnt>=`VK_CY & cnt<`VK_CY+tr_cy; 
assign dmx0_mem_enb = rst ? 1'b0 : (~mx_cnt[0] & rd_mem_fst) | rd_dmx0_en;
assign dmx1_mem_enb = rst ? 1'b0 : (mx_cnt[0]  & rd_mem_fst) | rd_dmx1_en;
assign rtri_mem_enb = rst ? 1'b0 : rd_mem_fst | rd_rtri_en;

reg [`RAM_ADDR_WIDTH-1:0] dmx0_mem_addrb_reg ;
reg [`RAM_ADDR_WIDTH-1:0] dmx1_mem_addrb_reg ;
reg [`RAM_ADDR_WIDTH-1:0] rtri_mem_addrb_reg ;
assign dmx0_mem_addrb = rd_mem_fst ? `RAM_ADDR_WIDTH'h0 :
                              ~mx_cnt[0]&rd_mem_st ? hh_cnt : 
                                                 rd_dmx0_en ? dmx0_mem_addrb_reg+`RAM_ADDR_WIDTH'h1 : dmx0_mem_addrb_reg;
assign dmx1_mem_addrb = rd_mem_fst ? `RAM_ADDR_WIDTH'h0 :
                               mx_cnt[0]&rd_mem_st ? hh_cnt : 
                                                 rd_dmx1_en ? dmx1_mem_addrb_reg+`RAM_ADDR_WIDTH'h1 : dmx1_mem_addrb_reg;
assign rtri_mem_addrb = rd_mem_fst ? `RAM_ADDR_WIDTH'h0 :
                                              rd_mem_st ? hh_cnt : 
                                                      rd_rtri_en ? rtri_mem_addrb_reg+`RAM_ADDR_WIDTH'h1 : rtri_mem_addrb_reg;
// write matrics memory command
reg [`RAM_WEA_WIDTH-1:0]   dmx0_mem_wea_reg ;
reg [`RAM_WEA_WIDTH-1:0]   dmx1_mem_wea_reg ;
reg [`RAM_WEA_WIDTH-1:0]   rtri_mem_wea_reg ;
reg [`RAM_WEA_WIDTH-1:0]   dmx0_mem_wea_update ;
reg [`RAM_WEA_WIDTH-1:0]   dmx1_mem_wea_update ;
reg [`RAM_WEA_WIDTH-1:0]   rtri_mem_wea_update ;
assign dmx0_mem_ena = rst ? 1'b0 : ~mx_cnt[0] & tr_cnt>=`TR_CY & tr_cnt<`TR_CY+tr_cy;
assign dmx1_mem_ena = rst ? 1'b0 : mx_cnt[0]  & tr_cnt>=`TR_CY & tr_cnt<`TR_CY+tr_cy;
assign rtri_mem_ena = rst ? 1'b0 : tr_cnt>=`TR_CY & tr_cnt<`TR_CY+tr_cy;
assign dmx0_mem_wea = (~mx_cnt[0] & wr_mem_st) ? dmx0_mem_wea_update : dmx0_mem_wea_reg; 
assign dmx1_mem_wea = (mx_cnt[0]  & wr_mem_st) ? dmx1_mem_wea_update : dmx1_mem_wea_reg; 
assign rtri_mem_wea = wr_mem_st                ? rtri_mem_wea_update : rtri_mem_wea_reg; 

always @(posedge clk) begin
  if(rst) begin
    dmx0_mem_wea_reg  <= `RAM_WEA_WIDTH'h0    ;
    dmx1_mem_wea_reg  <= `RAM_WEA_WIDTH'h0    ;
    rtri_mem_wea_reg  <= `RAM_WEA_WIDTH'h0    ;
  end else begin
    dmx0_mem_wea_reg  <= dmx0_mem_wea         ;
    dmx1_mem_wea_reg  <= dmx1_mem_wea         ;
    rtri_mem_wea_reg  <= rtri_mem_wea         ;
  end
end

reg [`RAM_ADDR_WIDTH-1:0] dmx0_mem_addra_reg ;
reg [`RAM_ADDR_WIDTH-1:0] dmx1_mem_addra_reg ;
reg [`RAM_ADDR_WIDTH-1:0] rtri_mem_addra_reg ;
assign dmx0_mem_addra = ~mx_cnt[0]&wr_mem_st ? hh_cnt : 
                                         dmx0_mem_ena ? dmx0_mem_addra_reg+`RAM_ADDR_WIDTH'h1 : dmx0_mem_addra_reg;
assign dmx1_mem_addra = mx_cnt[0]&wr_mem_st  ? hh_cnt : 
                                         dmx1_mem_ena ? dmx1_mem_addra_reg+`RAM_ADDR_WIDTH'h1 : dmx1_mem_addra_reg;
assign rtri_mem_addra = wr_mem_st ? hh_cnt : 
                              rtri_mem_ena ? rtri_mem_addra_reg+`RAM_ADDR_WIDTH'h1 : rtri_mem_addra_reg;

always @(posedge clk) begin 
  if(rst) begin
    dmx0_mem_addra_reg <= `RAM_ADDR_WIDTH'h0;
    dmx1_mem_addra_reg <= `RAM_ADDR_WIDTH'h0;
    dmx0_mem_addrb_reg <= `RAM_ADDR_WIDTH'h0;
    dmx1_mem_addrb_reg <= `RAM_ADDR_WIDTH'h0;
    rtri_mem_addra_reg <= `RAM_ADDR_WIDTH'h0;
    rtri_mem_addrb_reg <= `RAM_ADDR_WIDTH'h0;
  end else begin
    dmx0_mem_addra_reg <= dmx0_mem_addra;
    dmx1_mem_addra_reg <= dmx1_mem_addra;
    dmx0_mem_addrb_reg <= dmx0_mem_addrb;
    dmx1_mem_addrb_reg <= dmx1_mem_addrb;
    rtri_mem_addra_reg <= rtri_mem_addra;
    rtri_mem_addrb_reg <= rtri_mem_addrb;
  end
end

assign mem0_fi = ~mx_cnt[0] & hh_fi & (tr_cy==`CNT_WIDTH'd1); 
assign mem1_fi = mx_cnt[0]  & hh_fi & (tr_cy==`CNT_WIDTH'd1); 
assign tsqr_fi = (mem0_fi|mem1_fi) & (mx_cnt==tile_no-1); 

`ifdef ST_WIDTH_16
always @(rst, wr_mem_st, hh_cnt) begin
  if(rst) begin
    dmx0_mem_wea_update = `WEA8;
    dmx1_mem_wea_update = `WEA8;
    rtri_mem_wea_update = `WEA8;
  end else if(wr_mem_st) begin
  case (hh_cnt) 
    8'd0    :  begin rtri_mem_wea_update=`WEA8  ; end
    8'd1    :  begin rtri_mem_wea_update=`WEA7  ; end
    8'd2    :  begin rtri_mem_wea_update=`WEA6  ; end
    8'd3    :  begin rtri_mem_wea_update=`WEA5  ; end
    8'd4    :  begin rtri_mem_wea_update=`WEA4  ; end
    8'd5    :  begin rtri_mem_wea_update=`WEA3  ; end
    8'd6    :  begin rtri_mem_wea_update=`WEA2  ; end
    8'd7    :  begin rtri_mem_wea_update=`WEA1  ; end
    default :  begin 
                 dmx0_mem_wea_update = `WEA8;
                 dmx1_mem_wea_update = `WEA8;
                 rtri_mem_wea_update = `WEA8;
               end
  endcase
  end 
end
`endif // ST_WIDTH_16

`ifdef ST_WIDTH_32
always @(rst, wr_mem_st, hh_cnt) begin
//always @(hh_cnt, rst) begin
  if(rst) begin
    dmx0_mem_wea_update = `WEA16;
    dmx1_mem_wea_update = `WEA16;
    rtri_mem_wea_update = `WEA16;
  end else if(wr_mem_st) begin
  case (hh_cnt) 
    8'd0    :  begin rtri_mem_wea_update=`WEA16 ; end
    8'd1    :  begin rtri_mem_wea_update=`WEA15 ; end
    8'd2    :  begin rtri_mem_wea_update=`WEA14 ; end
    8'd3    :  begin rtri_mem_wea_update=`WEA13 ; end
    8'd4    :  begin rtri_mem_wea_update=`WEA12 ; end
    8'd5    :  begin rtri_mem_wea_update=`WEA11 ; end
    8'd6    :  begin rtri_mem_wea_update=`WEA10 ; end
    8'd7    :  begin rtri_mem_wea_update=`WEA9  ; end
    8'd8    :  begin rtri_mem_wea_update=`WEA8  ; end
    8'd9    :  begin rtri_mem_wea_update=`WEA7  ; end
    8'd10   :  begin rtri_mem_wea_update=`WEA6  ; end
    8'd11   :  begin rtri_mem_wea_update=`WEA5  ; end
    8'd12   :  begin rtri_mem_wea_update=`WEA4  ; end
    8'd13   :  begin rtri_mem_wea_update=`WEA3  ; end
    8'd14   :  begin rtri_mem_wea_update=`WEA2  ; end
    8'd15   :  begin rtri_mem_wea_update=`WEA1  ; end
    default :  begin 
                 dmx0_mem_wea_update = `WEA16;
                 dmx1_mem_wea_update = `WEA16;
                 rtri_mem_wea_update = `WEA16;
               end
  endcase
  end
end
`endif // ST_WIDTH_32

`ifdef ST_WIDTH_64
always @(rst, wr_mem_st, hh_cnt) begin
  if(rst) begin
    dmx0_mem_wea_update = `WEA32;
    dmx1_mem_wea_update = `WEA32;
    rtri_mem_wea_update = `WEA32;
  end else if(wr_mem_st) begin
  case (hh_cnt) 
    8'd0   :  begin rtri_mem_wea_update=`WEA32   ; end
    8'd1   :  begin rtri_mem_wea_update=`WEA31   ; end
    8'd2   :  begin rtri_mem_wea_update=`WEA30   ; end
    8'd3   :  begin rtri_mem_wea_update=`WEA29   ; end
    8'd4   :  begin rtri_mem_wea_update=`WEA28   ; end
    8'd5   :  begin rtri_mem_wea_update=`WEA27   ; end
    8'd6   :  begin rtri_mem_wea_update=`WEA26   ; end
    8'd7   :  begin rtri_mem_wea_update=`WEA25   ; end
    8'd8   :  begin rtri_mem_wea_update=`WEA24   ; end
    8'd9   :  begin rtri_mem_wea_update=`WEA23   ; end
    8'd10  :  begin rtri_mem_wea_update=`WEA22   ; end
    8'd11  :  begin rtri_mem_wea_update=`WEA21   ; end
    8'd12  :  begin rtri_mem_wea_update=`WEA20   ; end
    8'd13  :  begin rtri_mem_wea_update=`WEA19   ; end
    8'd14  :  begin rtri_mem_wea_update=`WEA18   ; end
    8'd15  :  begin rtri_mem_wea_update=`WEA17   ; end
    8'd16  :  begin rtri_mem_wea_update=`WEA16   ; end
    8'd17  :  begin rtri_mem_wea_update=`WEA15   ; end
    8'd18  :  begin rtri_mem_wea_update=`WEA14   ; end
    8'd19  :  begin rtri_mem_wea_update=`WEA13   ; end
    8'd20  :  begin rtri_mem_wea_update=`WEA12   ; end
    8'd21  :  begin rtri_mem_wea_update=`WEA11   ; end
    8'd22  :  begin rtri_mem_wea_update=`WEA10   ; end
    8'd23  :  begin rtri_mem_wea_update=`WEA9    ; end
    8'd24  :  begin rtri_mem_wea_update=`WEA8    ; end
    8'd25  :  begin rtri_mem_wea_update=`WEA7    ; end
    8'd26  :  begin rtri_mem_wea_update=`WEA6    ; end
    8'd27  :  begin rtri_mem_wea_update=`WEA5    ; end
    8'd28  :  begin rtri_mem_wea_update=`WEA4    ; end
    8'd29  :  begin rtri_mem_wea_update=`WEA3    ; end
    8'd30  :  begin rtri_mem_wea_update=`WEA2    ; end
    8'd31  :  begin rtri_mem_wea_update=`WEA1    ; end
    default :  begin 
                 dmx0_mem_wea_update = `WEA32;
                 dmx1_mem_wea_update = `WEA32;
                 rtri_mem_wea_update = `WEA32;
               end
  endcase
  end
end
`endif // ST_WIDTH_128
`ifdef ST_WIDTH_128
always @(rst, wr_mem_st, hh_cnt) begin
  if(rst) begin
    dmx0_mem_wea_update = `WEA64;
    dmx1_mem_wea_update = `WEA64;
    rtri_mem_wea_update = `WEA64;
  end else if(wr_mem_st) begin
  case (hh_cnt) 
    8'd0   :  begin rtri_mem_wea_update=`WEA64   ; end
    8'd1   :  begin rtri_mem_wea_update=`WEA63   ; end
    8'd2   :  begin rtri_mem_wea_update=`WEA62   ; end
    8'd3   :  begin rtri_mem_wea_update=`WEA61   ; end
    8'd4   :  begin rtri_mem_wea_update=`WEA60   ; end
    8'd5   :  begin rtri_mem_wea_update=`WEA59   ; end
    8'd6   :  begin rtri_mem_wea_update=`WEA58   ; end
    8'd7   :  begin rtri_mem_wea_update=`WEA57   ; end
    8'd8   :  begin rtri_mem_wea_update=`WEA56   ; end
    8'd9   :  begin rtri_mem_wea_update=`WEA55   ; end
    8'd10  :  begin rtri_mem_wea_update=`WEA54   ; end
    8'd11  :  begin rtri_mem_wea_update=`WEA53   ; end
    8'd12  :  begin rtri_mem_wea_update=`WEA52   ; end
    8'd13  :  begin rtri_mem_wea_update=`WEA51   ; end
    8'd14  :  begin rtri_mem_wea_update=`WEA50   ; end
    8'd15  :  begin rtri_mem_wea_update=`WEA49   ; end
    8'd16  :  begin rtri_mem_wea_update=`WEA48   ; end
    8'd17  :  begin rtri_mem_wea_update=`WEA47   ; end
    8'd18  :  begin rtri_mem_wea_update=`WEA46   ; end
    8'd19  :  begin rtri_mem_wea_update=`WEA45   ; end
    8'd20  :  begin rtri_mem_wea_update=`WEA44   ; end
    8'd21  :  begin rtri_mem_wea_update=`WEA43   ; end
    8'd22  :  begin rtri_mem_wea_update=`WEA42   ; end
    8'd23  :  begin rtri_mem_wea_update=`WEA41   ; end
    8'd24  :  begin rtri_mem_wea_update=`WEA40   ; end
    8'd25  :  begin rtri_mem_wea_update=`WEA39   ; end
    8'd26  :  begin rtri_mem_wea_update=`WEA38   ; end
    8'd27  :  begin rtri_mem_wea_update=`WEA37   ; end
    8'd28  :  begin rtri_mem_wea_update=`WEA36   ; end
    8'd29  :  begin rtri_mem_wea_update=`WEA35   ; end
    8'd30  :  begin rtri_mem_wea_update=`WEA34   ; end
    8'd31  :  begin rtri_mem_wea_update=`WEA33   ; end
    8'd32  :  begin rtri_mem_wea_update=`WEA32   ; end
    8'd33  :  begin rtri_mem_wea_update=`WEA31   ; end
    8'd34  :  begin rtri_mem_wea_update=`WEA30   ; end
    8'd35  :  begin rtri_mem_wea_update=`WEA29   ; end
    8'd36  :  begin rtri_mem_wea_update=`WEA28   ; end
    8'd37  :  begin rtri_mem_wea_update=`WEA27   ; end
    8'd38  :  begin rtri_mem_wea_update=`WEA26   ; end
    8'd39  :  begin rtri_mem_wea_update=`WEA25   ; end
    8'd40  :  begin rtri_mem_wea_update=`WEA24   ; end
    8'd41  :  begin rtri_mem_wea_update=`WEA23   ; end
    8'd42  :  begin rtri_mem_wea_update=`WEA22   ; end
    8'd43  :  begin rtri_mem_wea_update=`WEA21   ; end
    8'd44  :  begin rtri_mem_wea_update=`WEA20   ; end
    8'd45  :  begin rtri_mem_wea_update=`WEA19   ; end
    8'd46  :  begin rtri_mem_wea_update=`WEA18   ; end
    8'd47  :  begin rtri_mem_wea_update=`WEA17   ; end
    8'd48  :  begin rtri_mem_wea_update=`WEA16   ; end
    8'd49  :  begin rtri_mem_wea_update=`WEA15   ; end
    8'd50  :  begin rtri_mem_wea_update=`WEA14   ; end
    8'd51  :  begin rtri_mem_wea_update=`WEA13   ; end
    8'd52  :  begin rtri_mem_wea_update=`WEA12   ; end
    8'd53  :  begin rtri_mem_wea_update=`WEA11   ; end
    8'd54  :  begin rtri_mem_wea_update=`WEA10   ; end
    8'd55  :  begin rtri_mem_wea_update=`WEA9    ; end
    8'd56  :  begin rtri_mem_wea_update=`WEA8    ; end
    8'd57  :  begin rtri_mem_wea_update=`WEA7    ; end
    8'd58  :  begin rtri_mem_wea_update=`WEA6    ; end
    8'd59  :  begin rtri_mem_wea_update=`WEA5    ; end
    8'd60  :  begin rtri_mem_wea_update=`WEA4    ; end
    8'd61  :  begin rtri_mem_wea_update=`WEA3    ; end
    8'd62  :  begin rtri_mem_wea_update=`WEA2    ; end
    8'd63  :  begin rtri_mem_wea_update=`WEA1    ; end
    default :  begin 
                 dmx0_mem_wea_update = `WEA64;
                 dmx1_mem_wea_update = `WEA64;
                 rtri_mem_wea_update = `WEA64;
               end
  endcase
  end
end
`endif // ST_WIDTH_128

`ifdef ST_WIDTH_256
always @(rst, wr_mem_st, hh_cnt) begin
  if(rst) begin
    dmx0_mem_wea_update = `WEA128;
    dmx1_mem_wea_update = `WEA128;
    rtri_mem_wea_update = `WEA128;
  end else if(wr_mem_st) begin
  case (hh_cnt) 
    8'd0    :  begin rtri_mem_wea_update=`WEA128  ; end
    8'd1    :  begin rtri_mem_wea_update=`WEA127  ; end
    8'd2    :  begin rtri_mem_wea_update=`WEA126  ; end
    8'd3    :  begin rtri_mem_wea_update=`WEA125  ; end
    8'd4    :  begin rtri_mem_wea_update=`WEA124  ; end
    8'd5    :  begin rtri_mem_wea_update=`WEA123  ; end
    8'd6    :  begin rtri_mem_wea_update=`WEA122  ; end
    8'd7    :  begin rtri_mem_wea_update=`WEA121  ; end
    8'd8    :  begin rtri_mem_wea_update=`WEA120  ; end
    8'd9    :  begin rtri_mem_wea_update=`WEA119  ; end
    8'd10   :  begin rtri_mem_wea_update=`WEA118  ; end
    8'd11   :  begin rtri_mem_wea_update=`WEA117  ; end
    8'd12   :  begin rtri_mem_wea_update=`WEA116  ; end
    8'd13   :  begin rtri_mem_wea_update=`WEA115  ; end
    8'd14   :  begin rtri_mem_wea_update=`WEA114  ; end
    8'd15   :  begin rtri_mem_wea_update=`WEA113  ; end
    8'd16   :  begin rtri_mem_wea_update=`WEA112  ; end
    8'd17   :  begin rtri_mem_wea_update=`WEA111  ; end
    8'd18   :  begin rtri_mem_wea_update=`WEA110  ; end
    8'd19   :  begin rtri_mem_wea_update=`WEA109  ; end
    8'd20   :  begin rtri_mem_wea_update=`WEA108  ; end
    8'd21   :  begin rtri_mem_wea_update=`WEA107  ; end
    8'd22   :  begin rtri_mem_wea_update=`WEA106  ; end
    8'd23   :  begin rtri_mem_wea_update=`WEA105  ; end
    8'd24   :  begin rtri_mem_wea_update=`WEA104  ; end
    8'd25   :  begin rtri_mem_wea_update=`WEA103  ; end
    8'd26   :  begin rtri_mem_wea_update=`WEA102  ; end
    8'd27   :  begin rtri_mem_wea_update=`WEA101  ; end
    8'd28   :  begin rtri_mem_wea_update=`WEA100  ; end
    8'd29   :  begin rtri_mem_wea_update=`WEA99   ; end
    8'd30   :  begin rtri_mem_wea_update=`WEA98   ; end
    8'd31   :  begin rtri_mem_wea_update=`WEA97   ; end
    8'd32   :  begin rtri_mem_wea_update=`WEA96   ; end
    8'd33   :  begin rtri_mem_wea_update=`WEA95   ; end
    8'd34   :  begin rtri_mem_wea_update=`WEA94   ; end
    8'd35   :  begin rtri_mem_wea_update=`WEA93   ; end
    8'd36   :  begin rtri_mem_wea_update=`WEA92   ; end
    8'd37   :  begin rtri_mem_wea_update=`WEA91   ; end
    8'd38   :  begin rtri_mem_wea_update=`WEA90   ; end
    8'd39   :  begin rtri_mem_wea_update=`WEA89   ; end
    8'd40   :  begin rtri_mem_wea_update=`WEA88   ; end
    8'd41   :  begin rtri_mem_wea_update=`WEA87   ; end
    8'd42   :  begin rtri_mem_wea_update=`WEA86   ; end
    8'd43   :  begin rtri_mem_wea_update=`WEA85   ; end
    8'd44   :  begin rtri_mem_wea_update=`WEA84   ; end
    8'd45   :  begin rtri_mem_wea_update=`WEA83   ; end
    8'd46   :  begin rtri_mem_wea_update=`WEA82   ; end
    8'd47   :  begin rtri_mem_wea_update=`WEA81   ; end
    8'd48   :  begin rtri_mem_wea_update=`WEA80   ; end
    8'd49   :  begin rtri_mem_wea_update=`WEA79   ; end
    8'd50   :  begin rtri_mem_wea_update=`WEA78   ; end
    8'd51   :  begin rtri_mem_wea_update=`WEA77   ; end
    8'd52   :  begin rtri_mem_wea_update=`WEA76   ; end
    8'd53   :  begin rtri_mem_wea_update=`WEA75   ; end
    8'd54   :  begin rtri_mem_wea_update=`WEA74   ; end
    8'd55   :  begin rtri_mem_wea_update=`WEA73   ; end
    8'd56   :  begin rtri_mem_wea_update=`WEA72   ; end
    8'd57   :  begin rtri_mem_wea_update=`WEA71   ; end
    8'd58   :  begin rtri_mem_wea_update=`WEA70   ; end
    8'd59   :  begin rtri_mem_wea_update=`WEA69   ; end
    8'd60   :  begin rtri_mem_wea_update=`WEA68   ; end
    8'd61   :  begin rtri_mem_wea_update=`WEA67   ; end
    8'd62   :  begin rtri_mem_wea_update=`WEA66   ; end
    8'd63   :  begin rtri_mem_wea_update=`WEA65   ; end
    8'd64   :  begin rtri_mem_wea_update=`WEA64   ; end
    8'd65   :  begin rtri_mem_wea_update=`WEA63   ; end
    8'd66   :  begin rtri_mem_wea_update=`WEA62   ; end
    8'd67   :  begin rtri_mem_wea_update=`WEA61   ; end
    8'd68   :  begin rtri_mem_wea_update=`WEA60   ; end
    8'd69   :  begin rtri_mem_wea_update=`WEA59   ; end
    8'd70   :  begin rtri_mem_wea_update=`WEA58   ; end
    8'd71   :  begin rtri_mem_wea_update=`WEA57   ; end
    8'd72   :  begin rtri_mem_wea_update=`WEA56   ; end
    8'd73   :  begin rtri_mem_wea_update=`WEA55   ; end
    8'd74   :  begin rtri_mem_wea_update=`WEA54   ; end
    8'd75   :  begin rtri_mem_wea_update=`WEA53   ; end
    8'd76   :  begin rtri_mem_wea_update=`WEA52   ; end
    8'd77   :  begin rtri_mem_wea_update=`WEA51   ; end
    8'd78   :  begin rtri_mem_wea_update=`WEA50   ; end
    8'd79   :  begin rtri_mem_wea_update=`WEA49   ; end
    8'd80   :  begin rtri_mem_wea_update=`WEA48   ; end
    8'd81   :  begin rtri_mem_wea_update=`WEA47   ; end
    8'd82   :  begin rtri_mem_wea_update=`WEA46   ; end
    8'd83   :  begin rtri_mem_wea_update=`WEA45   ; end
    8'd84   :  begin rtri_mem_wea_update=`WEA44   ; end
    8'd85   :  begin rtri_mem_wea_update=`WEA43   ; end
    8'd86   :  begin rtri_mem_wea_update=`WEA42   ; end
    8'd87   :  begin rtri_mem_wea_update=`WEA41   ; end
    8'd88   :  begin rtri_mem_wea_update=`WEA40   ; end
    8'd89   :  begin rtri_mem_wea_update=`WEA39   ; end
    8'd90   :  begin rtri_mem_wea_update=`WEA38   ; end
    8'd91   :  begin rtri_mem_wea_update=`WEA37   ; end
    8'd92   :  begin rtri_mem_wea_update=`WEA36   ; end
    8'd93   :  begin rtri_mem_wea_update=`WEA35   ; end
    8'd94   :  begin rtri_mem_wea_update=`WEA34   ; end
    8'd95   :  begin rtri_mem_wea_update=`WEA33   ; end
    8'd96   :  begin rtri_mem_wea_update=`WEA32   ; end
    8'd97   :  begin rtri_mem_wea_update=`WEA31   ; end
    8'd98   :  begin rtri_mem_wea_update=`WEA30   ; end
    8'd99   :  begin rtri_mem_wea_update=`WEA29   ; end
    8'd100  :  begin rtri_mem_wea_update=`WEA28   ; end
    8'd101  :  begin rtri_mem_wea_update=`WEA27   ; end
    8'd102  :  begin rtri_mem_wea_update=`WEA26   ; end
    8'd103  :  begin rtri_mem_wea_update=`WEA25   ; end
    8'd104  :  begin rtri_mem_wea_update=`WEA24   ; end
    8'd105  :  begin rtri_mem_wea_update=`WEA23   ; end
    8'd106  :  begin rtri_mem_wea_update=`WEA22   ; end
    8'd107  :  begin rtri_mem_wea_update=`WEA21   ; end
    8'd108  :  begin rtri_mem_wea_update=`WEA20   ; end
    8'd109  :  begin rtri_mem_wea_update=`WEA19   ; end
    8'd110  :  begin rtri_mem_wea_update=`WEA18   ; end
    8'd111  :  begin rtri_mem_wea_update=`WEA17   ; end
    8'd112  :  begin rtri_mem_wea_update=`WEA16   ; end
    8'd113  :  begin rtri_mem_wea_update=`WEA15   ; end
    8'd114  :  begin rtri_mem_wea_update=`WEA14   ; end
    8'd115  :  begin rtri_mem_wea_update=`WEA13   ; end
    8'd116  :  begin rtri_mem_wea_update=`WEA12   ; end
    8'd117  :  begin rtri_mem_wea_update=`WEA11   ; end
    8'd118  :  begin rtri_mem_wea_update=`WEA10   ; end
    8'd119  :  begin rtri_mem_wea_update=`WEA9    ; end
    8'd120  :  begin rtri_mem_wea_update=`WEA8    ; end
    8'd121  :  begin rtri_mem_wea_update=`WEA7    ; end
    8'd122  :  begin rtri_mem_wea_update=`WEA6    ; end
    8'd123  :  begin rtri_mem_wea_update=`WEA5    ; end
    8'd124  :  begin rtri_mem_wea_update=`WEA4    ; end
    8'd125  :  begin rtri_mem_wea_update=`WEA3    ; end
    8'd126  :  begin rtri_mem_wea_update=`WEA2    ; end
    8'd127  :  begin rtri_mem_wea_update=`WEA1    ; end
    default :  begin 
                 dmx0_mem_wea_update = `WEA128;
                 dmx1_mem_wea_update = `WEA128;
                 rtri_mem_wea_update = `WEA128;
               end
  endcase
  end
end
`endif // ST_WIDTH_256
endmodule
