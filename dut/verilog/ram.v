//*********************************************************************************************//
//----------------   RAM Memory          ----------------------------------------------------////
//---------------- Author: Xiaokun Yang  ----------------------------------------------------////
//---------------- Lawrence Berkeley Lab ----------------------------------------------------////
//---------------- Date: 9/3/2022 ----------------------------------------------------------//// 
//----- Version 1: Buffer Constrol Module ---------------------------------------------------////
//----- Date: 7/28/2022 ---------------------------------------------------------------------////
//----- Version 2:                                                   ------------------------////
//----- Date:           ---------------------------------------------------------------------////
//*********************************************************************************************//
//*********************************************************************************************//

// ----------------------------------------------------------------------
// Dual-Port Block `RAM with Two Write Ports
// File: rams_tdp_rf_rf.v
//https://docs.xilinx.com/r/en-US/ug901-vivado-synthesis/Dual-Port-Block-`RAM-with-Two-Write-Ports-in-Read-First-Mode-Example-Verilog 
// ----------------------------------------------------------------------
module simple_dual  (input                             clka ,
                     input                             clkb ,
                     input                             ena  ,
		     input                             enb  ,
		     input      [`RAM_WIDTH/8-1:0]     wea  ,
		     input      [`RAM_ADDR_WIDTH-1:0]  addra,
		     input      [`RAM_ADDR_WIDTH-1:0]  addrb,
		     input      [`RAM_WIDTH-1:0]       dina  ,
		     output reg [`RAM_WIDTH-1:0]       doutb  );

reg [`RAM_WIDTH-1:0] ram[0:`RAM_DEPTH-1]; 

`ifdef ST_WIDTH_16
always @(posedge clka) begin
  if (ena) begin
    case(wea)
      `WEA8: begin ram[addra]=dina; end
      `WEA7: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*1  ],dina[`RAM_WIDTH-1-32*1  :0]}; end
      `WEA6: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*2  ],dina[`RAM_WIDTH-1-32*2  :0]}; end
      `WEA5: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*3  ],dina[`RAM_WIDTH-1-32*3  :0]}; end
      `WEA4: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*4  ],dina[`RAM_WIDTH-1-32*4  :0]}; end
      `WEA3: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*5  ],dina[`RAM_WIDTH-1-32*5  :0]}; end
      `WEA2: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*6  ],dina[`RAM_WIDTH-1-32*6  :0]}; end
      `WEA1: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*7  ],dina[`RAM_WIDTH-1-32*7  :0]}; end
      default : begin ram[addra]<=`RAM_WIDTH'h0; end
    endcase
  end
end
`endif // ST_WIDTH_16
`ifdef ST_WIDTH_32
always @(posedge clka) begin
  if (ena) begin
    case(wea)
      `WEA16: begin ram[addra]=dina; end
      `WEA15: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*1  ],dina[`RAM_WIDTH-1-32*1  :0]}; end
      `WEA14: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*2  ],dina[`RAM_WIDTH-1-32*2  :0]}; end
      `WEA13: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*3  ],dina[`RAM_WIDTH-1-32*3  :0]}; end
      `WEA12: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*4  ],dina[`RAM_WIDTH-1-32*4  :0]}; end
      `WEA11: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*5  ],dina[`RAM_WIDTH-1-32*5  :0]}; end
      `WEA10: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*6  ],dina[`RAM_WIDTH-1-32*6  :0]}; end
      `WEA9 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*7  ],dina[`RAM_WIDTH-1-32*7  :0]}; end
      `WEA8 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*8  ],dina[`RAM_WIDTH-1-32*8  :0]}; end
      `WEA7 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*9  ],dina[`RAM_WIDTH-1-32*9  :0]}; end
      `WEA6 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*10 ],dina[`RAM_WIDTH-1-32*10 :0]}; end
      `WEA5 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*11 ],dina[`RAM_WIDTH-1-32*11 :0]}; end
      `WEA4 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*12 ],dina[`RAM_WIDTH-1-32*12 :0]}; end
      `WEA3 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*13 ],dina[`RAM_WIDTH-1-32*13 :0]}; end
      `WEA2 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*14 ],dina[`RAM_WIDTH-1-32*14 :0]}; end
      `WEA1 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*15 ],dina[`RAM_WIDTH-1-32*15 :0]}; end
      default : begin ram[addra]<=`RAM_WIDTH'h0; end
    endcase
  end
end
`endif // ST_WIDTH_32
`ifdef ST_WIDTH_64
always @(posedge clka) begin
  if (ena) begin
    case(wea)
      `WEA32: begin ram[addra]=dina; end
      `WEA31: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*1  ],dina[`RAM_WIDTH-1-32*1  :0]}; end
      `WEA30: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*2  ],dina[`RAM_WIDTH-1-32*2  :0]}; end
      `WEA29: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*3  ],dina[`RAM_WIDTH-1-32*3  :0]}; end
      `WEA28: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*4  ],dina[`RAM_WIDTH-1-32*4  :0]}; end
      `WEA27: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*5  ],dina[`RAM_WIDTH-1-32*5  :0]}; end
      `WEA26: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*6  ],dina[`RAM_WIDTH-1-32*6  :0]}; end
      `WEA25: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*7  ],dina[`RAM_WIDTH-1-32*7  :0]}; end
      `WEA24: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*8  ],dina[`RAM_WIDTH-1-32*8  :0]}; end
      `WEA23: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*9  ],dina[`RAM_WIDTH-1-32*9  :0]}; end
      `WEA22: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*10 ],dina[`RAM_WIDTH-1-32*10 :0]}; end
      `WEA21: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*11 ],dina[`RAM_WIDTH-1-32*11 :0]}; end
      `WEA20: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*12 ],dina[`RAM_WIDTH-1-32*12 :0]}; end
      `WEA19: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*13 ],dina[`RAM_WIDTH-1-32*13 :0]}; end
      `WEA18: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*14 ],dina[`RAM_WIDTH-1-32*14 :0]}; end
      `WEA17: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*15 ],dina[`RAM_WIDTH-1-32*15 :0]}; end
      `WEA16: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*16 ],dina[`RAM_WIDTH-1-32*16 :0]}; end
      `WEA15: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*17 ],dina[`RAM_WIDTH-1-32*17 :0]}; end
      `WEA14: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*18 ],dina[`RAM_WIDTH-1-32*18 :0]}; end
      `WEA13: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*19 ],dina[`RAM_WIDTH-1-32*19 :0]}; end
      `WEA12: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*20 ],dina[`RAM_WIDTH-1-32*20 :0]}; end
      `WEA11: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*21 ],dina[`RAM_WIDTH-1-32*21 :0]}; end
      `WEA10: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*22 ],dina[`RAM_WIDTH-1-32*22 :0]}; end
      `WEA9 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*23 ],dina[`RAM_WIDTH-1-32*23 :0]}; end
      `WEA8 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*24 ],dina[`RAM_WIDTH-1-32*24 :0]}; end
      `WEA7 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*25 ],dina[`RAM_WIDTH-1-32*25 :0]}; end
      `WEA6 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*26 ],dina[`RAM_WIDTH-1-32*26 :0]}; end
      `WEA5 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*27 ],dina[`RAM_WIDTH-1-32*27 :0]}; end
      `WEA4 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*28 ],dina[`RAM_WIDTH-1-32*28 :0]}; end
      `WEA3 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*29 ],dina[`RAM_WIDTH-1-32*29 :0]}; end
      `WEA2 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*30 ],dina[`RAM_WIDTH-1-32*30 :0]}; end
      `WEA1 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*31 ],dina[`RAM_WIDTH-1-32*31 :0]}; end
      default : begin ram[addra]<=`RAM_WIDTH'h0; end
    endcase
  end
end
`endif // ST_WIDTH_64
`ifdef ST_WIDTH_128
always @(posedge clka) begin
  if (ena) begin
    case(wea)
      `WEA64: begin ram[addra]=dina; end
      `WEA63: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*1  ],dina[`RAM_WIDTH-1-32*1  :0]}; end
      `WEA62: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*2  ],dina[`RAM_WIDTH-1-32*2  :0]}; end
      `WEA61: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*3  ],dina[`RAM_WIDTH-1-32*3  :0]}; end
      `WEA60: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*4  ],dina[`RAM_WIDTH-1-32*4  :0]}; end
      `WEA59: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*5  ],dina[`RAM_WIDTH-1-32*5  :0]}; end
      `WEA58: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*6  ],dina[`RAM_WIDTH-1-32*6  :0]}; end
      `WEA57: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*7  ],dina[`RAM_WIDTH-1-32*7  :0]}; end
      `WEA56: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*8  ],dina[`RAM_WIDTH-1-32*8  :0]}; end
      `WEA55: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*9  ],dina[`RAM_WIDTH-1-32*9  :0]}; end
      `WEA54: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*10 ],dina[`RAM_WIDTH-1-32*10 :0]}; end
      `WEA53: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*11 ],dina[`RAM_WIDTH-1-32*11 :0]}; end
      `WEA52: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*12 ],dina[`RAM_WIDTH-1-32*12 :0]}; end
      `WEA51: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*13 ],dina[`RAM_WIDTH-1-32*13 :0]}; end
      `WEA50: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*14 ],dina[`RAM_WIDTH-1-32*14 :0]}; end
      `WEA49: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*15 ],dina[`RAM_WIDTH-1-32*15 :0]}; end
      `WEA48: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*16 ],dina[`RAM_WIDTH-1-32*16 :0]}; end
      `WEA47: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*17 ],dina[`RAM_WIDTH-1-32*17 :0]}; end
      `WEA46: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*18 ],dina[`RAM_WIDTH-1-32*18 :0]}; end
      `WEA45: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*19 ],dina[`RAM_WIDTH-1-32*19 :0]}; end
      `WEA44: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*20 ],dina[`RAM_WIDTH-1-32*20 :0]}; end
      `WEA43: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*21 ],dina[`RAM_WIDTH-1-32*21 :0]}; end
      `WEA42: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*22 ],dina[`RAM_WIDTH-1-32*22 :0]}; end
      `WEA41: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*23 ],dina[`RAM_WIDTH-1-32*23 :0]}; end
      `WEA40: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*24 ],dina[`RAM_WIDTH-1-32*24 :0]}; end
      `WEA39: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*25 ],dina[`RAM_WIDTH-1-32*25 :0]}; end
      `WEA38: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*26 ],dina[`RAM_WIDTH-1-32*26 :0]}; end
      `WEA37: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*27 ],dina[`RAM_WIDTH-1-32*27 :0]}; end
      `WEA36: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*28 ],dina[`RAM_WIDTH-1-32*28 :0]}; end
      `WEA35: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*29 ],dina[`RAM_WIDTH-1-32*29 :0]}; end
      `WEA34: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*30 ],dina[`RAM_WIDTH-1-32*30 :0]}; end
      `WEA33: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*31 ],dina[`RAM_WIDTH-1-32*31 :0]}; end
      `WEA32: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*32 ],dina[`RAM_WIDTH-1-32*32 :0]}; end
      `WEA31: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*33 ],dina[`RAM_WIDTH-1-32*33 :0]}; end
      `WEA30: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*34 ],dina[`RAM_WIDTH-1-32*34 :0]}; end
      `WEA29: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*35 ],dina[`RAM_WIDTH-1-32*35 :0]}; end
      `WEA28: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*36 ],dina[`RAM_WIDTH-1-32*36 :0]}; end
      `WEA27: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*37 ],dina[`RAM_WIDTH-1-32*37 :0]}; end
      `WEA26: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*38 ],dina[`RAM_WIDTH-1-32*38 :0]}; end
      `WEA25: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*39 ],dina[`RAM_WIDTH-1-32*39 :0]}; end
      `WEA24: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*40 ],dina[`RAM_WIDTH-1-32*40 :0]}; end
      `WEA23: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*41 ],dina[`RAM_WIDTH-1-32*41 :0]}; end
      `WEA22: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*42 ],dina[`RAM_WIDTH-1-32*42 :0]}; end
      `WEA21: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*43 ],dina[`RAM_WIDTH-1-32*43 :0]}; end
      `WEA20: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*44 ],dina[`RAM_WIDTH-1-32*44 :0]}; end
      `WEA19: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*45 ],dina[`RAM_WIDTH-1-32*45 :0]}; end
      `WEA18: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*46 ],dina[`RAM_WIDTH-1-32*46 :0]}; end
      `WEA17: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*47 ],dina[`RAM_WIDTH-1-32*47 :0]}; end
      `WEA16: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*48 ],dina[`RAM_WIDTH-1-32*48 :0]}; end
      `WEA15: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*49 ],dina[`RAM_WIDTH-1-32*49 :0]}; end
      `WEA14: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*50 ],dina[`RAM_WIDTH-1-32*50 :0]}; end
      `WEA13: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*51 ],dina[`RAM_WIDTH-1-32*51 :0]}; end
      `WEA12: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*52 ],dina[`RAM_WIDTH-1-32*52 :0]}; end
      `WEA11: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*53 ],dina[`RAM_WIDTH-1-32*53 :0]}; end
      `WEA10: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*54 ],dina[`RAM_WIDTH-1-32*54 :0]}; end
      `WEA9 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*55 ],dina[`RAM_WIDTH-1-32*55 :0]}; end
      `WEA8 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*56 ],dina[`RAM_WIDTH-1-32*56 :0]}; end
      `WEA7 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*57 ],dina[`RAM_WIDTH-1-32*57 :0]}; end
      `WEA6 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*58 ],dina[`RAM_WIDTH-1-32*58 :0]}; end
      `WEA5 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*59 ],dina[`RAM_WIDTH-1-32*59 :0]}; end
      `WEA4 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*60 ],dina[`RAM_WIDTH-1-32*60 :0]}; end
      `WEA3 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*61 ],dina[`RAM_WIDTH-1-32*61 :0]}; end
      `WEA2 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*62 ],dina[`RAM_WIDTH-1-32*62 :0]}; end
      `WEA1 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*63 ],dina[`RAM_WIDTH-1-32*63 :0]}; end
      default : begin ram[addra]<=`RAM_WIDTH'h0; end
    endcase
  end
end
`endif // ST_WIDTH_128
`ifdef ST_WIDTH_256
always @(posedge clka) begin
  if (ena) begin
    case(wea)
      `WEA128: begin ram[addra]=dina; end
      `WEA127: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*1  ],dina[`RAM_WIDTH-1-32*1  :0]}; end
      `WEA126: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*2  ],dina[`RAM_WIDTH-1-32*2  :0]}; end
      `WEA125: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*3  ],dina[`RAM_WIDTH-1-32*3  :0]}; end
      `WEA124: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*4  ],dina[`RAM_WIDTH-1-32*4  :0]}; end
      `WEA123: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*5  ],dina[`RAM_WIDTH-1-32*5  :0]}; end
      `WEA122: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*6  ],dina[`RAM_WIDTH-1-32*6  :0]}; end
      `WEA121: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*7  ],dina[`RAM_WIDTH-1-32*7  :0]}; end
      `WEA120: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*8  ],dina[`RAM_WIDTH-1-32*8  :0]}; end
      `WEA119: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*9  ],dina[`RAM_WIDTH-1-32*9  :0]}; end
      `WEA118: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*10 ],dina[`RAM_WIDTH-1-32*10 :0]}; end
      `WEA117: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*11 ],dina[`RAM_WIDTH-1-32*11 :0]}; end
      `WEA116: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*12 ],dina[`RAM_WIDTH-1-32*12 :0]}; end
      `WEA115: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*13 ],dina[`RAM_WIDTH-1-32*13 :0]}; end
      `WEA114: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*14 ],dina[`RAM_WIDTH-1-32*14 :0]}; end
      `WEA113: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*15 ],dina[`RAM_WIDTH-1-32*15 :0]}; end
      `WEA112: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*16 ],dina[`RAM_WIDTH-1-32*16 :0]}; end
      `WEA111: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*17 ],dina[`RAM_WIDTH-1-32*17 :0]}; end
      `WEA110: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*18 ],dina[`RAM_WIDTH-1-32*18 :0]}; end
      `WEA109: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*19 ],dina[`RAM_WIDTH-1-32*19 :0]}; end
      `WEA108: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*20 ],dina[`RAM_WIDTH-1-32*20 :0]}; end
      `WEA107: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*21 ],dina[`RAM_WIDTH-1-32*21 :0]}; end
      `WEA106: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*22 ],dina[`RAM_WIDTH-1-32*22 :0]}; end
      `WEA105: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*23 ],dina[`RAM_WIDTH-1-32*23 :0]}; end
      `WEA104: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*24 ],dina[`RAM_WIDTH-1-32*24 :0]}; end
      `WEA103: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*25 ],dina[`RAM_WIDTH-1-32*25 :0]}; end
      `WEA102: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*26 ],dina[`RAM_WIDTH-1-32*26 :0]}; end
      `WEA101: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*27 ],dina[`RAM_WIDTH-1-32*27 :0]}; end
      `WEA100: begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*28 ],dina[`RAM_WIDTH-1-32*28 :0]}; end
      `WEA99 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*29 ],dina[`RAM_WIDTH-1-32*29 :0]}; end
      `WEA98 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*30 ],dina[`RAM_WIDTH-1-32*30 :0]}; end
      `WEA97 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*31 ],dina[`RAM_WIDTH-1-32*31 :0]}; end
      `WEA96 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*32 ],dina[`RAM_WIDTH-1-32*32 :0]}; end
      `WEA95 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*33 ],dina[`RAM_WIDTH-1-32*33 :0]}; end
      `WEA94 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*34 ],dina[`RAM_WIDTH-1-32*34 :0]}; end
      `WEA93 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*35 ],dina[`RAM_WIDTH-1-32*35 :0]}; end
      `WEA92 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*36 ],dina[`RAM_WIDTH-1-32*36 :0]}; end
      `WEA91 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*37 ],dina[`RAM_WIDTH-1-32*37 :0]}; end
      `WEA90 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*38 ],dina[`RAM_WIDTH-1-32*38 :0]}; end
      `WEA89 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*39 ],dina[`RAM_WIDTH-1-32*39 :0]}; end
      `WEA88 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*40 ],dina[`RAM_WIDTH-1-32*40 :0]}; end
      `WEA87 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*41 ],dina[`RAM_WIDTH-1-32*41 :0]}; end
      `WEA86 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*42 ],dina[`RAM_WIDTH-1-32*42 :0]}; end
      `WEA85 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*43 ],dina[`RAM_WIDTH-1-32*43 :0]}; end
      `WEA84 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*44 ],dina[`RAM_WIDTH-1-32*44 :0]}; end
      `WEA83 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*45 ],dina[`RAM_WIDTH-1-32*45 :0]}; end
      `WEA82 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*46 ],dina[`RAM_WIDTH-1-32*46 :0]}; end
      `WEA81 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*47 ],dina[`RAM_WIDTH-1-32*47 :0]}; end
      `WEA80 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*48 ],dina[`RAM_WIDTH-1-32*48 :0]}; end
      `WEA79 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*49 ],dina[`RAM_WIDTH-1-32*49 :0]}; end
      `WEA78 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*50 ],dina[`RAM_WIDTH-1-32*50 :0]}; end
      `WEA77 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*51 ],dina[`RAM_WIDTH-1-32*51 :0]}; end
      `WEA76 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*52 ],dina[`RAM_WIDTH-1-32*52 :0]}; end
      `WEA75 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*53 ],dina[`RAM_WIDTH-1-32*53 :0]}; end
      `WEA74 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*54 ],dina[`RAM_WIDTH-1-32*54 :0]}; end
      `WEA73 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*55 ],dina[`RAM_WIDTH-1-32*55 :0]}; end
      `WEA72 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*56 ],dina[`RAM_WIDTH-1-32*56 :0]}; end
      `WEA71 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*57 ],dina[`RAM_WIDTH-1-32*57 :0]}; end
      `WEA70 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*58 ],dina[`RAM_WIDTH-1-32*58 :0]}; end
      `WEA69 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*59 ],dina[`RAM_WIDTH-1-32*59 :0]}; end
      `WEA68 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*60 ],dina[`RAM_WIDTH-1-32*60 :0]}; end
      `WEA67 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*61 ],dina[`RAM_WIDTH-1-32*61 :0]}; end
      `WEA66 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*62 ],dina[`RAM_WIDTH-1-32*62 :0]}; end
      `WEA65 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*63 ],dina[`RAM_WIDTH-1-32*63 :0]}; end
      `WEA64 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*64 ],dina[`RAM_WIDTH-1-32*64 :0]}; end
      `WEA63 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*65 ],dina[`RAM_WIDTH-1-32*65 :0]}; end
      `WEA62 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*66 ],dina[`RAM_WIDTH-1-32*66 :0]}; end
      `WEA61 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*67 ],dina[`RAM_WIDTH-1-32*67 :0]}; end
      `WEA60 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*68 ],dina[`RAM_WIDTH-1-32*68 :0]}; end
      `WEA59 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*69 ],dina[`RAM_WIDTH-1-32*69 :0]}; end
      `WEA58 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*70 ],dina[`RAM_WIDTH-1-32*70 :0]}; end
      `WEA57 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*71 ],dina[`RAM_WIDTH-1-32*71 :0]}; end
      `WEA56 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*72 ],dina[`RAM_WIDTH-1-32*72 :0]}; end
      `WEA55 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*73 ],dina[`RAM_WIDTH-1-32*73 :0]}; end
      `WEA54 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*74 ],dina[`RAM_WIDTH-1-32*74 :0]}; end
      `WEA53 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*75 ],dina[`RAM_WIDTH-1-32*75 :0]}; end
      `WEA52 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*76 ],dina[`RAM_WIDTH-1-32*76 :0]}; end
      `WEA51 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*77 ],dina[`RAM_WIDTH-1-32*77 :0]}; end
      `WEA50 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*78 ],dina[`RAM_WIDTH-1-32*78 :0]}; end
      `WEA49 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*79 ],dina[`RAM_WIDTH-1-32*79 :0]}; end
      `WEA48 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*80 ],dina[`RAM_WIDTH-1-32*80 :0]}; end
      `WEA47 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*81 ],dina[`RAM_WIDTH-1-32*81 :0]}; end
      `WEA46 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*82 ],dina[`RAM_WIDTH-1-32*82 :0]}; end
      `WEA45 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*83 ],dina[`RAM_WIDTH-1-32*83 :0]}; end
      `WEA44 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*84 ],dina[`RAM_WIDTH-1-32*84 :0]}; end
      `WEA43 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*85 ],dina[`RAM_WIDTH-1-32*85 :0]}; end
      `WEA42 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*86 ],dina[`RAM_WIDTH-1-32*86 :0]}; end
      `WEA41 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*87 ],dina[`RAM_WIDTH-1-32*87 :0]}; end
      `WEA40 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*88 ],dina[`RAM_WIDTH-1-32*88 :0]}; end
      `WEA39 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*89 ],dina[`RAM_WIDTH-1-32*89 :0]}; end
      `WEA38 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*90 ],dina[`RAM_WIDTH-1-32*90 :0]}; end
      `WEA37 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*91 ],dina[`RAM_WIDTH-1-32*91 :0]}; end
      `WEA36 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*92 ],dina[`RAM_WIDTH-1-32*92 :0]}; end
      `WEA35 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*93 ],dina[`RAM_WIDTH-1-32*93 :0]}; end
      `WEA34 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*94 ],dina[`RAM_WIDTH-1-32*94 :0]}; end
      `WEA33 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*95 ],dina[`RAM_WIDTH-1-32*95 :0]}; end
      `WEA32 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*96 ],dina[`RAM_WIDTH-1-32*96 :0]}; end
      `WEA31 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*97 ],dina[`RAM_WIDTH-1-32*97 :0]}; end
      `WEA30 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*98 ],dina[`RAM_WIDTH-1-32*98 :0]}; end
      `WEA29 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*99 ],dina[`RAM_WIDTH-1-32*99 :0]}; end
      `WEA28 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*100],dina[`RAM_WIDTH-1-32*100:0]}; end
      `WEA27 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*101],dina[`RAM_WIDTH-1-32*101:0]}; end
      `WEA26 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*102],dina[`RAM_WIDTH-1-32*102:0]}; end
      `WEA25 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*103],dina[`RAM_WIDTH-1-32*103:0]}; end
      `WEA24 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*104],dina[`RAM_WIDTH-1-32*104:0]}; end
      `WEA23 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*105],dina[`RAM_WIDTH-1-32*105:0]}; end
      `WEA22 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*106],dina[`RAM_WIDTH-1-32*106:0]}; end
      `WEA21 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*107],dina[`RAM_WIDTH-1-32*107:0]}; end
      `WEA20 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*108],dina[`RAM_WIDTH-1-32*108:0]}; end
      `WEA19 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*109],dina[`RAM_WIDTH-1-32*109:0]}; end
      `WEA18 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*110],dina[`RAM_WIDTH-1-32*110:0]}; end
      `WEA17 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*111],dina[`RAM_WIDTH-1-32*111:0]}; end
      `WEA16 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*112],dina[`RAM_WIDTH-1-32*112:0]}; end
      `WEA15 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*113],dina[`RAM_WIDTH-1-32*113:0]}; end
      `WEA14 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*114],dina[`RAM_WIDTH-1-32*114:0]}; end
      `WEA13 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*115],dina[`RAM_WIDTH-1-32*115:0]}; end
      `WEA12 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*116],dina[`RAM_WIDTH-1-32*116:0]}; end
      `WEA11 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*117],dina[`RAM_WIDTH-1-32*117:0]}; end
      `WEA10 : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*118],dina[`RAM_WIDTH-1-32*118:0]}; end
      `WEA9  : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*119],dina[`RAM_WIDTH-1-32*119:0]}; end
      `WEA8  : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*120],dina[`RAM_WIDTH-1-32*120:0]}; end
      `WEA7  : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*121],dina[`RAM_WIDTH-1-32*121:0]}; end
      `WEA6  : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*122],dina[`RAM_WIDTH-1-32*122:0]}; end
      `WEA5  : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*123],dina[`RAM_WIDTH-1-32*123:0]}; end
      `WEA4  : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*124],dina[`RAM_WIDTH-1-32*124:0]}; end
      `WEA3  : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*125],dina[`RAM_WIDTH-1-32*125:0]}; end
      `WEA2  : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*126],dina[`RAM_WIDTH-1-32*126:0]}; end
      `WEA1  : begin ram[addra]={ram[addra][`RAM_WIDTH-1:`RAM_WIDTH-32*127],dina[`RAM_WIDTH-1-32*127:0]}; end
      default : begin ram[addra]<=`RAM_WIDTH'h0; end
    endcase
  end
end
`endif // ST_WIDTH_256

always @(posedge clkb) begin
  if (enb) begin
      doutb <= ram[addrb];
  end
end

endmodule
