////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: fifo_generator_v4_4.v
// /___/   /\     Timestamp: Tue May 11 06:11:50 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog /root/fifo/tmp/_cg/fifo_generator_v4_4.ngc /root/fifo/tmp/_cg/fifo_generator_v4_4.v 
// Device	: 2vp50ff1152-7
// Input file	: /root/fifo/tmp/_cg/fifo_generator_v4_4.ngc
// Output file	: /root/fifo/tmp/_cg/fifo_generator_v4_4.v
// # of Modules	: 1
// Design Name	: fifo_generator_v4_4
// Xilinx        : /opt/Xilinx/10.1/ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module fifo_generator_v4_4 (
  valid, rd_en, wr_en, full, empty, clk, wr_ack, rst, dout, din, data_count
);
  output valid;
  input rd_en;
  input wr_en;
  output full;
  output empty;
  input clk;
  output wr_ack;
  input rst;
  output [31 : 0] dout;
  input [31 : 0] din;
  output [9 : 0] data_count;
  
  // synthesis translate_off
  
  wire NlwRenamedSig_OI_empty;
  wire \BU2/N6 ;
  wire \BU2/N5 ;
  wire \BU2/U0/grf.rf/mem/tmp_ram_rd_en ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count ;
  wire \BU2/N01 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<0>_rt_261 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<1>_rt_260 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<2>_rt_258 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<3>_rt_256 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<4>_rt_254 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<5>_rt_252 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<6>_rt_250 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<7>_rt_248 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<8>_rt_246 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<9>_rt_244 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count2 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count1 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count3 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count4 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count7 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count5 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count6 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count8 ;
  wire \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count9 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<0>_rt_212 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<1>_rt_211 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<2>_rt_209 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<3>_rt_207 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<4>_rt_205 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<5>_rt_203 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<6>_rt_201 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<7>_rt_199 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<8>_rt_197 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<9>_rt_195 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count2 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count1 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count3 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count4 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count7 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count5 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count6 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count8 ;
  wire \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count9 ;
  wire \BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/comp1 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<0>1_1_162 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<1>1_1_161 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<2>1_1_159 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<3>1_1_157 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/comp0 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<4>1_1_154 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/comp1 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/comp0 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count10 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count9 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count8 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count7 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count6 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count5 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count4 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count3 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count2 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count1 ;
  wire \BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_102 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_100 ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_comb ;
  wire \BU2/U0/grf.rf/gl0.wr/gwss.wsts/wr_rst_d1_98 ;
  wire \BU2/U0/grf.rf/gl0.rd/grhf.rhf/ram_valid_d1_mux0001 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ;
  wire \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000 ;
  wire \BU2/U0/grf.rf/rstblk/wr_rst_comb ;
  wire \BU2/U0/grf.rf/rstblk/rd_rst_reg[0] ;
  wire \BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ;
  wire \BU2/U0/grf.rf/rstblk/rd_rst_comb ;
  wire \BU2/U0/grf.rf/rstblk/wr_rst_asreg_89 ;
  wire \BU2/U0/grf.rf/rstblk/rd_rst_asreg_88 ;
  wire \BU2/U0/grf.rf/rstblk/wr_rst_asreg_d2_87 ;
  wire \BU2/U0/grf.rf/rstblk/wr_rst_asreg_d1_86 ;
  wire \BU2/U0/grf.rf/rstblk/rd_rst_asreg_d2_85 ;
  wire \BU2/U0/grf.rf/rstblk/rd_rst_asreg_d1_84 ;
  wire \BU2/N0_inv ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOPA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOB<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOB<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOPB<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOPB<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOPA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOPA<0>_UNCONNECTED ;
  wire [31 : 0] din_2;
  wire [9 : 0] NlwRenamedSig_OI_data_count;
  wire [31 : 0] dout_3;
  wire [9 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 ;
  wire [8 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy ;
  wire [9 : 0] \BU2/U0/grf.rf/gl0.wr/wpntr/count ;
  wire [9 : 0] \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 ;
  wire [8 : 0] \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy ;
  wire [9 : 0] \BU2/U0/grf.rf/gl0.rd/rpntr/count ;
  wire [4 : 0] \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 ;
  wire [3 : 0] \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/carrynet ;
  wire [3 : 0] \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/carrynet ;
  wire [4 : 0] \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 ;
  wire [3 : 0] \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/carrynet ;
  wire [4 : 0] \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 ;
  wire [3 : 0] \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/carrynet ;
  wire [9 : 0] \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut ;
  wire [8 : 0] \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy ;
  wire [1 : 1] \BU2/U0/grf.rf/rstblk/wr_rst_reg ;
  wire [0 : 0] \BU2/rd_data_count ;
  assign
    empty = NlwRenamedSig_OI_empty,
    dout[31] = dout_3[31],
    dout[30] = dout_3[30],
    dout[29] = dout_3[29],
    dout[28] = dout_3[28],
    dout[27] = dout_3[27],
    dout[26] = dout_3[26],
    dout[25] = dout_3[25],
    dout[24] = dout_3[24],
    dout[23] = dout_3[23],
    dout[22] = dout_3[22],
    dout[21] = dout_3[21],
    dout[20] = dout_3[20],
    dout[19] = dout_3[19],
    dout[18] = dout_3[18],
    dout[17] = dout_3[17],
    dout[16] = dout_3[16],
    dout[15] = dout_3[15],
    dout[14] = dout_3[14],
    dout[13] = dout_3[13],
    dout[12] = dout_3[12],
    dout[11] = dout_3[11],
    dout[10] = dout_3[10],
    dout[9] = dout_3[9],
    dout[8] = dout_3[8],
    dout[7] = dout_3[7],
    dout[6] = dout_3[6],
    dout[5] = dout_3[5],
    dout[4] = dout_3[4],
    dout[3] = dout_3[3],
    dout[2] = dout_3[2],
    dout[1] = dout_3[1],
    dout[0] = dout_3[0],
    din_2[31] = din[31],
    din_2[30] = din[30],
    din_2[29] = din[29],
    din_2[28] = din[28],
    din_2[27] = din[27],
    din_2[26] = din[26],
    din_2[25] = din[25],
    din_2[24] = din[24],
    din_2[23] = din[23],
    din_2[22] = din[22],
    din_2[21] = din[21],
    din_2[20] = din[20],
    din_2[19] = din[19],
    din_2[18] = din[18],
    din_2[17] = din[17],
    din_2[16] = din[16],
    din_2[15] = din[15],
    din_2[14] = din[14],
    din_2[13] = din[13],
    din_2[12] = din[12],
    din_2[11] = din[11],
    din_2[10] = din[10],
    din_2[9] = din[9],
    din_2[8] = din[8],
    din_2[7] = din[7],
    din_2[6] = din[6],
    din_2[5] = din[5],
    din_2[4] = din[4],
    din_2[3] = din[3],
    din_2[2] = din[2],
    din_2[1] = din[1],
    din_2[0] = din[0],
    data_count[9] = NlwRenamedSig_OI_data_count[9],
    data_count[8] = NlwRenamedSig_OI_data_count[8],
    data_count[7] = NlwRenamedSig_OI_data_count[7],
    data_count[6] = NlwRenamedSig_OI_data_count[6],
    data_count[5] = NlwRenamedSig_OI_data_count[5],
    data_count[4] = NlwRenamedSig_OI_data_count[4],
    data_count[3] = NlwRenamedSig_OI_data_count[3],
    data_count[2] = NlwRenamedSig_OI_data_count[2],
    data_count[1] = NlwRenamedSig_OI_data_count[1],
    data_count[0] = NlwRenamedSig_OI_data_count[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  LUT2_L #(
    .INIT ( 4'h8 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_or0000_SW0  (
    .I0(rd_en),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp1 ),
    .LO(\BU2/N01 )
  );
  RAMB16_S18_S18 #(
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_A ( 18'h00000 ),
    .SRVAL_B ( 18'h00000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .INIT_A ( 18'h00000 ),
    .INIT_B ( 18'h00000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ))
  \BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(\BU2/N0_inv ),
    .ENB(\BU2/U0/grf.rf/mem/tmp_ram_rd_en ),
    .SSRA(\BU2/rd_data_count [0]),
    .SSRB(\BU2/U0/grf.rf/rstblk/rd_rst_reg[0] ),
    .WEA(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .WEB(\BU2/rd_data_count [0]),
    .ADDRA({\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [9], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [8], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [7], 
\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [6], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [4], 
\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1], 
\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]}),
    .ADDRB({\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [9], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [8], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [7], 
\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [6], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [4], 
\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1], 
\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]}),
    .DIA({\BU2/rd_data_count [0], din_2[31], din_2[30], din_2[29], din_2[28], din_2[27], din_2[26], din_2[25], \BU2/rd_data_count [0], din_2[24], 
din_2[23], din_2[22], din_2[21], din_2[20], din_2[19], din_2[18]}),
    .DIB({\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0]}),
    .DIPA({\BU2/rd_data_count [0], \BU2/rd_data_count [0]}),
    .DIPB({\BU2/rd_data_count [0], \BU2/rd_data_count [0]}),
    .DOA({\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<15>_UNCONNECTED 
, \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<13>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<11>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<9>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<7>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<5>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<3>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<1>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOA<0>_UNCONNECTED }),
    .DOPA({
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOPA<1>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOPA<0>_UNCONNECTED }),
    .DOB({\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOB<15>_UNCONNECTED 
, dout_3[31], dout_3[30], dout_3[29], dout_3[28], dout_3[27], dout_3[26], dout_3[25], 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOB<7>_UNCONNECTED , 
dout_3[24], dout_3[23], dout_3[22], dout_3[21], dout_3[20], dout_3[19], dout_3[18]}),
    .DOPB({
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOPB<1>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[1].ram.r/v2_noinit.ram/dp18x18.ram_DOPB<0>_UNCONNECTED })
  );
  RAMB16_S18_S18 #(
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SRVAL_A ( 18'h00000 ),
    .SRVAL_B ( 18'h00001 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .SIM_COLLISION_CHECK ( "NONE" ),
    .INIT_A ( 18'h00000 ),
    .INIT_B ( 18'h00001 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ))
  \BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram  (
    .CLKA(clk),
    .CLKB(clk),
    .ENA(\BU2/N0_inv ),
    .ENB(\BU2/U0/grf.rf/mem/tmp_ram_rd_en ),
    .SSRA(\BU2/rd_data_count [0]),
    .SSRB(\BU2/U0/grf.rf/rstblk/rd_rst_reg[0] ),
    .WEA(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .WEB(\BU2/rd_data_count [0]),
    .ADDRA({\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [9], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [8], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [7], 
\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [6], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [4], 
\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2], \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1], 
\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]}),
    .ADDRB({\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [9], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [8], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [7], 
\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [6], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [4], 
\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2], \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1], 
\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]}),
    .DIA({din_2[16], din_2[15], din_2[14], din_2[13], din_2[12], din_2[11], din_2[10], din_2[9], din_2[7], din_2[6], din_2[5], din_2[4], din_2[3], 
din_2[2], din_2[1], din_2[0]}),
    .DIB({\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], 
\BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0], \BU2/rd_data_count [0]}),
    .DIPA({din_2[17], din_2[8]}),
    .DIPB({\BU2/rd_data_count [0], \BU2/rd_data_count [0]}),
    .DOA({\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<15>_UNCONNECTED 
, \NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<14>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<13>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<12>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<11>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<10>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<9>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<8>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<7>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<6>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<5>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<4>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<3>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<2>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<1>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOA<0>_UNCONNECTED }),
    .DOPA({
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOPA<1>_UNCONNECTED , 
\NLW_BU2/U0/grf.rf/mem/gbm.gbmg.gbmga.ngecc.bmg/blk_mem_generator/valid.cstr/ramloop[0].ram.r/v2_noinit.ram/dp18x18.ram_DOPA<0>_UNCONNECTED }),
    .DOB({dout_3[16], dout_3[15], dout_3[14], dout_3[13], dout_3[12], dout_3[11], dout_3[10], dout_3[9], dout_3[7], dout_3[6], dout_3[5], dout_3[4], 
dout_3[3], dout_3[2], dout_3[1], dout_3[0]}),
    .DOPB({dout_3[17], dout_3[8]})
  );
  LUT4 #(
    .INIT ( 16'h23AF ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_comb24_G  (
    .I0(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count ),
    .I2(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/wr_rst_d1_98 ),
    .I3(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/comp0 ),
    .O(\BU2/N6 )
  );
  LUT4 #(
    .INIT ( 16'hA020 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_comb24_F  (
    .I0(wr_en),
    .I1(rd_en),
    .I2(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/comp1 ),
    .I3(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/N5 )
  );
  MUXF5   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_comb24  (
    .I0(\BU2/N5 ),
    .I1(\BU2/N6 ),
    .S(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_100 ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_comb )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_2  (
    .I0(rd_en),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1  (
    .I0(rd_en),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_102 )
  );
  LUT3 #(
    .INIT ( 8'hBA ))
  \BU2/U0/grf.rf/mem/tmp_ram_rd_en1  (
    .I0(\BU2/U0/grf.rf/rstblk/rd_rst_reg[0] ),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .I2(rd_en),
    .O(\BU2/U0/grf.rf/mem/tmp_ram_rd_en )
  );
  LUT3 #(
    .INIT ( 8'h9A ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut<9>  (
    .I0(NlwRenamedSig_OI_data_count[9]),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .I2(rd_en),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [9])
  );
  LUT4 #(
    .INIT ( 16'h6530 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not00011  (
    .I0(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_100 ),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .I2(rd_en),
    .I3(wr_en),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 )
  );
  LUT3 #(
    .INIT ( 8'hC6 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut<8>  (
    .I0(rd_en),
    .I1(NlwRenamedSig_OI_data_count[8]),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [8])
  );
  LUT3 #(
    .INIT ( 8'hC6 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut<7>  (
    .I0(rd_en),
    .I1(NlwRenamedSig_OI_data_count[7]),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [7])
  );
  LUT3 #(
    .INIT ( 8'hC6 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut<6>  (
    .I0(rd_en),
    .I1(NlwRenamedSig_OI_data_count[6]),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [6])
  );
  LUT3 #(
    .INIT ( 8'hC6 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut<5>  (
    .I0(rd_en),
    .I1(NlwRenamedSig_OI_data_count[5]),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [5])
  );
  LUT3 #(
    .INIT ( 8'hC6 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut<4>  (
    .I0(rd_en),
    .I1(NlwRenamedSig_OI_data_count[4]),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [4])
  );
  LUT3 #(
    .INIT ( 8'hC6 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut<3>  (
    .I0(rd_en),
    .I1(NlwRenamedSig_OI_data_count[3]),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [3])
  );
  LUT3 #(
    .INIT ( 8'hC6 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut<2>  (
    .I0(rd_en),
    .I1(NlwRenamedSig_OI_data_count[2]),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [2])
  );
  LUT3 #(
    .INIT ( 8'hC6 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut<1>  (
    .I0(rd_en),
    .I1(NlwRenamedSig_OI_data_count[1]),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [1])
  );
  LUT3 #(
    .INIT ( 8'h39 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut<0>  (
    .I0(rd_en),
    .I1(NlwRenamedSig_OI_data_count[0]),
    .I2(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [0])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<9>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [9]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<9>_rt_244 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<9>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [9]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<9>_rt_195 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<0>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<0>_rt_261 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<1>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<1>_rt_260 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<2>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<2>_rt_258 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<3>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<3>_rt_256 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<4>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [4]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<4>_rt_254 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<5>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [5]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<5>_rt_252 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<6>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [6]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<6>_rt_250 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<7>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [7]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<7>_rt_248 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<8>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [8]),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<8>_rt_246 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<0>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<0>_rt_212 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<1>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<1>_rt_211 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<2>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<2>_rt_209 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<3>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<3>_rt_207 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<4>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [4]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<4>_rt_205 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<5>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [5]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<5>_rt_203 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<6>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [6]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<6>_rt_201 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<7>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [7]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<7>_rt_199 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<8>_rt  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [8]),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<8>_rt_197 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<0>1_1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<0>1_1_162 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<1>1_1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<1>1_1_161 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<2>1_1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [4]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [4]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<2>1_1_159 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<3>1_1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [7]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [7]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [6]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [6]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<3>1_1_157 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<4>1_1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [9]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [9]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [8]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [8]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<4>1_1_154 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1  (
    .I0(rd_en),
    .I1(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count )
  );
  LUT4 #(
    .INIT ( 16'h32BA ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_or0000  (
    .I0(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 ),
    .I1(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .I2(\BU2/N01 ),
    .I3(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp0 ),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<0>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 [0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<1>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 [1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<2>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [4]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [4]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 [2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<3>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [7]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [7]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [6]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [6]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 [3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<4>1  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [9]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [9]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [8]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [8]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 [4])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1_0_and00001  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 [0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1_0_and00001  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .I3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 [0])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1_1_and00001  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 [1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1_1_and00001  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2]),
    .I3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 [1])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1_2_and00001  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [5]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [4]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [4]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 [2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1_2_and00001  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [5]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [4]),
    .I3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [4]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 [2])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1_3_and00001  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [7]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [7]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [6]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [6]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 [3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1_3_and00001  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [7]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [7]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [6]),
    .I3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [6]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 [3])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1_4_and00001  (
    .I0(\BU2/U0/grf.rf/gl0.rd/rpntr/count [9]),
    .I1(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [9]),
    .I2(\BU2/U0/grf.rf/gl0.rd/rpntr/count [8]),
    .I3(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [8]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 [4])
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1_4_and00001  (
    .I0(\BU2/U0/grf.rf/gl0.wr/wpntr/count [9]),
    .I1(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [9]),
    .I2(\BU2/U0/grf.rf/gl0.wr/wpntr/count [8]),
    .I3(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [8]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 [4])
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \BU2/U0/grf.rf/gl0.wr/gwhf.whf/wr_ack_i1  (
    .I0(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_100 ),
    .I1(wr_en),
    .O(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \BU2/U0/grf.rf/gl0.rd/grhf.rhf/ram_valid_i1  (
    .I0(NlwRenamedSig_OI_empty),
    .I1(rd_en),
    .O(\BU2/U0/grf.rf/gl0.rd/grhf.rhf/ram_valid_d1_mux0001 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_comb1  (
    .I0(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_d2_85 ),
    .I1(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_88 ),
    .O(\BU2/U0/grf.rf/rstblk/rd_rst_comb )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \BU2/U0/grf.rf/rstblk/wr_rst_comb1  (
    .I0(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_d2_87 ),
    .I1(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_89 ),
    .O(\BU2/U0/grf.rf/rstblk/wr_rst_comb )
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_0  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_1  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_2  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_3  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_4  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [4]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [4])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_5  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [5]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [5])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_6  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [6]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [6])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_7  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [7]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [7])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_8  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [8]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [8])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_d1_9  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/count [9]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count_d1 [9])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<0>  (
    .CI(\BU2/N0_inv ),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<0>_rt_261 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [0])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<0>  (
    .CI(\BU2/N0_inv ),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<0>_rt_261 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<1>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [0]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<1>_rt_260 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [1])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<1>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [0]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<1>_rt_260 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count1 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<2>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [1]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<2>_rt_258 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [2])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<2>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [1]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<2>_rt_258 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count2 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<3>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [2]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<3>_rt_256 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [3])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<3>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [2]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<3>_rt_256 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count3 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<4>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [3]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<4>_rt_254 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [4])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<4>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [3]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<4>_rt_254 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count4 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<5>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [4]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<5>_rt_252 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [5])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<5>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [4]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<5>_rt_252 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count5 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<6>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [5]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<6>_rt_250 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [6])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<6>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [5]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<6>_rt_250 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count6 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<7>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [6]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<7>_rt_248 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [7])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<7>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [6]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<7>_rt_248 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count7 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<8>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [7]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<8>_rt_246 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [8])
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<8>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [7]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy<8>_rt_246 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count8 )
  );
  XORCY   \BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<9>  (
    .CI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_cy [8]),
    .LI(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count_xor<9>_rt_244 ),
    .O(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count9 )
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_2  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count2 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [2])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_0  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count ),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_1  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count1 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_3  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count3 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_4  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count4 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [4])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_7  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count7 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [7])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_5  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count5 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [5])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_6  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count6 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [6])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_8  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count8 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [8])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/wpntr/count_9  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/wpntr/Mcount_count9 ),
    .Q(\BU2/U0/grf.rf/gl0.wr/wpntr/count [9])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_0  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_1  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_2  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_3  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_4  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [4]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [4])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_5  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [5]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [5])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_6  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [6]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [6])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_7  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [7]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [7])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_8  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [8]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [8])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_d1_9  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/count [9]),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count_d1 [9])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<0>  (
    .CI(\BU2/N0_inv ),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<0>_rt_212 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [0])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<0>  (
    .CI(\BU2/N0_inv ),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<0>_rt_212 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<1>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [0]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<1>_rt_211 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [1])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<1>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [0]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<1>_rt_211 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count1 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<2>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [1]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<2>_rt_209 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [2])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<2>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [1]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<2>_rt_209 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count2 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<3>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [2]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<3>_rt_207 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [3])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<3>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [2]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<3>_rt_207 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count3 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<4>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [3]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<4>_rt_205 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [4])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<4>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [3]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<4>_rt_205 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count4 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<5>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [4]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<5>_rt_203 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [5])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<5>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [4]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<5>_rt_203 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count5 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<6>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [5]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<6>_rt_201 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [6])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<6>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [5]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<6>_rt_201 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count6 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<7>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [6]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<7>_rt_199 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [7])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<7>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [6]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<7>_rt_199 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count7 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<8>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [7]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<8>_rt_197 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [8])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<8>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [7]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy<8>_rt_197 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count8 )
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<9>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_cy [8]),
    .LI(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count_xor<9>_rt_195 ),
    .O(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count9 )
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_2  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count2 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [2])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_0  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count ),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [0])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_1  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count1 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_3  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count3 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_4  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count4 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [4])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_7  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count7 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [7])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_5  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count5 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [5])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_6  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count6 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [6])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_8  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count8 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [8])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/rpntr/count_9  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_1_173 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/rpntr/Mcount_count9 ),
    .Q(\BU2/U0/grf.rf/gl0.rd/rpntr/count [9])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/gmux.gm[0].gm1.m1  (
    .CI(\BU2/N0_inv ),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 [0]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/carrynet [0])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/gmux.gm[1].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/carrynet [0]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 [1]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/carrynet [1])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/gmux.gm[2].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/carrynet [1]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 [2]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/carrynet [2])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/gmux.gm[3].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/carrynet [2]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 [3]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/carrynet [3])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/gmux.gm[4].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/carrynet [3]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c1/v1 [4]),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/comp1 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/gmux.gm[0].gm1.m1  (
    .CI(\BU2/N0_inv ),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<0>1_1_162 ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/carrynet [0])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/gmux.gm[1].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/carrynet [0]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<1>1_1_161 ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/carrynet [1])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/gmux.gm[2].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/carrynet [1]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<2>1_1_159 ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/carrynet [2])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/gmux.gm[3].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/carrynet [2]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<3>1_1_157 ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/carrynet [3])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/gmux.gm[4].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/c0/carrynet [3]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1<4>1_1_154 ),
    .O(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/comp0 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/gmux.gm[0].gm1.m1  (
    .CI(\BU2/N0_inv ),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/carrynet [0])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/gmux.gm[1].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/carrynet [0]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 [1]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/carrynet [1])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/gmux.gm[2].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/carrynet [1]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/carrynet [2])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/gmux.gm[3].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/carrynet [2]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 [3]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/carrynet [3])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/gmux.gm[4].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/carrynet [3]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c2/v1 [4]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp1 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/gmux.gm[0].gm1.m1  (
    .CI(\BU2/N0_inv ),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/carrynet [0])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/gmux.gm[1].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/carrynet [0]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 [1]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/carrynet [1])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/gmux.gm[2].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/carrynet [1]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/carrynet [2])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/gmux.gm[3].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/carrynet [2]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 [3]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/carrynet [3])
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/gmux.gm[4].gms.ms  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/carrynet [3]),
    .DI(\BU2/rd_data_count [0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.rsts/c1/v1 [4]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.rsts/comp0 )
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_9  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count10 ),
    .Q(NlwRenamedSig_OI_data_count[9])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_8  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count9 ),
    .Q(NlwRenamedSig_OI_data_count[8])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_7  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count8 ),
    .Q(NlwRenamedSig_OI_data_count[7])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_6  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count7 ),
    .Q(NlwRenamedSig_OI_data_count[6])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_5  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count6 ),
    .Q(NlwRenamedSig_OI_data_count[5])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_4  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count5 ),
    .Q(NlwRenamedSig_OI_data_count[4])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_3  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count4 ),
    .Q(NlwRenamedSig_OI_data_count[3])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_2  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count3 ),
    .Q(NlwRenamedSig_OI_data_count[2])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_1  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count2 ),
    .Q(NlwRenamedSig_OI_data_count[1])
  );
  FDCE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_0  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/count_not0001 ),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count1 ),
    .Q(NlwRenamedSig_OI_data_count[0])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_xor<9>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [8]),
    .LI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [9]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count10 )
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_xor<8>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [7]),
    .LI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [8]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count9 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy<8>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [7]),
    .DI(NlwRenamedSig_OI_data_count[8]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [8]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [8])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_xor<7>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [6]),
    .LI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [7]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count8 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy<7>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [6]),
    .DI(NlwRenamedSig_OI_data_count[7]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [7]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [7])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_xor<6>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [5]),
    .LI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [6]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count7 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy<6>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [5]),
    .DI(NlwRenamedSig_OI_data_count[6]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [6]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [6])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_xor<5>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [4]),
    .LI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [5]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count6 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy<5>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [4]),
    .DI(NlwRenamedSig_OI_data_count[5]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [5]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [5])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_xor<4>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [3]),
    .LI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [4]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count5 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy<4>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [3]),
    .DI(NlwRenamedSig_OI_data_count[4]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [4]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [4])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_xor<3>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [2]),
    .LI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [3]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count4 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy<3>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [2]),
    .DI(NlwRenamedSig_OI_data_count[3]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [3]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [3])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_xor<2>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [1]),
    .LI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count3 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy<2>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [1]),
    .DI(NlwRenamedSig_OI_data_count[2]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [2]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [2])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_xor<1>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [0]),
    .LI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [1]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count2 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy<1>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [0]),
    .DI(NlwRenamedSig_OI_data_count[1]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [1]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [1])
  );
  XORCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_xor<0>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_102 ),
    .LI(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count1 )
  );
  MUXCY   \BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy<0>  (
    .CI(\BU2/U0/grf.rf/gl0.rd/ram_rd_en_i1_102 ),
    .DI(NlwRenamedSig_OI_data_count[0]),
    .S(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_lut [0]),
    .O(\BU2/U0/grf.rf/gl0.rd/grss.gdc.dc/dc/Mcount_count_cy [0])
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK  (
    .C(clk),
    .CLR(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .D(\BU2/U0/grf.rf/gl0.wr/gwhf.whf/WR_ACK_mux0001 ),
    .Q(wr_ack)
  );
  FDP #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i  (
    .C(clk),
    .D(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_comb ),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_fb_i_100 )
  );
  FDP #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_i  (
    .C(clk),
    .D(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/ram_full_comb ),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .Q(full)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.wr/gwss.wsts/wr_rst_d1  (
    .C(clk),
    .D(\BU2/rd_data_count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1]),
    .Q(\BU2/U0/grf.rf/gl0.wr/gwss.wsts/wr_rst_d1_98 )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/gl0.rd/grhf.rhf/ram_valid_d1  (
    .C(clk),
    .CLR(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .D(\BU2/U0/grf.rf/gl0.rd/grhf.rhf/ram_valid_d1_mux0001 ),
    .Q(valid)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_i  (
    .C(clk),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000 ),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .Q(NlwRenamedSig_OI_empty)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i  (
    .C(clk),
    .D(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_mux0000 ),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] ),
    .Q(\BU2/U0/grf.rf/gl0.rd/grss.rsts/ram_empty_fb_i_96 )
  );
  FDP #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/wr_rst_reg_1  (
    .C(clk),
    .D(\BU2/rd_data_count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/wr_rst_comb ),
    .Q(\BU2/U0/grf.rf/rstblk/wr_rst_reg [1])
  );
  FDP #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_reg_0  (
    .C(clk),
    .D(\BU2/rd_data_count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_comb ),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_reg[0] )
  );
  FDP #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_reg_2  (
    .C(clk),
    .D(\BU2/rd_data_count [0]),
    .PRE(\BU2/U0/grf.rf/rstblk/rd_rst_comb ),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_reg[2] )
  );
  FDPE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_asreg  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_d1_84 ),
    .D(\BU2/rd_data_count [0]),
    .PRE(rst),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_88 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/wr_rst_asreg_d1  (
    .C(clk),
    .D(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_89 ),
    .Q(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_d1_86 )
  );
  FDPE #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/wr_rst_asreg  (
    .C(clk),
    .CE(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_d1_86 ),
    .D(\BU2/rd_data_count [0]),
    .PRE(rst),
    .Q(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_89 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_asreg_d1  (
    .C(clk),
    .D(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_88 ),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_d1_84 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/wr_rst_asreg_d2  (
    .C(clk),
    .D(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_d1_86 ),
    .Q(\BU2/U0/grf.rf/rstblk/wr_rst_asreg_d2_87 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/grf.rf/rstblk/rd_rst_asreg_d2  (
    .C(clk),
    .D(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_d1_84 ),
    .Q(\BU2/U0/grf.rf/rstblk/rd_rst_asreg_d2_85 )
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/N0_inv )
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/rd_data_count [0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

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

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

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

endmodule

// synthesis translate_on
