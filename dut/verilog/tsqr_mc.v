//*********************************************************************************************//
//----------------    tsqr_mc_top DUT -------------------------------------------------------////
//---------------- Author: Xiaokun Yang  ----------------------------------------------------////
//---------------- Lawrence Berkeley Lab ----------------------------------------------------////
//---------------- Date: 6/1/2023 -----/-----------------------------------------------------//// 
//----- Version 1: Dual Core Design   -------------------------------------------------------////
//----- Date: 6/1/2023 ----------------/-----------------------------------------------------////
//----- Description: dual-core design to write upper triangle into the first core -----------////
//----- Version 2:                                                   ------------------------////
//----- Date:           ---------------------------------------------------------------------////
//---------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------//
//*********************************************************************************************//

`include "define.v"
module tsqr_mc (input                             clk          ,
                input                             rst          ,
	        input                             tsqr_en      ,
                input      [`CNT_WIDTH-1:0]       tile_no      ,
                input      [`MEM_NO-1:0]          dma_mem_ena  ,
                input      [`RAM_WEA_WIDTH-1:0]   dma_mem_wea  ,
                input      [`RAM_ADDR_WIDTH-1:0]  dma_mem_addra,
                input      [`RAM_WIDTH-1:0]       dma_mem_dina ,
                input      [`MEM_NO-1:0]          dma_mem_enb  ,
                input      [`RAM_ADDR_WIDTH-1:0]  dma_mem_addrb,
                output reg [`RAM_WIDTH-1:0]       dma_mem_doutb,
`ifdef SINGLE_CORE_INT
	        output                            c1_mem0_fi   ,
	        output                            c1_mem1_fi   ,
  `ifdef DUAL_CORE_INT
	        output                            c2_mem0_fi   ,
	        output                            c2_mem1_fi   ,
    `ifdef QUAD_CORE_INT
	        output                            c3_mem0_fi   ,
	        output                            c3_mem1_fi   ,
	        output                            c4_mem0_fi   ,
	        output                            c4_mem1_fi   ,
      `ifdef EIGHT_CORE_INT
	        output                            c5_mem0_fi   ,
	        output                            c5_mem1_fi   ,
	        output                            c6_mem0_fi   ,
	        output                            c6_mem1_fi   ,
	        output                            c7_mem0_fi   ,
	        output                            c7_mem1_fi   ,
	        output                            c8_mem0_fi   ,
	        output                            c8_mem1_fi   ,
      `endif //EIGHT_CORE_INT
    `endif //QUAD_CORE_INT
  `endif //DUAL_CORE_INT
`endif //SINGLE_CORE_INT
	        output                            tsqr_fi      );

// -----------------------------------------
// Interface declaration
// -----------------------------------------
`ifdef SINGLE_CORE_INT
wire [`CNT_WIDTH-1:0]       c1_mx_cnt              ;
wire [`CNT_WIDTH-1:0]       c1_hh_cnt              ;
wire                        c1_d1_rdy              ;
wire                        c1_d1_vld              ;
wire                        c1_d2_rdy              ;
wire                        c1_d2_vld              ;
wire                        c1_vk1_rdy             ;
wire                        c1_vk1_vld             ;
wire                        c1_d3_rdy              ;
wire                        c1_d3_vld              ;
wire                        c1_tk_rdy              ;
wire                        c1_tk_vld              ;
wire                        c1_d4_rdy              ;
wire                        c1_d4_vld              ;
wire                        c1_d5_rdy              ;
wire                        c1_d5_vld              ;
wire                        c1_yjp_rdy             ;
wire                        c1_yjp_vld             ;
wire                        c1_yj_sft              ;
wire                        c1_d4_sft              ;
wire                        c1_hh_st               ;
wire                        c1_tsqr_fi             ;
wire                        c1_fsm_dmx0_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c1_fsm_dmx0_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c1_fsm_dmx0_mem_addra ;
wire                        c1_fsm_dmx0_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c1_fsm_dmx0_mem_addrb ;
wire                        c1_fsm_dmx1_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c1_fsm_dmx1_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c1_fsm_dmx1_mem_addra ;
wire                        c1_fsm_dmx1_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c1_fsm_dmx1_mem_addrb ;
wire                        c1_fsm_rtri_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c1_fsm_rtri_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c1_fsm_rtri_mem_addra ;
wire                        c1_fsm_rtri_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c1_fsm_rtri_mem_addrb ;
wire [2*`RAM_WIDTH-1:0]     c1_hh_dout            ;
`endif //SINGLE_CORE_INT

`ifdef DUAL_CORE_INT
wire [`CNT_WIDTH-1:0]       c2_mx_cnt        ;
wire [`CNT_WIDTH-1:0]       c2_hh_cnt        ;
wire                        c2_d1_rdy      ;
wire                        c2_d1_vld      ;
wire                        c2_d2_rdy      ;
wire                        c2_d2_vld      ;
wire                        c2_vk1_rdy      ;
wire                        c2_vk1_vld      ;
wire                        c2_d3_rdy      ;
wire                        c2_d3_vld      ;
wire                        c2_tk_rdy      ;
wire                        c2_tk_vld      ;
wire                        c2_d4_rdy      ;
wire                        c2_d4_vld      ;
wire                        c2_d5_rdy     ;
wire                        c2_d5_vld     ;
wire                        c2_yjp_rdy     ;
wire                        c2_yjp_vld     ;
wire                        c2_yj_sft        ;
wire                        c2_d4_sft        ;
wire                        c2_hh_st     ;
//wire                        c2_mem0_fi       ;
//wire                        c2_mem1_fi       ;
wire                        c2_tsqr_fi       ;
wire                        c2_fsm_dmx0_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c2_fsm_dmx0_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c2_fsm_dmx0_mem_addra ;
wire                        c2_fsm_dmx0_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c2_fsm_dmx0_mem_addrb ;
wire                        c2_fsm_dmx1_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c2_fsm_dmx1_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c2_fsm_dmx1_mem_addra ;
wire                        c2_fsm_dmx1_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c2_fsm_dmx1_mem_addrb ;
wire                        c2_fsm_rtri_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c2_fsm_rtri_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c2_fsm_rtri_mem_addra ;
wire                        c2_fsm_rtri_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c2_fsm_rtri_mem_addrb ;
wire [2*`RAM_WIDTH-1:0]     c2_hh_dout            ;
`endif //DUAL_CORE_INT

`ifdef QUAD_CORE_INT
wire [`CNT_WIDTH-1:0]       c3_mx_cnt        ;
wire [`CNT_WIDTH-1:0]       c3_hh_cnt        ;
wire                        c3_d1_rdy      ;
wire                        c3_d1_vld      ;
wire                        c3_d2_rdy      ;
wire                        c3_d2_vld      ;
wire                        c3_vk1_rdy      ;
wire                        c3_vk1_vld      ;
wire                        c3_d3_rdy      ;
wire                        c3_d3_vld      ;
wire                        c3_tk_rdy      ;
wire                        c3_tk_vld      ;
wire                        c3_d4_rdy      ;
wire                        c3_d4_vld      ;
wire                        c3_d5_rdy     ;
wire                        c3_d5_vld     ;
wire                        c3_yjp_rdy     ;
wire                        c3_yjp_vld     ;
wire                        c3_yj_sft        ;
wire                        c3_d4_sft        ;
wire                        c3_hh_st     ;
//wire                        c3_mem0_fi       ;
//wire                        c3_mem1_fi       ;
wire                        c3_tsqr_fi       ;
wire                        c3_fsm_dmx0_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c3_fsm_dmx0_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c3_fsm_dmx0_mem_addra ;
wire                        c3_fsm_dmx0_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c3_fsm_dmx0_mem_addrb ;
wire                        c3_fsm_dmx1_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c3_fsm_dmx1_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c3_fsm_dmx1_mem_addra ;
wire                        c3_fsm_dmx1_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c3_fsm_dmx1_mem_addrb ;
wire                        c3_fsm_rtri_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c3_fsm_rtri_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c3_fsm_rtri_mem_addra ;
wire                        c3_fsm_rtri_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c3_fsm_rtri_mem_addrb ;
wire [2*`RAM_WIDTH-1:0]     c3_hh_dout            ;

wire [`CNT_WIDTH-1:0]       c4_mx_cnt        ;
wire [`CNT_WIDTH-1:0]       c4_hh_cnt        ;
wire                        c4_d1_rdy      ;
wire                        c4_d1_vld      ;
wire                        c4_d2_rdy      ;
wire                        c4_d2_vld      ;
wire                        c4_vk1_rdy      ;
wire                        c4_vk1_vld      ;
wire                        c4_d3_rdy      ;
wire                        c4_d3_vld      ;
wire                        c4_tk_rdy      ;
wire                        c4_tk_vld      ;
wire                        c4_d4_rdy      ;
wire                        c4_d4_vld      ;
wire                        c4_d5_rdy     ;
wire                        c4_d5_vld     ;
wire                        c4_yjp_rdy     ;
wire                        c4_yjp_vld     ;
wire                        c4_yj_sft        ;
wire                        c4_d4_sft        ;
wire                        c4_hh_st     ;
//wire                        c4_mem0_fi       ;
//wire                        c4_mem1_fi       ;
wire                        c4_tsqr_fi       ;
wire                        c4_fsm_dmx0_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c4_fsm_dmx0_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c4_fsm_dmx0_mem_addra ;
wire                        c4_fsm_dmx0_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c4_fsm_dmx0_mem_addrb ;
wire                        c4_fsm_dmx1_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c4_fsm_dmx1_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c4_fsm_dmx1_mem_addra ;
wire                        c4_fsm_dmx1_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c4_fsm_dmx1_mem_addrb ;
wire                        c4_fsm_rtri_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c4_fsm_rtri_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c4_fsm_rtri_mem_addra ;
wire                        c4_fsm_rtri_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c4_fsm_rtri_mem_addrb ;
wire [2*`RAM_WIDTH-1:0]     c4_hh_dout            ;
`endif //QUAD_CORE_INT

`ifdef EIGHT_CORE_INT
wire [`CNT_WIDTH-1:0]       c5_mx_cnt              ;
wire [`CNT_WIDTH-1:0]       c5_hh_cnt              ;
wire                        c5_d1_rdy              ;
wire                        c5_d1_vld              ;
wire                        c5_d2_rdy              ;
wire                        c5_d2_vld              ;
wire                        c5_vk1_rdy             ;
wire                        c5_vk1_vld             ;
wire                        c5_d3_rdy              ;
wire                        c5_d3_vld              ;
wire                        c5_tk_rdy              ;
wire                        c5_tk_vld              ;
wire                        c5_d4_rdy              ;
wire                        c5_d4_vld              ;
wire                        c5_d5_rdy              ;
wire                        c5_d5_vld              ;
wire                        c5_yjp_rdy             ;
wire                        c5_yjp_vld             ;
wire                        c5_yj_sft              ;
wire                        c5_d4_sft              ;
wire                        c5_hh_st               ;
wire                        c5_tsqr_fi             ;
wire                        c5_fsm_dmx0_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c5_fsm_dmx0_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c5_fsm_dmx0_mem_addra ;
wire                        c5_fsm_dmx0_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c5_fsm_dmx0_mem_addrb ;
wire                        c5_fsm_dmx1_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c5_fsm_dmx1_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c5_fsm_dmx1_mem_addra ;
wire                        c5_fsm_dmx1_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c5_fsm_dmx1_mem_addrb ;
wire                        c5_fsm_rtri_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c5_fsm_rtri_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c5_fsm_rtri_mem_addra ;
wire                        c5_fsm_rtri_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c5_fsm_rtri_mem_addrb ;
wire [2*`RAM_WIDTH-1:0]     c5_hh_dout            ;

wire [`CNT_WIDTH-1:0]       c6_mx_cnt              ;
wire [`CNT_WIDTH-1:0]       c6_hh_cnt              ;
wire                        c6_d1_rdy              ;
wire                        c6_d1_vld              ;
wire                        c6_d2_rdy              ;
wire                        c6_d2_vld              ;
wire                        c6_vk1_rdy             ;
wire                        c6_vk1_vld             ;
wire                        c6_d3_rdy              ;
wire                        c6_d3_vld              ;
wire                        c6_tk_rdy              ;
wire                        c6_tk_vld              ;
wire                        c6_d4_rdy              ;
wire                        c6_d4_vld              ;
wire                        c6_d5_rdy              ;
wire                        c6_d5_vld              ;
wire                        c6_yjp_rdy             ;
wire                        c6_yjp_vld             ;
wire                        c6_yj_sft              ;
wire                        c6_d4_sft              ;
wire                        c6_hh_st               ;
wire                        c6_tsqr_fi             ;
wire                        c6_fsm_dmx0_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c6_fsm_dmx0_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c6_fsm_dmx0_mem_addra ;
wire                        c6_fsm_dmx0_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c6_fsm_dmx0_mem_addrb ;
wire                        c6_fsm_dmx1_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c6_fsm_dmx1_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c6_fsm_dmx1_mem_addra ;
wire                        c6_fsm_dmx1_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c6_fsm_dmx1_mem_addrb ;
wire                        c6_fsm_rtri_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c6_fsm_rtri_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c6_fsm_rtri_mem_addra ;
wire                        c6_fsm_rtri_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c6_fsm_rtri_mem_addrb ;
wire [2*`RAM_WIDTH-1:0]     c6_hh_dout            ;

wire [`CNT_WIDTH-1:0]       c7_mx_cnt              ;
wire [`CNT_WIDTH-1:0]       c7_hh_cnt              ;
wire                        c7_d1_rdy              ;
wire                        c7_d1_vld              ;
wire                        c7_d2_rdy              ;
wire                        c7_d2_vld              ;
wire                        c7_vk1_rdy             ;
wire                        c7_vk1_vld             ;
wire                        c7_d3_rdy              ;
wire                        c7_d3_vld              ;
wire                        c7_tk_rdy              ;
wire                        c7_tk_vld              ;
wire                        c7_d4_rdy              ;
wire                        c7_d4_vld              ;
wire                        c7_d5_rdy              ;
wire                        c7_d5_vld              ;
wire                        c7_yjp_rdy             ;
wire                        c7_yjp_vld             ;
wire                        c7_yj_sft              ;
wire                        c7_d4_sft              ;
wire                        c7_hh_st               ;
wire                        c7_tsqr_fi             ;
wire                        c7_fsm_dmx0_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c7_fsm_dmx0_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c7_fsm_dmx0_mem_addra ;
wire                        c7_fsm_dmx0_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c7_fsm_dmx0_mem_addrb ;
wire                        c7_fsm_dmx1_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c7_fsm_dmx1_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c7_fsm_dmx1_mem_addra ;
wire                        c7_fsm_dmx1_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c7_fsm_dmx1_mem_addrb ;
wire                        c7_fsm_rtri_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c7_fsm_rtri_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c7_fsm_rtri_mem_addra ;
wire                        c7_fsm_rtri_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c7_fsm_rtri_mem_addrb ;
wire [2*`RAM_WIDTH-1:0]     c7_hh_dout            ;

wire [`CNT_WIDTH-1:0]       c8_mx_cnt             ;
wire [`CNT_WIDTH-1:0]       c8_hh_cnt             ;
wire                        c8_d1_rdy             ;
wire                        c8_d1_vld             ;
wire                        c8_d2_rdy             ;
wire                        c8_d2_vld             ;
wire                        c8_vk1_rdy            ;
wire                        c8_vk1_vld            ;
wire                        c8_d3_rdy             ;
wire                        c8_d3_vld             ;
wire                        c8_tk_rdy             ;
wire                        c8_tk_vld             ;
wire                        c8_d4_rdy             ;
wire                        c8_d4_vld             ;
wire                        c8_d5_rdy             ;
wire                        c8_d5_vld             ;
wire                        c8_yjp_rdy            ;
wire                        c8_yjp_vld            ;
wire                        c8_yj_sft             ;
wire                        c8_d4_sft             ;
wire                        c8_hh_st              ;
wire                        c8_tsqr_fi            ;
wire                        c8_fsm_dmx0_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c8_fsm_dmx0_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c8_fsm_dmx0_mem_addra ;
wire                        c8_fsm_dmx0_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c8_fsm_dmx0_mem_addrb ;
wire                        c8_fsm_dmx1_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c8_fsm_dmx1_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c8_fsm_dmx1_mem_addra ;
wire                        c8_fsm_dmx1_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c8_fsm_dmx1_mem_addrb ;
wire                        c8_fsm_rtri_mem_ena   ;
wire [`RAM_WEA_WIDTH-1:0]   c8_fsm_rtri_mem_wea   ;
wire [`RAM_ADDR_WIDTH-1:0]  c8_fsm_rtri_mem_addra ;
wire                        c8_fsm_rtri_mem_enb   ;
wire [`RAM_ADDR_WIDTH-1:0]  c8_fsm_rtri_mem_addrb ;
wire [2*`RAM_WIDTH-1:0]     c8_hh_dout            ;
`endif //EIGHT_CORE_INT

// -----------------------------------------
// Single core
// Interface declaration and mem interfacing
// -----------------------------------------
`ifdef SINGLE_CORE
wire                        c1_tsqr_en       = tsqr_en; 
wire [`CNT_WIDTH-1:0]       c1_tile_no       = c1_tsqr_en ? tile_no-`CNT_WIDTH'd1 : `CNT_WIDTH'd0; 
assign                      tsqr_fi          = c1_tsqr_en ? c1_tsqr_fi : 1'b0; 

wire c1_rtri_mem_ena = dma_mem_ena[`MEM_NO-1] | c1_fsm_rtri_mem_ena;
wire c1_dmx0_mem_ena = dma_mem_ena[`MEM_NO-2] | c1_fsm_dmx0_mem_ena;
wire c1_dmx1_mem_ena = dma_mem_ena[`MEM_NO-3] | c1_fsm_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c1_rtri_mem_wea = dma_mem_ena[`MEM_NO-1] ? dma_mem_wea : c1_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c1_dmx0_mem_wea = dma_mem_ena[`MEM_NO-2] ? dma_mem_wea : c1_fsm_dmx0_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c1_dmx1_mem_wea = dma_mem_ena[`MEM_NO-3] ? dma_mem_wea : c1_fsm_dmx1_mem_wea;

wire [`RAM_ADDR_WIDTH-1:0] c1_rtri_mem_addra = dma_mem_ena[`MEM_NO-1] ? dma_mem_addra : c1_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx0_mem_addra = dma_mem_ena[`MEM_NO-2] ? dma_mem_addra : c1_fsm_dmx0_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx1_mem_addra = dma_mem_ena[`MEM_NO-3] ? dma_mem_addra : c1_fsm_dmx1_mem_addra; 

wire [`RAM_WIDTH-1:0] c1_rtri_mem_dina = dma_mem_ena[`MEM_NO-1] ? dma_mem_dina : 
                                                           c1_fsm_rtri_mem_ena ? c1_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c1_dmx0_mem_dina = dma_mem_ena[`MEM_NO-2] ? dma_mem_dina : 
                                                           c1_fsm_dmx0_mem_ena ? c1_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c1_dmx1_mem_dina = dma_mem_ena[`MEM_NO-3] ? dma_mem_dina :
                                                           c1_fsm_dmx1_mem_ena ? c1_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;

wire c1_rtri_mem_enb = dma_mem_enb[`MEM_NO-1] | c1_fsm_rtri_mem_enb;
wire c1_dmx0_mem_enb = dma_mem_enb[`MEM_NO-2] | c1_fsm_dmx0_mem_enb;
wire c1_dmx1_mem_enb = dma_mem_enb[`MEM_NO-3] | c1_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c1_rtri_mem_addrb = dma_mem_enb[`MEM_NO-1] ? dma_mem_addrb : c1_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-2] ? dma_mem_addrb : c1_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-3] ? dma_mem_addrb : c1_fsm_dmx1_mem_addrb;

wire [`RAM_WIDTH-1:0] c1_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_dmx1_mem_doutb  ;
always @(rst,dma_mem_enb,c1_rtri_mem_doutb,c1_dmx0_mem_doutb,c1_dmx1_mem_doutb) begin
  if(rst) begin
    dma_mem_doutb=`RAM_WIDTH'h0;
  end else begin
    case(dma_mem_enb)
      `MEM_NO'b100: dma_mem_doutb=c1_rtri_mem_doutb;
      `MEM_NO'b010: dma_mem_doutb=c1_dmx0_mem_doutb;
      `MEM_NO'b001: dma_mem_doutb=c1_dmx1_mem_doutb;
      default: dma_mem_doutb=`RAM_WIDTH'h0;
    endcase
  end
end
`endif //SINGLE_CORE

// -----------------------------------------
// Dual core
// Interface declaration and mem interfacing
// -----------------------------------------
`ifdef DUAL_CORE
wire                        c1_tsqr_en       = tsqr_en; 
wire [`CNT_WIDTH-1:0]       c1_tile_no       = c1_tsqr_en ? tile_no/2 : `CNT_WIDTH'd0; 
assign                      tsqr_fi          = c1_tsqr_en ? c1_tsqr_fi : 1'b0; 

reg  c2_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c2_tsqr_fi_level <= 1'b0 ;
  end else if (c2_tsqr_fi) begin
    c2_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c2_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c2_tsqr_en  = tsqr_en&~c2_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c2_tile_no  = c2_tsqr_en ? tile_no/2-`CNT_WIDTH'd1 : `CNT_WIDTH'd0; 

// Memory Operations in Core 2 
wire c2_rtri_mem_ena = dma_mem_ena[`MEM_NO-4] | c2_fsm_rtri_mem_ena;
wire c2_dmx0_mem_ena = dma_mem_ena[`MEM_NO-5] | c2_fsm_dmx0_mem_ena;
wire c2_dmx1_mem_ena = dma_mem_ena[`MEM_NO-6] | c2_fsm_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c2_rtri_mem_wea = dma_mem_ena[`MEM_NO-4] ? dma_mem_wea : c2_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c2_dmx0_mem_wea = dma_mem_ena[`MEM_NO-5] ? dma_mem_wea : c2_fsm_dmx0_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c2_dmx1_mem_wea = dma_mem_ena[`MEM_NO-6] ? dma_mem_wea : c2_fsm_dmx1_mem_wea;

wire [`RAM_ADDR_WIDTH-1:0] c2_rtri_mem_addra = dma_mem_ena[`MEM_NO-4] ? dma_mem_addra : c2_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx0_mem_addra = dma_mem_ena[`MEM_NO-5] ? dma_mem_addra : c2_fsm_dmx0_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx1_mem_addra = dma_mem_ena[`MEM_NO-6] ? dma_mem_addra : c2_fsm_dmx1_mem_addra; 

wire [`RAM_WIDTH-1:0] c2_rtri_mem_dina = dma_mem_ena[`MEM_NO-4] ? dma_mem_dina : 
                                                           c2_fsm_rtri_mem_ena ? c2_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c2_dmx0_mem_dina = dma_mem_ena[`MEM_NO-5] ? dma_mem_dina : 
                                                           c2_fsm_dmx0_mem_ena ? c2_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c2_dmx1_mem_dina = dma_mem_ena[`MEM_NO-6] ? dma_mem_dina :
                                                           c2_fsm_dmx1_mem_ena ? c2_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;

wire c2_rtri_mem_enb = dma_mem_enb[`MEM_NO-4] | c2_fsm_rtri_mem_enb;
wire c2_dmx0_mem_enb = dma_mem_enb[`MEM_NO-5] | c2_fsm_dmx0_mem_enb;
wire c2_dmx1_mem_enb = dma_mem_enb[`MEM_NO-6] | c2_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c2_rtri_mem_addrb = dma_mem_enb[`MEM_NO-4] ? dma_mem_addrb : c2_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-5] ? dma_mem_addrb : c2_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-6] ? dma_mem_addrb : c2_fsm_dmx1_mem_addrb;

// Memory Operations in Core 1
wire c2_wr_c1_dmx1_mem_ena  = c2_rtri_mem_ena & (c2_mx_cnt==tile_no/2-`CNT_WIDTH'd2) & ~tile_no[1]; 
wire c2_wr_c1_dmx0_mem_ena  = c2_rtri_mem_ena & (c2_mx_cnt==tile_no/2-`CNT_WIDTH'd2) & tile_no[1]; 
wire c1_rtri_mem_ena = dma_mem_ena[`MEM_NO-1] | c1_fsm_rtri_mem_ena;
wire c1_dmx0_mem_ena = dma_mem_ena[`MEM_NO-2] | c1_fsm_dmx0_mem_ena | c2_wr_c1_dmx0_mem_ena;
wire c1_dmx1_mem_ena = dma_mem_ena[`MEM_NO-3] | c1_fsm_dmx1_mem_ena | c2_wr_c1_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c1_rtri_mem_wea = dma_mem_ena[`MEM_NO-1] ? dma_mem_wea : c1_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c1_dmx0_mem_wea = dma_mem_ena[`MEM_NO-2] ? dma_mem_wea :
                                                             c1_fsm_dmx0_mem_ena ? c1_fsm_dmx0_mem_wea :
                                                                                 c2_wr_c1_dmx0_mem_ena ? c2_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;
wire [`RAM_WEA_WIDTH-1:0] c1_dmx1_mem_wea = dma_mem_ena[`MEM_NO-3] ? dma_mem_wea : 
                                                             c1_fsm_dmx1_mem_ena ? c1_fsm_dmx1_mem_wea :
                                                                                 c2_wr_c1_dmx1_mem_ena ? c2_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;

wire [`RAM_ADDR_WIDTH-1:0] c1_rtri_mem_addra = dma_mem_ena[`MEM_NO-1] ? dma_mem_addra : c1_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx0_mem_addra = dma_mem_ena[`MEM_NO-2] ? dma_mem_addra :
                                                                  c1_fsm_dmx0_mem_ena ? c1_fsm_dmx0_mem_addra :
                                                                                        c2_wr_c1_dmx0_mem_ena ? c2_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx1_mem_addra = dma_mem_ena[`MEM_NO-3] ? dma_mem_addra : 
                                                                  c1_fsm_dmx1_mem_ena ? c1_fsm_dmx1_mem_addra : 
                                                                                        c2_wr_c1_dmx1_mem_ena ? c2_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;

wire [`RAM_WIDTH-1:0] c1_rtri_mem_dina = dma_mem_ena[`MEM_NO-1] ? dma_mem_dina : 
                                                           c1_fsm_rtri_mem_ena ? c1_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c1_dmx0_mem_dina = dma_mem_ena[`MEM_NO-2] ? dma_mem_dina : 
                                                           c1_fsm_dmx0_mem_ena ? c1_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c2_wr_c1_dmx0_mem_ena ? c2_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;
wire [`RAM_WIDTH-1:0] c1_dmx1_mem_dina = dma_mem_ena[`MEM_NO-3] ? dma_mem_dina :
                                                           c1_fsm_dmx1_mem_ena ? c1_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c2_wr_c1_dmx1_mem_ena ? c2_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;

wire c1_rtri_mem_enb = dma_mem_enb[`MEM_NO-1] | c1_fsm_rtri_mem_enb;
wire c1_dmx0_mem_enb = dma_mem_enb[`MEM_NO-2] | c1_fsm_dmx0_mem_enb;
wire c1_dmx1_mem_enb = dma_mem_enb[`MEM_NO-3] | c1_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c1_rtri_mem_addrb = dma_mem_enb[`MEM_NO-1] ? dma_mem_addrb : c1_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-2] ? dma_mem_addrb : c1_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-3] ? dma_mem_addrb : c1_fsm_dmx1_mem_addrb;

// DMA interfacing
wire [`RAM_WIDTH-1:0] c2_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c2_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c2_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_dmx1_mem_doutb  ;
always @(rst,dma_mem_enb,c1_rtri_mem_doutb,c1_dmx0_mem_doutb,c1_dmx1_mem_doutb,c2_rtri_mem_doutb,c2_dmx0_mem_doutb,c2_dmx1_mem_doutb) begin
  if(rst) begin
    dma_mem_doutb=`RAM_WIDTH'h0;
  end else begin
    case(dma_mem_enb)
      `MEM_NO'b100000: dma_mem_doutb=c1_rtri_mem_doutb;
      `MEM_NO'b010000: dma_mem_doutb=c1_dmx0_mem_doutb;
      `MEM_NO'b001000: dma_mem_doutb=c1_dmx1_mem_doutb;
      `MEM_NO'b000100: dma_mem_doutb=c2_rtri_mem_doutb;
      `MEM_NO'b000010: dma_mem_doutb=c2_dmx0_mem_doutb;
      `MEM_NO'b000001: dma_mem_doutb=c2_dmx1_mem_doutb;
      default: dma_mem_doutb=`RAM_WIDTH'h0;
    endcase
  end
end
`endif //DUAL_CORE_INT

// -----------------------------------------
// Quad-core core
// Interface declaration and mem interfacing
// -----------------------------------------
`ifdef QUAD_CORE
wire                        c1_tsqr_en       = tsqr_en; 
wire [`CNT_WIDTH-1:0]       c1_tile_no       = c1_tsqr_en ? tile_no/4+`CNT_WIDTH'd1 : `CNT_WIDTH'd0; 
assign                      tsqr_fi          = c1_tsqr_en ? c1_tsqr_fi : 1'b0; 

reg  c2_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c2_tsqr_fi_level <= 1'b0 ;
  end else if (c2_tsqr_fi) begin
    c2_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c2_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c2_tsqr_en  = tsqr_en&~c2_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c2_tile_no  = c2_tsqr_en ? tile_no/4-`CNT_WIDTH'd1 : `CNT_WIDTH'd0; 

reg  c3_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c3_tsqr_fi_level <= 1'b0 ;
  end else if (c3_tsqr_fi) begin
    c3_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c3_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c3_tsqr_en  = tsqr_en&~c3_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c3_tile_no  = c3_tsqr_en ? tile_no/4 : `CNT_WIDTH'd0; 

reg  c4_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c4_tsqr_fi_level <= 1'b0 ;
  end else if (c4_tsqr_fi) begin
    c4_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c4_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c4_tsqr_en  = tsqr_en&~c4_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c4_tile_no  = c4_tsqr_en ? tile_no/4-`CNT_WIDTH'd1 : `CNT_WIDTH'd0; 

// Memory Operations in Core 4 
wire c4_rtri_mem_ena = dma_mem_ena[`MEM_NO-10] | c4_fsm_rtri_mem_ena;
wire c4_dmx0_mem_ena = dma_mem_ena[`MEM_NO-11] | c4_fsm_dmx0_mem_ena;
wire c4_dmx1_mem_ena = dma_mem_ena[`MEM_NO-12] | c4_fsm_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c4_rtri_mem_wea = dma_mem_ena[`MEM_NO-10] ? dma_mem_wea : c4_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c4_dmx0_mem_wea = dma_mem_ena[`MEM_NO-11] ? dma_mem_wea : c4_fsm_dmx0_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c4_dmx1_mem_wea = dma_mem_ena[`MEM_NO-12] ? dma_mem_wea : c4_fsm_dmx1_mem_wea;

wire [`RAM_ADDR_WIDTH-1:0] c4_rtri_mem_addra = dma_mem_ena[`MEM_NO-10] ? dma_mem_addra : c4_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c4_dmx0_mem_addra = dma_mem_ena[`MEM_NO-11] ? dma_mem_addra : c4_fsm_dmx0_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c4_dmx1_mem_addra = dma_mem_ena[`MEM_NO-12] ? dma_mem_addra : c4_fsm_dmx1_mem_addra; 

wire [`RAM_WIDTH-1:0] c4_rtri_mem_dina = dma_mem_ena[`MEM_NO-10] ? dma_mem_dina : 
                                                           c4_fsm_rtri_mem_ena ? c4_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c4_dmx0_mem_dina = dma_mem_ena[`MEM_NO-11] ? dma_mem_dina : 
                                                           c4_fsm_dmx0_mem_ena ? c4_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c4_dmx1_mem_dina = dma_mem_ena[`MEM_NO-12] ? dma_mem_dina :
                                                           c4_fsm_dmx1_mem_ena ? c4_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;

wire c4_rtri_mem_enb = dma_mem_enb[`MEM_NO-10] | c4_fsm_rtri_mem_enb;
wire c4_dmx0_mem_enb = dma_mem_enb[`MEM_NO-11] | c4_fsm_dmx0_mem_enb;
wire c4_dmx1_mem_enb = dma_mem_enb[`MEM_NO-12] | c4_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c4_rtri_mem_addrb = dma_mem_enb[`MEM_NO-10] ? dma_mem_addrb : c4_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c4_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-11] ? dma_mem_addrb : c4_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c4_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-12] ? dma_mem_addrb : c4_fsm_dmx1_mem_addrb;

// Memory Operations in Core 3 
wire c4_wr_c3_dmx1_mem_ena  = c4_rtri_mem_ena & (c4_mx_cnt==tile_no/4-`CNT_WIDTH'd2) & ~tile_no[2]; 
wire c4_wr_c3_dmx0_mem_ena  = c4_rtri_mem_ena & (c4_mx_cnt==tile_no/4-`CNT_WIDTH'd2) & tile_no[2]; 
wire c3_rtri_mem_ena = dma_mem_ena[`MEM_NO-7] | c3_fsm_rtri_mem_ena;
wire c3_dmx0_mem_ena = dma_mem_ena[`MEM_NO-8] | c3_fsm_dmx0_mem_ena | c4_wr_c3_dmx0_mem_ena;
wire c3_dmx1_mem_ena = dma_mem_ena[`MEM_NO-9] | c3_fsm_dmx1_mem_ena | c4_wr_c3_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c3_rtri_mem_wea = dma_mem_ena[`MEM_NO-7] ? dma_mem_wea : c3_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c3_dmx0_mem_wea = dma_mem_ena[`MEM_NO-8] ? dma_mem_wea :
                                                             c3_fsm_dmx0_mem_ena ? c3_fsm_dmx0_mem_wea :
                                                                                 c4_wr_c3_dmx0_mem_ena ? c4_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;
wire [`RAM_WEA_WIDTH-1:0] c3_dmx1_mem_wea = dma_mem_ena[`MEM_NO-9] ? dma_mem_wea : 
                                                             c3_fsm_dmx1_mem_ena ? c3_fsm_dmx1_mem_wea :
                                                                                 c4_wr_c3_dmx1_mem_ena ? c4_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;

wire [`RAM_ADDR_WIDTH-1:0] c3_rtri_mem_addra = dma_mem_ena[`MEM_NO-7] ? dma_mem_addra : c3_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c3_dmx0_mem_addra = dma_mem_ena[`MEM_NO-8] ? dma_mem_addra :
                                                                  c3_fsm_dmx0_mem_ena ? c3_fsm_dmx0_mem_addra :
                                                                                        c4_wr_c3_dmx0_mem_ena ? c4_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;
wire [`RAM_ADDR_WIDTH-1:0] c3_dmx1_mem_addra = dma_mem_ena[`MEM_NO-9] ? dma_mem_addra : 
                                                                  c3_fsm_dmx1_mem_ena ? c3_fsm_dmx1_mem_addra : 
                                                                                        c4_wr_c3_dmx1_mem_ena ? c4_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;

wire [`RAM_WIDTH-1:0] c3_rtri_mem_dina = dma_mem_ena[`MEM_NO-7] ? dma_mem_dina : 
                                                           c3_fsm_rtri_mem_ena ? c3_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c3_dmx0_mem_dina = dma_mem_ena[`MEM_NO-8] ? dma_mem_dina : 
                                                           c3_fsm_dmx0_mem_ena ? c3_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c4_wr_c3_dmx0_mem_ena ? c4_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;
wire [`RAM_WIDTH-1:0] c3_dmx1_mem_dina = dma_mem_ena[`MEM_NO-9] ? dma_mem_dina :
                                                           c3_fsm_dmx1_mem_ena ? c3_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c4_wr_c3_dmx1_mem_ena ? c4_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;

wire c3_rtri_mem_enb = dma_mem_enb[`MEM_NO-7] | c3_fsm_rtri_mem_enb;
wire c3_dmx0_mem_enb = dma_mem_enb[`MEM_NO-8] | c3_fsm_dmx0_mem_enb;
wire c3_dmx1_mem_enb = dma_mem_enb[`MEM_NO-9] | c3_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c3_rtri_mem_addrb = dma_mem_enb[`MEM_NO-7] ? dma_mem_addrb : c3_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c3_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-8] ? dma_mem_addrb : c3_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c3_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-9] ? dma_mem_addrb : c3_fsm_dmx1_mem_addrb;

// Memory Operations in Core 2 
wire c2_rtri_mem_ena = dma_mem_ena[`MEM_NO-4] | c2_fsm_rtri_mem_ena;
wire c2_dmx0_mem_ena = dma_mem_ena[`MEM_NO-5] | c2_fsm_dmx0_mem_ena;
wire c2_dmx1_mem_ena = dma_mem_ena[`MEM_NO-6] | c2_fsm_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c2_rtri_mem_wea = dma_mem_ena[`MEM_NO-4] ? dma_mem_wea : c2_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c2_dmx0_mem_wea = dma_mem_ena[`MEM_NO-5] ? dma_mem_wea : c2_fsm_dmx0_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c2_dmx1_mem_wea = dma_mem_ena[`MEM_NO-6] ? dma_mem_wea : c2_fsm_dmx1_mem_wea;

wire [`RAM_ADDR_WIDTH-1:0] c2_rtri_mem_addra = dma_mem_ena[`MEM_NO-4] ? dma_mem_addra : c2_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx0_mem_addra = dma_mem_ena[`MEM_NO-5] ? dma_mem_addra : c2_fsm_dmx0_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx1_mem_addra = dma_mem_ena[`MEM_NO-6] ? dma_mem_addra : c2_fsm_dmx1_mem_addra; 

wire [`RAM_WIDTH-1:0] c2_rtri_mem_dina = dma_mem_ena[`MEM_NO-4] ? dma_mem_dina : 
                                                           c2_fsm_rtri_mem_ena ? c2_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c2_dmx0_mem_dina = dma_mem_ena[`MEM_NO-5] ? dma_mem_dina : 
                                                           c2_fsm_dmx0_mem_ena ? c2_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c2_dmx1_mem_dina = dma_mem_ena[`MEM_NO-6] ? dma_mem_dina :
                                                           c2_fsm_dmx1_mem_ena ? c2_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;

wire c2_rtri_mem_enb = dma_mem_enb[`MEM_NO-4] | c2_fsm_rtri_mem_enb;
wire c2_dmx0_mem_enb = dma_mem_enb[`MEM_NO-5] | c2_fsm_dmx0_mem_enb;
wire c2_dmx1_mem_enb = dma_mem_enb[`MEM_NO-6] | c2_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c2_rtri_mem_addrb = dma_mem_enb[`MEM_NO-4] ? dma_mem_addrb : c2_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-5] ? dma_mem_addrb : c2_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-6] ? dma_mem_addrb : c2_fsm_dmx1_mem_addrb;

// Memory Operations in Core 1 
wire c2_wr_c1_dmx1_mem_ena  = c2_rtri_mem_ena & (c2_mx_cnt==tile_no/4-`CNT_WIDTH'd2) & ~tile_no[2]; 
wire c2_wr_c1_dmx0_mem_ena  = c2_rtri_mem_ena & (c2_mx_cnt==tile_no/4-`CNT_WIDTH'd2) & tile_no[2]; 
wire c3_wr_c1_dmx1_mem_ena  = c3_rtri_mem_ena & (c3_mx_cnt==tile_no/4-`CNT_WIDTH'd1) & tile_no[2]; 
wire c3_wr_c1_dmx0_mem_ena  = c3_rtri_mem_ena & (c3_mx_cnt==tile_no/4-`CNT_WIDTH'd1) & ~tile_no[2]; 
wire c1_rtri_mem_ena = dma_mem_ena[`MEM_NO-1] | c1_fsm_rtri_mem_ena;
wire c1_dmx0_mem_ena = dma_mem_ena[`MEM_NO-2] | c1_fsm_dmx0_mem_ena | c2_wr_c1_dmx0_mem_ena | c3_wr_c1_dmx0_mem_ena;
wire c1_dmx1_mem_ena = dma_mem_ena[`MEM_NO-3] | c1_fsm_dmx1_mem_ena | c2_wr_c1_dmx1_mem_ena | c3_wr_c1_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c1_rtri_mem_wea = dma_mem_ena[`MEM_NO-1] ? dma_mem_wea : c1_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c1_dmx0_mem_wea = dma_mem_ena[`MEM_NO-2] ? dma_mem_wea :
                                                             c1_fsm_dmx0_mem_ena ? c1_fsm_dmx0_mem_wea :
                                                                                 c2_wr_c1_dmx0_mem_ena ? c2_fsm_rtri_mem_wea : 
                                                                                                       c3_wr_c1_dmx0_mem_ena ? c3_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;
wire [`RAM_WEA_WIDTH-1:0] c1_dmx1_mem_wea = dma_mem_ena[`MEM_NO-3] ? dma_mem_wea : 
                                                             c1_fsm_dmx1_mem_ena ? c1_fsm_dmx1_mem_wea :
                                                                                 c2_wr_c1_dmx1_mem_ena ? c2_fsm_rtri_mem_wea : 
                                                                                                       c3_wr_c1_dmx1_mem_ena ? c3_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;

wire [`RAM_ADDR_WIDTH-1:0] c1_rtri_mem_addra = dma_mem_ena[`MEM_NO-1] ? dma_mem_addra : c1_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx0_mem_addra = dma_mem_ena[`MEM_NO-2] ? dma_mem_addra :
                                                                  c1_fsm_dmx0_mem_ena ? c1_fsm_dmx0_mem_addra :
                                                                                        c2_wr_c1_dmx0_mem_ena ? c2_fsm_rtri_mem_addra : 
                                                                                                                c3_wr_c1_dmx0_mem_ena ? c3_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx1_mem_addra = dma_mem_ena[`MEM_NO-3] ? dma_mem_addra : 
                                                                  c1_fsm_dmx1_mem_ena ? c1_fsm_dmx1_mem_addra : 
                                                                                        c2_wr_c1_dmx1_mem_ena ? c2_fsm_rtri_mem_addra : 
                                                                                                                c3_wr_c1_dmx1_mem_ena ? c3_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;

wire [`RAM_WIDTH-1:0] c1_rtri_mem_dina = dma_mem_ena[`MEM_NO-1] ? dma_mem_dina : 
                                                           c1_fsm_rtri_mem_ena ? c1_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c1_dmx0_mem_dina = dma_mem_ena[`MEM_NO-2] ? dma_mem_dina : 
                                                           c1_fsm_dmx0_mem_ena ? c1_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c2_wr_c1_dmx0_mem_ena ? c2_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : 
                                                                                                                              c3_wr_c1_dmx0_mem_ena ? c3_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;
wire [`RAM_WIDTH-1:0] c1_dmx1_mem_dina = dma_mem_ena[`MEM_NO-3] ? dma_mem_dina :
                                                           c1_fsm_dmx1_mem_ena ? c1_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c2_wr_c1_dmx1_mem_ena ? c2_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : 
                                                                                                                              c3_wr_c1_dmx1_mem_ena ? c3_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;

wire c1_rtri_mem_enb = dma_mem_enb[`MEM_NO-1] | c1_fsm_rtri_mem_enb;
wire c1_dmx0_mem_enb = dma_mem_enb[`MEM_NO-2] | c1_fsm_dmx0_mem_enb;
wire c1_dmx1_mem_enb = dma_mem_enb[`MEM_NO-3] | c1_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c1_rtri_mem_addrb = dma_mem_enb[`MEM_NO-1] ? dma_mem_addrb : c1_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-2] ? dma_mem_addrb : c1_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-3] ? dma_mem_addrb : c1_fsm_dmx1_mem_addrb;

// DMA interfacing
wire [`RAM_WIDTH-1:0] c4_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c4_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c4_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c3_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c3_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c3_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c2_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c2_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c2_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_dmx1_mem_doutb  ;
always @(rst,dma_mem_enb,c1_rtri_mem_doutb,c1_dmx0_mem_doutb,c1_dmx1_mem_doutb,c2_rtri_mem_doutb,c2_dmx0_mem_doutb,c2_dmx1_mem_doutb,c3_rtri_mem_doutb,c3_dmx0_mem_doutb,c3_dmx1_mem_doutb,c4_rtri_mem_doutb,c4_dmx0_mem_doutb,c4_dmx1_mem_doutb) begin
  if(rst) begin
    dma_mem_doutb=`RAM_WIDTH'h0;
  end else begin
    case(dma_mem_enb)
      `MEM_NO'b1000_0000_0000: dma_mem_doutb=c1_rtri_mem_doutb;
      `MEM_NO'b0100_0000_0000: dma_mem_doutb=c1_dmx0_mem_doutb;
      `MEM_NO'b0010_0000_0000: dma_mem_doutb=c1_dmx1_mem_doutb;
      `MEM_NO'b0001_0000_0000: dma_mem_doutb=c2_rtri_mem_doutb;
      `MEM_NO'b0000_1000_0000: dma_mem_doutb=c2_dmx0_mem_doutb;
      `MEM_NO'b0000_0100_0000: dma_mem_doutb=c2_dmx1_mem_doutb;
      `MEM_NO'b0000_0010_0000: dma_mem_doutb=c3_rtri_mem_doutb;
      `MEM_NO'b0000_0001_0000: dma_mem_doutb=c3_dmx0_mem_doutb;
      `MEM_NO'b0000_0000_1000: dma_mem_doutb=c3_dmx1_mem_doutb;
      `MEM_NO'b0000_0000_0100: dma_mem_doutb=c4_rtri_mem_doutb;
      `MEM_NO'b0000_0000_0010: dma_mem_doutb=c4_dmx0_mem_doutb;
      `MEM_NO'b0000_0000_0001: dma_mem_doutb=c4_dmx1_mem_doutb;
      default: dma_mem_doutb=`RAM_WIDTH'h0;
    endcase
  end
end
`endif //QUAD_CORE_INT

// -----------------------------------------
// Eight-core core
// Interface declaration and mem interfacing
// -----------------------------------------
`ifdef EIGHT_CORE
wire                        c1_tsqr_en       = tsqr_en; 
wire [`CNT_WIDTH-1:0]       c1_tile_no       = c1_tsqr_en ? tile_no/8+`CNT_WIDTH'd2 : `CNT_WIDTH'd0; 
assign                      tsqr_fi          = c1_tsqr_en ? c1_tsqr_fi : 1'b0; 

reg  c2_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c2_tsqr_fi_level <= 1'b0 ;
  end else if (c2_tsqr_fi) begin
    c2_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c2_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c2_tsqr_en  = tsqr_en&~c2_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c2_tile_no  = c2_tsqr_en ? tile_no/8-`CNT_WIDTH'd1 : `CNT_WIDTH'd0; 

reg  c3_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c3_tsqr_fi_level <= 1'b0 ;
  end else if (c3_tsqr_fi) begin
    c3_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c3_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c3_tsqr_en  = tsqr_en&~c3_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c3_tile_no  = c3_tsqr_en ? tile_no/8 : `CNT_WIDTH'd0; 

reg  c4_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c4_tsqr_fi_level <= 1'b0 ;
  end else if (c4_tsqr_fi) begin
    c4_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c4_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c4_tsqr_en  = tsqr_en&~c4_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c4_tile_no  = c4_tsqr_en ? tile_no/8-`CNT_WIDTH'd1 : `CNT_WIDTH'd0; 

reg  c5_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c5_tsqr_fi_level <= 1'b0 ;
  end else if (c5_tsqr_fi) begin
    c5_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c5_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c5_tsqr_en  = tsqr_en&~c5_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c5_tile_no  = c5_tsqr_en ? tile_no/8+`CNT_WIDTH'd1 : `CNT_WIDTH'd0; 

reg  c6_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c6_tsqr_fi_level <= 1'b0 ;
  end else if (c6_tsqr_fi) begin
    c6_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c6_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c6_tsqr_en  = tsqr_en&~c6_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c6_tile_no  = c6_tsqr_en ? tile_no/8-`CNT_WIDTH'd1 : `CNT_WIDTH'd0; 

reg  c7_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c7_tsqr_fi_level <= 1'b0 ;
  end else if (c7_tsqr_fi) begin
    c7_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c7_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c7_tsqr_en  = tsqr_en&~c7_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c7_tile_no  = c7_tsqr_en ? tile_no/8 : `CNT_WIDTH'd0; 

reg  c8_tsqr_fi_level;
always @(posedge clk)begin
  if(rst) begin
    c8_tsqr_fi_level <= 1'b0 ;
  end else if (c8_tsqr_fi) begin
    c8_tsqr_fi_level <= 1'b1 ;
  end else if (tsqr_fi) begin
    c8_tsqr_fi_level <= 1'b0 ;
  end
end

wire                        c8_tsqr_en  = tsqr_en&~c8_tsqr_fi_level               ; 
wire [`CNT_WIDTH-1:0]       c8_tile_no  = c8_tsqr_en ? tile_no/8-`CNT_WIDTH'd1 : `CNT_WIDTH'd0; 

// Memory Operations in Core 8 
wire c8_rtri_mem_ena = dma_mem_ena[`MEM_NO-22] | c8_fsm_rtri_mem_ena;
wire c8_dmx0_mem_ena = dma_mem_ena[`MEM_NO-23] | c8_fsm_dmx0_mem_ena;
wire c8_dmx1_mem_ena = dma_mem_ena[`MEM_NO-24] | c8_fsm_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c8_rtri_mem_wea = dma_mem_ena[`MEM_NO-22] ? dma_mem_wea : c8_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c8_dmx0_mem_wea = dma_mem_ena[`MEM_NO-23] ? dma_mem_wea : c8_fsm_dmx0_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c8_dmx1_mem_wea = dma_mem_ena[`MEM_NO-24] ? dma_mem_wea : c8_fsm_dmx1_mem_wea;

wire [`RAM_ADDR_WIDTH-1:0] c8_rtri_mem_addra = dma_mem_ena[`MEM_NO-22] ? dma_mem_addra : c8_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c8_dmx0_mem_addra = dma_mem_ena[`MEM_NO-23] ? dma_mem_addra : c8_fsm_dmx0_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c8_dmx1_mem_addra = dma_mem_ena[`MEM_NO-24] ? dma_mem_addra : c8_fsm_dmx1_mem_addra; 

wire [`RAM_WIDTH-1:0] c8_rtri_mem_dina = dma_mem_ena[`MEM_NO-22] ? dma_mem_dina : 
                                                           c8_fsm_rtri_mem_ena ? c8_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c8_dmx0_mem_dina = dma_mem_ena[`MEM_NO-23] ? dma_mem_dina : 
                                                           c8_fsm_dmx0_mem_ena ? c8_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c8_dmx1_mem_dina = dma_mem_ena[`MEM_NO-24] ? dma_mem_dina :
                                                           c8_fsm_dmx1_mem_ena ? c8_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;

wire c8_rtri_mem_enb = dma_mem_enb[`MEM_NO-22] | c8_fsm_rtri_mem_enb;
wire c8_dmx0_mem_enb = dma_mem_enb[`MEM_NO-23] | c8_fsm_dmx0_mem_enb;
wire c8_dmx1_mem_enb = dma_mem_enb[`MEM_NO-24] | c8_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c8_rtri_mem_addrb = dma_mem_enb[`MEM_NO-22] ? dma_mem_addrb : c8_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c8_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-23] ? dma_mem_addrb : c8_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c8_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-24] ? dma_mem_addrb : c8_fsm_dmx1_mem_addrb;

// Memory Operations in Core 7 
wire c8_wr_c7_dmx1_mem_ena  = c8_rtri_mem_ena & (c8_mx_cnt==tile_no/8-`CNT_WIDTH'd2) & ~tile_no[3]; 
wire c8_wr_c7_dmx0_mem_ena  = c8_rtri_mem_ena & (c8_mx_cnt==tile_no/8-`CNT_WIDTH'd2) & tile_no[3]; 
wire c7_rtri_mem_ena = dma_mem_ena[`MEM_NO-19] | c7_fsm_rtri_mem_ena;
wire c7_dmx0_mem_ena = dma_mem_ena[`MEM_NO-20] | c7_fsm_dmx0_mem_ena | c8_wr_c7_dmx0_mem_ena;
wire c7_dmx1_mem_ena = dma_mem_ena[`MEM_NO-21] | c7_fsm_dmx1_mem_ena | c8_wr_c7_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c7_rtri_mem_wea = dma_mem_ena[`MEM_NO-19] ? dma_mem_wea : c7_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c7_dmx0_mem_wea = dma_mem_ena[`MEM_NO-20] ? dma_mem_wea :
                                                             c7_fsm_dmx0_mem_ena ? c7_fsm_dmx0_mem_wea :
                                                                                 c8_wr_c7_dmx0_mem_ena ? c8_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;
wire [`RAM_WEA_WIDTH-1:0] c7_dmx1_mem_wea = dma_mem_ena[`MEM_NO-21] ? dma_mem_wea : 
                                                             c7_fsm_dmx1_mem_ena ? c7_fsm_dmx1_mem_wea :
                                                                                 c8_wr_c7_dmx1_mem_ena ? c8_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;

wire [`RAM_ADDR_WIDTH-1:0] c7_rtri_mem_addra = dma_mem_ena[`MEM_NO-19] ? dma_mem_addra : c7_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c7_dmx0_mem_addra = dma_mem_ena[`MEM_NO-20] ? dma_mem_addra :
                                                                  c7_fsm_dmx0_mem_ena ? c7_fsm_dmx0_mem_addra :
                                                                                        c8_wr_c7_dmx0_mem_ena ? c8_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;
wire [`RAM_ADDR_WIDTH-1:0] c7_dmx1_mem_addra = dma_mem_ena[`MEM_NO-21] ? dma_mem_addra : 
                                                                  c7_fsm_dmx1_mem_ena ? c7_fsm_dmx1_mem_addra : 
                                                                                        c8_wr_c7_dmx1_mem_ena ? c8_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;

wire [`RAM_WIDTH-1:0] c7_rtri_mem_dina = dma_mem_ena[`MEM_NO-19] ? dma_mem_dina : 
                                                           c7_fsm_rtri_mem_ena ? c7_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c7_dmx0_mem_dina = dma_mem_ena[`MEM_NO-20] ? dma_mem_dina : 
                                                           c7_fsm_dmx0_mem_ena ? c7_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c8_wr_c7_dmx0_mem_ena ? c8_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;
wire [`RAM_WIDTH-1:0] c7_dmx1_mem_dina = dma_mem_ena[`MEM_NO-21] ? dma_mem_dina :
                                                           c7_fsm_dmx1_mem_ena ? c7_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c8_wr_c7_dmx1_mem_ena ? c8_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;

wire c7_rtri_mem_enb = dma_mem_enb[`MEM_NO-19] | c7_fsm_rtri_mem_enb;
wire c7_dmx0_mem_enb = dma_mem_enb[`MEM_NO-20] | c7_fsm_dmx0_mem_enb;
wire c7_dmx1_mem_enb = dma_mem_enb[`MEM_NO-21] | c7_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c7_rtri_mem_addrb = dma_mem_enb[`MEM_NO-19] ? dma_mem_addrb : c7_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c7_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-20] ? dma_mem_addrb : c7_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c7_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-21] ? dma_mem_addrb : c7_fsm_dmx1_mem_addrb;

// Memory Operations in Core 6 
wire c6_rtri_mem_ena = dma_mem_ena[`MEM_NO-16] | c6_fsm_rtri_mem_ena;
wire c6_dmx0_mem_ena = dma_mem_ena[`MEM_NO-17] | c6_fsm_dmx0_mem_ena;
wire c6_dmx1_mem_ena = dma_mem_ena[`MEM_NO-18] | c6_fsm_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c6_rtri_mem_wea = dma_mem_ena[`MEM_NO-16] ? dma_mem_wea : c6_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c6_dmx0_mem_wea = dma_mem_ena[`MEM_NO-17] ? dma_mem_wea : c6_fsm_dmx0_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c6_dmx1_mem_wea = dma_mem_ena[`MEM_NO-18] ? dma_mem_wea : c6_fsm_dmx1_mem_wea;

wire [`RAM_ADDR_WIDTH-1:0] c6_rtri_mem_addra = dma_mem_ena[`MEM_NO-16] ? dma_mem_addra : c6_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c6_dmx0_mem_addra = dma_mem_ena[`MEM_NO-17] ? dma_mem_addra : c6_fsm_dmx0_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c6_dmx1_mem_addra = dma_mem_ena[`MEM_NO-18] ? dma_mem_addra : c6_fsm_dmx1_mem_addra; 

wire [`RAM_WIDTH-1:0] c6_rtri_mem_dina = dma_mem_ena[`MEM_NO-16] ? dma_mem_dina : 
                                                           c6_fsm_rtri_mem_ena ? c6_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c6_dmx0_mem_dina = dma_mem_ena[`MEM_NO-17] ? dma_mem_dina : 
                                                           c6_fsm_dmx0_mem_ena ? c6_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c6_dmx1_mem_dina = dma_mem_ena[`MEM_NO-18] ? dma_mem_dina :
                                                           c6_fsm_dmx1_mem_ena ? c6_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;

wire c6_rtri_mem_enb = dma_mem_enb[`MEM_NO-16] | c6_fsm_rtri_mem_enb;
wire c6_dmx0_mem_enb = dma_mem_enb[`MEM_NO-17] | c6_fsm_dmx0_mem_enb;
wire c6_dmx1_mem_enb = dma_mem_enb[`MEM_NO-18] | c6_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c6_rtri_mem_addrb = dma_mem_enb[`MEM_NO-16] ? dma_mem_addrb : c6_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c6_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-17] ? dma_mem_addrb : c6_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c6_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-18] ? dma_mem_addrb : c6_fsm_dmx1_mem_addrb;

// Memory Operations in Core 5 
wire c6_wr_c5_dmx1_mem_ena  = c6_rtri_mem_ena & (c6_mx_cnt==tile_no/8-`CNT_WIDTH'd2) & ~tile_no[3]; 
wire c6_wr_c5_dmx0_mem_ena  = c6_rtri_mem_ena & (c6_mx_cnt==tile_no/8-`CNT_WIDTH'd2) &  tile_no[3]; 
wire c7_wr_c5_dmx1_mem_ena  = c7_rtri_mem_ena & (c7_mx_cnt==tile_no/8-`CNT_WIDTH'd1) &  tile_no[3]; 
wire c7_wr_c5_dmx0_mem_ena  = c7_rtri_mem_ena & (c7_mx_cnt==tile_no/8-`CNT_WIDTH'd1) & ~tile_no[3]; 
wire c5_rtri_mem_ena = dma_mem_ena[`MEM_NO-13] | c5_fsm_rtri_mem_ena;
wire c5_dmx0_mem_ena = dma_mem_ena[`MEM_NO-14] | c5_fsm_dmx0_mem_ena | c6_wr_c5_dmx0_mem_ena | c7_wr_c5_dmx0_mem_ena;
wire c5_dmx1_mem_ena = dma_mem_ena[`MEM_NO-15] | c5_fsm_dmx1_mem_ena | c6_wr_c5_dmx1_mem_ena | c7_wr_c5_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c5_rtri_mem_wea = dma_mem_ena[`MEM_NO-13] ? dma_mem_wea : c5_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c5_dmx0_mem_wea = dma_mem_ena[`MEM_NO-14] ? dma_mem_wea :
                                                             c5_fsm_dmx0_mem_ena ? c5_fsm_dmx0_mem_wea :
                                                                                 c6_wr_c5_dmx0_mem_ena ? c6_fsm_rtri_mem_wea : 
                                                                                                       c7_wr_c5_dmx0_mem_ena ? c7_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;
wire [`RAM_WEA_WIDTH-1:0] c5_dmx1_mem_wea = dma_mem_ena[`MEM_NO-15] ? dma_mem_wea : 
                                                             c5_fsm_dmx1_mem_ena ? c5_fsm_dmx1_mem_wea :
                                                                                 c6_wr_c5_dmx1_mem_ena ? c6_fsm_rtri_mem_wea : 
                                                                                                       c7_wr_c5_dmx1_mem_ena ? c7_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;

wire [`RAM_ADDR_WIDTH-1:0] c5_rtri_mem_addra = dma_mem_ena[`MEM_NO-13] ? dma_mem_addra : c5_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c5_dmx0_mem_addra = dma_mem_ena[`MEM_NO-14] ? dma_mem_addra :
                                                                  c5_fsm_dmx0_mem_ena ? c5_fsm_dmx0_mem_addra :
                                                                                        c6_wr_c5_dmx0_mem_ena ? c6_fsm_rtri_mem_addra : 
                                                                                                                c7_wr_c5_dmx0_mem_ena ? c7_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;
wire [`RAM_ADDR_WIDTH-1:0] c5_dmx1_mem_addra = dma_mem_ena[`MEM_NO-15] ? dma_mem_addra : 
                                                                  c5_fsm_dmx1_mem_ena ? c5_fsm_dmx1_mem_addra : 
                                                                                        c6_wr_c5_dmx1_mem_ena ? c6_fsm_rtri_mem_addra : 
                                                                                                                c7_wr_c5_dmx1_mem_ena ? c7_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;

wire [`RAM_WIDTH-1:0] c5_rtri_mem_dina = dma_mem_ena[`MEM_NO-13] ? dma_mem_dina : 
                                                           c5_fsm_rtri_mem_ena ? c5_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c5_dmx0_mem_dina = dma_mem_ena[`MEM_NO-14] ? dma_mem_dina : 
                                                           c5_fsm_dmx0_mem_ena ? c5_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c6_wr_c5_dmx0_mem_ena ? c6_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : 
                                                                                                                              c7_wr_c5_dmx0_mem_ena ? c7_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;
wire [`RAM_WIDTH-1:0] c5_dmx1_mem_dina = dma_mem_ena[`MEM_NO-15] ? dma_mem_dina :
                                                           c5_fsm_dmx1_mem_ena ? c5_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c6_wr_c5_dmx1_mem_ena ? c6_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : 
                                                                                                                              c7_wr_c5_dmx1_mem_ena ? c7_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;

wire c5_rtri_mem_enb = dma_mem_enb[`MEM_NO-13] | c5_fsm_rtri_mem_enb;
wire c5_dmx0_mem_enb = dma_mem_enb[`MEM_NO-14] | c5_fsm_dmx0_mem_enb;
wire c5_dmx1_mem_enb = dma_mem_enb[`MEM_NO-15] | c5_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c5_rtri_mem_addrb = dma_mem_enb[`MEM_NO-13] ? dma_mem_addrb : c5_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c5_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-14] ? dma_mem_addrb : c5_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c5_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-15] ? dma_mem_addrb : c5_fsm_dmx1_mem_addrb;

// Memory Operations in Core 4 
wire c4_rtri_mem_ena = dma_mem_ena[`MEM_NO-10] | c4_fsm_rtri_mem_ena;
wire c4_dmx0_mem_ena = dma_mem_ena[`MEM_NO-11] | c4_fsm_dmx0_mem_ena;
wire c4_dmx1_mem_ena = dma_mem_ena[`MEM_NO-12] | c4_fsm_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c4_rtri_mem_wea = dma_mem_ena[`MEM_NO-10] ? dma_mem_wea : c4_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c4_dmx0_mem_wea = dma_mem_ena[`MEM_NO-11] ? dma_mem_wea : c4_fsm_dmx0_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c4_dmx1_mem_wea = dma_mem_ena[`MEM_NO-12] ? dma_mem_wea : c4_fsm_dmx1_mem_wea;

wire [`RAM_ADDR_WIDTH-1:0] c4_rtri_mem_addra = dma_mem_ena[`MEM_NO-10] ? dma_mem_addra : c4_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c4_dmx0_mem_addra = dma_mem_ena[`MEM_NO-11] ? dma_mem_addra : c4_fsm_dmx0_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c4_dmx1_mem_addra = dma_mem_ena[`MEM_NO-12] ? dma_mem_addra : c4_fsm_dmx1_mem_addra; 

wire [`RAM_WIDTH-1:0] c4_rtri_mem_dina = dma_mem_ena[`MEM_NO-10] ? dma_mem_dina : 
                                                           c4_fsm_rtri_mem_ena ? c4_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c4_dmx0_mem_dina = dma_mem_ena[`MEM_NO-11] ? dma_mem_dina : 
                                                           c4_fsm_dmx0_mem_ena ? c4_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c4_dmx1_mem_dina = dma_mem_ena[`MEM_NO-12] ? dma_mem_dina :
                                                           c4_fsm_dmx1_mem_ena ? c4_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;

wire c4_rtri_mem_enb = dma_mem_enb[`MEM_NO-10] | c4_fsm_rtri_mem_enb;
wire c4_dmx0_mem_enb = dma_mem_enb[`MEM_NO-11] | c4_fsm_dmx0_mem_enb;
wire c4_dmx1_mem_enb = dma_mem_enb[`MEM_NO-12] | c4_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c4_rtri_mem_addrb = dma_mem_enb[`MEM_NO-10] ? dma_mem_addrb : c4_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c4_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-11] ? dma_mem_addrb : c4_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c4_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-12] ? dma_mem_addrb : c4_fsm_dmx1_mem_addrb;

// Memory Operations in Core 3 
wire c4_wr_c3_dmx1_mem_ena  = c4_rtri_mem_ena & (c4_mx_cnt==tile_no/8-`CNT_WIDTH'd2) & ~tile_no[3]; 
wire c4_wr_c3_dmx0_mem_ena  = c4_rtri_mem_ena & (c4_mx_cnt==tile_no/8-`CNT_WIDTH'd2) &  tile_no[3]; 
wire c3_rtri_mem_ena = dma_mem_ena[`MEM_NO-7] | c3_fsm_rtri_mem_ena;
wire c3_dmx0_mem_ena = dma_mem_ena[`MEM_NO-8] | c3_fsm_dmx0_mem_ena | c4_wr_c3_dmx0_mem_ena;
wire c3_dmx1_mem_ena = dma_mem_ena[`MEM_NO-9] | c3_fsm_dmx1_mem_ena | c4_wr_c3_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c3_rtri_mem_wea = dma_mem_ena[`MEM_NO-7] ? dma_mem_wea : c3_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c3_dmx0_mem_wea = dma_mem_ena[`MEM_NO-8] ? dma_mem_wea :
                                                             c3_fsm_dmx0_mem_ena ? c3_fsm_dmx0_mem_wea :
                                                                                 c4_wr_c3_dmx0_mem_ena ? c4_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;
wire [`RAM_WEA_WIDTH-1:0] c3_dmx1_mem_wea = dma_mem_ena[`MEM_NO-9] ? dma_mem_wea : 
                                                             c3_fsm_dmx1_mem_ena ? c3_fsm_dmx1_mem_wea :
                                                                                 c4_wr_c3_dmx1_mem_ena ? c4_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;

wire [`RAM_ADDR_WIDTH-1:0] c3_rtri_mem_addra = dma_mem_ena[`MEM_NO-7] ? dma_mem_addra : c3_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c3_dmx0_mem_addra = dma_mem_ena[`MEM_NO-8] ? dma_mem_addra :
                                                                  c3_fsm_dmx0_mem_ena ? c3_fsm_dmx0_mem_addra :
                                                                                        c4_wr_c3_dmx0_mem_ena ? c4_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;
wire [`RAM_ADDR_WIDTH-1:0] c3_dmx1_mem_addra = dma_mem_ena[`MEM_NO-9] ? dma_mem_addra : 
                                                                  c3_fsm_dmx1_mem_ena ? c3_fsm_dmx1_mem_addra : 
                                                                                        c4_wr_c3_dmx1_mem_ena ? c4_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;

wire [`RAM_WIDTH-1:0] c3_rtri_mem_dina = dma_mem_ena[`MEM_NO-7] ? dma_mem_dina : 
                                                           c3_fsm_rtri_mem_ena ? c3_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c3_dmx0_mem_dina = dma_mem_ena[`MEM_NO-8] ? dma_mem_dina : 
                                                           c3_fsm_dmx0_mem_ena ? c3_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c4_wr_c3_dmx0_mem_ena ? c4_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;
wire [`RAM_WIDTH-1:0] c3_dmx1_mem_dina = dma_mem_ena[`MEM_NO-9] ? dma_mem_dina :
                                                           c3_fsm_dmx1_mem_ena ? c3_hh_dout[`RAM_WIDTH-1:0] : 
                                                                                      c4_wr_c3_dmx1_mem_ena ? c4_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;

wire c3_rtri_mem_enb = dma_mem_enb[`MEM_NO-7] | c3_fsm_rtri_mem_enb;
wire c3_dmx0_mem_enb = dma_mem_enb[`MEM_NO-8] | c3_fsm_dmx0_mem_enb;
wire c3_dmx1_mem_enb = dma_mem_enb[`MEM_NO-9] | c3_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c3_rtri_mem_addrb = dma_mem_enb[`MEM_NO-7] ? dma_mem_addrb : c3_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c3_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-8] ? dma_mem_addrb : c3_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c3_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-9] ? dma_mem_addrb : c3_fsm_dmx1_mem_addrb;

// Memory Operations in Core 2 
wire c2_rtri_mem_ena = dma_mem_ena[`MEM_NO-4] | c2_fsm_rtri_mem_ena;
wire c2_dmx0_mem_ena = dma_mem_ena[`MEM_NO-5] | c2_fsm_dmx0_mem_ena;
wire c2_dmx1_mem_ena = dma_mem_ena[`MEM_NO-6] | c2_fsm_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c2_rtri_mem_wea = dma_mem_ena[`MEM_NO-4] ? dma_mem_wea : c2_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c2_dmx0_mem_wea = dma_mem_ena[`MEM_NO-5] ? dma_mem_wea : c2_fsm_dmx0_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c2_dmx1_mem_wea = dma_mem_ena[`MEM_NO-6] ? dma_mem_wea : c2_fsm_dmx1_mem_wea;

wire [`RAM_ADDR_WIDTH-1:0] c2_rtri_mem_addra = dma_mem_ena[`MEM_NO-4] ? dma_mem_addra : c2_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx0_mem_addra = dma_mem_ena[`MEM_NO-5] ? dma_mem_addra : c2_fsm_dmx0_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx1_mem_addra = dma_mem_ena[`MEM_NO-6] ? dma_mem_addra : c2_fsm_dmx1_mem_addra; 

wire [`RAM_WIDTH-1:0] c2_rtri_mem_dina = dma_mem_ena[`MEM_NO-4] ? dma_mem_dina : 
                                                           c2_fsm_rtri_mem_ena ? c2_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c2_dmx0_mem_dina = dma_mem_ena[`MEM_NO-5] ? dma_mem_dina : 
                                                           c2_fsm_dmx0_mem_ena ? c2_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c2_dmx1_mem_dina = dma_mem_ena[`MEM_NO-6] ? dma_mem_dina :
                                                           c2_fsm_dmx1_mem_ena ? c2_hh_dout[`RAM_WIDTH-1:0]            : `RAM_WIDTH'h0     ;

wire c2_rtri_mem_enb = dma_mem_enb[`MEM_NO-4] | c2_fsm_rtri_mem_enb;
wire c2_dmx0_mem_enb = dma_mem_enb[`MEM_NO-5] | c2_fsm_dmx0_mem_enb;
wire c2_dmx1_mem_enb = dma_mem_enb[`MEM_NO-6] | c2_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c2_rtri_mem_addrb = dma_mem_enb[`MEM_NO-4] ? dma_mem_addrb : c2_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-5] ? dma_mem_addrb : c2_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c2_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-6] ? dma_mem_addrb : c2_fsm_dmx1_mem_addrb;

// Memory Operations in Core 1 
wire c2_wr_c1_dmx1_mem_ena  = c2_rtri_mem_ena & (c2_mx_cnt==tile_no/8-`CNT_WIDTH'd2) & ~tile_no[3]; 
wire c2_wr_c1_dmx0_mem_ena  = c2_rtri_mem_ena & (c2_mx_cnt==tile_no/8-`CNT_WIDTH'd2) &  tile_no[3]; 
wire c3_wr_c1_dmx1_mem_ena  = c3_rtri_mem_ena & (c3_mx_cnt==tile_no/8-`CNT_WIDTH'd1) &  tile_no[3]; 
wire c3_wr_c1_dmx0_mem_ena  = c3_rtri_mem_ena & (c3_mx_cnt==tile_no/8-`CNT_WIDTH'd1) & ~tile_no[3]; 
wire c5_wr_c1_dmx1_mem_ena  = c5_rtri_mem_ena & (c5_mx_cnt==tile_no/8              ) & ~tile_no[3]; 
wire c5_wr_c1_dmx0_mem_ena  = c5_rtri_mem_ena & (c5_mx_cnt==tile_no/8              ) &  tile_no[3]; 
wire c1_rtri_mem_ena = dma_mem_ena[`MEM_NO-1] | c1_fsm_rtri_mem_ena;
wire c1_dmx0_mem_ena = dma_mem_ena[`MEM_NO-2] | c1_fsm_dmx0_mem_ena | c2_wr_c1_dmx0_mem_ena | c3_wr_c1_dmx0_mem_ena | c5_wr_c1_dmx0_mem_ena;
wire c1_dmx1_mem_ena = dma_mem_ena[`MEM_NO-3] | c1_fsm_dmx1_mem_ena | c2_wr_c1_dmx1_mem_ena | c3_wr_c1_dmx1_mem_ena | c5_wr_c1_dmx1_mem_ena;

wire [`RAM_WEA_WIDTH-1:0] c1_rtri_mem_wea = dma_mem_ena[`MEM_NO-1] ? dma_mem_wea : c1_fsm_rtri_mem_wea;
wire [`RAM_WEA_WIDTH-1:0] c1_dmx0_mem_wea = dma_mem_ena[`MEM_NO-2] ? dma_mem_wea :
                                                         c1_fsm_dmx0_mem_ena ? c1_fsm_dmx0_mem_wea :
                                                                         c2_wr_c1_dmx0_mem_ena ? c2_fsm_rtri_mem_wea : 
                                                                                           c3_wr_c1_dmx0_mem_ena ? c3_fsm_rtri_mem_wea : 
                                                                                                             c5_wr_c1_dmx0_mem_ena ? c5_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;
wire [`RAM_WEA_WIDTH-1:0] c1_dmx1_mem_wea = dma_mem_ena[`MEM_NO-3] ? dma_mem_wea : 
                                                         c1_fsm_dmx1_mem_ena ? c1_fsm_dmx1_mem_wea :
                                                                         c2_wr_c1_dmx1_mem_ena ? c2_fsm_rtri_mem_wea : 
                                                                                           c3_wr_c1_dmx1_mem_ena ? c3_fsm_rtri_mem_wea : 
                                                                                                             c5_wr_c1_dmx1_mem_ena ? c5_fsm_rtri_mem_wea : `RAM_WEA_WIDTH'h0;

wire [`RAM_ADDR_WIDTH-1:0] c1_rtri_mem_addra = dma_mem_ena[`MEM_NO-1] ? dma_mem_addra : c1_fsm_rtri_mem_addra;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx0_mem_addra = dma_mem_ena[`MEM_NO-2] ? dma_mem_addra :
                                                              c1_fsm_dmx0_mem_ena ? c1_fsm_dmx0_mem_addra :
                                                                              c2_wr_c1_dmx0_mem_ena ? c2_fsm_rtri_mem_addra : 
                                                                                                c3_wr_c1_dmx0_mem_ena ? c3_fsm_rtri_mem_addra : 
                                                                                                              c5_wr_c1_dmx0_mem_ena ? c5_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx1_mem_addra = dma_mem_ena[`MEM_NO-3] ? dma_mem_addra : 
                                                              c1_fsm_dmx1_mem_ena ? c1_fsm_dmx1_mem_addra : 
                                                                              c2_wr_c1_dmx1_mem_ena ? c2_fsm_rtri_mem_addra : 
                                                                                                c3_wr_c1_dmx1_mem_ena ? c3_fsm_rtri_mem_addra : 
                                                                                                                  c5_wr_c1_dmx1_mem_ena ? c5_fsm_rtri_mem_addra : `RAM_ADDR_WIDTH'h0;

wire [`RAM_WIDTH-1:0] c1_rtri_mem_dina = dma_mem_ena[`MEM_NO-1] ? dma_mem_dina : 
                                                           c1_fsm_rtri_mem_ena ? c1_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0     ;
wire [`RAM_WIDTH-1:0] c1_dmx0_mem_dina = dma_mem_ena[`MEM_NO-2] ? dma_mem_dina : 
                                                       c1_fsm_dmx0_mem_ena ? c1_hh_dout[`RAM_WIDTH-1:0] : 
                                                                     c2_wr_c1_dmx0_mem_ena ? c2_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : 
                                                                                     c3_wr_c1_dmx0_mem_ena ? c3_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] :
                                                                                                     c5_wr_c1_dmx0_mem_ena ? c5_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;
wire [`RAM_WIDTH-1:0] c1_dmx1_mem_dina = dma_mem_ena[`MEM_NO-3] ? dma_mem_dina :
                                                      c1_fsm_dmx1_mem_ena ? c1_hh_dout[`RAM_WIDTH-1:0] : 
                                                                    c2_wr_c1_dmx1_mem_ena ? c2_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : 
                                                                                     c3_wr_c1_dmx1_mem_ena ? c3_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] :
                                                                                                     c5_wr_c1_dmx1_mem_ena ? c5_hh_dout[2*`RAM_WIDTH-1:`RAM_WIDTH] : `RAM_WIDTH'h0;

wire c1_rtri_mem_enb = dma_mem_enb[`MEM_NO-1] | c1_fsm_rtri_mem_enb;
wire c1_dmx0_mem_enb = dma_mem_enb[`MEM_NO-2] | c1_fsm_dmx0_mem_enb;
wire c1_dmx1_mem_enb = dma_mem_enb[`MEM_NO-3] | c1_fsm_dmx1_mem_enb;
wire [`RAM_ADDR_WIDTH-1:0] c1_rtri_mem_addrb = dma_mem_enb[`MEM_NO-1] ? dma_mem_addrb : c1_fsm_rtri_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx0_mem_addrb = dma_mem_enb[`MEM_NO-2] ? dma_mem_addrb : c1_fsm_dmx0_mem_addrb;
wire [`RAM_ADDR_WIDTH-1:0] c1_dmx1_mem_addrb = dma_mem_enb[`MEM_NO-3] ? dma_mem_addrb : c1_fsm_dmx1_mem_addrb;

// DMA interfacing
wire [`RAM_WIDTH-1:0] c8_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c8_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c8_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c7_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c7_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c7_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c6_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c6_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c6_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c5_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c5_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c5_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c4_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c4_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c4_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c3_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c3_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c3_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c2_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c2_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c2_dmx1_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_rtri_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_dmx0_mem_doutb  ;
wire [`RAM_WIDTH-1:0] c1_dmx1_mem_doutb  ;
always @(rst,dma_mem_enb,c1_rtri_mem_doutb,c1_dmx0_mem_doutb,c1_dmx1_mem_doutb,c2_rtri_mem_doutb,c2_dmx0_mem_doutb,c2_dmx1_mem_doutb,c3_rtri_mem_doutb,c3_dmx0_mem_doutb,c3_dmx1_mem_doutb,c4_rtri_mem_doutb,c4_dmx0_mem_doutb,c4_dmx1_mem_doutb,c5_rtri_mem_doutb,c5_dmx0_mem_doutb,c5_dmx1_mem_doutb,c6_rtri_mem_doutb,c6_dmx0_mem_doutb,c6_dmx1_mem_doutb,c7_rtri_mem_doutb,c7_dmx0_mem_doutb,c7_dmx1_mem_doutb,c8_rtri_mem_doutb,c8_dmx0_mem_doutb,c8_dmx1_mem_doutb) begin
  if(rst) begin
    dma_mem_doutb=`RAM_WIDTH'h0;
  end else begin
    case(dma_mem_enb)
      `MEM_NO'b1000_0000_0000_0000_0000_0000: dma_mem_doutb=c1_rtri_mem_doutb;
      `MEM_NO'b0100_0000_0000_0000_0000_0000: dma_mem_doutb=c1_dmx0_mem_doutb;
      `MEM_NO'b0010_0000_0000_0000_0000_0000: dma_mem_doutb=c1_dmx1_mem_doutb;
      `MEM_NO'b0001_0000_0000_0000_0000_0000: dma_mem_doutb=c2_rtri_mem_doutb;
      `MEM_NO'b0000_1000_0000_0000_0000_0000: dma_mem_doutb=c2_dmx0_mem_doutb;
      `MEM_NO'b0000_0100_0000_0000_0000_0000: dma_mem_doutb=c2_dmx1_mem_doutb;
      `MEM_NO'b0000_0010_0000_0000_0000_0000: dma_mem_doutb=c3_rtri_mem_doutb;
      `MEM_NO'b0000_0001_0000_0000_0000_0000: dma_mem_doutb=c3_dmx0_mem_doutb;
      `MEM_NO'b0000_0000_1000_0000_0000_0000: dma_mem_doutb=c3_dmx1_mem_doutb;
      `MEM_NO'b0000_0000_0100_0000_0000_0000: dma_mem_doutb=c4_rtri_mem_doutb;
      `MEM_NO'b0000_0000_0010_0000_0000_0000: dma_mem_doutb=c4_dmx0_mem_doutb;
      `MEM_NO'b0000_0000_0001_0000_0000_0000: dma_mem_doutb=c4_dmx1_mem_doutb;
      `MEM_NO'b0000_0000_0000_1000_0000_0000: dma_mem_doutb=c5_rtri_mem_doutb;
      `MEM_NO'b0000_0000_0000_0100_0000_0000: dma_mem_doutb=c5_dmx0_mem_doutb;
      `MEM_NO'b0000_0000_0000_0010_0000_0000: dma_mem_doutb=c5_dmx1_mem_doutb;
      `MEM_NO'b0000_0000_0000_0001_0000_0000: dma_mem_doutb=c6_rtri_mem_doutb;
      `MEM_NO'b0000_0000_0000_0000_1000_0000: dma_mem_doutb=c6_dmx0_mem_doutb;
      `MEM_NO'b0000_0000_0000_0000_0100_0000: dma_mem_doutb=c6_dmx1_mem_doutb;
      `MEM_NO'b0000_0000_0000_0000_0010_0000: dma_mem_doutb=c7_rtri_mem_doutb;
      `MEM_NO'b0000_0000_0000_0000_0001_0000: dma_mem_doutb=c7_dmx0_mem_doutb;
      `MEM_NO'b0000_0000_0000_0000_0000_1000: dma_mem_doutb=c7_dmx1_mem_doutb;
      `MEM_NO'b0000_0000_0000_0000_0000_0100: dma_mem_doutb=c8_rtri_mem_doutb;
      `MEM_NO'b0000_0000_0000_0000_0000_0010: dma_mem_doutb=c8_dmx0_mem_doutb;
      `MEM_NO'b0000_0000_0000_0000_0000_0001: dma_mem_doutb=c8_dmx1_mem_doutb;
      default: dma_mem_doutb=`RAM_WIDTH'h0;
    endcase
  end
end
`endif //EIGHT_CORE_INT

// -----------------------------------------
// Multi-core instantiation 
// -----------------------------------------
`ifdef SINGLE_CORE_INT
fsm u1_fsm (.clk                (clk                  ),
            .rst                (rst                  ),
	    .tsqr_en            (c1_tsqr_en           ),
            .tile_no            (c1_tile_no           ),
            .hh_cnt             (c1_hh_cnt            ),
            .mx_cnt             (c1_mx_cnt            ),
	    .d1_rdy           (c1_d1_rdy          ),
	    .d1_vld           (c1_d1_vld          ),
	    .d2_rdy           (c1_d2_rdy          ),
	    .d2_vld           (c1_d2_vld          ),
	    .vk1_rdy           (c1_vk1_rdy          ),
	    .vk1_vld           (c1_vk1_vld          ),
	    .d3_rdy           (c1_d3_rdy          ),
	    .d3_vld           (c1_d3_vld          ),
	    .tk_rdy           (c1_tk_rdy          ),
	    .tk_vld           (c1_tk_vld          ),
	    .d4_rdy           (c1_d4_rdy          ),
	    .d4_vld           (c1_d4_vld          ),
	    .d5_rdy          (c1_d5_rdy         ),
	    .d5_vld          (c1_d5_vld         ),
	    .yjp_rdy          (c1_yjp_rdy         ),
	    .yjp_vld          (c1_yjp_vld         ),
	    .yj_sft             (c1_yj_sft            ),
	    .d4_sft             (c1_d4_sft            ),
	    .hh_st          (c1_hh_st         ),
	    .mem0_fi            (c1_mem0_fi           ),
            .mem1_fi            (c1_mem1_fi           ),
            .tsqr_fi            (c1_tsqr_fi           ),
            .dmx0_mem_ena       (c1_fsm_dmx0_mem_ena  ),
            .dmx0_mem_wea       (c1_fsm_dmx0_mem_wea  ),
            .dmx0_mem_addra     (c1_fsm_dmx0_mem_addra),
            .dmx0_mem_enb       (c1_fsm_dmx0_mem_enb  ),
            .dmx0_mem_addrb     (c1_fsm_dmx0_mem_addrb),
            .dmx1_mem_ena       (c1_fsm_dmx1_mem_ena  ),
            .dmx1_mem_wea       (c1_fsm_dmx1_mem_wea  ),
            .dmx1_mem_addra     (c1_fsm_dmx1_mem_addra),
            .dmx1_mem_enb       (c1_fsm_dmx1_mem_enb  ),
            .dmx1_mem_addrb     (c1_fsm_dmx1_mem_addrb),
            .rtri_mem_ena       (c1_fsm_rtri_mem_ena  ),
            .rtri_mem_wea       (c1_fsm_rtri_mem_wea  ),
            .rtri_mem_addra     (c1_fsm_rtri_mem_addra),
            .rtri_mem_enb       (c1_fsm_rtri_mem_enb  ),
            .rtri_mem_addrb     (c1_fsm_rtri_mem_addrb));

hh_core u1_hh_core (.clk                  (clk                  ),
                    .rst                  (rst                  ),
                    .hh_cnt               (c1_hh_cnt            ),
                    .d1_rdy             (c1_d1_rdy          ),
                    .d1_vld             (c1_d1_vld          ),
                    .d2_rdy             (c1_d2_rdy          ),
                    .d2_vld             (c1_d2_vld          ),
                    .vk1_rdy             (c1_vk1_rdy          ),
                    .vk1_vld             (c1_vk1_vld          ),
                    .d3_rdy             (c1_d3_rdy          ),
                    .d3_vld             (c1_d3_vld          ),
                    .tk_rdy             (c1_tk_rdy          ),
                    .tk_vld             (c1_tk_vld          ),
                    .d4_rdy             (c1_d4_rdy          ),
                    .d4_vld             (c1_d4_vld          ),
                    .d5_rdy            (c1_d5_rdy         ),
                    .d5_vld            (c1_d5_vld         ),
                    .yjp_rdy            (c1_yjp_rdy         ),
                    .yjp_vld            (c1_yjp_vld         ),
                    .yj_sft               (c1_yj_sft            ),
                    .d4_sft               (c1_d4_sft            ),
                    .hh_st            (c1_hh_st         ),
                    .mem0_fi              (c1_mem0_fi           ),
                    .mem1_fi              (c1_mem1_fi           ),
                    .dmx0_mem_ena         (c1_dmx0_mem_ena      ),
                    .dmx0_mem_wea         (c1_dmx0_mem_wea      ),
                    .dmx0_mem_addra       (c1_dmx0_mem_addra    ),
                    .dmx0_mem_dina        (c1_dmx0_mem_dina     ),
                    .dmx0_mem_enb         (c1_dmx0_mem_enb      ),
                    .dmx0_mem_addrb       (c1_dmx0_mem_addrb    ),
                    .dmx0_mem_doutb       (c1_dmx0_mem_doutb    ),
                    .dmx1_mem_ena         (c1_dmx1_mem_ena      ),
                    .dmx1_mem_wea         (c1_dmx1_mem_wea      ),
                    .dmx1_mem_addra       (c1_dmx1_mem_addra    ),
                    .dmx1_mem_dina        (c1_dmx1_mem_dina     ),
                    .dmx1_mem_enb         (c1_dmx1_mem_enb      ),
                    .dmx1_mem_addrb       (c1_dmx1_mem_addrb    ),
                    .dmx1_mem_doutb       (c1_dmx1_mem_doutb    ),
                    .rtri_mem_ena         (c1_rtri_mem_ena      ),
                    .rtri_mem_wea         (c1_rtri_mem_wea      ),
                    .rtri_mem_addra       (c1_rtri_mem_addra    ),
                    .rtri_mem_dina        (c1_rtri_mem_dina     ),
                    .rtri_mem_enb         (c1_rtri_mem_enb      ),
                    .rtri_mem_addrb       (c1_rtri_mem_addrb    ),
                    .rtri_mem_doutb       (c1_rtri_mem_doutb    ),
                    .hh_dout              (c1_hh_dout          ));
`endif //SINGLE_CORE_INT

`ifdef DUAL_CORE_INT
fsm u2_fsm (.clk                (clk                  ),
            .rst                (rst                  ),
	    .tsqr_en            (c2_tsqr_en           ),
            .tile_no            (c2_tile_no           ),
            .hh_cnt             (c2_hh_cnt            ),
            .mx_cnt             (c2_mx_cnt            ),
	    .d1_rdy           (c2_d1_rdy          ),
	    .d1_vld           (c2_d1_vld          ),
	    .d2_rdy           (c2_d2_rdy          ),
	    .d2_vld           (c2_d2_vld          ),
	    .vk1_rdy           (c2_vk1_rdy          ),
	    .vk1_vld           (c2_vk1_vld          ),
	    .d3_rdy           (c2_d3_rdy          ),
	    .d3_vld           (c2_d3_vld          ),
	    .tk_rdy           (c2_tk_rdy          ),
	    .tk_vld           (c2_tk_vld          ),
	    .d4_rdy           (c2_d4_rdy          ),
	    .d4_vld           (c2_d4_vld          ),
	    .d5_rdy          (c2_d5_rdy         ),
	    .d5_vld          (c2_d5_vld         ),
	    .yjp_rdy          (c2_yjp_rdy         ),
	    .yjp_vld          (c2_yjp_vld         ),
	    .yj_sft             (c2_yj_sft            ),
	    .d4_sft             (c2_d4_sft            ),
	    .hh_st          (c2_hh_st         ),
	    .mem0_fi            (c2_mem0_fi           ),
            .mem1_fi            (c2_mem1_fi           ),
            .tsqr_fi            (c2_tsqr_fi           ),
            .dmx0_mem_ena       (c2_fsm_dmx0_mem_ena  ),
            .dmx0_mem_wea       (c2_fsm_dmx0_mem_wea  ),
            .dmx0_mem_addra     (c2_fsm_dmx0_mem_addra),
            .dmx0_mem_enb       (c2_fsm_dmx0_mem_enb  ),
            .dmx0_mem_addrb     (c2_fsm_dmx0_mem_addrb),
            .dmx1_mem_ena       (c2_fsm_dmx1_mem_ena  ),
            .dmx1_mem_wea       (c2_fsm_dmx1_mem_wea  ),
            .dmx1_mem_addra     (c2_fsm_dmx1_mem_addra),
            .dmx1_mem_enb       (c2_fsm_dmx1_mem_enb  ),
            .dmx1_mem_addrb     (c2_fsm_dmx1_mem_addrb),
            .rtri_mem_ena       (c2_fsm_rtri_mem_ena  ),
            .rtri_mem_wea       (c2_fsm_rtri_mem_wea  ),
            .rtri_mem_addra     (c2_fsm_rtri_mem_addra),
            .rtri_mem_enb       (c2_fsm_rtri_mem_enb  ),
            .rtri_mem_addrb     (c2_fsm_rtri_mem_addrb));

hh_core u2_hh_core (.clk                  (clk                  ),
                    .rst                  (rst                  ),
                    .hh_cnt               (c2_hh_cnt            ),
                    .d1_rdy             (c2_d1_rdy          ),
                    .d1_vld             (c2_d1_vld          ),
                    .d2_rdy             (c2_d2_rdy          ),
                    .d2_vld             (c2_d2_vld          ),
                    .vk1_rdy             (c2_vk1_rdy          ),
                    .vk1_vld             (c2_vk1_vld          ),
                    .d3_rdy             (c2_d3_rdy          ),
                    .d3_vld             (c2_d3_vld          ),
                    .tk_rdy             (c2_tk_rdy          ),
                    .tk_vld             (c2_tk_vld          ),
                    .d4_rdy             (c2_d4_rdy          ),
                    .d4_vld             (c2_d4_vld          ),
                    .d5_rdy            (c2_d5_rdy         ),
                    .d5_vld            (c2_d5_vld         ),
                    .yjp_rdy            (c2_yjp_rdy         ),
                    .yjp_vld            (c2_yjp_vld         ),
                    .yj_sft               (c2_yj_sft            ),
                    .d4_sft               (c2_d4_sft            ),
                    .hh_st            (c2_hh_st         ),
                    .mem0_fi              (c2_mem0_fi           ),
                    .mem1_fi              (c2_mem1_fi           ),
                    .dmx0_mem_ena         (c2_dmx0_mem_ena      ),
                    .dmx0_mem_wea         (c2_dmx0_mem_wea      ),
                    .dmx0_mem_addra       (c2_dmx0_mem_addra    ),
                    .dmx0_mem_dina        (c2_dmx0_mem_dina     ),
                    .dmx0_mem_enb         (c2_dmx0_mem_enb      ),
                    .dmx0_mem_addrb       (c2_dmx0_mem_addrb    ),
                    .dmx0_mem_doutb       (c2_dmx0_mem_doutb    ),
                    .dmx1_mem_ena         (c2_dmx1_mem_ena      ),
                    .dmx1_mem_wea         (c2_dmx1_mem_wea      ),
                    .dmx1_mem_addra       (c2_dmx1_mem_addra    ),
                    .dmx1_mem_dina        (c2_dmx1_mem_dina     ),
                    .dmx1_mem_enb         (c2_dmx1_mem_enb      ),
                    .dmx1_mem_addrb       (c2_dmx1_mem_addrb    ),
                    .dmx1_mem_doutb       (c2_dmx1_mem_doutb    ),
                    .rtri_mem_ena         (c2_rtri_mem_ena      ),
                    .rtri_mem_wea         (c2_rtri_mem_wea      ),
                    .rtri_mem_addra       (c2_rtri_mem_addra    ),
                    .rtri_mem_dina        (c2_rtri_mem_dina     ),
                    .rtri_mem_enb         (c2_rtri_mem_enb      ),
                    .rtri_mem_addrb       (c2_rtri_mem_addrb    ),
                    .rtri_mem_doutb       (c2_rtri_mem_doutb    ),
                    .hh_dout              (c2_hh_dout          ));
`endif //DUAL_CORE_INT

`ifdef QUAD_CORE_INT
fsm u3_fsm (.clk                (clk                  ),
            .rst                (rst                  ),
	    .tsqr_en            (c3_tsqr_en           ),
            .tile_no            (c3_tile_no           ),
            .hh_cnt             (c3_hh_cnt            ),
            .mx_cnt             (c3_mx_cnt            ),
	    .d1_rdy           (c3_d1_rdy          ),
	    .d1_vld           (c3_d1_vld          ),
	    .d2_rdy           (c3_d2_rdy          ),
	    .d2_vld           (c3_d2_vld          ),
	    .vk1_rdy           (c3_vk1_rdy          ),
	    .vk1_vld           (c3_vk1_vld          ),
	    .d3_rdy           (c3_d3_rdy          ),
	    .d3_vld           (c3_d3_vld          ),
	    .tk_rdy           (c3_tk_rdy          ),
	    .tk_vld           (c3_tk_vld          ),
	    .d4_rdy           (c3_d4_rdy          ),
	    .d4_vld           (c3_d4_vld          ),
	    .d5_rdy          (c3_d5_rdy         ),
	    .d5_vld          (c3_d5_vld         ),
	    .yjp_rdy          (c3_yjp_rdy         ),
	    .yjp_vld          (c3_yjp_vld         ),
	    .yj_sft             (c3_yj_sft            ),
	    .d4_sft             (c3_d4_sft            ),
	    .hh_st          (c3_hh_st         ),
	    .mem0_fi            (c3_mem0_fi           ),
            .mem1_fi            (c3_mem1_fi           ),
            .tsqr_fi            (c3_tsqr_fi           ),
            .dmx0_mem_ena       (c3_fsm_dmx0_mem_ena  ),
            .dmx0_mem_wea       (c3_fsm_dmx0_mem_wea  ),
            .dmx0_mem_addra     (c3_fsm_dmx0_mem_addra),
            .dmx0_mem_enb       (c3_fsm_dmx0_mem_enb  ),
            .dmx0_mem_addrb     (c3_fsm_dmx0_mem_addrb),
            .dmx1_mem_ena       (c3_fsm_dmx1_mem_ena  ),
            .dmx1_mem_wea       (c3_fsm_dmx1_mem_wea  ),
            .dmx1_mem_addra     (c3_fsm_dmx1_mem_addra),
            .dmx1_mem_enb       (c3_fsm_dmx1_mem_enb  ),
            .dmx1_mem_addrb     (c3_fsm_dmx1_mem_addrb),
            .rtri_mem_ena       (c3_fsm_rtri_mem_ena  ),
            .rtri_mem_wea       (c3_fsm_rtri_mem_wea  ),
            .rtri_mem_addra     (c3_fsm_rtri_mem_addra),
            .rtri_mem_enb       (c3_fsm_rtri_mem_enb  ),
            .rtri_mem_addrb     (c3_fsm_rtri_mem_addrb));

hh_core u3_hh_core (.clk                  (clk                  ),
                    .rst                  (rst                  ),
                    .hh_cnt               (c3_hh_cnt            ),
                    .d1_rdy             (c3_d1_rdy          ),
                    .d1_vld             (c3_d1_vld          ),
                    .d2_rdy             (c3_d2_rdy          ),
                    .d2_vld             (c3_d2_vld          ),
                    .vk1_rdy             (c3_vk1_rdy          ),
                    .vk1_vld             (c3_vk1_vld          ),
                    .d3_rdy             (c3_d3_rdy          ),
                    .d3_vld             (c3_d3_vld          ),
                    .tk_rdy             (c3_tk_rdy          ),
                    .tk_vld             (c3_tk_vld          ),
                    .d4_rdy             (c3_d4_rdy          ),
                    .d4_vld             (c3_d4_vld          ),
                    .d5_rdy            (c3_d5_rdy         ),
                    .d5_vld            (c3_d5_vld         ),
                    .yjp_rdy            (c3_yjp_rdy         ),
                    .yjp_vld            (c3_yjp_vld         ),
                    .yj_sft               (c3_yj_sft            ),
                    .d4_sft               (c3_d4_sft            ),
                    .hh_st            (c3_hh_st         ),
                    .mem0_fi              (c3_mem0_fi           ),
                    .mem1_fi              (c3_mem1_fi           ),
                    .dmx0_mem_ena         (c3_dmx0_mem_ena      ),
                    .dmx0_mem_wea         (c3_dmx0_mem_wea      ),
                    .dmx0_mem_addra       (c3_dmx0_mem_addra    ),
                    .dmx0_mem_dina        (c3_dmx0_mem_dina     ),
                    .dmx0_mem_enb         (c3_dmx0_mem_enb      ),
                    .dmx0_mem_addrb       (c3_dmx0_mem_addrb    ),
                    .dmx0_mem_doutb       (c3_dmx0_mem_doutb    ),
                    .dmx1_mem_ena         (c3_dmx1_mem_ena      ),
                    .dmx1_mem_wea         (c3_dmx1_mem_wea      ),
                    .dmx1_mem_addra       (c3_dmx1_mem_addra    ),
                    .dmx1_mem_dina        (c3_dmx1_mem_dina     ),
                    .dmx1_mem_enb         (c3_dmx1_mem_enb      ),
                    .dmx1_mem_addrb       (c3_dmx1_mem_addrb    ),
                    .dmx1_mem_doutb       (c3_dmx1_mem_doutb    ),
                    .rtri_mem_ena         (c3_rtri_mem_ena      ),
                    .rtri_mem_wea         (c3_rtri_mem_wea      ),
                    .rtri_mem_addra       (c3_rtri_mem_addra    ),
                    .rtri_mem_dina        (c3_rtri_mem_dina     ),
                    .rtri_mem_enb         (c3_rtri_mem_enb      ),
                    .rtri_mem_addrb       (c3_rtri_mem_addrb    ),
                    .rtri_mem_doutb       (c3_rtri_mem_doutb    ),
                    .hh_dout              (c3_hh_dout          ));

fsm u4_fsm (.clk                (clk                  ),
            .rst                (rst                  ),
	    .tsqr_en            (c4_tsqr_en           ),
            .tile_no            (c4_tile_no           ),
            .hh_cnt             (c4_hh_cnt            ),
            .mx_cnt             (c4_mx_cnt            ),
	    .d1_rdy           (c4_d1_rdy          ),
	    .d1_vld           (c4_d1_vld          ),
	    .d2_rdy           (c4_d2_rdy          ),
	    .d2_vld           (c4_d2_vld          ),
	    .vk1_rdy           (c4_vk1_rdy          ),
	    .vk1_vld           (c4_vk1_vld          ),
	    .d3_rdy           (c4_d3_rdy          ),
	    .d3_vld           (c4_d3_vld          ),
	    .tk_rdy           (c4_tk_rdy          ),
	    .tk_vld           (c4_tk_vld          ),
	    .d4_rdy           (c4_d4_rdy          ),
	    .d4_vld           (c4_d4_vld          ),
	    .d5_rdy          (c4_d5_rdy         ),
	    .d5_vld          (c4_d5_vld         ),
	    .yjp_rdy          (c4_yjp_rdy         ),
	    .yjp_vld          (c4_yjp_vld         ),
	    .yj_sft             (c4_yj_sft            ),
	    .d4_sft             (c4_d4_sft            ),
	    .hh_st          (c4_hh_st         ),
	    .mem0_fi            (c4_mem0_fi           ),
            .mem1_fi            (c4_mem1_fi           ),
            .tsqr_fi            (c4_tsqr_fi           ),
            .dmx0_mem_ena       (c4_fsm_dmx0_mem_ena  ),
            .dmx0_mem_wea       (c4_fsm_dmx0_mem_wea  ),
            .dmx0_mem_addra     (c4_fsm_dmx0_mem_addra),
            .dmx0_mem_enb       (c4_fsm_dmx0_mem_enb  ),
            .dmx0_mem_addrb     (c4_fsm_dmx0_mem_addrb),
            .dmx1_mem_ena       (c4_fsm_dmx1_mem_ena  ),
            .dmx1_mem_wea       (c4_fsm_dmx1_mem_wea  ),
            .dmx1_mem_addra     (c4_fsm_dmx1_mem_addra),
            .dmx1_mem_enb       (c4_fsm_dmx1_mem_enb  ),
            .dmx1_mem_addrb     (c4_fsm_dmx1_mem_addrb),
            .rtri_mem_ena       (c4_fsm_rtri_mem_ena  ),
            .rtri_mem_wea       (c4_fsm_rtri_mem_wea  ),
            .rtri_mem_addra     (c4_fsm_rtri_mem_addra),
            .rtri_mem_enb       (c4_fsm_rtri_mem_enb  ),
            .rtri_mem_addrb     (c4_fsm_rtri_mem_addrb));

hh_core u4_hh_core (.clk                  (clk                  ),
                    .rst                  (rst                  ),
                    .hh_cnt               (c4_hh_cnt            ),
                    .d1_rdy             (c4_d1_rdy          ),
                    .d1_vld             (c4_d1_vld          ),
                    .d2_rdy             (c4_d2_rdy          ),
                    .d2_vld             (c4_d2_vld          ),
                    .vk1_rdy             (c4_vk1_rdy          ),
                    .vk1_vld             (c4_vk1_vld          ),
                    .d3_rdy             (c4_d3_rdy          ),
                    .d3_vld             (c4_d3_vld          ),
                    .tk_rdy             (c4_tk_rdy          ),
                    .tk_vld             (c4_tk_vld          ),
                    .d4_rdy             (c4_d4_rdy          ),
                    .d4_vld             (c4_d4_vld          ),
                    .d5_rdy            (c4_d5_rdy         ),
                    .d5_vld            (c4_d5_vld         ),
                    .yjp_rdy            (c4_yjp_rdy         ),
                    .yjp_vld            (c4_yjp_vld         ),
                    .yj_sft               (c4_yj_sft            ),
                    .d4_sft               (c4_d4_sft            ),
                    .hh_st            (c4_hh_st         ),
                    .mem0_fi              (c4_mem0_fi           ),
                    .mem1_fi              (c4_mem1_fi           ),
                    .dmx0_mem_ena         (c4_dmx0_mem_ena      ),
                    .dmx0_mem_wea         (c4_dmx0_mem_wea      ),
                    .dmx0_mem_addra       (c4_dmx0_mem_addra    ),
                    .dmx0_mem_dina        (c4_dmx0_mem_dina     ),
                    .dmx0_mem_enb         (c4_dmx0_mem_enb      ),
                    .dmx0_mem_addrb       (c4_dmx0_mem_addrb    ),
                    .dmx0_mem_doutb       (c4_dmx0_mem_doutb    ),
                    .dmx1_mem_ena         (c4_dmx1_mem_ena      ),
                    .dmx1_mem_wea         (c4_dmx1_mem_wea      ),
                    .dmx1_mem_addra       (c4_dmx1_mem_addra    ),
                    .dmx1_mem_dina        (c4_dmx1_mem_dina     ),
                    .dmx1_mem_enb         (c4_dmx1_mem_enb      ),
                    .dmx1_mem_addrb       (c4_dmx1_mem_addrb    ),
                    .dmx1_mem_doutb       (c4_dmx1_mem_doutb    ),
                    .rtri_mem_ena         (c4_rtri_mem_ena      ),
                    .rtri_mem_wea         (c4_rtri_mem_wea      ),
                    .rtri_mem_addra       (c4_rtri_mem_addra    ),
                    .rtri_mem_dina        (c4_rtri_mem_dina     ),
                    .rtri_mem_enb         (c4_rtri_mem_enb      ),
                    .rtri_mem_addrb       (c4_rtri_mem_addrb    ),
                    .rtri_mem_doutb       (c4_rtri_mem_doutb    ),
                    .hh_dout              (c4_hh_dout          ));
`endif //QUAD_CORE_INT
`ifdef EIGHT_CORE_INT
fsm u5_fsm (.clk                (clk                  ),
            .rst                (rst                  ),
	    .tsqr_en            (c5_tsqr_en           ),
            .tile_no            (c5_tile_no           ),
            .hh_cnt             (c5_hh_cnt            ),
            .mx_cnt             (c5_mx_cnt            ),
	    .d1_rdy             (c5_d1_rdy            ),
	    .d1_vld             (c5_d1_vld            ),
	    .d2_rdy             (c5_d2_rdy            ),
	    .d2_vld             (c5_d2_vld            ),
	    .vk1_rdy            (c5_vk1_rdy           ),
	    .vk1_vld            (c5_vk1_vld           ),
	    .d3_rdy             (c5_d3_rdy            ),
	    .d3_vld             (c5_d3_vld            ),
	    .tk_rdy             (c5_tk_rdy            ),
	    .tk_vld             (c5_tk_vld            ),
	    .d4_rdy             (c5_d4_rdy            ),
	    .d4_vld             (c5_d4_vld            ),
	    .d5_rdy             (c5_d5_rdy            ),
	    .d5_vld             (c5_d5_vld            ),
	    .yjp_rdy            (c5_yjp_rdy           ),
	    .yjp_vld            (c5_yjp_vld           ),
	    .yj_sft             (c5_yj_sft            ),
	    .d4_sft             (c5_d4_sft            ),
	    .hh_st              (c5_hh_st             ),
	    .mem0_fi            (c5_mem0_fi           ),
            .mem1_fi            (c5_mem1_fi           ),
            .tsqr_fi            (c5_tsqr_fi           ),
            .dmx0_mem_ena       (c5_fsm_dmx0_mem_ena  ),
            .dmx0_mem_wea       (c5_fsm_dmx0_mem_wea  ),
            .dmx0_mem_addra     (c5_fsm_dmx0_mem_addra),
            .dmx0_mem_enb       (c5_fsm_dmx0_mem_enb  ),
            .dmx0_mem_addrb     (c5_fsm_dmx0_mem_addrb),
            .dmx1_mem_ena       (c5_fsm_dmx1_mem_ena  ),
            .dmx1_mem_wea       (c5_fsm_dmx1_mem_wea  ),
            .dmx1_mem_addra     (c5_fsm_dmx1_mem_addra),
            .dmx1_mem_enb       (c5_fsm_dmx1_mem_enb  ),
            .dmx1_mem_addrb     (c5_fsm_dmx1_mem_addrb),
            .rtri_mem_ena       (c5_fsm_rtri_mem_ena  ),
            .rtri_mem_wea       (c5_fsm_rtri_mem_wea  ),
            .rtri_mem_addra     (c5_fsm_rtri_mem_addra),
            .rtri_mem_enb       (c5_fsm_rtri_mem_enb  ),
            .rtri_mem_addrb     (c5_fsm_rtri_mem_addrb));

hh_core u5_hh_core (.clk                  (clk                  ),
                    .rst                  (rst                  ),
                    .hh_cnt               (c5_hh_cnt            ),
                    .d1_rdy               (c5_d1_rdy            ),
                    .d1_vld               (c5_d1_vld            ),
                    .d2_rdy               (c5_d2_rdy            ),
                    .d2_vld               (c5_d2_vld            ),
                    .vk1_rdy              (c5_vk1_rdy           ),
                    .vk1_vld              (c5_vk1_vld           ),
                    .d3_rdy               (c5_d3_rdy            ),
                    .d3_vld               (c5_d3_vld            ),
                    .tk_rdy               (c5_tk_rdy            ),
                    .tk_vld               (c5_tk_vld            ),
                    .d4_rdy               (c5_d4_rdy            ),
                    .d4_vld               (c5_d4_vld            ),
                    .d5_rdy               (c5_d5_rdy            ),
                    .d5_vld               (c5_d5_vld            ),
                    .yjp_rdy              (c5_yjp_rdy           ),
                    .yjp_vld              (c5_yjp_vld           ),
                    .yj_sft               (c5_yj_sft            ),
                    .d4_sft               (c5_d4_sft            ),
                    .hh_st                (c5_hh_st             ),
                    .mem0_fi              (c5_mem0_fi           ),
                    .mem1_fi              (c5_mem1_fi           ),
                    .dmx0_mem_ena         (c5_dmx0_mem_ena      ),
                    .dmx0_mem_wea         (c5_dmx0_mem_wea      ),
                    .dmx0_mem_addra       (c5_dmx0_mem_addra    ),
                    .dmx0_mem_dina        (c5_dmx0_mem_dina     ),
                    .dmx0_mem_enb         (c5_dmx0_mem_enb      ),
                    .dmx0_mem_addrb       (c5_dmx0_mem_addrb    ),
                    .dmx0_mem_doutb       (c5_dmx0_mem_doutb    ),
                    .dmx1_mem_ena         (c5_dmx1_mem_ena      ),
                    .dmx1_mem_wea         (c5_dmx1_mem_wea      ),
                    .dmx1_mem_addra       (c5_dmx1_mem_addra    ),
                    .dmx1_mem_dina        (c5_dmx1_mem_dina     ),
                    .dmx1_mem_enb         (c5_dmx1_mem_enb      ),
                    .dmx1_mem_addrb       (c5_dmx1_mem_addrb    ),
                    .dmx1_mem_doutb       (c5_dmx1_mem_doutb    ),
                    .rtri_mem_ena         (c5_rtri_mem_ena      ),
                    .rtri_mem_wea         (c5_rtri_mem_wea      ),
                    .rtri_mem_addra       (c5_rtri_mem_addra    ),
                    .rtri_mem_dina        (c5_rtri_mem_dina     ),
                    .rtri_mem_enb         (c5_rtri_mem_enb      ),
                    .rtri_mem_addrb       (c5_rtri_mem_addrb    ),
                    .rtri_mem_doutb       (c5_rtri_mem_doutb    ),
                    .hh_dout              (c5_hh_dout          ));

fsm u6_fsm (.clk                (clk                  ),
            .rst                (rst                  ),
	    .tsqr_en            (c6_tsqr_en           ),
            .tile_no            (c6_tile_no           ),
            .hh_cnt             (c6_hh_cnt            ),
            .mx_cnt             (c6_mx_cnt            ),
	    .d1_rdy             (c6_d1_rdy            ),
	    .d1_vld             (c6_d1_vld            ),
	    .d2_rdy             (c6_d2_rdy            ),
	    .d2_vld             (c6_d2_vld            ),
	    .vk1_rdy            (c6_vk1_rdy           ),
	    .vk1_vld            (c6_vk1_vld           ),
	    .d3_rdy             (c6_d3_rdy            ),
	    .d3_vld             (c6_d3_vld            ),
	    .tk_rdy             (c6_tk_rdy            ),
	    .tk_vld             (c6_tk_vld            ),
	    .d4_rdy             (c6_d4_rdy            ),
	    .d4_vld             (c6_d4_vld            ),
	    .d5_rdy             (c6_d5_rdy            ),
	    .d5_vld             (c6_d5_vld            ),
	    .yjp_rdy            (c6_yjp_rdy           ),
	    .yjp_vld            (c6_yjp_vld           ),
	    .yj_sft             (c6_yj_sft            ),
	    .d4_sft             (c6_d4_sft            ),
	    .hh_st              (c6_hh_st             ),
	    .mem0_fi            (c6_mem0_fi           ),
            .mem1_fi            (c6_mem1_fi           ),
            .tsqr_fi            (c6_tsqr_fi           ),
            .dmx0_mem_ena       (c6_fsm_dmx0_mem_ena  ),
            .dmx0_mem_wea       (c6_fsm_dmx0_mem_wea  ),
            .dmx0_mem_addra     (c6_fsm_dmx0_mem_addra),
            .dmx0_mem_enb       (c6_fsm_dmx0_mem_enb  ),
            .dmx0_mem_addrb     (c6_fsm_dmx0_mem_addrb),
            .dmx1_mem_ena       (c6_fsm_dmx1_mem_ena  ),
            .dmx1_mem_wea       (c6_fsm_dmx1_mem_wea  ),
            .dmx1_mem_addra     (c6_fsm_dmx1_mem_addra),
            .dmx1_mem_enb       (c6_fsm_dmx1_mem_enb  ),
            .dmx1_mem_addrb     (c6_fsm_dmx1_mem_addrb),
            .rtri_mem_ena       (c6_fsm_rtri_mem_ena  ),
            .rtri_mem_wea       (c6_fsm_rtri_mem_wea  ),
            .rtri_mem_addra     (c6_fsm_rtri_mem_addra),
            .rtri_mem_enb       (c6_fsm_rtri_mem_enb  ),
            .rtri_mem_addrb     (c6_fsm_rtri_mem_addrb));

hh_core u6_hh_core (.clk                  (clk                  ),
                    .rst                  (rst                  ),
                    .hh_cnt               (c6_hh_cnt            ),
                    .d1_rdy               (c6_d1_rdy            ),
                    .d1_vld               (c6_d1_vld            ),
                    .d2_rdy               (c6_d2_rdy            ),
                    .d2_vld               (c6_d2_vld            ),
                    .vk1_rdy              (c6_vk1_rdy           ),
                    .vk1_vld              (c6_vk1_vld           ),
                    .d3_rdy               (c6_d3_rdy            ),
                    .d3_vld               (c6_d3_vld            ),
                    .tk_rdy               (c6_tk_rdy            ),
                    .tk_vld               (c6_tk_vld            ),
                    .d4_rdy               (c6_d4_rdy            ),
                    .d4_vld               (c6_d4_vld            ),
                    .d5_rdy               (c6_d5_rdy            ),
                    .d5_vld               (c6_d5_vld            ),
                    .yjp_rdy              (c6_yjp_rdy           ),
                    .yjp_vld              (c6_yjp_vld           ),
                    .yj_sft               (c6_yj_sft            ),
                    .d4_sft               (c6_d4_sft            ),
                    .hh_st                (c6_hh_st             ),
                    .mem0_fi              (c6_mem0_fi           ),
                    .mem1_fi              (c6_mem1_fi           ),
                    .dmx0_mem_ena         (c6_dmx0_mem_ena      ),
                    .dmx0_mem_wea         (c6_dmx0_mem_wea      ),
                    .dmx0_mem_addra       (c6_dmx0_mem_addra    ),
                    .dmx0_mem_dina        (c6_dmx0_mem_dina     ),
                    .dmx0_mem_enb         (c6_dmx0_mem_enb      ),
                    .dmx0_mem_addrb       (c6_dmx0_mem_addrb    ),
                    .dmx0_mem_doutb       (c6_dmx0_mem_doutb    ),
                    .dmx1_mem_ena         (c6_dmx1_mem_ena      ),
                    .dmx1_mem_wea         (c6_dmx1_mem_wea      ),
                    .dmx1_mem_addra       (c6_dmx1_mem_addra    ),
                    .dmx1_mem_dina        (c6_dmx1_mem_dina     ),
                    .dmx1_mem_enb         (c6_dmx1_mem_enb      ),
                    .dmx1_mem_addrb       (c6_dmx1_mem_addrb    ),
                    .dmx1_mem_doutb       (c6_dmx1_mem_doutb    ),
                    .rtri_mem_ena         (c6_rtri_mem_ena      ),
                    .rtri_mem_wea         (c6_rtri_mem_wea      ),
                    .rtri_mem_addra       (c6_rtri_mem_addra    ),
                    .rtri_mem_dina        (c6_rtri_mem_dina     ),
                    .rtri_mem_enb         (c6_rtri_mem_enb      ),
                    .rtri_mem_addrb       (c6_rtri_mem_addrb    ),
                    .rtri_mem_doutb       (c6_rtri_mem_doutb    ),
                    .hh_dout              (c6_hh_dout          ));

fsm u7_fsm (.clk                (clk                  ),
            .rst                (rst                  ),
	    .tsqr_en            (c7_tsqr_en           ),
            .tile_no            (c7_tile_no           ),
            .hh_cnt             (c7_hh_cnt            ),
            .mx_cnt             (c7_mx_cnt            ),
	    .d1_rdy             (c7_d1_rdy            ),
	    .d1_vld             (c7_d1_vld            ),
	    .d2_rdy             (c7_d2_rdy            ),
	    .d2_vld             (c7_d2_vld            ),
	    .vk1_rdy            (c7_vk1_rdy           ),
	    .vk1_vld            (c7_vk1_vld           ),
	    .d3_rdy             (c7_d3_rdy            ),
	    .d3_vld             (c7_d3_vld            ),
	    .tk_rdy             (c7_tk_rdy            ),
	    .tk_vld             (c7_tk_vld            ),
	    .d4_rdy             (c7_d4_rdy            ),
	    .d4_vld             (c7_d4_vld            ),
	    .d5_rdy             (c7_d5_rdy            ),
	    .d5_vld             (c7_d5_vld            ),
	    .yjp_rdy            (c7_yjp_rdy           ),
	    .yjp_vld            (c7_yjp_vld           ),
	    .yj_sft             (c7_yj_sft            ),
	    .d4_sft             (c7_d4_sft            ),
	    .hh_st              (c7_hh_st             ),
	    .mem0_fi            (c7_mem0_fi           ),
            .mem1_fi            (c7_mem1_fi           ),
            .tsqr_fi            (c7_tsqr_fi           ),
            .dmx0_mem_ena       (c7_fsm_dmx0_mem_ena  ),
            .dmx0_mem_wea       (c7_fsm_dmx0_mem_wea  ),
            .dmx0_mem_addra     (c7_fsm_dmx0_mem_addra),
            .dmx0_mem_enb       (c7_fsm_dmx0_mem_enb  ),
            .dmx0_mem_addrb     (c7_fsm_dmx0_mem_addrb),
            .dmx1_mem_ena       (c7_fsm_dmx1_mem_ena  ),
            .dmx1_mem_wea       (c7_fsm_dmx1_mem_wea  ),
            .dmx1_mem_addra     (c7_fsm_dmx1_mem_addra),
            .dmx1_mem_enb       (c7_fsm_dmx1_mem_enb  ),
            .dmx1_mem_addrb     (c7_fsm_dmx1_mem_addrb),
            .rtri_mem_ena       (c7_fsm_rtri_mem_ena  ),
            .rtri_mem_wea       (c7_fsm_rtri_mem_wea  ),
            .rtri_mem_addra     (c7_fsm_rtri_mem_addra),
            .rtri_mem_enb       (c7_fsm_rtri_mem_enb  ),
            .rtri_mem_addrb     (c7_fsm_rtri_mem_addrb));

hh_core u7_hh_core (.clk                  (clk                  ),
                    .rst                  (rst                  ),
                    .hh_cnt               (c7_hh_cnt            ),
                    .d1_rdy               (c7_d1_rdy            ),
                    .d1_vld               (c7_d1_vld            ),
                    .d2_rdy               (c7_d2_rdy            ),
                    .d2_vld               (c7_d2_vld            ),
                    .vk1_rdy              (c7_vk1_rdy           ),
                    .vk1_vld              (c7_vk1_vld           ),
                    .d3_rdy               (c7_d3_rdy            ),
                    .d3_vld               (c7_d3_vld            ),
                    .tk_rdy               (c7_tk_rdy            ),
                    .tk_vld               (c7_tk_vld            ),
                    .d4_rdy               (c7_d4_rdy            ),
                    .d4_vld               (c7_d4_vld            ),
                    .d5_rdy               (c7_d5_rdy            ),
                    .d5_vld               (c7_d5_vld            ),
                    .yjp_rdy              (c7_yjp_rdy           ),
                    .yjp_vld              (c7_yjp_vld           ),
                    .yj_sft               (c7_yj_sft            ),
                    .d4_sft               (c7_d4_sft            ),
                    .hh_st                (c7_hh_st             ),
                    .mem0_fi              (c7_mem0_fi           ),
                    .mem1_fi              (c7_mem1_fi           ),
                    .dmx0_mem_ena         (c7_dmx0_mem_ena      ),
                    .dmx0_mem_wea         (c7_dmx0_mem_wea      ),
                    .dmx0_mem_addra       (c7_dmx0_mem_addra    ),
                    .dmx0_mem_dina        (c7_dmx0_mem_dina     ),
                    .dmx0_mem_enb         (c7_dmx0_mem_enb      ),
                    .dmx0_mem_addrb       (c7_dmx0_mem_addrb    ),
                    .dmx0_mem_doutb       (c7_dmx0_mem_doutb    ),
                    .dmx1_mem_ena         (c7_dmx1_mem_ena      ),
                    .dmx1_mem_wea         (c7_dmx1_mem_wea      ),
                    .dmx1_mem_addra       (c7_dmx1_mem_addra    ),
                    .dmx1_mem_dina        (c7_dmx1_mem_dina     ),
                    .dmx1_mem_enb         (c7_dmx1_mem_enb      ),
                    .dmx1_mem_addrb       (c7_dmx1_mem_addrb    ),
                    .dmx1_mem_doutb       (c7_dmx1_mem_doutb    ),
                    .rtri_mem_ena         (c7_rtri_mem_ena      ),
                    .rtri_mem_wea         (c7_rtri_mem_wea      ),
                    .rtri_mem_addra       (c7_rtri_mem_addra    ),
                    .rtri_mem_dina        (c7_rtri_mem_dina     ),
                    .rtri_mem_enb         (c7_rtri_mem_enb      ),
                    .rtri_mem_addrb       (c7_rtri_mem_addrb    ),
                    .rtri_mem_doutb       (c7_rtri_mem_doutb    ),
                    .hh_dout              (c7_hh_dout          ));

fsm u8_fsm (.clk                (clk                  ),
            .rst                (rst                  ),
	    .tsqr_en            (c8_tsqr_en           ),
            .tile_no            (c8_tile_no           ),
            .hh_cnt             (c8_hh_cnt            ),
            .mx_cnt             (c8_mx_cnt            ),
	    .d1_rdy             (c8_d1_rdy            ),
	    .d1_vld             (c8_d1_vld            ),
	    .d2_rdy             (c8_d2_rdy            ),
	    .d2_vld             (c8_d2_vld            ),
	    .vk1_rdy            (c8_vk1_rdy           ),
	    .vk1_vld            (c8_vk1_vld           ),
	    .d3_rdy             (c8_d3_rdy            ),
	    .d3_vld             (c8_d3_vld            ),
	    .tk_rdy             (c8_tk_rdy            ),
	    .tk_vld             (c8_tk_vld            ),
	    .d4_rdy             (c8_d4_rdy            ),
	    .d4_vld             (c8_d4_vld            ),
	    .d5_rdy             (c8_d5_rdy            ),
	    .d5_vld             (c8_d5_vld            ),
	    .yjp_rdy            (c8_yjp_rdy           ),
	    .yjp_vld            (c8_yjp_vld           ),
	    .yj_sft             (c8_yj_sft            ),
	    .d4_sft             (c8_d4_sft            ),
	    .hh_st              (c8_hh_st             ),
	    .mem0_fi            (c8_mem0_fi           ),
            .mem1_fi            (c8_mem1_fi           ),
            .tsqr_fi            (c8_tsqr_fi           ),
            .dmx0_mem_ena       (c8_fsm_dmx0_mem_ena  ),
            .dmx0_mem_wea       (c8_fsm_dmx0_mem_wea  ),
            .dmx0_mem_addra     (c8_fsm_dmx0_mem_addra),
            .dmx0_mem_enb       (c8_fsm_dmx0_mem_enb  ),
            .dmx0_mem_addrb     (c8_fsm_dmx0_mem_addrb),
            .dmx1_mem_ena       (c8_fsm_dmx1_mem_ena  ),
            .dmx1_mem_wea       (c8_fsm_dmx1_mem_wea  ),
            .dmx1_mem_addra     (c8_fsm_dmx1_mem_addra),
            .dmx1_mem_enb       (c8_fsm_dmx1_mem_enb  ),
            .dmx1_mem_addrb     (c8_fsm_dmx1_mem_addrb),
            .rtri_mem_ena       (c8_fsm_rtri_mem_ena  ),
            .rtri_mem_wea       (c8_fsm_rtri_mem_wea  ),
            .rtri_mem_addra     (c8_fsm_rtri_mem_addra),
            .rtri_mem_enb       (c8_fsm_rtri_mem_enb  ),
            .rtri_mem_addrb     (c8_fsm_rtri_mem_addrb));

hh_core u8_hh_core (.clk                  (clk                  ),
                    .rst                  (rst                  ),
                    .hh_cnt               (c8_hh_cnt            ),
                    .d1_rdy               (c8_d1_rdy            ),
                    .d1_vld               (c8_d1_vld            ),
                    .d2_rdy               (c8_d2_rdy            ),
                    .d2_vld               (c8_d2_vld            ),
                    .vk1_rdy              (c8_vk1_rdy           ),
                    .vk1_vld              (c8_vk1_vld           ),
                    .d3_rdy               (c8_d3_rdy            ),
                    .d3_vld               (c8_d3_vld            ),
                    .tk_rdy               (c8_tk_rdy            ),
                    .tk_vld               (c8_tk_vld            ),
                    .d4_rdy               (c8_d4_rdy            ),
                    .d4_vld               (c8_d4_vld            ),
                    .d5_rdy               (c8_d5_rdy            ),
                    .d5_vld               (c8_d5_vld            ),
                    .yjp_rdy              (c8_yjp_rdy           ),
                    .yjp_vld              (c8_yjp_vld           ),
                    .yj_sft               (c8_yj_sft            ),
                    .d4_sft               (c8_d4_sft            ),
                    .hh_st                (c8_hh_st             ),
                    .mem0_fi              (c8_mem0_fi           ),
                    .mem1_fi              (c8_mem1_fi           ),
                    .dmx0_mem_ena         (c8_dmx0_mem_ena      ),
                    .dmx0_mem_wea         (c8_dmx0_mem_wea      ),
                    .dmx0_mem_addra       (c8_dmx0_mem_addra    ),
                    .dmx0_mem_dina        (c8_dmx0_mem_dina     ),
                    .dmx0_mem_enb         (c8_dmx0_mem_enb      ),
                    .dmx0_mem_addrb       (c8_dmx0_mem_addrb    ),
                    .dmx0_mem_doutb       (c8_dmx0_mem_doutb    ),
                    .dmx1_mem_ena         (c8_dmx1_mem_ena      ),
                    .dmx1_mem_wea         (c8_dmx1_mem_wea      ),
                    .dmx1_mem_addra       (c8_dmx1_mem_addra    ),
                    .dmx1_mem_dina        (c8_dmx1_mem_dina     ),
                    .dmx1_mem_enb         (c8_dmx1_mem_enb      ),
                    .dmx1_mem_addrb       (c8_dmx1_mem_addrb    ),
                    .dmx1_mem_doutb       (c8_dmx1_mem_doutb    ),
                    .rtri_mem_ena         (c8_rtri_mem_ena      ),
                    .rtri_mem_wea         (c8_rtri_mem_wea      ),
                    .rtri_mem_addra       (c8_rtri_mem_addra    ),
                    .rtri_mem_dina        (c8_rtri_mem_dina     ),
                    .rtri_mem_enb         (c8_rtri_mem_enb      ),
                    .rtri_mem_addrb       (c8_rtri_mem_addrb    ),
                    .rtri_mem_doutb       (c8_rtri_mem_doutb    ),
                    .hh_dout              (c8_hh_dout          ));
`endif //EIGHT_CORE_INT
endmodule
