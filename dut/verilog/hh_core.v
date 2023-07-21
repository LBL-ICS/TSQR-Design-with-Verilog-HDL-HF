//*********************************************************************************************//
//----------------    hh_core DUT ----------------------------------------------------------////
//---------------- Author: Xiaokun Yang  ----------------------------------------------------////
//---------------- Lawrence Berkeley Lab ----------------------------------------------------////
//---------------- Date: 1/1/2022 -----/-----------------------------------------------------//// 
//----- Version 1: Householder Core -------------------------------------------------------////
//----- Date: 6/1/2022 ----------------/-----------------------------------------------------////
//----- Version 1:                                                   ------------------------////
//----- Date:           ---------------------------------------------------------------------////
//---------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------//
//*********************************************************************************************//
module hh_core (input                         clk                  ,
                input                         rst                  ,
                input  [`CNT_WIDTH-1:0]       hh_cnt               ,
                input                         d1_rdy             ,
                input                         d1_vld             ,
                input                         d2_rdy             ,
                input                         d2_vld             ,
                input                         vk1_rdy             ,
                input                         vk1_vld             ,
                input                         d3_rdy             ,
                input                         d3_vld             ,
                input                         tk_rdy             ,
                input                         tk_vld             ,
                input                         d4_rdy             ,
                input                         d4_vld             ,
                input                         d5_rdy            ,
                input                         d5_vld            ,
                input                         yjp_rdy            ,
                input                         yjp_vld            ,
                input                         yj_sft               ,
                input                         d4_sft               ,
                input                         hh_st            ,
                input                         mem0_fi              ,
                input                         mem1_fi              ,
                input                         dmx0_mem_ena         ,
                input  [`RAM_WEA_WIDTH-1:0]   dmx0_mem_wea         ,
                input  [`RAM_ADDR_WIDTH-1:0]  dmx0_mem_addra       ,
                input  [`RAM_WIDTH-1:0]       dmx0_mem_dina        ,
                input                         dmx0_mem_enb         ,
                input  [`RAM_ADDR_WIDTH-1:0]  dmx0_mem_addrb       ,
                output [`RAM_WIDTH-1:0]       dmx0_mem_doutb       ,
                input                         dmx1_mem_ena         ,
                input  [`RAM_WEA_WIDTH-1:0]   dmx1_mem_wea         ,
                input  [`RAM_ADDR_WIDTH-1:0]  dmx1_mem_addra       ,
                input  [`RAM_WIDTH-1:0]       dmx1_mem_dina        ,
                input                         dmx1_mem_enb         ,
                input  [`RAM_ADDR_WIDTH-1:0]  dmx1_mem_addrb       ,
                output [`RAM_WIDTH-1:0]       dmx1_mem_doutb       ,
                input                         rtri_mem_ena         ,
                input  [`RAM_WEA_WIDTH-1:0]   rtri_mem_wea         ,
                input  [`RAM_ADDR_WIDTH-1:0]  rtri_mem_addra       ,
                input  [`RAM_WIDTH-1:0]       rtri_mem_dina        ,
                input                         rtri_mem_enb         ,
                input  [`RAM_ADDR_WIDTH-1:0]  rtri_mem_addrb       ,
                output [`RAM_WIDTH-1:0]       rtri_mem_doutb       ,
                input  [2*`RAM_WIDTH-1:0]     hh_dout              ); 

// ---------------------------------------------
// ---- update hh_din data ---------------------
// ---------------------------------------------
reg hh0_din_rdy ;
reg hh1_din_rdy ;
wire [2*`RAM_WIDTH-1:0] hh_din        ;
reg  [2*`RAM_WIDTH-1:0] hh_din_reg    ;
reg  [2*`RAM_WIDTH-1:0] hh_din_update ;
reg  [2*`RAM_WIDTH-1:0] hh_dout_update;
always @(posedge clk)begin
  if(rst) begin
    hh0_din_rdy <= 1'b0                ;
    hh1_din_rdy <= 1'b0                ;
    hh_din_reg  <= 2*`RAM_WIDTH'h0     ; 
  end else begin
    hh0_din_rdy <= dmx0_mem_enb&rtri_mem_enb;
    hh1_din_rdy <= dmx1_mem_enb&rtri_mem_enb;
    hh_din_reg  <= hh_din                   ; 
  end
end

assign hh_din = (hh0_din_rdy | hh1_din_rdy) ? hh_din_update : 
                                                      hh_st ? hh_dout_update : hh_din_reg;

wire [`RAM_WIDTH-1:0] dmx_mem_doutb = hh0_din_rdy ? dmx0_mem_doutb : 
                                                   hh1_din_rdy ? dmx1_mem_doutb : `RAM_WIDTH'h0;

always @(rst, hh_cnt, hh0_din_rdy, hh1_din_rdy, rtri_mem_doutb, dmx_mem_doutb) begin
  if(rst) begin
    hh_din_update=2*`RAM_WIDTH'h0     ; 
  end else if(hh0_din_rdy|hh1_din_rdy) begin
  case (hh_cnt) 
`ifdef ST_WIDTH_INF_16
    8'd0  :  begin hh_din_update = {{0{32'h0}  }, rtri_mem_doutb[`RAM_WIDTH-0*32-1:0]  , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd1  :  begin hh_din_update = {{1{32'h0}  }, rtri_mem_doutb[`RAM_WIDTH-1*32-1:0]  , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd2  :  begin hh_din_update = {{2{32'h0}  }, rtri_mem_doutb[`RAM_WIDTH-2*32-1:0]  , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd3  :  begin hh_din_update = {{3{32'h0}  }, rtri_mem_doutb[`RAM_WIDTH-3*32-1:0]  , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd4  :  begin hh_din_update = {{4{32'h0}  }, rtri_mem_doutb[`RAM_WIDTH-4*32-1:0]  , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd5  :  begin hh_din_update = {{5{32'h0}  }, rtri_mem_doutb[`RAM_WIDTH-5*32-1:0]  , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd6  :  begin hh_din_update = {{6{32'h0}  }, rtri_mem_doutb[`RAM_WIDTH-6*32-1:0]  , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd7  :  begin hh_din_update = {{7{32'h0}  }, rtri_mem_doutb[`RAM_WIDTH-7*32-1:0]  , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
`endif // ST_WIDTH_INF_16
`ifdef ST_WIDTH_INF_32
    8'd8  :  begin hh_din_update = {{8{32'h0}  }, rtri_mem_doutb[`RAM_WIDTH-8*32-1:0]  , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd9  :  begin hh_din_update = {{9{32'h0}  }, rtri_mem_doutb[`RAM_WIDTH-9*32-1:0]  , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd10 :  begin hh_din_update = {{10{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-10*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd11 :  begin hh_din_update = {{11{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-11*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd12 :  begin hh_din_update = {{12{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-12*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd13 :  begin hh_din_update = {{13{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-13*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd14 :  begin hh_din_update = {{14{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-14*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd15 :  begin hh_din_update = {{15{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-15*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
`endif // ST_WIDTH_INF_32
`ifdef ST_WIDTH_INF_64
    8'd16 :  begin hh_din_update = {{16{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-16*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd17 :  begin hh_din_update = {{17{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-17*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd18 :  begin hh_din_update = {{18{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-18*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd19 :  begin hh_din_update = {{19{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-19*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd20 :  begin hh_din_update = {{20{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-20*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd21 :  begin hh_din_update = {{21{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-21*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd22 :  begin hh_din_update = {{22{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-22*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd23 :  begin hh_din_update = {{23{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-23*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd24 :  begin hh_din_update = {{24{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-24*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd25 :  begin hh_din_update = {{25{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-25*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd26 :  begin hh_din_update = {{26{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-26*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd27 :  begin hh_din_update = {{27{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-27*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd28 :  begin hh_din_update = {{28{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-28*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd29 :  begin hh_din_update = {{29{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-29*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd30 :  begin hh_din_update = {{30{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-30*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd31 :  begin hh_din_update = {{31{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-31*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
`endif // ST_WIDTH_INF_64
`ifdef ST_WIDTH_INF_128
    8'd32 :  begin hh_din_update = {{32{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-32*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd33 :  begin hh_din_update = {{33{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-33*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd34 :  begin hh_din_update = {{34{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-34*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd35 :  begin hh_din_update = {{35{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-35*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd36 :  begin hh_din_update = {{36{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-36*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd37 :  begin hh_din_update = {{37{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-37*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd38 :  begin hh_din_update = {{38{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-38*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd39 :  begin hh_din_update = {{39{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-39*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd40 :  begin hh_din_update = {{40{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-40*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd41 :  begin hh_din_update = {{41{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-41*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd42 :  begin hh_din_update = {{42{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-42*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd43 :  begin hh_din_update = {{43{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-43*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd44 :  begin hh_din_update = {{44{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-44*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd45 :  begin hh_din_update = {{45{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-45*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd46 :  begin hh_din_update = {{46{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-46*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd47 :  begin hh_din_update = {{47{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-47*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd48 :  begin hh_din_update = {{48{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-48*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd49 :  begin hh_din_update = {{49{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-49*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd50 :  begin hh_din_update = {{50{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-50*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd51 :  begin hh_din_update = {{51{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-51*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd52 :  begin hh_din_update = {{52{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-52*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd53 :  begin hh_din_update = {{53{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-53*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd54 :  begin hh_din_update = {{54{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-54*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd55 :  begin hh_din_update = {{55{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-55*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd56 :  begin hh_din_update = {{56{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-56*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd57 :  begin hh_din_update = {{57{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-57*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd58 :  begin hh_din_update = {{58{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-58*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd59 :  begin hh_din_update = {{59{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-59*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd60 :  begin hh_din_update = {{60{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-60*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd61 :  begin hh_din_update = {{61{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-61*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd62 :  begin hh_din_update = {{62{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-62*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd63 :  begin hh_din_update = {{63{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-63*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
`endif // ST_WIDTH_INF_128
`ifdef ST_WIDTH_INF_256
    8'd64 :  begin hh_din_update = {{64{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-64*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd65 :  begin hh_din_update = {{65{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-65*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd66 :  begin hh_din_update = {{66{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-66*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd67 :  begin hh_din_update = {{67{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-67*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd68 :  begin hh_din_update = {{68{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-68*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd69 :  begin hh_din_update = {{69{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-69*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd70 :  begin hh_din_update = {{70{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-70*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd71 :  begin hh_din_update = {{71{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-71*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd72 :  begin hh_din_update = {{72{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-72*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd73 :  begin hh_din_update = {{73{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-73*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd74 :  begin hh_din_update = {{74{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-74*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd75 :  begin hh_din_update = {{75{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-75*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd76 :  begin hh_din_update = {{76{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-76*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd77 :  begin hh_din_update = {{77{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-77*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd78 :  begin hh_din_update = {{78{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-78*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd79 :  begin hh_din_update = {{79{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-79*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd80 :  begin hh_din_update = {{80{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-80*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd81 :  begin hh_din_update = {{81{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-81*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd82 :  begin hh_din_update = {{82{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-82*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd83 :  begin hh_din_update = {{83{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-83*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd84 :  begin hh_din_update = {{84{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-84*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd85 :  begin hh_din_update = {{85{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-85*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd86 :  begin hh_din_update = {{86{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-86*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd87 :  begin hh_din_update = {{87{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-87*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd88 :  begin hh_din_update = {{88{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-88*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd89 :  begin hh_din_update = {{89{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-89*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd90 :  begin hh_din_update = {{90{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-90*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd91 :  begin hh_din_update = {{91{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-91*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd92 :  begin hh_din_update = {{92{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-92*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd93 :  begin hh_din_update = {{93{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-93*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd94 :  begin hh_din_update = {{94{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-94*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd95 :  begin hh_din_update = {{95{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-95*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd96 :  begin hh_din_update = {{96{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-96*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd97 :  begin hh_din_update = {{97{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-97*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd98 :  begin hh_din_update = {{98{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-98*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd99 :  begin hh_din_update = {{99{32'h0} }, rtri_mem_doutb[`RAM_WIDTH-99*32-1:0] , dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd100:  begin hh_din_update = {{100{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-100*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd101:  begin hh_din_update = {{101{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-101*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd102:  begin hh_din_update = {{102{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-102*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd103:  begin hh_din_update = {{103{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-103*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd104:  begin hh_din_update = {{104{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-104*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd105:  begin hh_din_update = {{105{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-105*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd106:  begin hh_din_update = {{106{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-106*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd107:  begin hh_din_update = {{107{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-107*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd108:  begin hh_din_update = {{108{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-108*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd109:  begin hh_din_update = {{109{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-109*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd110:  begin hh_din_update = {{110{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-110*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd111:  begin hh_din_update = {{111{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-111*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd112:  begin hh_din_update = {{112{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-112*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd113:  begin hh_din_update = {{113{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-113*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd114:  begin hh_din_update = {{114{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-114*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd115:  begin hh_din_update = {{115{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-115*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd116:  begin hh_din_update = {{116{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-116*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd117:  begin hh_din_update = {{117{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-117*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd118:  begin hh_din_update = {{118{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-118*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd119:  begin hh_din_update = {{119{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-119*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd120:  begin hh_din_update = {{120{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-120*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd121:  begin hh_din_update = {{121{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-121*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd122:  begin hh_din_update = {{122{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-122*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd123:  begin hh_din_update = {{123{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-123*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd124:  begin hh_din_update = {{124{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-124*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd125:  begin hh_din_update = {{125{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-125*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd126:  begin hh_din_update = {{126{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-126*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
    8'd127:  begin hh_din_update = {{127{32'h0}}, rtri_mem_doutb[`RAM_WIDTH-127*32-1:0], dmx_mem_doutb[`RAM_WIDTH-1:0]} ; end
`endif //ST_WIDTH_INF_256
    default: begin hh_din_update=2*`RAM_WIDTH'h0     ; end
  endcase
  //end else begin
  //  hh_din_update=2*`RAM_WIDTH'h0     ; 
  end
end

always @(rst, hh_cnt, hh_st, hh_dout) begin
  if(rst) begin
    hh_dout_update=2*`RAM_WIDTH'h0     ; 
  end else if(hh_st) begin
  case (hh_cnt) 
`ifdef ST_WIDTH_INF_16
    8'd0  :  begin hh_dout_update = {{0{32'h0}  }, hh_dout[2*`RAM_WIDTH-0*32-1:0]  } ; end
    8'd1  :  begin hh_dout_update = {{1{32'h0}  }, hh_dout[2*`RAM_WIDTH-1*32-1:0]  } ; end
    8'd2  :  begin hh_dout_update = {{2{32'h0}  }, hh_dout[2*`RAM_WIDTH-2*32-1:0]  } ; end
    8'd3  :  begin hh_dout_update = {{3{32'h0}  }, hh_dout[2*`RAM_WIDTH-3*32-1:0]  } ; end
    8'd4  :  begin hh_dout_update = {{4{32'h0}  }, hh_dout[2*`RAM_WIDTH-4*32-1:0]  } ; end
    8'd5  :  begin hh_dout_update = {{5{32'h0}  }, hh_dout[2*`RAM_WIDTH-5*32-1:0]  } ; end
    8'd6  :  begin hh_dout_update = {{6{32'h0}  }, hh_dout[2*`RAM_WIDTH-6*32-1:0]  } ; end
    8'd7  :  begin hh_dout_update = {{7{32'h0}  }, hh_dout[2*`RAM_WIDTH-7*32-1:0]  } ; end
`endif // ST_WIDTH_INF_16
`ifdef ST_WIDTH_INF_32
    8'd8  :  begin hh_dout_update = {{8{32'h0}  }, hh_dout[2*`RAM_WIDTH-8*32-1:0]  } ; end
    8'd9  :  begin hh_dout_update = {{9{32'h0}  }, hh_dout[2*`RAM_WIDTH-9*32-1:0]  } ; end
    8'd10 :  begin hh_dout_update = {{10{32'h0} }, hh_dout[2*`RAM_WIDTH-10*32-1:0] } ; end
    8'd11 :  begin hh_dout_update = {{11{32'h0} }, hh_dout[2*`RAM_WIDTH-11*32-1:0] } ; end
    8'd12 :  begin hh_dout_update = {{12{32'h0} }, hh_dout[2*`RAM_WIDTH-12*32-1:0] } ; end
    8'd13 :  begin hh_dout_update = {{13{32'h0} }, hh_dout[2*`RAM_WIDTH-13*32-1:0] } ; end
    8'd14 :  begin hh_dout_update = {{14{32'h0} }, hh_dout[2*`RAM_WIDTH-14*32-1:0] } ; end
    8'd15 :  begin hh_dout_update = {{15{32'h0} }, hh_dout[2*`RAM_WIDTH-15*32-1:0] } ; end
`endif // ST_WIDTH_INF_32
`ifdef ST_WIDTH_INF_64
    8'd16 :  begin hh_dout_update = {{16{32'h0} }, hh_dout[2*`RAM_WIDTH-16*32-1:0] } ; end
    8'd17 :  begin hh_dout_update = {{17{32'h0} }, hh_dout[2*`RAM_WIDTH-17*32-1:0] } ; end
    8'd18 :  begin hh_dout_update = {{18{32'h0} }, hh_dout[2*`RAM_WIDTH-18*32-1:0] } ; end
    8'd19 :  begin hh_dout_update = {{19{32'h0} }, hh_dout[2*`RAM_WIDTH-19*32-1:0] } ; end
    8'd20 :  begin hh_dout_update = {{20{32'h0} }, hh_dout[2*`RAM_WIDTH-20*32-1:0] } ; end
    8'd21 :  begin hh_dout_update = {{21{32'h0} }, hh_dout[2*`RAM_WIDTH-21*32-1:0] } ; end
    8'd22 :  begin hh_dout_update = {{22{32'h0} }, hh_dout[2*`RAM_WIDTH-22*32-1:0] } ; end
    8'd23 :  begin hh_dout_update = {{23{32'h0} }, hh_dout[2*`RAM_WIDTH-23*32-1:0] } ; end
    8'd24 :  begin hh_dout_update = {{24{32'h0} }, hh_dout[2*`RAM_WIDTH-24*32-1:0] } ; end
    8'd25 :  begin hh_dout_update = {{25{32'h0} }, hh_dout[2*`RAM_WIDTH-25*32-1:0] } ; end
    8'd26 :  begin hh_dout_update = {{26{32'h0} }, hh_dout[2*`RAM_WIDTH-26*32-1:0] } ; end
    8'd27 :  begin hh_dout_update = {{27{32'h0} }, hh_dout[2*`RAM_WIDTH-27*32-1:0] } ; end
    8'd28 :  begin hh_dout_update = {{28{32'h0} }, hh_dout[2*`RAM_WIDTH-28*32-1:0] } ; end
    8'd29 :  begin hh_dout_update = {{29{32'h0} }, hh_dout[2*`RAM_WIDTH-29*32-1:0] } ; end
    8'd30 :  begin hh_dout_update = {{30{32'h0} }, hh_dout[2*`RAM_WIDTH-30*32-1:0] } ; end
    8'd31 :  begin hh_dout_update = {{31{32'h0} }, hh_dout[2*`RAM_WIDTH-31*32-1:0] } ; end
`endif // ST_WIDTH_INF_64
`ifdef ST_WIDTH_INF_128
    8'd32 :  begin hh_dout_update = {{32{32'h0} }, hh_dout[2*`RAM_WIDTH-32*32-1:0] } ; end
    8'd33 :  begin hh_dout_update = {{33{32'h0} }, hh_dout[2*`RAM_WIDTH-33*32-1:0] } ; end
    8'd34 :  begin hh_dout_update = {{34{32'h0} }, hh_dout[2*`RAM_WIDTH-34*32-1:0] } ; end
    8'd35 :  begin hh_dout_update = {{35{32'h0} }, hh_dout[2*`RAM_WIDTH-35*32-1:0] } ; end
    8'd36 :  begin hh_dout_update = {{36{32'h0} }, hh_dout[2*`RAM_WIDTH-36*32-1:0] } ; end
    8'd37 :  begin hh_dout_update = {{37{32'h0} }, hh_dout[2*`RAM_WIDTH-37*32-1:0] } ; end
    8'd38 :  begin hh_dout_update = {{38{32'h0} }, hh_dout[2*`RAM_WIDTH-38*32-1:0] } ; end
    8'd39 :  begin hh_dout_update = {{39{32'h0} }, hh_dout[2*`RAM_WIDTH-39*32-1:0] } ; end
    8'd40 :  begin hh_dout_update = {{40{32'h0} }, hh_dout[2*`RAM_WIDTH-40*32-1:0] } ; end
    8'd41 :  begin hh_dout_update = {{41{32'h0} }, hh_dout[2*`RAM_WIDTH-41*32-1:0] } ; end
    8'd42 :  begin hh_dout_update = {{42{32'h0} }, hh_dout[2*`RAM_WIDTH-42*32-1:0] } ; end
    8'd43 :  begin hh_dout_update = {{43{32'h0} }, hh_dout[2*`RAM_WIDTH-43*32-1:0] } ; end
    8'd44 :  begin hh_dout_update = {{44{32'h0} }, hh_dout[2*`RAM_WIDTH-44*32-1:0] } ; end
    8'd45 :  begin hh_dout_update = {{45{32'h0} }, hh_dout[2*`RAM_WIDTH-45*32-1:0] } ; end
    8'd46 :  begin hh_dout_update = {{46{32'h0} }, hh_dout[2*`RAM_WIDTH-46*32-1:0] } ; end
    8'd47 :  begin hh_dout_update = {{47{32'h0} }, hh_dout[2*`RAM_WIDTH-47*32-1:0] } ; end
    8'd48 :  begin hh_dout_update = {{48{32'h0} }, hh_dout[2*`RAM_WIDTH-48*32-1:0] } ; end
    8'd49 :  begin hh_dout_update = {{49{32'h0} }, hh_dout[2*`RAM_WIDTH-49*32-1:0] } ; end
    8'd50 :  begin hh_dout_update = {{50{32'h0} }, hh_dout[2*`RAM_WIDTH-50*32-1:0] } ; end
    8'd51 :  begin hh_dout_update = {{51{32'h0} }, hh_dout[2*`RAM_WIDTH-51*32-1:0] } ; end
    8'd52 :  begin hh_dout_update = {{52{32'h0} }, hh_dout[2*`RAM_WIDTH-52*32-1:0] } ; end
    8'd53 :  begin hh_dout_update = {{53{32'h0} }, hh_dout[2*`RAM_WIDTH-53*32-1:0] } ; end
    8'd54 :  begin hh_dout_update = {{54{32'h0} }, hh_dout[2*`RAM_WIDTH-54*32-1:0] } ; end
    8'd55 :  begin hh_dout_update = {{55{32'h0} }, hh_dout[2*`RAM_WIDTH-55*32-1:0] } ; end
    8'd56 :  begin hh_dout_update = {{56{32'h0} }, hh_dout[2*`RAM_WIDTH-56*32-1:0] } ; end
    8'd57 :  begin hh_dout_update = {{57{32'h0} }, hh_dout[2*`RAM_WIDTH-57*32-1:0] } ; end
    8'd58 :  begin hh_dout_update = {{58{32'h0} }, hh_dout[2*`RAM_WIDTH-58*32-1:0] } ; end
    8'd59 :  begin hh_dout_update = {{59{32'h0} }, hh_dout[2*`RAM_WIDTH-59*32-1:0] } ; end
    8'd60 :  begin hh_dout_update = {{60{32'h0} }, hh_dout[2*`RAM_WIDTH-60*32-1:0] } ; end
    8'd61 :  begin hh_dout_update = {{61{32'h0} }, hh_dout[2*`RAM_WIDTH-61*32-1:0] } ; end
    8'd62 :  begin hh_dout_update = {{62{32'h0} }, hh_dout[2*`RAM_WIDTH-62*32-1:0] } ; end
    8'd63 :  begin hh_dout_update = {{63{32'h0} }, hh_dout[2*`RAM_WIDTH-63*32-1:0] } ; end
`endif // ST_WIDTH_INF_128
`ifdef ST_WIDTH_INF_256
    8'd64 :  begin hh_dout_update = {{64{32'h0} }, hh_dout[2*`RAM_WIDTH-64*32-1:0] } ; end
    8'd65 :  begin hh_dout_update = {{65{32'h0} }, hh_dout[2*`RAM_WIDTH-65*32-1:0] } ; end
    8'd66 :  begin hh_dout_update = {{66{32'h0} }, hh_dout[2*`RAM_WIDTH-66*32-1:0] } ; end
    8'd67 :  begin hh_dout_update = {{67{32'h0} }, hh_dout[2*`RAM_WIDTH-67*32-1:0] } ; end
    8'd68 :  begin hh_dout_update = {{68{32'h0} }, hh_dout[2*`RAM_WIDTH-68*32-1:0] } ; end
    8'd69 :  begin hh_dout_update = {{69{32'h0} }, hh_dout[2*`RAM_WIDTH-69*32-1:0] } ; end
    8'd70 :  begin hh_dout_update = {{70{32'h0} }, hh_dout[2*`RAM_WIDTH-70*32-1:0] } ; end
    8'd71 :  begin hh_dout_update = {{71{32'h0} }, hh_dout[2*`RAM_WIDTH-71*32-1:0] } ; end
    8'd72 :  begin hh_dout_update = {{72{32'h0} }, hh_dout[2*`RAM_WIDTH-72*32-1:0] } ; end
    8'd73 :  begin hh_dout_update = {{73{32'h0} }, hh_dout[2*`RAM_WIDTH-73*32-1:0] } ; end
    8'd74 :  begin hh_dout_update = {{74{32'h0} }, hh_dout[2*`RAM_WIDTH-74*32-1:0] } ; end
    8'd75 :  begin hh_dout_update = {{75{32'h0} }, hh_dout[2*`RAM_WIDTH-75*32-1:0] } ; end
    8'd76 :  begin hh_dout_update = {{76{32'h0} }, hh_dout[2*`RAM_WIDTH-76*32-1:0] } ; end
    8'd77 :  begin hh_dout_update = {{77{32'h0} }, hh_dout[2*`RAM_WIDTH-77*32-1:0] } ; end
    8'd78 :  begin hh_dout_update = {{78{32'h0} }, hh_dout[2*`RAM_WIDTH-78*32-1:0] } ; end
    8'd79 :  begin hh_dout_update = {{79{32'h0} }, hh_dout[2*`RAM_WIDTH-79*32-1:0] } ; end
    8'd80 :  begin hh_dout_update = {{80{32'h0} }, hh_dout[2*`RAM_WIDTH-80*32-1:0] } ; end
    8'd81 :  begin hh_dout_update = {{81{32'h0} }, hh_dout[2*`RAM_WIDTH-81*32-1:0] } ; end
    8'd82 :  begin hh_dout_update = {{82{32'h0} }, hh_dout[2*`RAM_WIDTH-82*32-1:0] } ; end
    8'd83 :  begin hh_dout_update = {{83{32'h0} }, hh_dout[2*`RAM_WIDTH-83*32-1:0] } ; end
    8'd84 :  begin hh_dout_update = {{84{32'h0} }, hh_dout[2*`RAM_WIDTH-84*32-1:0] } ; end
    8'd85 :  begin hh_dout_update = {{85{32'h0} }, hh_dout[2*`RAM_WIDTH-85*32-1:0] } ; end
    8'd86 :  begin hh_dout_update = {{86{32'h0} }, hh_dout[2*`RAM_WIDTH-86*32-1:0] } ; end
    8'd87 :  begin hh_dout_update = {{87{32'h0} }, hh_dout[2*`RAM_WIDTH-87*32-1:0] } ; end
    8'd88 :  begin hh_dout_update = {{88{32'h0} }, hh_dout[2*`RAM_WIDTH-88*32-1:0] } ; end
    8'd89 :  begin hh_dout_update = {{89{32'h0} }, hh_dout[2*`RAM_WIDTH-89*32-1:0] } ; end
    8'd90 :  begin hh_dout_update = {{90{32'h0} }, hh_dout[2*`RAM_WIDTH-90*32-1:0] } ; end
    8'd91 :  begin hh_dout_update = {{91{32'h0} }, hh_dout[2*`RAM_WIDTH-91*32-1:0] } ; end
    8'd92 :  begin hh_dout_update = {{92{32'h0} }, hh_dout[2*`RAM_WIDTH-92*32-1:0] } ; end
    8'd93 :  begin hh_dout_update = {{93{32'h0} }, hh_dout[2*`RAM_WIDTH-93*32-1:0] } ; end
    8'd94 :  begin hh_dout_update = {{94{32'h0} }, hh_dout[2*`RAM_WIDTH-94*32-1:0] } ; end
    8'd95 :  begin hh_dout_update = {{95{32'h0} }, hh_dout[2*`RAM_WIDTH-95*32-1:0] } ; end
    8'd96 :  begin hh_dout_update = {{96{32'h0} }, hh_dout[2*`RAM_WIDTH-96*32-1:0] } ; end
    8'd97 :  begin hh_dout_update = {{97{32'h0} }, hh_dout[2*`RAM_WIDTH-97*32-1:0] } ; end
    8'd98 :  begin hh_dout_update = {{98{32'h0} }, hh_dout[2*`RAM_WIDTH-98*32-1:0] } ; end
    8'd99 :  begin hh_dout_update = {{99{32'h0} }, hh_dout[2*`RAM_WIDTH-99*32-1:0] } ; end
    8'd100:  begin hh_dout_update = {{100{32'h0}}, hh_dout[2*`RAM_WIDTH-100*32-1:0]} ; end
    8'd101:  begin hh_dout_update = {{101{32'h0}}, hh_dout[2*`RAM_WIDTH-101*32-1:0]} ; end
    8'd102:  begin hh_dout_update = {{102{32'h0}}, hh_dout[2*`RAM_WIDTH-102*32-1:0]} ; end
    8'd103:  begin hh_dout_update = {{103{32'h0}}, hh_dout[2*`RAM_WIDTH-103*32-1:0]} ; end
    8'd104:  begin hh_dout_update = {{104{32'h0}}, hh_dout[2*`RAM_WIDTH-104*32-1:0]} ; end
    8'd105:  begin hh_dout_update = {{105{32'h0}}, hh_dout[2*`RAM_WIDTH-105*32-1:0]} ; end
    8'd106:  begin hh_dout_update = {{106{32'h0}}, hh_dout[2*`RAM_WIDTH-106*32-1:0]} ; end
    8'd107:  begin hh_dout_update = {{107{32'h0}}, hh_dout[2*`RAM_WIDTH-107*32-1:0]} ; end
    8'd108:  begin hh_dout_update = {{108{32'h0}}, hh_dout[2*`RAM_WIDTH-108*32-1:0]} ; end
    8'd109:  begin hh_dout_update = {{109{32'h0}}, hh_dout[2*`RAM_WIDTH-109*32-1:0]} ; end
    8'd110:  begin hh_dout_update = {{110{32'h0}}, hh_dout[2*`RAM_WIDTH-110*32-1:0]} ; end
    8'd111:  begin hh_dout_update = {{111{32'h0}}, hh_dout[2*`RAM_WIDTH-111*32-1:0]} ; end
    8'd112:  begin hh_dout_update = {{112{32'h0}}, hh_dout[2*`RAM_WIDTH-112*32-1:0]} ; end
    8'd113:  begin hh_dout_update = {{113{32'h0}}, hh_dout[2*`RAM_WIDTH-113*32-1:0]} ; end
    8'd114:  begin hh_dout_update = {{114{32'h0}}, hh_dout[2*`RAM_WIDTH-114*32-1:0]} ; end
    8'd115:  begin hh_dout_update = {{115{32'h0}}, hh_dout[2*`RAM_WIDTH-115*32-1:0]} ; end
    8'd116:  begin hh_dout_update = {{116{32'h0}}, hh_dout[2*`RAM_WIDTH-116*32-1:0]} ; end
    8'd117:  begin hh_dout_update = {{117{32'h0}}, hh_dout[2*`RAM_WIDTH-117*32-1:0]} ; end
    8'd118:  begin hh_dout_update = {{118{32'h0}}, hh_dout[2*`RAM_WIDTH-118*32-1:0]} ; end
    8'd119:  begin hh_dout_update = {{119{32'h0}}, hh_dout[2*`RAM_WIDTH-119*32-1:0]} ; end
    8'd120:  begin hh_dout_update = {{120{32'h0}}, hh_dout[2*`RAM_WIDTH-120*32-1:0]} ; end
    8'd121:  begin hh_dout_update = {{121{32'h0}}, hh_dout[2*`RAM_WIDTH-121*32-1:0]} ; end
    8'd122:  begin hh_dout_update = {{122{32'h0}}, hh_dout[2*`RAM_WIDTH-122*32-1:0]} ; end
    8'd123:  begin hh_dout_update = {{123{32'h0}}, hh_dout[2*`RAM_WIDTH-123*32-1:0]} ; end
    8'd124:  begin hh_dout_update = {{124{32'h0}}, hh_dout[2*`RAM_WIDTH-124*32-1:0]} ; end
    8'd125:  begin hh_dout_update = {{125{32'h0}}, hh_dout[2*`RAM_WIDTH-125*32-1:0]} ; end
    8'd126:  begin hh_dout_update = {{126{32'h0}}, hh_dout[2*`RAM_WIDTH-126*32-1:0]} ; end
    8'd127:  begin hh_dout_update = {{127{32'h0}}, hh_dout[2*`RAM_WIDTH-127*32-1:0]} ; end
`endif //ST_WIDTH_INF_256
    default: begin hh_dout_update=2*`RAM_WIDTH'h0     ; end
  endcase
  //end else begin
  //  hh_dout_update=2*`RAM_WIDTH'h0     ; 
  end
end

   
`ifdef VIVADO_BLK_RAM
blk_mem_gen_0 u_dmx0   ( .clka  (clk               ),
                         .ena   (dmx0_mem_ena      ),
		         .wea   (dmx0_mem_wea      ), //
		         .addra (dmx0_mem_addra    ),
		         .dina  (dmx0_mem_dina     ),
                         .clkb  (clk               ),
		         .enb   (dmx0_mem_enb      ),
		         .addrb (dmx0_mem_addrb    ),
		         .doutb (dmx0_mem_doutb   ));

blk_mem_gen_1 u_dmx1   ( .clka  (clk               ),
                         .ena   (dmx1_mem_ena      ),
		         .wea   (dmx1_mem_wea      ),
		         .addra (dmx1_mem_addra    ),
		         .dina  (dmx1_mem_dina     ),
                         .clkb  (clk               ),
		         .enb   (dmx1_mem_enb      ),
		         .addrb (dmx1_mem_addrb    ),
		         .doutb (dmx1_mem_doutb   ));

blk_mem_gen_2 u_rtri   ( .clka  (clk               ),
                         .ena   (rtri_mem_ena      ),
		         .wea   (rtri_mem_wea      ),
		         .addra (rtri_mem_addra    ),
		         .dina  (rtri_mem_dina     ),
                         .clkb  (clk               ),
		         .enb   (rtri_mem_enb      ),
		         .addrb (rtri_mem_addrb    ),
		         .doutb (rtri_mem_doutb   ));

`else
simple_dual u_dmx0     ( .clka  (clk               ),
                         .ena   (dmx0_mem_ena      ),
		         .wea   (dmx0_mem_wea      ),
		         .addra (dmx0_mem_addra    ),
		         .dina  (dmx0_mem_dina     ),
                         .clkb  (clk               ),
		         .enb   (dmx0_mem_enb      ),
		         .addrb (dmx0_mem_addrb    ),
		         .doutb (dmx0_mem_doutb   ));

simple_dual u_dmx1     ( .clka  (clk               ),
                         .ena   (dmx1_mem_ena      ),
		         .wea   (dmx1_mem_wea      ),
		         .addra (dmx1_mem_addra    ),
		         .dina  (dmx1_mem_dina     ),
                         .clkb  (clk               ),
		         .enb   (dmx1_mem_enb      ),
		         .addrb (dmx1_mem_addrb    ),
		         .doutb (dmx1_mem_doutb   ));

simple_dual u_rtri     ( .clka  (clk               ),
                         .ena   (rtri_mem_ena      ),
		         .wea   (rtri_mem_wea      ),
		         .addra (rtri_mem_addra    ),
		         .dina  (rtri_mem_dina     ),
                         .clkb  (clk               ),
		         .enb   (rtri_mem_enb      ),
		         .addrb (rtri_mem_addrb    ),
		         .doutb (rtri_mem_doutb   ));
`endif

hh_datapath u_hh_datapath (.clk          (clk       ),
                           .rst          (rst       ),
                           .hh_cnt       (hh_cnt    ),
                           .d1_rdy       (d1_rdy    ),
                           .d1_vld       (d1_vld    ),
                           .d2_rdy       (d2_rdy    ),
                           .d2_vld       (d2_vld    ),
                           .vk1_rdy      (vk1_rdy   ),
                           .vk1_vld      (vk1_vld   ),
                           .d3_rdy       (d3_rdy    ),
                           .d3_vld       (d3_vld    ),
                           .tk_rdy       (tk_rdy    ),
                           .tk_vld       (tk_vld    ),
                           .d4_rdy       (d4_rdy    ),
                           .d4_vld       (d4_vld    ),
                           .d5_rdy       (d5_rdy    ),
                           .d5_vld       (d5_vld    ),
                           .yjp_rdy      (yjp_rdy   ),
                           .yjp_vld      (yjp_vld   ),
                           .yj_sft       (yj_sft    ),
                           .d4_sft       (d4_sft    ),
	                   .hh_din       (hh_din    ),
	                   .hh_dout      (hh_dout   ));

endmodule
