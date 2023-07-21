//*********************************************************************************************//
//---------------- Parameterized Design on TSQR----------------------------------------------////
//---------------- Author: Xiaokun Yang  ----------------------------------------------------////
//---------------- Lawrence Berkeley Lab ----------------------------------------------------////
//---------------- Date: 6/14/2023 ----------------------------------------------------------//// 
//----- Step 1: Select the TSQR core number (signle-, dual-, quad-, eight-cores)-------------////
//----- Step 2: Select the streaing width of the householder (16, 32, 64, 128, 256) ---------////
//----- Step 3: Select the simulation or FPGA implemenation ---------------------------------////
//----- Step 4: Select the MOF of FP operators (100MHz or 400 MHz for FPGA evaluation) ------////
//*********************************************************************************************//

// **************************************************
// -------------------------------------------------- 
// -----Parameterizable Multi-core Desgin ----------- 
// -----1. Please select the number of cores
// -------------------------------------------------- 
//`define SINGLE_CORE
//`define DUAL_CORE
//`define QUAD_CORE
//`define EIGHT_CORE

// -------------------------------------------------- 
// -----End Configuration
// -------------------------------------------------- 
// **************************************************

`ifdef SINGLE_CORE
  `define SINGLE_CORE_INT
`elsif DUAL_CORE
  `define SINGLE_CORE_INT
  `define DUAL_CORE_INT
`elsif QUAD_CORE
  `define SINGLE_CORE_INT
  `define DUAL_CORE_INT
  `define QUAD_CORE_INT
`elsif EIGHT_CORE
  `define SINGLE_CORE_INT
  `define DUAL_CORE_INT
  `define QUAD_CORE_INT
  `define EIGHT_CORE_INT
`endif

`ifdef SINGLE_CORE
  `define MEM_NO 3
`elsif DUAL_CORE
  `define MEM_NO 6 
`elsif QUAD_CORE
  `define MEM_NO 12
`elsif EIGHT_CORE
  `define MEM_NO 24
`endif

// **************************************************
// -------------------------------------------------- 
// -----Parameterizable Streaming Width of HH-------- 
// -----2. Please select the Streaming Width of HH
// -------------------------------------------------- 
//`define ST_WIDTH_16
//`define ST_WIDTH_32
//`define ST_WIDTH_64
//`define ST_WIDTH_128
//`define ST_WIDTH_256
// -------------------------------------------------- 
// -----End Configuration
// -------------------------------------------------- 
// **************************************************

`ifdef ST_WIDTH_16
  `define ST_WIDTH_INF_16
`elsif ST_WIDTH_32
  `define ST_WIDTH_INF_16
  `define ST_WIDTH_INF_32
`elsif ST_WIDTH_64
  `define ST_WIDTH_INF_16
  `define ST_WIDTH_INF_32
  `define ST_WIDTH_INF_64
`elsif ST_WIDTH_128
  `define ST_WIDTH_INF_16
  `define ST_WIDTH_INF_32
  `define ST_WIDTH_INF_64
  `define ST_WIDTH_INF_128
`elsif ST_WIDTH_256
  `define ST_WIDTH_INF_16
  `define ST_WIDTH_INF_32
  `define ST_WIDTH_INF_64
  `define ST_WIDTH_INF_128
  `define ST_WIDTH_INF_256
`endif

`define CNT_WIDTH      16 

`ifdef ST_WIDTH_16
  `define RAM_ADDR_WIDTH 3   
  `define RAM_WIDTH      256           //8x32
  `define RAM_WEA_WIDTH  32            //256/8
  `define RAM_DEPTH      8 
  `define MATRIX_WIDTH   8  
  `define MATRIX_HEIGHT  16  
`elsif ST_WIDTH_32
  `define RAM_ADDR_WIDTH 4   
  `define RAM_WIDTH      512           //16x32
  `define RAM_WEA_WIDTH  64            //512/8
  `define RAM_DEPTH      16 
  `define MATRIX_WIDTH   16  
  `define MATRIX_HEIGHT  32  
`elsif ST_WIDTH_64
  `define RAM_ADDR_WIDTH 5   
  `define RAM_WIDTH      1024          //32x32
  `define RAM_WEA_WIDTH  128           //1024/8
  `define RAM_DEPTH      32 
  `define MATRIX_WIDTH   32  
  `define MATRIX_HEIGHT  64  
`elsif ST_WIDTH_128
  `define RAM_ADDR_WIDTH 6   
  `define RAM_WIDTH      2048          //64x32
  `define RAM_WEA_WIDTH  256           //2048/8
  `define RAM_DEPTH      64 
  `define MATRIX_WIDTH   64  
  `define MATRIX_HEIGHT  128  
`elsif ST_WIDTH_256
  `define RAM_ADDR_WIDTH 7   
  `define RAM_WIDTH      4096          //128x32
  `define RAM_WEA_WIDTH  512           //4096/8
  `define RAM_DEPTH      128 
  `define MATRIX_WIDTH   128  
  `define MATRIX_HEIGHT  256  
`endif

`ifdef ST_WIDTH_16
  `define WEA8    `RAM_WEA_WIDTH'hffff_ffff 
  `define WEA7    `RAM_WEA_WIDTH'h0fff_ffff 
  `define WEA6    `RAM_WEA_WIDTH'h00ff_ffff 
  `define WEA5    `RAM_WEA_WIDTH'h000f_ffff 
  `define WEA4    `RAM_WEA_WIDTH'h0000_ffff 
  `define WEA3    `RAM_WEA_WIDTH'h0000_0fff 
  `define WEA2    `RAM_WEA_WIDTH'h0000_00ff 
  `define WEA1    `RAM_WEA_WIDTH'h0000_000f 
`elsif ST_WIDTH_32
  `define WEA16   `RAM_WEA_WIDTH'hffff_ffff_ffff_ffff 
  `define WEA15   `RAM_WEA_WIDTH'h0fff_ffff_ffff_ffff 
  `define WEA14   `RAM_WEA_WIDTH'h00ff_ffff_ffff_ffff 
  `define WEA13   `RAM_WEA_WIDTH'h000f_ffff_ffff_ffff 
  `define WEA12   `RAM_WEA_WIDTH'h0000_ffff_ffff_ffff 
  `define WEA11   `RAM_WEA_WIDTH'h0000_0fff_ffff_ffff 
  `define WEA10   `RAM_WEA_WIDTH'h0000_00ff_ffff_ffff 
  `define WEA9    `RAM_WEA_WIDTH'h0000_000f_ffff_ffff 
  `define WEA8    `RAM_WEA_WIDTH'h0000_0000_ffff_ffff 
  `define WEA7    `RAM_WEA_WIDTH'h0000_0000_0fff_ffff 
  `define WEA6    `RAM_WEA_WIDTH'h0000_0000_00ff_ffff 
  `define WEA5    `RAM_WEA_WIDTH'h0000_0000_000f_ffff 
  `define WEA4    `RAM_WEA_WIDTH'h0000_0000_0000_ffff 
  `define WEA3    `RAM_WEA_WIDTH'h0000_0000_0000_0fff 
  `define WEA2    `RAM_WEA_WIDTH'h0000_0000_0000_00ff 
  `define WEA1    `RAM_WEA_WIDTH'h0000_0000_0000_000f 
`elsif ST_WIDTH_64
  `define WEA32   `RAM_WEA_WIDTH'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA31   `RAM_WEA_WIDTH'h0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA30   `RAM_WEA_WIDTH'h00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA29   `RAM_WEA_WIDTH'h000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA28   `RAM_WEA_WIDTH'h0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA27   `RAM_WEA_WIDTH'h0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA26   `RAM_WEA_WIDTH'h0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA25   `RAM_WEA_WIDTH'h0000_000f_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA24   `RAM_WEA_WIDTH'h0000_0000_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA23   `RAM_WEA_WIDTH'h0000_0000_0fff_ffff_ffff_ffff_ffff_ffff 
  `define WEA22   `RAM_WEA_WIDTH'h0000_0000_00ff_ffff_ffff_ffff_ffff_ffff 
  `define WEA21   `RAM_WEA_WIDTH'h0000_0000_000f_ffff_ffff_ffff_ffff_ffff 
  `define WEA20   `RAM_WEA_WIDTH'h0000_0000_0000_ffff_ffff_ffff_ffff_ffff 
  `define WEA19   `RAM_WEA_WIDTH'h0000_0000_0000_0fff_ffff_ffff_ffff_ffff 
  `define WEA18   `RAM_WEA_WIDTH'h0000_0000_0000_00ff_ffff_ffff_ffff_ffff 
  `define WEA17   `RAM_WEA_WIDTH'h0000_0000_0000_000f_ffff_ffff_ffff_ffff 
  `define WEA16   `RAM_WEA_WIDTH'h0000_0000_0000_0000_ffff_ffff_ffff_ffff 
  `define WEA15   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0fff_ffff_ffff_ffff 
  `define WEA14   `RAM_WEA_WIDTH'h0000_0000_0000_0000_00ff_ffff_ffff_ffff 
  `define WEA13   `RAM_WEA_WIDTH'h0000_0000_0000_0000_000f_ffff_ffff_ffff 
  `define WEA12   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_ffff_ffff_ffff 
  `define WEA11   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0fff_ffff_ffff 
  `define WEA10   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_00ff_ffff_ffff 
  `define WEA9    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_000f_ffff_ffff 
  `define WEA8    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_ffff_ffff 
  `define WEA7    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0fff_ffff 
  `define WEA6    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_00ff_ffff 
  `define WEA5    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_000f_ffff 
  `define WEA4    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_ffff 
  `define WEA3    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0fff 
  `define WEA2    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_00ff 
  `define WEA1    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_000f 
`elsif ST_WIDTH_128
  `define WEA64   `RAM_WEA_WIDTH'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA63   `RAM_WEA_WIDTH'h0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA62   `RAM_WEA_WIDTH'h00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA61   `RAM_WEA_WIDTH'h000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA60   `RAM_WEA_WIDTH'h0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA59   `RAM_WEA_WIDTH'h0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA58   `RAM_WEA_WIDTH'h0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA57   `RAM_WEA_WIDTH'h0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA56   `RAM_WEA_WIDTH'h0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA55   `RAM_WEA_WIDTH'h0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA54   `RAM_WEA_WIDTH'h0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA53   `RAM_WEA_WIDTH'h0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA52   `RAM_WEA_WIDTH'h0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA51   `RAM_WEA_WIDTH'h0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA50   `RAM_WEA_WIDTH'h0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA49   `RAM_WEA_WIDTH'h0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA48   `RAM_WEA_WIDTH'h0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA47   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA46   `RAM_WEA_WIDTH'h0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA45   `RAM_WEA_WIDTH'h0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA44   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA43   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA42   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA41   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA40   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA39   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA38   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA37   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA36   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA35   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA34   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA33   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA32   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA31   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA30   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA29   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA28   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA27   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA26   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA25   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA24   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA23   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff 
  `define WEA22   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff 
  `define WEA21   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff 
  `define WEA20   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff 
  `define WEA19   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff 
  `define WEA18   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff 
  `define WEA17   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff 
  `define WEA16   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff 
  `define WEA15   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff 
  `define WEA14   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff 
  `define WEA13   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff 
  `define WEA12   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff 
  `define WEA11   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff 
  `define WEA10   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff 
  `define WEA9    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff 
  `define WEA8    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff 
  `define WEA7    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff 
  `define WEA6    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff 
  `define WEA5    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff 
  `define WEA4    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff 
  `define WEA3    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff 
  `define WEA2    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff 
  `define WEA1    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f 
`elsif ST_WIDTH_256
  `define WEA128  `RAM_WEA_WIDTH'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA127  `RAM_WEA_WIDTH'h0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA126  `RAM_WEA_WIDTH'h00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA125  `RAM_WEA_WIDTH'h000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA124  `RAM_WEA_WIDTH'h0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA123  `RAM_WEA_WIDTH'h0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA122  `RAM_WEA_WIDTH'h0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA121  `RAM_WEA_WIDTH'h0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA120  `RAM_WEA_WIDTH'h0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA119  `RAM_WEA_WIDTH'h0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA118  `RAM_WEA_WIDTH'h0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA117  `RAM_WEA_WIDTH'h0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA116  `RAM_WEA_WIDTH'h0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA115  `RAM_WEA_WIDTH'h0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA114  `RAM_WEA_WIDTH'h0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA113  `RAM_WEA_WIDTH'h0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA112  `RAM_WEA_WIDTH'h0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA111  `RAM_WEA_WIDTH'h0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA110  `RAM_WEA_WIDTH'h0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA109  `RAM_WEA_WIDTH'h0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA108  `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA107  `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA106  `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA105  `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA104  `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA103  `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA102  `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA101  `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA100  `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA99   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA98   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA97   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA96   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA95   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA94   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA93   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA92   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA91   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA90   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA89   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA88   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA87   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA86   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA85   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA84   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA83   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA82   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA81   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA80   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA79   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA78   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA77   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA76   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA75   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA74   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA73   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA72   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA71   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA70   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA69   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA68   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA67   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA66   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA65   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA64   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA63   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA62   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA61   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA60   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA59   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA58   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA57   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA56   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA55   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA54   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA53   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA52   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA51   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA50   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA49   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA48   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA47   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA46   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA45   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA44   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA43   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA42   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA41   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA40   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA39   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA38   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA37   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA36   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA35   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA34   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA33   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA32   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA31   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA30   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA29   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA28   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA27   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA26   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA25   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA24   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff_ffff 
  `define WEA23   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff_ffff 
  `define WEA22   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff_ffff 
  `define WEA21   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff_ffff 
  `define WEA20   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff_ffff 
  `define WEA19   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff_ffff 
  `define WEA18   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff_ffff 
  `define WEA17   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff_ffff 
  `define WEA16   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff_ffff 
  `define WEA15   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff_ffff 
  `define WEA14   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff_ffff 
  `define WEA13   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff_ffff 
  `define WEA12   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff_ffff 
  `define WEA11   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff_ffff 
  `define WEA10   `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff_ffff 
  `define WEA9    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff_ffff 
  `define WEA8    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff_ffff 
  `define WEA7    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff_ffff 
  `define WEA6    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff_ffff 
  `define WEA5    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f_ffff 
  `define WEA4    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_ffff 
  `define WEA3    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0fff 
  `define WEA2    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_00ff 
  `define WEA1    `RAM_WEA_WIDTH'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000f 
`endif
  
// **************************************************
// -------------------------------------------------- 
// -----3. Please select simulation and synthesis 
// -------------------------------------------------- 
//`define VIVADO_BLK_RAM  
// -------------------------------------------------- 
// -----End Configuration
// -------------------------------------------------- 
// **************************************************

`ifdef VIVADO_BLK_RAM
  `define MEM_RD_CY      2  
  `define MEM_WR_CY      1 
`else
  `define MEM_RD_CY      1  
  `define MEM_WR_CY      1 
`endif

// **************************************************
// -------------------------------------------------- 
// -----Parameterizable FP MOF ---------------------- 
// -----4. Please select the MOF
// -----High MOF design: 400 MHz
// -----FP Adder: 13 cycles; FP Multiplier: 10 Cycles
// -----Low MOF design: 100 MHz
// -----FP Adder: 1 cycles; FP Multiplier: 1 Cycles
// -------------------------------------------------- 
`define HIGH_MOF
//`define LOW_MOF
// -------------------------------------------------- 
// -----End Configuration
// -------------------------------------------------- 
`ifdef VIVADO_BLK_RAM
  `define MEM_RD_CY      2  
  `define MEM_WR_CY      1 
`else
  `define MEM_RD_CY      1  
  `define MEM_WR_CY      1 
`endif

`ifdef LOW_MOF
  `ifdef ST_WIDTH_16
    `define DDOT_CY       5    //hqr2,  6, 9: 1+log2(16)=4
  `elsif ST_WIDTH_32
    `define DDOT_CY       6    //hqr2,  6, 9: 1+log2(32)=6
  `elsif ST_WIDTH_64
    `define DDOT_CY       7    //hqr2,  6, 9: 1+log2(64)=7
  `elsif ST_WIDTH_128
    `define DDOT_CY       8    //hqr2,  6, 9: 1+log2(128)=8
  `elsif ST_WIDTH_256
    `define DDOT_CY       9    //hqr2,  6, 9: 1+log2(256)=9
  `endif
  
  `define HQR3_CY        9    //hqr3:  sqrt
  `define HQR5_CY        1    //hqr5:  xk(1)+sign(xk(1))*d2
  `define HQR7_CY        6    //hqr7:  -2/d3
  `define HQR10_CY       1    //hqr10: d5=tk*d4
  `define HQR11_CY       2    //hqr11: axpy
`endif
  
`ifdef HIGH_MOF
  `ifdef ST_WIDTH_16
    `define DDOT_CY        62    //hqr2,  6, 9: 10+13*log2(16)=62
  `elsif ST_WIDTH_32
    `define DDOT_CY        75    //hqr2,  6, 9: 10+13*log2(32)=75
  `elsif ST_WIDTH_64
    `define DDOT_CY        88    //hqr2,  6, 9: 10+13*log2(64)=88
  `elsif ST_WIDTH_128
    `define DDOT_CY        101    //hqr2,  6, 9: 10+13*log2(128)=101
  `elsif ST_WIDTH_256
    `define DDOT_CY        114    //hqr2,  6, 9: 10+13*log2(256)=114
  `endif
  
  `define HQR3_CY        139    //hqr3:  sqrt
  `define HQR5_CY        13     //hqr5:  xk(1)+sign(xk(1))*d2
  `define HQR7_CY        129    //hqr7:  -2/d3
  `define HQR10_CY       10     //hqr10: d5=tk*d4
  `define HQR11_CY       23     //hqr11: axpy
`endif

  `define YJ_SFT_NO      `DDOT_CY+`HQR7_CY+`HQR10_CY-1
  `define D4_SFT_NO      `HQR7_CY-1  
  
  `define VK_CY    `DDOT_CY+`HQR3_CY+`HQR5_CY
  `define TK_CY    `VK_CY+`DDOT_CY+`HQR7_CY
  `define TR_CY    `DDOT_CY+`HQR7_CY+`HQR10_CY+`HQR11_CY-`MEM_RD_CY
  `define HH_CY    `TK_CY+`HQR10_CY+`HQR11_CY
