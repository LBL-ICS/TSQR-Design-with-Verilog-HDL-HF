//*********************************************************************************************// 
//----------------   TSQR Testbench (Scala golden model)-------------------------------------//// 
//---------------- Author: Xiaokun Yang  ----------------------------------------------------//// 
//---------------- Lawrence Berkeley Lab ----------------------------------------------------//// 
//---------------- Date: 6/13/2023  ---------------------------------------------------------//// 
//----- Version 1: TSQR MC Testbench---------------------------------------------------------//// 
//----- Date: 6/13/2023 ---------------------------------------------------------------------//// 
//-------------------------------------------------------------------------------------------//// 
//*********************************************************************************************// 
//----- This testbench support verification to the multi-core TSQR designs                     //
//----- with streaming width of 16                                                             // 
//*********************************************************************************************// 
`define DEBUG
//`define ERROR_THRESHOLD 5  //5% error tolerace
`define ERROR_THRESHOLD 20  //5% error tolerace

//--------------------------------------------------------- 
//--- test cases  
//--------------------------------------------------------- 
`ifdef ST16_RANDOM_TEST_16X8 
  `define TILE_NO 2 
  `define TILE_NO_2 
`elsif ST16_RANDOM_TEST_24X8 
  `define TILE_NO 3 
  `define TILE_NO_2 
  `define TILE_NO_3 
`elsif ST16_RANDOM_TEST_32X8 
  `define TILE_NO 4 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
`elsif ST16_RANDOM_TEST_40X8 
  `define TILE_NO 5 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
`elsif ST16_RANDOM_TEST_48X8
  `define TILE_NO 6 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6 
`elsif ST16_RANDOM_TEST_56X8
  `define TILE_NO 7
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6 
  `define TILE_NO_7 
`elsif ST16_RANDOM_TEST_64X8
  `define TILE_NO 8 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
`elsif ST16_RANDOM_TEST_72X8
  `define TILE_NO 9
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
`elsif ST16_RANDOM_TEST_80X8
  `define TILE_NO 10
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
`elsif ST16_RANDOM_TEST_88X8
  `define TILE_NO 11
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
`elsif ST16_RANDOM_TEST_96X8
  `define TILE_NO 12
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
`elsif ST16_RANDOM_TEST_104X8
  `define TILE_NO 13
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
  `define TILE_NO_13 
`elsif ST16_RANDOM_TEST_112X8
  `define TILE_NO 14
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
  `define TILE_NO_13 
  `define TILE_NO_14 
`elsif ST16_RANDOM_TEST_120X8
  `define TILE_NO 15
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
  `define TILE_NO_13 
  `define TILE_NO_14 
  `define TILE_NO_15 
`elsif ST16_RANDOM_TEST_128X8
  `define TILE_NO 16 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
  `define TILE_NO_13 
  `define TILE_NO_14 
  `define TILE_NO_15 
  `define TILE_NO_16 
`elsif ST16_RANDOM_TEST_192X8
  `define TILE_NO 24 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
  `define TILE_NO_13 
  `define TILE_NO_14 
  `define TILE_NO_15 
  `define TILE_NO_16 
  `define TILE_NO_17 
  `define TILE_NO_18 
  `define TILE_NO_19 
  `define TILE_NO_20 
  `define TILE_NO_21 
  `define TILE_NO_22 
  `define TILE_NO_23 
  `define TILE_NO_24 
`elsif ST16_RANDOM_TEST_256X8
  `define TILE_NO 32 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
  `define TILE_NO_13 
  `define TILE_NO_14 
  `define TILE_NO_15 
  `define TILE_NO_16 
  `define TILE_NO_17 
  `define TILE_NO_18 
  `define TILE_NO_19 
  `define TILE_NO_20 
  `define TILE_NO_21 
  `define TILE_NO_22 
  `define TILE_NO_23 
  `define TILE_NO_24 
  `define TILE_NO_25 
  `define TILE_NO_26  
  `define TILE_NO_27 
  `define TILE_NO_28 
  `define TILE_NO_29 
  `define TILE_NO_30 
  `define TILE_NO_31 
  `define TILE_NO_32 
`elsif ST16_RANDOM_TEST_512X8 //64 tiles
  `define TILE_NO 64 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
  `define TILE_NO_13 
  `define TILE_NO_14 
  `define TILE_NO_15 
  `define TILE_NO_16 
  `define TILE_NO_17 
  `define TILE_NO_18 
  `define TILE_NO_19 
  `define TILE_NO_20 
  `define TILE_NO_21 
  `define TILE_NO_22 
  `define TILE_NO_23 
  `define TILE_NO_24 
  `define TILE_NO_25 
  `define TILE_NO_26  
  `define TILE_NO_27 
  `define TILE_NO_28 
  `define TILE_NO_29 
  `define TILE_NO_30 
  `define TILE_NO_31 
  `define TILE_NO_32 
  `define TILE_NO_40 
  `define TILE_NO_48 
  `define TILE_NO_56 
  `define TILE_NO_64 
`elsif ST16_RANDOM_TEST_1024X8 //128 tiles
  `define TILE_NO 128 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
  `define TILE_NO_13 
  `define TILE_NO_14 
  `define TILE_NO_15 
  `define TILE_NO_16 
  `define TILE_NO_17 
  `define TILE_NO_18 
  `define TILE_NO_19 
  `define TILE_NO_20 
  `define TILE_NO_21 
  `define TILE_NO_22 
  `define TILE_NO_23 
  `define TILE_NO_24 
  `define TILE_NO_25 
  `define TILE_NO_26  
  `define TILE_NO_27 
  `define TILE_NO_28 
  `define TILE_NO_29 
  `define TILE_NO_30 
  `define TILE_NO_31 
  `define TILE_NO_32 
  `define TILE_NO_40 
  `define TILE_NO_48 
  `define TILE_NO_56 
  `define TILE_NO_64 
  `define TILE_NO_72 
  `define TILE_NO_80 
  `define TILE_NO_88 
  `define TILE_NO_96 
  `define TILE_NO_104 
  `define TILE_NO_112 
  `define TILE_NO_120 
  `define TILE_NO_128 
`elsif ST16_RANDOM_TEST_1536X8 //192 tiles
  `define TILE_NO 192 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
  `define TILE_NO_13 
  `define TILE_NO_14 
  `define TILE_NO_15 
  `define TILE_NO_16 
  `define TILE_NO_17 
  `define TILE_NO_18 
  `define TILE_NO_19 
  `define TILE_NO_20 
  `define TILE_NO_21 
  `define TILE_NO_22 
  `define TILE_NO_23 
  `define TILE_NO_24 
  `define TILE_NO_25 
  `define TILE_NO_26  
  `define TILE_NO_27 
  `define TILE_NO_28 
  `define TILE_NO_29 
  `define TILE_NO_30 
  `define TILE_NO_31 
  `define TILE_NO_32 
  `define TILE_NO_40 
  `define TILE_NO_48 
  `define TILE_NO_56 
  `define TILE_NO_64 
  `define TILE_NO_72 
  `define TILE_NO_80 
  `define TILE_NO_88 
  `define TILE_NO_96 
  `define TILE_NO_104 
  `define TILE_NO_112 
  `define TILE_NO_120 
  `define TILE_NO_128 
  `define TILE_NO_136 
  `define TILE_NO_144 
  `define TILE_NO_152 
  `define TILE_NO_160 
  `define TILE_NO_168 
  `define TILE_NO_176 
  `define TILE_NO_184 
  `define TILE_NO_192 
`elsif ST16_RANDOM_TEST_2048X8 //256 tiles
  `define TILE_NO 256 
  `define TILE_NO_2 
  `define TILE_NO_3 
  `define TILE_NO_4 
  `define TILE_NO_5 
  `define TILE_NO_6  
  `define TILE_NO_7 
  `define TILE_NO_8 
  `define TILE_NO_9 
  `define TILE_NO_10 
  `define TILE_NO_11 
  `define TILE_NO_12 
  `define TILE_NO_13 
  `define TILE_NO_14 
  `define TILE_NO_15 
  `define TILE_NO_16 
  `define TILE_NO_17 
  `define TILE_NO_18 
  `define TILE_NO_19 
  `define TILE_NO_20 
  `define TILE_NO_21 
  `define TILE_NO_22 
  `define TILE_NO_23 
  `define TILE_NO_24 
  `define TILE_NO_25 
  `define TILE_NO_26  
  `define TILE_NO_27 
  `define TILE_NO_28 
  `define TILE_NO_29 
  `define TILE_NO_30 
  `define TILE_NO_31 
  `define TILE_NO_32 
  `define TILE_NO_40 
  `define TILE_NO_48 
  `define TILE_NO_56 
  `define TILE_NO_64 
  `define TILE_NO_72 
  `define TILE_NO_80 
  `define TILE_NO_88 
  `define TILE_NO_96 
  `define TILE_NO_104 
  `define TILE_NO_112 
  `define TILE_NO_120 
  `define TILE_NO_128 
  `define TILE_NO_136 
  `define TILE_NO_144 
  `define TILE_NO_152 
  `define TILE_NO_160 
  `define TILE_NO_168 
  `define TILE_NO_176 
  `define TILE_NO_184 
  `define TILE_NO_192 
  `define TILE_NO_200 
  `define TILE_NO_208 
  `define TILE_NO_216 
  `define TILE_NO_224
  `define TILE_NO_232
  `define TILE_NO_240
  `define TILE_NO_248
  `define TILE_NO_256
`endif

//`include "../dut/multi_core/define.v"
module tsqr_mc_st16_tb();
//---------------------------------------------------------
//--- wire and reg declaration 
//---------------------------------------------------------
reg                         clk        ;
reg                         rst        ;
reg                         tsqr_en    ;
reg  [`CNT_WIDTH-1:0]       tile_no    ;

`ifdef SINGLE_CORE_INT
wire                        c1_mem0_fi ;
wire                        c1_mem1_fi ;
`endif //SINGLE_CORE_INT
`ifdef DUAL_CORE_INT
wire                        c2_mem0_fi ;
wire                        c2_mem1_fi ;
`endif //DUAL_CORE_INT
`ifdef QUAD_CORE_INT
wire                        c3_mem0_fi ;
wire                        c3_mem1_fi ;
wire                        c4_mem0_fi ;
wire                        c4_mem1_fi ;
`endif //QUAD_CORE_INT 
`ifdef EIGHT_CORE_INT
wire                        c5_mem0_fi ;
wire                        c5_mem1_fi ;
wire                        c6_mem0_fi ;
wire                        c6_mem1_fi ;
wire                        c7_mem0_fi ;
wire                        c7_mem1_fi ;
wire                        c8_mem0_fi ;
wire                        c8_mem1_fi ;
`endif //QUAD_CORE_INT 
wire                        tsqr_fi    ; 
reg  [`MEM_NO-1:0]          dma_mem_ena  ;
reg  [`RAM_WIDTH/8-1:0]     dma_mem_wea  ;
reg  [`RAM_ADDR_WIDTH-1:0]  dma_mem_addra;
reg  [`RAM_WIDTH-1:0]       dma_mem_dina ;
reg  [`MEM_NO-1:0]          dma_mem_enb  ;
reg  [`RAM_ADDR_WIDTH-1:0]  dma_mem_addrb;
wire [`RAM_WIDTH-1:0]       dma_mem_doutb;

//---------------------------------------------------------
//--- golden model and input file 
//---------------------------------------------------------
reg [`MATRIX_WIDTH*32-1:0]  tri_ram[0:`MATRIX_WIDTH-1]   ; //For the matlab tsqr function, only the upper triangle (8*8) is stored. 
reg [`TILE_NO*`MATRIX_WIDTH*32-1:0] dmx_ram[0:`MATRIX_WIDTH-1] ;

initial begin
$display("=== The maxix factoriation Starts! (%d ns) ====", $time);
`ifdef SINGLE_CORE
  `ifdef ST16_RANDOM_TEST_16X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_16X8 (%d ns) in Single-core Design",$time);
     $readmemh("../golden/single_core/sc_st16_random_test_16x8_mat/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/single_core/sc_st16_random_test_16x8_mat/tri_ieee754.txt" , tri_ram);
     //$readmemh("../golden/single_core/sc_st16_random_test_16x8/dmx_ieee754.txt" , dmx_ram);
     //$readmemh("../golden/single_core/sc_st16_random_test_16x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_24X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_24X8 (%d ns) in Single-core Design",$time);
     $readmemh("../golden/single_core/sc_st16_random_test_24x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/single_core/sc_st16_random_test_24x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_32X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_32X8 (%d ns) in Single-core Design",$time);
     $readmemh("../golden/single_core/sc_st16_random_test_32x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/single_core/sc_st16_random_test_32x8/tri_ieee754.txt" , tri_ram);
  `endif
`elsif DUAL_CORE
  `ifdef ST16_RANDOM_TEST_32X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_32X8 (%d ns) in Dual-core Design",$time);
     $readmemh("../golden/dual_core/dc_st16_random_test_32x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/dual_core/dc_st16_random_test_32x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_48X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_48X8 (%d ns) in Dual-core Design",$time);
     $readmemh("../golden/dual_core/dc_st16_random_test_48x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/dual_core/dc_st16_random_test_48x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_64X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_64X8 (%d ns) in Dual-core Design",$time);
     $readmemh("../golden/dual_core/dc_st16_random_test_64x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/dual_core/dc_st16_random_test_64x8/tri_ieee754.txt" , tri_ram);
  `endif
`elsif QUAD_CORE
  `ifdef ST16_RANDOM_TEST_64X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_64X8 (%d ns) in Quad-core Design",$time);
     $readmemh("../golden/quad_core/qc_st16_random_test_64x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/quad_core/qc_st16_random_test_64x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_96X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_96X8 (%d ns) in Quad-core Design",$time);
     $readmemh("../golden/quad_core/qc_st16_random_test_96x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/quad_core/qc_st16_random_test_96x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_128X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_128X8 (%d ns) in Quad-core Design",$time);
     $readmemh("../golden/quad_core/qc_st16_random_test_128x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/quad_core/qc_st16_random_test_128x8/tri_ieee754.txt" , tri_ram);
  `endif
`elsif EIGHT_CORE
  `ifdef ST16_RANDOM_TEST_128X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_128X8 (%d ns) in EIGHT-core Design",$time);
     $readmemh("../golden/eight_core/ec_st16_random_test_128x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/eight_core/ec_st16_random_test_128x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_192X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_192X8 (%d ns) in EIGHT-core Design",$time);
     $readmemh("../golden/eight_core/ec_st16_random_test_192x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/eight_core/ec_st16_random_test_192x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_256X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_256X8 (%d ns) in EIGHT-core Design",$time);
     $readmemh("../golden/eight_core/ec_st16_random_test_256x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/eight_core/ec_st16_random_test_256x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_512X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_512X8 (%d ns) in EIGHT-core Design",$time);
     $readmemh("../golden/eight_core/ec_st16_random_test_512x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/eight_core/ec_st16_random_test_512x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_1024X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_1024X8 (%d ns) in EIGHT-core Design",$time);
     $readmemh("../golden/eight_core/ec_st16_random_test_1024x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/eight_core/ec_st16_random_test_1024x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_1536X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_1536X8 (%d ns) in EIGHT-core Design",$time);
     $readmemh("../golden/eight_core/ec_st16_random_test_1536x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/eight_core/ec_st16_random_test_1536x8/tri_ieee754.txt" , tri_ram);
  `elsif ST16_RANDOM_TEST_2048X8
     $display("Initilize The Memory in ST16_RANDOM_TEST_2048X8 (%d ns) in EIGHT-core Design",$time);
     $readmemh("../golden/eight_core/ec_st16_random_test_2048x8/dmx_ieee754.txt" , dmx_ram);
     $readmemh("../golden/eight_core/ec_st16_random_test_2048x8/tri_ieee754.txt" , tri_ram);
  `endif
`endif
end

//---------------------------------------------------------
//--- Initialize and Load Memory -------------------------- 
//--- Single-core Test Cases ------------------------------ 
//---------------------------------------------------------
`include "load_mem.sv"

//---------------------------------------------------------
//--- Instantiation 
//---------------------------------------------------------
tsqr_mc u_tsqr_mc (.clk          (clk          ),
                   .rst          (rst          ),
	           .tsqr_en      (tsqr_en      ),
	           .tile_no      (tile_no      ),
                   .dma_mem_ena  (dma_mem_ena  ),
                   .dma_mem_wea  (dma_mem_wea  ),
                   .dma_mem_addra(dma_mem_addra),
                   .dma_mem_dina (dma_mem_dina ),
                   .dma_mem_enb  (dma_mem_enb  ),
                   .dma_mem_addrb(dma_mem_addrb),
                   .dma_mem_doutb(dma_mem_doutb),
`ifdef SINGLE_CORE_INT
	           .c1_mem0_fi   (c1_mem0_fi   ),
                   .c1_mem1_fi   (c1_mem1_fi   ),
`endif //SINGLE_CORE_INT
`ifdef DUAL_CORE_INT
	           .c2_mem0_fi   (c2_mem0_fi   ),
                   .c2_mem1_fi   (c2_mem1_fi   ),
`endif //DUAL_CORE_INT
`ifdef QUAD_CORE_INT
	           .c3_mem0_fi   (c3_mem0_fi   ),
                   .c3_mem1_fi   (c3_mem1_fi   ),
	           .c4_mem0_fi   (c4_mem0_fi   ),
                   .c4_mem1_fi   (c4_mem1_fi   ),
`endif //QUAD_CORE_INT
`ifdef EIGHT_CORE_INT
	           .c5_mem0_fi   (c5_mem0_fi   ),
                   .c5_mem1_fi   (c5_mem1_fi   ),
	           .c6_mem0_fi   (c6_mem0_fi   ),
                   .c6_mem1_fi   (c6_mem1_fi   ),
	           .c7_mem0_fi   (c7_mem0_fi   ),
                   .c7_mem1_fi   (c7_mem1_fi   ),
	           .c8_mem0_fi   (c8_mem0_fi   ),
                   .c8_mem1_fi   (c8_mem1_fi   ),
`endif //EIGHT_CORE_INT
                   .tsqr_fi      (tsqr_fi      ));

//---------------------------------------------------------------------
//------- BFM
//---------------------------------------------------------------------
always #5 clk = ~clk;
initial begin
   rst     = 1'b1;
   clk     = 1'b0;
   tsqr_en = 1'b0;
   tile_no = `TILE_NO;
   dma_mem_ena   = `MEM_NO'h0        ;
`ifdef ST_WIDTH_256
   dma_mem_wea   = `WEA128           ;
`elsif ST_WIDTH_128
   dma_mem_wea   = `WEA64            ;
`elsif ST_WIDTH_64
   dma_mem_wea   = `WEA32            ;
`elsif ST_WIDTH_32
   dma_mem_wea   = `WEA16            ;
`elsif ST_WIDTH_16
   dma_mem_wea   = `WEA8             ;
`endif
   dma_mem_addra = `RAM_ADDR_WIDTH'h0 ;
   dma_mem_dina  = `RAM_WIDTH'h0      ;
   dma_mem_enb   = 1'b0               ;
   dma_mem_addrb = `RAM_ADDR_WIDTH'h0 ;
   #100;
   rst     = 1'b0;
   #16; 
   tsqr_en = 1'b1;
   wait(tsqr_fi);
   @(posedge clk); 
   tsqr_en = 1'b0;
end


//---------------------------------------------------------------------
//------- Monitor -----------------------------------------------------
//---------------------------------------------------------------------
integer col_index;

`include "tb_func.sv"

reg [`MATRIX_WIDTH*32-1:0] golden_column;
reg [`MATRIX_WIDTH*32-1:0] dut_column;
real error_percent;

`include "error_percent_declare.sv"

reg wr_fi;
always @(posedge clk) begin
  if(rst) begin
    wr_fi<=1'b0;
  end else begin
    wr_fi<=tsqr_fi;
  end
end

integer ref_report;
integer trl_report; 
integer tri_report; 
integer tri_report_ieee754; 

`ifdef DEBUG
  initial begin
   ref_report=$fopen("../golden/single_core/sc_st16_random_test_16x8_mat/ref_report.log", "w");
   trl_report=$fopen("../golden/single_core/sc_st16_random_test_16x8_mat/trl_report.log", "w");
  end
  `include "d1_d5_comp.sv"
`endif 

// -------------------------------------------
// --Monitor: Simulation Log -----------------
// -------------------------------------------
initial begin
  col_index    = 0;
  wait(~rst);
  forever begin
    @(negedge clk);

    if(wr_fi) begin 
      $display("=== The %d maxix factoriation is completed! (%d ns) ====", u_tsqr_mc.c1_mx_cnt, $time);

      // ********************************
      // ---------- open report ---------
      // ********************************
`ifdef ST16_RANDOM_TEST_16X8
  `ifdef SINGLE_CORE
      tri_report=$fopen("../golden/single_core/sc_st16_random_test_16x8_mat/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/single_core/sc_st16_random_test_16x8_mat/tri_report_ieee754.log", "w");
      //tri_report=$fopen("../golden/single_core/sc_st16_random_test_16x8/tri_report.log", "w");
      //tri_report_ieee754=$fopen("../golden/single_core/sc_st16_random_test_16x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Single-core Simulation\n"                    );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_16X8\n"        );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_24X8
  `ifdef SINGLE_CORE
      tri_report=$fopen("../golden/single_core/sc_st16_random_test_24x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/single_core/sc_st16_random_test_24x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Single-core Simulation\n"                    );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_24X8\n"        );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_32X8
  `ifdef SINGLE_CORE
      tri_report=$fopen("../golden/single_core/sc_st16_random_test_32x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/single_core/sc_st16_random_test_32x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Single-core Simulation\n"                    );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_32X8\n"        );
      $fwrite(tri_report, "==========================================\n");
  `elsif DUAL_CORE
      tri_report=$fopen("../golden/dual_core/dc_st16_random_test_32x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/dual_core/dc_st16_random_test_32x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Dual-core Simulation\n"                      ); 
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_32X8\n"        );
      $fwrite(tri_report, "==========================================\n");
  `endif 
`elsif ST16_RANDOM_TEST_48X8
  `ifdef DUAL_CORE
      tri_report=$fopen("../golden/dual_core/dc_st16_random_test_48x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/dual_core/dc_st16_random_test_48x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Dual-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_48X8\n"        );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_64X8
  `ifdef DUAL_CORE
      tri_report=$fopen("../golden/dual_core/dc_st16_random_test_64x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/dual_core/dc_st16_random_test_64x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Dual-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_64X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `elsif QUAD_CORE
      tri_report=$fopen("../golden/quad_core/qc_st16_random_test_64x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/quad_core/qc_st16_random_test_64x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_64X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_96X8
  `ifdef QUAD_CORE
      tri_report=$fopen("../golden/quad_core/qc_st16_random_test_96x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/quad_core/qc_st16_random_test_96x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_96X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_128X8
  `ifdef QUAD_CORE
      tri_report=$fopen("../golden/quad_core/qc_st16_random_test_128x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/quad_core/qc_st16_random_test_128x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_128X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `elsif EIGHT_CORE
      tri_report=$fopen("../golden/eight_core/ec_st16_random_test_128x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/eight_core/ec_st16_random_test_128x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_128X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_192X8
  `ifdef EIGHT_CORE
      tri_report=$fopen("../golden/eight_core/ec_st16_random_test_192x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/eight_core/ec_st16_random_test_192x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_192X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_256X8
  `ifdef EIGHT_CORE
      tri_report=$fopen("../golden/eight_core/ec_st16_random_test_256x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/eight_core/ec_st16_random_test_256x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_256X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_512X8
  `ifdef EIGHT_CORE
      tri_report=$fopen("../golden/eight_core/ec_st16_random_test_512x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/eight_core/ec_st16_random_test_512x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_512X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_1024X8
  `ifdef EIGHT_CORE
      tri_report=$fopen("../golden/eight_core/ec_st16_random_test_1024x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/eight_core/ec_st16_random_test_1024x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_1024X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_1536X8
  `ifdef EIGHT_CORE
      tri_report=$fopen("../golden/eight_core/ec_st16_random_test_1536x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/eight_core/ec_st16_random_test_1536x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_1536X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST16_RANDOM_TEST_2048X8
  `ifdef EIGHT_CORE
      tri_report=$fopen("../golden/eight_core/ec_st16_random_test_2048x8/tri_report.log", "w");
      tri_report_ieee754=$fopen("../golden/eight_core/ec_st16_random_test_2048x8/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST16_RANDOM_TEST_2048X8\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`endif

      // ********************************
      // ---------- write report --------
      // ********************************
      for(col_index=0; col_index<`MATRIX_WIDTH;) begin
        golden_column=tri_ram[col_index];
        dut_column   =u_tsqr_mc.u1_hh_core.u_rtri.ram[col_index];
        `include "error_percent_abs_cal_tri.sv"
        `include "comp_abs_tri.sv"
        `include "comp_tri_ieee754.sv"
        col_index=col_index+1;
      end

      // ********************************
      // ---------- close report --------
      // ********************************
      $fclose(tri_report);
      $fclose(tri_report_ieee754);
      $display("=== The maxix factoriation result is compared! Please check the report! ===");
      #1000;
      $stop; 
    end // if(write_fi)
  end //for loop
end //initial begin-end

endmodule
