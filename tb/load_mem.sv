//*********************************************************************************************// 
//----------------  Load Memory -------------------------------------------------------------//// 
//---------------- Author: Xiaokun Yang  ----------------------------------------------------//// 
//---------------- Lawrence Berkeley Lab ----------------------------------------------------//// 
//---------------- Date: 6/26/2023  ---------------------------------------------------------//// 
//----- Version 1: TSQR MC Testbench---------------------------------------------------------//// 
//----- Date: 6/21/2023 ---------------------------------------------------------------------//// 
//-------------------------------------------------------------------------------------------//// 
//*********************************************************************************************// 

//---------------------------------------------------------
//--- Initialize and Load Memory -------------------------- 
//--- Single-core Test Cases ------------------------------ 
//---------------------------------------------------------
integer i;
`ifdef SINGLE_CORE
initial begin
  `ifdef TILE_NO_2 //2 tiles
    $display("Load Memory C1R and C1D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO-0)*32-1:`MATRIX_WIDTH*(`TILE_NO-1)*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO-1)*32-1:`MATRIX_WIDTH*(`TILE_NO-2)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_3 //3 tiles
    $display("Load Memory C1D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO-2)*32-1:`MATRIX_WIDTH*(`TILE_NO-3)*32];
      i=i+1;
    end
  `endif
//======================
  `ifdef TILE_NO_4 //4 tiles
    wait(c1_mem1_fi);
    $display("Load Memory C1D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO-3)*32-1:`MATRIX_WIDTH*(`TILE_NO-4)*32];
      i=i+1;
    end
  `endif 
end
`endif //SINGLE_CORE

//---------------------------------------------------------
//--- Initialize and Load Memory -------------------------- 
//--- Dual-core Test Cases -------------------------------- 
//---------------------------------------------------------
`ifdef DUAL_CORE
initial begin
  `ifdef TILE_NO_4 //4 tiles
    $display("Load Memory C1R, C1D0, C2R, C2D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO-0)*32-1:`MATRIX_WIDTH*(`TILE_NO-1)*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO-1)*32-1:`MATRIX_WIDTH*(`TILE_NO-2)*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/2-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/2-1)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/2-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/2-2)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_6 //6 tiles
    $display("Load Memory C1D1 and C2D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO-2)*32-1:`MATRIX_WIDTH*(`TILE_NO-3)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/2-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/2-3)*32];
      i=i+1;
    end
  `endif
//======================
  `ifdef TILE_NO_8 //8 tiles
    wait(c1_mem1_fi & c2_mem1_fi);
    $display("Load Memory C1D0 and C2D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO-3)*32-1:`MATRIX_WIDTH*(`TILE_NO-4)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/2-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/2-4)*32];
      i=i+1;
    end
  `endif
end
`endif //DUAL_CORE

//---------------------------------------------------------
//--- Initialize and Load Memory -------------------------- 
//--- Quad-core Test Cases -------------------------------- 
//---------------------------------------------------------
`ifdef QUAD_CORE
initial begin
  `ifdef TILE_NO_8  //8 tiles
    $display("Load Memory C1R, C1D0, C2R, C2D0, C3R, C3D0, C4R, C4D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-1)*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-2)*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-1)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-2)*32];
      u_tsqr_mc.u3_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-1)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-2)*32];
      u_tsqr_mc.u4_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-1)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-2)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_12  //12 tiles
    $display("Load Memory C1D1, C2D1, C3D1, C4D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-3)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-3)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-3)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-3)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_16 //16 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-4)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-4)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-4)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-4)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_20 //20 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-5)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-5)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-5)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-5)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_24 //24 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-6)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-6)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-6)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-6)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_28 //28 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-7)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-7)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-7)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-7)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_32 //32 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-8)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-8)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-8)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-8)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_36 //36 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-9)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-9)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-9)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-9)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_40 //40 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-10)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-10)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-10)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-10)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_44 //44 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-11)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-11)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-11)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-11)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_48 //48 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-12)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-12)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-12)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-12)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_52 //52 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-13)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-13)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-13)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-13)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_56 //56 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-14)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-14)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-14)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-14)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_60 //60 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-15)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-15)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-15)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-15)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_64 //64 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*4-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*4-16)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*3-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*3-16)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*2-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*2-16)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/4*1-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/4*1-16)*32];
      i=i+1;
    end
  `endif
end
`endif //QUAD_CORE

//---------------------------------------------------------
//--- Initialize and Load Memory -------------------------- 
//--- EIGHT-core Test Cases -------------------------------- 
//---------------------------------------------------------
`ifdef EIGHT_CORE
initial begin
  `ifdef TILE_NO_16  //16 tiles
    $display("Load Memory C1R, C1D0, C2R, C2D0, C3R, C3D0, C4R, C4D0, C5R, C5D0, C6R, C6D0, C7R, C7D0, C8R, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-1)*32];
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-2)*32];
      u_tsqr_mc.u2_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-1)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-2)*32];
      u_tsqr_mc.u3_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-1)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-2)*32];
      u_tsqr_mc.u4_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-1)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-2)*32];
      u_tsqr_mc.u5_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-1)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-2)*32];
      u_tsqr_mc.u6_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-1)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-2)*32];
      u_tsqr_mc.u7_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-1)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-2)*32];
      u_tsqr_mc.u8_hh_core.u_rtri.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-0)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-1)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-1)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-2)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_24  //24 tiles
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-3)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-3)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-3)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-3)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-3)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-3)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-3)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-2)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-3)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_32 //32 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-4)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-4)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-4)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-4)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-4)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-4)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-4)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-3)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-4)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_40 //40 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-5)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-5)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-5)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-5)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-5)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-5)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-5)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-4)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-5)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_48 //48 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-6)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-6)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-6)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-6)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-6)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-6)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-6)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-5)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-6)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_56 //56 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-7)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-7)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-7)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-7)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-7)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-7)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-7)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-6)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-7)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_64 //64 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-8)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-8)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-8)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-8)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-8)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-8)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-8)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-7)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-8)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_72 //72 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-9)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-9)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-9)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-9)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-9)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-9)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-9)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-8)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-9)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_80 //80 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-10)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-10)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-10)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-10)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-10)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-10)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-10)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-9)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-10)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_88 //88 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-11)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-11)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-11)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-11)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-11)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-11)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-11)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-10)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-11)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_96 //96 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-12)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-12)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-12)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-12)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-12)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-12)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-12)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-11)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-12)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_104 //104 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-13)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-13)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-13)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-13)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-13)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-13)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-13)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-12)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-13)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_112 //112 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-14)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-14)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-14)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-14)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-14)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-14)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-14)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-13)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-14)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_120 //120 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-15)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-15)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-15)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-15)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-15)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-15)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-15)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-14)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-15)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_128 //128 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-16)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-16)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-16)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-16)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-16)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-16)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-16)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-15)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-16)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_136 //136 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-16)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-17)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-16)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-17)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-16)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-17)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-16)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-17)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-16)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-17)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-16)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-17)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-16)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-17)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-16)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-17)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_144 //144 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-17)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-18)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-17)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-18)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-17)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-18)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-17)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-18)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-17)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-18)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-17)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-18)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-17)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-18)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-17)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-18)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_152 //152 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-18)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-19)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-18)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-19)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-18)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-19)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-18)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-19)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-18)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-19)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-18)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-19)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-18)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-19)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-18)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-19)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_160 //160 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-19)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-20)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-19)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-20)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-19)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-20)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-19)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-20)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-19)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-20)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-19)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-20)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-19)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-20)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-19)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-20)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_168 //168 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-20)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-21)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-20)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-21)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-20)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-21)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-20)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-21)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-20)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-21)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-20)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-21)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-20)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-21)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-20)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-21)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_176 //176 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-21)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-22)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-21)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-22)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-21)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-22)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-21)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-22)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-21)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-22)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-21)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-22)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-21)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-22)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-21)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-22)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_184 //184 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-22)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-23)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-22)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-23)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-22)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-23)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-22)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-23)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-22)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-23)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-22)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-23)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-22)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-23)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-22)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-23)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_192 //192 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-23)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-24)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-23)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-24)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-23)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-24)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-23)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-24)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-23)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-24)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-23)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-24)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-23)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-24)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-23)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-24)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_200 //200 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-24)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-25)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-24)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-25)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-24)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-25)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-24)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-25)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-24)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-25)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-24)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-25)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-24)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-25)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-24)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-25)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_208 //208 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-25)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-26)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-25)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-26)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-25)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-26)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-25)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-26)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-25)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-26)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-25)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-26)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-25)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-26)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-25)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-26)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_216 //216 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-26)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-27)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-26)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-27)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-26)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-27)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-26)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-27)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-26)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-27)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-26)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-27)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-26)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-27)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-26)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-27)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_224 //224 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-27)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-28)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-27)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-28)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-27)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-28)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-27)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-28)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-27)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-28)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-27)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-28)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-27)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-28)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-27)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-28)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_232 //232 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-28)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-29)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-28)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-29)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-28)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-29)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-28)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-29)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-28)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-29)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-28)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-29)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-28)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-29)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-28)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-29)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_240 //240 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-29)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-30)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-29)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-30)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-29)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-30)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-29)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-30)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-29)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-30)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-29)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-30)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-29)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-30)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-29)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-30)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_248 //248 tiles
    wait(c1_mem0_fi & c2_mem0_fi & c3_mem0_fi & c4_mem0_fi & c5_mem0_fi & c6_mem0_fi & c7_mem0_fi & c8_mem0_fi);
    $display("Load Memory C1D1, C2D1, C3D1, C4D1, C5D1, C6D1, C7D1, C8D1 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-30)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-31)*32];
      u_tsqr_mc.u2_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-30)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-31)*32];
      u_tsqr_mc.u3_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-30)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-31)*32];
      u_tsqr_mc.u4_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-30)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-31)*32];
      u_tsqr_mc.u5_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-30)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-31)*32];
      u_tsqr_mc.u6_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-30)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-31)*32];
      u_tsqr_mc.u7_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-30)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-31)*32];
      u_tsqr_mc.u8_hh_core.u_dmx1.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-30)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-31)*32];
      i=i+1;
    end
  `endif
  `ifdef TILE_NO_256 //256 tiles
    wait(c1_mem1_fi & c2_mem1_fi & c3_mem1_fi & c4_mem1_fi & c5_mem1_fi & c6_mem1_fi & c7_mem1_fi & c8_mem1_fi);
    $display("Load Memory C1D0, C2D0, C3D0, C4D0, C5D0, C6D0, C7D0, C8D0 (%d ns)",$time);
    for(i=0; i<`MATRIX_WIDTH;) begin
      u_tsqr_mc.u1_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*8-31)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*8-32)*32];
      u_tsqr_mc.u2_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*7-31)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*7-32)*32];
      u_tsqr_mc.u3_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*6-31)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*6-32)*32];
      u_tsqr_mc.u4_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*5-31)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*5-32)*32];
      u_tsqr_mc.u5_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*4-31)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*4-32)*32];
      u_tsqr_mc.u6_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*3-31)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*3-32)*32];
      u_tsqr_mc.u7_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*2-31)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*2-32)*32];
      u_tsqr_mc.u8_hh_core.u_dmx0.ram[i]=dmx_ram[i][`MATRIX_WIDTH*(`TILE_NO/8*1-31)*32-1:`MATRIX_WIDTH*(`TILE_NO/8*1-32)*32];
      i=i+1;
    end
  `endif
end
`endif //EIGHT_CORE
