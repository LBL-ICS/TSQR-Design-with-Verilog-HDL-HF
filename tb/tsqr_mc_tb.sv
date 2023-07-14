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
//*********************************************************************************************//

//---------------------------------------------------------
//--- monitor on/off
//---------------------------------------------------------
`ifdef ST256_RANDOM_TEST_256X128
  `define TILE_NO 2
`elsif ST256_RANDOM_TEST_384X128
  `define TILE_NO 3 
`elsif ST256_RANDOM_TEST_512X128
  `define TILE_NO 4
`elsif ST256_RANDOM_TEST_640X128
  `define TILE_NO 5
`elsif ST256_RANDOM_TEST_768X128
  `define TILE_NO 6 
`elsif ST256_RANDOM_TEST_896X128
  `define TILE_NO 7
`elsif ST256_RANDOM_TEST_1024X128
  `define TILE_NO 8 
`elsif ST256_RANDOM_TEST_1152X128
  `define TILE_NO 9
`elsif ST256_RANDOM_TEST_1280X128
  `define TILE_NO 10
`elsif ST256_RANDOM_TEST_1408X128
  `define TILE_NO 11
`elsif ST256_RANDOM_TEST_1536X128
  `define TILE_NO 12
`elsif ST256_RANDOM_TEST_1664X128
  `define TILE_NO 13
`elsif ST256_RANDOM_TEST_1792X128
  `define TILE_NO 14
`elsif ST256_RANDOM_TEST_1920X128
  `define TILE_NO 15
`elsif ST256_RANDOM_TEST_2048X128
  `define TILE_NO 16 
`endif

`define ERROR_THRESHOLD 10  //10% error tolerace

//`include "../dut/multi_core/define.v"
module tsqr_mc_tb();
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
reg [`MATRIX_WIDTH*32-1:0]  tri_ram[0:`MATRIX_WIDTH-1]   ; //For the matlab tsqr function, only the upper triangle (128*128) is stored. 

`ifdef ST256_RANDOM_TEST_256X128
reg [256*32-1:0] dmx_ram[0:`MATRIX_WIDTH-1] ;
`elsif ST256_RANDOM_TEST_512X128
reg [512*32-1:0] dmx_ram[0:`MATRIX_WIDTH-1] ;
`elsif ST256_RANDOM_TEST_768X128
reg [768*32-1:0] dmx_ram[0:`MATRIX_WIDTH-1] ;
`elsif ST256_RANDOM_TEST_1024X128
reg [1024*32-1:0] dmx_ram[0:`MATRIX_WIDTH-1] ;
`elsif ST256_RANDOM_TEST_1536X128
reg [1536*32-1:0] dmx_ram[0:`MATRIX_WIDTH-1] ;
`elsif ST256_RANDOM_TEST_2048X128
reg [2048*32-1:0] dmx_ram[0:`MATRIX_WIDTH-1] ;
`endif

initial begin
`ifdef SINGLE_CORE
  `ifdef ST256_RANDOM_TEST_256X128
     $readmemh("../golden/single_core/sc_st256_random_test_256x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_512X128
     $readmemh("../golden/single_core/sc_st256_random_test_512x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_768X128
     $readmemh("../golden/single_core/sc_st256_random_test_768x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_1024X128
     $readmemh("../golden/single_core/sc_st256_random_test_1024x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_1536X128
     $readmemh("../golden/single_core/sc_st256_random_test_1536x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_2048X128
     $readmemh("../golden/single_core/sc_st256_random_test_2048x128/tri_ieee754.txt" , tri_ram);
  `endif
`elsif DUAL_CORE
  `ifdef ST256_RANDOM_TEST_512X128
     $readmemh("../golden/dual_core/dc_st256_random_test_512x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_768X128
     $readmemh("../golden/dual_core/dc_st256_random_test_768x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_1024X128
     $readmemh("../golden/dual_core/dc_st256_random_test_1024x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_1536X128
     $readmemh("../golden/dual_core/dc_st256_random_test_1536x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_2048X128
     $readmemh("../golden/dual_core/dc_st256_random_test_2048x128/tri_ieee754.txt" , tri_ram);
  `endif
`elsif QUAD_CORE
  `ifdef ST256_RANDOM_TEST_1024X128
     $readmemh("../golden/quad_core/qc_st256_random_test_1024x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_1536X128
     $readmemh("../golden/quad_core/qc_st256_random_test_1536x128/tri_ieee754.txt" , tri_ram);
  `elsif ST256_RANDOM_TEST_2048X128
     $readmemh("../golden/quad_core/qc_st256_random_test_2048x128/tri_ieee754.txt" , tri_ram);
  `endif
`endif
end

//---------------------------------------------------------
//--- Initialize and Load Memory -------------------------- 
//--- Single-core Test Cases ------------------------------ 
//---------------------------------------------------------
integer i;
`ifdef SINGLE_CORE
initial begin
`ifdef ST256_RANDOM_TEST_256X128 //256/256=1
    $readmemh("../golden/single_core/sc_st256_random_test_256x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory in ST256_RANDOM_TEST_256X128 (%d ns) in Single-core Design =============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_256X128 (%d ns) in Single-core Design=========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_512X128 //512/256=2
    $readmemh("../golden/single_core/sc_st256_random_test_512x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory in ST256_RANDOM_TEST_512X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory in ST256_RANDOM_TEST_512X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
  $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_512X128 (%d ns) in Single-core Design =========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_768X128 //768/256=3
    $readmemh("../golden/single_core/sc_st256_random_test_768x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory (matrics: A0-A2) in ST256_RANDOM_TEST_768X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (matrix: A3) in ST256_RANDOM_TEST_768X128 (%d ns) in Single-core Design==============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (matrix: A4) in ST256_RANDOM_TEST_768X128 (%d ns) in Single-core Design==============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (matrix: A5) in ST256_RANDOM_TEST_768X128 (%d ns) in Single-core Design==============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_768X128 (%d ns) in Single-core Design==========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_1024X128  //1024/256=4
    $readmemh("../golden/single_core/sc_st256_random_test_1024x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory (first-third matrics: A0-A2) in ST256_RANDOM_TEST_1024X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*8*32-1:128*7*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*7*32-1:128*6*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (fourth matrix: A3) in ST256_RANDOM_TEST_1024X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (fifth matrix: A4) in ST256_RANDOM_TEST_1024X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (sixth matrix: A5) in ST256_RANDOM_TEST_1024X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (seventh matrix: A6) in ST256_RANDOM_TEST_1024X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (eighth matrix: A7) in ST256_RANDOM_TEST_1024X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_1024X128 (%d ns) in Single-core Design=========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_1536X128  //1536/256=6
    $readmemh("../golden/single_core/sc_st256_random_test_1536x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory (first-third matrics: A0-A2) in ST256_RANDOM_TEST_1536X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*12*32-1:128*11*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*11*32-1:128*10*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*10*32-1:128*9*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (fourth matrix: A3) in ST256_RANDOM_TEST_1536X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*9*32-1:128*8*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (fifth matrix: A4) in ST256_RANDOM_TEST_1536X128=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*8*32-1:128*7*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (sixth matrix: A5) in ST256_RANDOM_TEST_1536X128=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*7*32-1:128*6*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (seventh matrix: A6) in ST256_RANDOM_TEST_1536X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (eighth matrix: A7) in ST256_RANDOM_TEST_1536X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (ninth matrix: A8) in ST256_RANDOM_TEST_1536X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (tenth matrix: A9) in ST256_RANDOM_TEST_1536X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (11th matrix: A10) in ST256_RANDOM_TEST_1536X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (12th matrix: A11) in ST256_RANDOM_TEST_1536X128 (%d ns) in Single-core Design=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_1536X128 (%d ns) in Single-core Design=========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_2048X128  //2048/256=8
    $readmemh("../golden/single_core/sc_st256_random_test_2048x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory (first-third matrics: A0-A2) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*16*32-1:128*15*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*15*32-1:128*14*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*14*32-1:128*13*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (fourth matrix: A3) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*13*32-1:128*12*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (fifth matrix: A4) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*12*32-1:128*11*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (sixth matrix: A5) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*11*32-1:128*10*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (seventh matrix: A6) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*10*32-1:128*9*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (eighth matrix: A7) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*9*32-1:128*8*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (ninth matrix: A8) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*8*32-1:128*7*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (tenth matrix: A9) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*7*32-1:128*6*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (11th matrix: A10) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (12th matrix: A11) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (13th matrix: A12) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (14th matrix: A13) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      i=i+1;
    end
    wait(c1_mem0_fi);
    $display("========== Load The Memory (15th matrix: A14) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      i=i+1;
    end
    wait(c1_mem1_fi);
    $display("========== Load The Memory (16th matrix: A15) in ST256_RANDOM_TEST_2048X128 (%d ns) in Single-core Design=============", $time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_2048X128, (%d ns) in Single-core Design=========", $time);
`endif //RANDOM_TEST
end
`endif //SINGLE_CORE

//---------------------------------------------------------
//--- Initialize and Load Memory -------------------------- 
//--- Dual-core Test Cases -------------------------------- 
//---------------------------------------------------------
`ifdef DUAL_CORE
initial begin
`ifdef ST256_RANDOM_TEST_512X128 //512/256=2
    $readmemh("../golden/dual_core/dc_st256_random_test_512x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory in ST256_RANDOM_TEST_512X128 in Dual-Core Design (%d ns) ============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_512X128 in Dual-Core Design (%d ns)=========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_768X128 //768/256=3
    $readmemh("../golden/dual_core/dc_st256_random_test_768x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory in ST256_RANDOM_TEST_768X128 in Dual-Core Design (%d ns)============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_768X128 in Dual-Core Design (%d ns)=========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_1024X128  //1024/256=4
    $readmemh("../golden/dual_core/dc_st256_random_test_1024x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory in ST256_RANDOM_TEST_1024X128 in Dual-Core Design (%d ns)============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*8*32-1:128*7*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*7*32-1:128*6*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      i=i+1;
    end
    wait(c1_mem1_fi & c2_mem1_fi);
    $display("========== Load The Memory (matrics: A3 and A6) in ST256_RANDOM_TEST_1024X128 (%d ns)=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_1024X128 in Dual-Core Design (%d ns)=========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_1536X128  //1536/256=6
    $readmemh("../golden/dual_core/dc_st256_random_test_1536x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory in ST256_RANDOM_TEST_1536X128 in Dual-Core Design (%d ns)============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*12*32-1:128*11*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*11*32-1:128*10*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*10*32-1:128*9*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      i=i+1;
    end
    wait(c1_mem1_fi & c2_mem1_fi);
    $display("========== Load The Memory (matrics: A3 and A9) in ST256_RANDOM_TEST_1536X128 (%d ns)=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*9*32-1:128*8*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      i=i+1;
    end
    wait(c1_mem0_fi & c2_mem0_fi);
    $display("========== Load The Memory (matrics: A4 and A10) in ST256_RANDOM_TEST_1536X128 (%d ns)=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*8*32-1:128*7*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      i=i+1;
    end
    wait(c1_mem1_fi & c2_mem1_fi);
    $display("========== Load The Memory (matrics: A5 and A11) in ST256_RANDOM_TEST_1536X128 (%d ns)=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*7*32-1:128*6*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_1024X128 in Dual-Core Design (%d ns)=========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_2048X128  //2048/256=8
    $readmemh("../golden/dual_core/dc_st256_random_test_2048x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory in ST256_RANDOM_TEST_2048X128 in Dual-Core Design (%d ns)============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*16*32-1:128*15*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*15*32-1:128*14*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*14*32-1:128*13*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][128*8*32-1:128*7*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*7*32-1:128*6*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      i=i+1;
    end
    wait(c1_mem1_fi & c2_mem1_fi);
    $display("========== Load The Memory (matrix: A3 and A11) in ST256_RANDOM_TEST_2048X128 (%d ns)=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*13*32-1:128*12*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      i=i+1;
    end
    wait(c1_mem0_fi & c2_mem0_fi);
    $display("========== Load The Memory (matrix: A4 and A12) in ST256_RANDOM_TEST_2048X128 (%d ns)=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*12*32-1:128*11*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      i=i+1;
    end
    wait(c1_mem1_fi & c2_mem1_fi);
    $display("========== Load The Memory (matrix: A5 and A13) in ST256_RANDOM_TEST_2048X128 (%d ns)=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*11*32-1:128*10*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      i=i+1;
    end
    wait(c1_mem0_fi & c2_mem0_fi);
    $display("========== Load The Memory (matrix: A6 and A14) in ST256_RANDOM_TEST_2048X128 (%d ns)=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*10*32-1:128*9*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      i=i+1;
    end
    wait(c1_mem1_fi & c2_mem1_fi);
    $display("========== Load The Memory (matrix: A7 and A15) in ST256_RANDOM_TEST_2048X128 (%d ns)=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*9*32-1:128*8*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_2048X128 in Dual-Core Design (%d ns)=========",$time);
`endif //RANDOM_TEST
end
`endif //DUAL_CORE

//---------------------------------------------------------
//--- Initialize and Load Memory -------------------------- 
//--- Quad-core Test Cases -------------------------------- 
//---------------------------------------------------------
`ifdef QUAD_CORE
initial begin
`ifdef ST256_RANDOM_TEST_1024X128  //1024/256=4
    $readmemh("../golden/quad_core/qc_st256_random_test_1024x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory in ST256_RANDOM_TEST_1024X128 in Quad-Core Design (%d ns)============",$time); for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*8*32-1:128*7*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*7*32-1:128*6*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      u_tsqr_mc.u3_hh_core.u_rtri.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      u_tsqr_mc.u4_hh_core.u_rtri.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_1024X128 in Quad-Core Design (%d ns)=========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_1536X128  //1536/256=12
    $readmemh("../golden/quad_core/qc_st256_random_test_1536x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory in ST256_RANDOM_TEST_1536X128 in Quad-Core Design (%d ns)============",$time); 
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*12*32-1:128*11*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*11*32-1:128*10*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*10*32-1:128*9*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][128*9*32-1:128*8*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*8*32-1:128*7*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*7*32-1:128*6*32];
      u_tsqr_mc.u3_hh_core.u_rtri.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      u_tsqr_mc.u4_hh_core.u_rtri.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_1536X128 in Quad-Core Design (%d ns)=========",$time);
//---------------------------------------------------------
`elsif ST256_RANDOM_TEST_2048X128  //2048/256=8
    $readmemh("../golden/quad_core/qc_st256_random_test_2048x128/dmx_ieee754.txt" ,dmx_ram);
    $display("========== Initilize The Memory in ST256_RANDOM_TEST_2048X128 in Quad-Core Design (%d ns)============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][128*16*32-1:128*15*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*15*32-1:128*14*32];
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*14*32-1:128*13*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][128*12*32-1:128*11*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*11*32-1:128*10*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*10*32-1:128*9*32];
      u_tsqr_mc.u3_hh_core.u_rtri.ram[i]=dmx_ram[i][128*8*32-1:128*7*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*7*32-1:128*6*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*6*32-1:128*5*32];
      u_tsqr_mc.u4_hh_core.u_rtri.ram[i]=dmx_ram[i][128*4*32-1:128*3*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*3*32-1:128*2*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][128*2*32-1:128*1*32];
      i=i+1;
    end
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi);
    $display("========== Load The Memory (matrix: A3, A7, A11, and A15) in ST256_RANDOM_TEST_2048X128 (%d ns)=============",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*13*32-1:128*12*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*9*32-1:128*8*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*5*32-1:128*4*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][128*1*32-1:128*0*32];
      i=i+1;
    end
    $display("======== Memory Initilization Finish in ST256_RANDOM_TEST_2048X128 in Quad-Core Design (%d ns)=========",$time);
`endif //RANDOM_TEST
end
`endif //QUAD_CORE

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
   dma_mem_ena   = `MEM_NO'h0         ;
   dma_mem_wea   = `WEA128            ;
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
integer tri_report; 
integer tri_report_ieee754; 
integer mx_report; 

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
`ifdef ST256_RANDOM_TEST_256X128
      tri_report=$fopen("sc_st256_random_test_256x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("sc_st256_random_test_256x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Single-core Simulation\n"                    );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_256X128\n"        );
      $fwrite(tri_report, "==========================================\n");
`elsif ST256_RANDOM_TEST_512X128
  `ifdef SINGLE_CORE
      tri_report=$fopen("sc_st256_random_test_512x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("sc_st256_random_test_512x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Single-core Simulation\n"                    );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_512X128\n"        );
      $fwrite(tri_report, "==========================================\n");
  `elsif DUAL_CORE
      tri_report=$fopen("dc_st256_random_test_512x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("dc_st256_random_test_512x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Dual-core Simulation\n"                      ); 
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_512X128\n"        );
      $fwrite(tri_report, "==========================================\n");
  `endif 
`elsif ST256_RANDOM_TEST_768X128
  `ifdef SINGLE_CORE
      tri_report=$fopen("sc_st256_random_test_768x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("sc_st256_random_test_768x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Single-core Simulation\n"                    );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_768X128\n"        );
      $fwrite(tri_report, "==========================================\n");
  `elsif DUAL_CORE
      tri_report=$fopen("dc_st256_random_test_768x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("dc_st256_random_test_768x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Dual-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_768X128\n"        );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST256_RANDOM_TEST_1024X128
  `ifdef SINGLE_CORE
      tri_report=$fopen("sc_st256_random_test_1024x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("sc_st256_random_test_1024x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Single-core Simulation\n"                    );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_1024X128\n"       );
      $fwrite(tri_report, "==========================================\n");
  `elsif DUAL_CORE
      tri_report=$fopen("dc_st256_random_test_1024x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("dc_st256_random_test_1024x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Dual-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_1024X128\n"       );
      $fwrite(tri_report, "==========================================\n");
  `elsif QUAD_CORE
      tri_report=$fopen("qc_st256_random_test_1024x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("qc_st256_random_test_1024x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_1024X128\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST256_RANDOM_TEST_1536X128
  `ifdef SINGLE_CORE
      tri_report=$fopen("sc_st256_random_test_1536x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("sc_st256_random_test_1536x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Single-core Simulation\n"                    );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_1536X128\n"       );
      $fwrite(tri_report, "==========================================\n");
  `elsif DUAL_CORE
      tri_report=$fopen("dc_st256_random_test_1536x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("dc_st256_random_test_1536x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Dual-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_1536X128\n"       );
      $fwrite(tri_report, "==========================================\n");
  `elsif QUAD_CORE
      tri_report=$fopen("qc_st256_random_test_1536x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("qc_st256_random_test_1536x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_1536X128\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`elsif ST256_RANDOM_TEST_2048X128
  `ifdef SINGLE_CORE
      tri_report=$fopen("sc_st256_random_test_2048x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("sc_st256_random_test_2048x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Single-core Simulation\n"                    );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_2048X128\n"       );
      $fwrite(tri_report, "==========================================\n");
  `elsif DUAL_CORE
      tri_report=$fopen("dc_st256_random_test_2048x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("dc_st256_random_test_2048x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Dual-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_2048X128\n"       );
      $fwrite(tri_report, "==========================================\n");
  `elsif QUAD_CORE
      tri_report=$fopen("qc_st256_random_test_2048x128/tri_report.log", "w");
      tri_report_ieee754=$fopen("qc_st256_random_test_2048x128/tri_report_ieee754.log", "w");
      $fwrite(tri_report, "==========================================\n");
      $fwrite(tri_report, "Quad-core Simulation\n"                      );
      $fwrite(tri_report, "Test case: ST256_RANDOM_TEST_2048X128\n"       );
      $fwrite(tri_report, "==========================================\n");
  `endif
`endif

      // ********************************
      // ---------- write report --------
      // ********************************
      for(col_index=0; col_index<`MATRIX_WIDTH;) begin
        golden_column=tri_ram[col_index];
        dut_column   =u_tsqr_mc.u1_hh_core.u_rtri.ram[col_index];
        `include "error_percent_cal_tri.sv"
        `include "comp_tri.sv"
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
