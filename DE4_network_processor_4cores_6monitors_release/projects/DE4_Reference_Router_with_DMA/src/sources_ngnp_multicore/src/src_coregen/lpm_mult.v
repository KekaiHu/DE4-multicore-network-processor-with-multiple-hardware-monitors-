////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: lpm_mult.v
// /___/   /\     Timestamp: Thu Dec 10 15:26:42 2009
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog /root/NF2/projects/ngnp/synth/coregen/tmp/_cg/lpm_mult.ngc /root/NF2/projects/ngnp/synth/coregen/tmp/_cg/lpm_mult.v 
// Device	: 2vp50ff1152-7
// Input file	: /root/NF2/projects/ngnp/synth/coregen/tmp/_cg/lpm_mult.ngc
// Output file	: /root/NF2/projects/ngnp/synth/coregen/tmp/_cg/lpm_mult.v
// # of Modules	: 1
// Design Name	: lpm_mult
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

module lpm_mult (
  sclr, ce, clk, a, b, p
);
  input sclr;
  input ce;
  input clk;
  input [32 : 0] a;
  input [32 : 0] b;
  output [65 : 0] p;
  
  // synthesis translate_off
  
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[0] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[1] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[2] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[3] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[4] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[5] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[6] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[7] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[8] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[9] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[10] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[11] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[12] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[13] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[14] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[15] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[16] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[17] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[18] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[19] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[20] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[21] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[22] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[23] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[24] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[25] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[26] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[27] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[28] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[29] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[30] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[31] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[32] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[33] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[34] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[35] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[36] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[37] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[38] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[39] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[40] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[41] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[42] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[43] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[44] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[45] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[46] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[47] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[52] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[0] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[1] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[2] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[3] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[4] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[5] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[6] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[7] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[8] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[9] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[10] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[11] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[12] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[13] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[14] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[15] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[16] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[17] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[18] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[19] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[20] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[21] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[22] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[23] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[24] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[25] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[26] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[27] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[28] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[29] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[30] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[31] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[32] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[33] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[34] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[35] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[36] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[37] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[38] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[39] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[40] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[41] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[42] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[43] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[44] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[45] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[46] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[47] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[52] ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].no_Mreg.m18x18_P<35>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[1].no_Mreg.m18x18_P<35>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[1].no_Mreg.m18x18_P<34>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[1].no_Mreg.m18x18_P<33>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].no_Mreg.m18x18_P<35>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].no_Mreg.m18x18_P<34>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].no_Mreg.m18x18_P<33>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[1].no_Mreg.m18x18_P<35>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[1].no_Mreg.m18x18_P<34>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[1].no_Mreg.m18x18_P<33>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[1].no_Mreg.m18x18_P<32>_UNCONNECTED ;
  wire [32 : 0] a_2;
  wire [32 : 0] b_3;
  wire [31 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut ;
  wire [30 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy ;
  wire [32 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut ;
  wire [31 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy ;
  wire [32 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 ;
  wire [50 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut ;
  wire [49 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy ;
  wire [31 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 ;
  wire [34 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> ;
  wire [32 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> ;
  wire [32 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> ;
  wire [31 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> ;
  wire [16 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r ;
  wire [0 : 0] \BU2/zero_detect ;
  assign
    a_2[32] = a[32],
    a_2[31] = a[31],
    a_2[30] = a[30],
    a_2[29] = a[29],
    a_2[28] = a[28],
    a_2[27] = a[27],
    a_2[26] = a[26],
    a_2[25] = a[25],
    a_2[24] = a[24],
    a_2[23] = a[23],
    a_2[22] = a[22],
    a_2[21] = a[21],
    a_2[20] = a[20],
    a_2[19] = a[19],
    a_2[18] = a[18],
    a_2[17] = a[17],
    a_2[16] = a[16],
    a_2[15] = a[15],
    a_2[14] = a[14],
    a_2[13] = a[13],
    a_2[12] = a[12],
    a_2[11] = a[11],
    a_2[10] = a[10],
    a_2[9] = a[9],
    a_2[8] = a[8],
    a_2[7] = a[7],
    a_2[6] = a[6],
    a_2[5] = a[5],
    a_2[4] = a[4],
    a_2[3] = a[3],
    a_2[2] = a[2],
    a_2[1] = a[1],
    a_2[0] = a[0],
    b_3[32] = b[32],
    b_3[31] = b[31],
    b_3[30] = b[30],
    b_3[29] = b[29],
    b_3[28] = b[28],
    b_3[27] = b[27],
    b_3[26] = b[26],
    b_3[25] = b[25],
    b_3[24] = b[24],
    b_3[23] = b[23],
    b_3[22] = b[22],
    b_3[21] = b[21],
    b_3[20] = b[20],
    b_3[19] = b[19],
    b_3[18] = b[18],
    b_3[17] = b[17],
    b_3[16] = b[16],
    b_3[15] = b[15],
    b_3[14] = b[14],
    b_3[13] = b[13],
    b_3[12] = b[12],
    b_3[11] = b[11],
    b_3[10] = b[10],
    b_3[9] = b[9],
    b_3[8] = b[8],
    b_3[7] = b[7],
    b_3[6] = b[6],
    b_3[5] = b[5],
    b_3[4] = b[4],
    b_3[3] = b[3],
    b_3[2] = b[2],
    b_3[1] = b[1],
    b_3[0] = b[0],
    p[65] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[52] ,
    p[64] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[47] ,
    p[63] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[46] ,
    p[62] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[45] ,
    p[61] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[44] ,
    p[60] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[43] ,
    p[59] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[42] ,
    p[58] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[41] ,
    p[57] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[40] ,
    p[56] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[39] ,
    p[55] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[38] ,
    p[54] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[37] ,
    p[53] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[36] ,
    p[52] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[35] ,
    p[51] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[34] ,
    p[50] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[33] ,
    p[49] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[32] ,
    p[48] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[31] ,
    p[47] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[30] ,
    p[46] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[29] ,
    p[45] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[28] ,
    p[44] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[27] ,
    p[43] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[26] ,
    p[42] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[25] ,
    p[41] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[24] ,
    p[40] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[23] ,
    p[39] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[22] ,
    p[38] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[21] ,
    p[37] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[20] ,
    p[36] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[19] ,
    p[35] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[18] ,
    p[34] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[17] ,
    p[33] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[16] ,
    p[32] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[15] ,
    p[31] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[14] ,
    p[30] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[13] ,
    p[29] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[12] ,
    p[28] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[11] ,
    p[27] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[10] ,
    p[26] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[9] ,
    p[25] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[8] ,
    p[24] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[7] ,
    p[23] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[6] ,
    p[22] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[5] ,
    p[21] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[4] ,
    p[20] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[3] ,
    p[19] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[2] ,
    p[18] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[1] ,
    p[17] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[0] ,
    p[16] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [16],
    p[15] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [15],
    p[14] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [14],
    p[13] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [13],
    p[12] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [12],
    p[11] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [11],
    p[10] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [10],
    p[9] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [9],
    p[8] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [8],
    p[7] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [7],
    p[6] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [6],
    p[5] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [5],
    p[4] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [4],
    p[3] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [3],
    p[2] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [2],
    p[1] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [1],
    p[0] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [0]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [1]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [2]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [3]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [4]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [5]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [6]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [7]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [8]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [9]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [10]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [11]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [12]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [13]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [14]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [15]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [16]),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/bp20r [16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_0  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[0] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[0] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_1  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[1] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[1] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_2  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[2] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[2] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_3  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[3] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[3] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_4  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[4] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[4] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_5  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[5] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[5] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_6  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[6] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[6] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_7  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[7] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[7] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_8  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[8] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[8] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_9  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[9] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[9] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_10  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[10] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[10] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_11  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[11] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[11] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_12  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[12] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[12] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_13  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[13] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[13] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_14  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[14] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[14] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_15  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[15] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[15] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_16  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[16] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[16] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_17  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[17] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[17] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_18  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[18] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[18] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_19  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[19] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[19] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_20  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[20] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[20] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_21  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[21] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[21] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_22  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[22] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[22] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_23  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[23] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[23] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_24  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[24] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[24] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_25  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[25] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[25] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_26  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[26] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[26] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_27  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[27] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[27] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_28  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[28] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[28] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_29  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[29] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[29] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_30  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[30] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[30] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_31  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[31] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[31] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_32  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[32] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[32] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_33  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[33] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[33] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_34  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[34] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[34] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_35  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[35] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[35] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_36  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[36] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[36] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_37  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[37] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[37] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_38  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[38] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[38] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_39  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[39] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[39] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_40  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[40] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[40] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_41  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[41] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[41] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_42  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[42] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[42] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_43  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[43] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[43] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_44  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[44] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[44] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_45  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[45] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[45] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_46  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[46] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[46] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_47  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[47] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[47] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r_52  (
    .C(clk),
    .CE(ce),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[52] ),
    .R(sclr),
    .Q(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20r[52] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<0>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [17]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [0])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<0>  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [17]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [0])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<0>  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<1>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [18]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [1])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<1>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [0]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [18]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [1])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<1>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [0]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<2>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [19]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [2])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<2>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [1]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [19]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [2])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<2>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [1]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<3>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [20]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [3])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<3>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [2]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [20]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [3])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<3>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [2]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<4>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [21]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [4])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<4>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [3]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [21]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [4])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<4>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [3]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<5>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [22]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [5])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<5>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [4]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [22]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [5])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<5>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [4]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<6>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [23]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [6])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<6>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [5]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [23]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [6])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<6>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [5]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<7>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [24]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [7])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<7>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [6]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [24]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [7])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<7>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [6]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<8>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [25]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [8])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<8>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [7]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [25]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [8])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<8>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [7]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<9>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [26]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [9])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<9>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [8]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [26]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [9])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<9>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [8]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<10>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [27]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [10])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<10>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [9]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [27]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [10])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<10>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [9]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<11>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [28]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [11])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<11>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [10]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [28]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [11])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<11>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [10]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<12>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [29]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [12])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<12>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [11]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [29]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [12])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<12>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [11]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<13>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [30]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [13])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<13>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [12]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [30]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [13])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<13>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [12]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<14>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [31]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [14])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<14>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [13]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [31]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [14])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<14>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [13]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<15>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [15])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<15>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [14]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [15])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<15>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [14]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<16>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [16])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<16>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [15]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [16])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<16>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [15]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<17>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [17])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<17>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [16]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [17])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<17>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [16]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<18>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [18]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [18])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<18>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [17]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [18]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [18])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<18>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [17]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [18]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<19>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [19]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [19])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<19>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [18]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [19]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [19])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<19>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [18]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [19]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<20>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [20]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [20])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<20>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [19]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [20]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [20])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<20>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [19]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [20]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [20])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<21>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [21]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [21])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<21>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [20]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [21]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [21])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<21>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [20]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [21]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [21])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<22>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [22]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [22])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<22>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [21]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [22]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [22])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<22>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [21]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [22]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [22])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<23>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [23]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [23])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<23>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [22]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [23]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [23])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<23>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [22]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [23]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [23])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<24>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [24]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [24])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<24>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [23]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [24]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [24])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<24>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [23]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [24]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [24])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<25>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [25]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [25])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<25>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [24]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [25]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [25])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<25>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [24]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [25]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [25])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<26>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [26]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [26])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<26>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [25]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [26]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [26])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<26>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [25]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [26]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [26])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<27>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [27]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [27])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<27>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [26]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [27]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [27])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<27>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [26]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [27]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [27])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<28>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [28]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [28])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<28>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [27]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [28]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [28])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<28>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [27]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [28]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [28])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<29>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [29]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [29])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<29>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [28]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [29]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [29])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<29>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [28]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [29]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [29])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<30>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [30]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [30])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy<30>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [29]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [30]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [30])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<30>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [29]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [30]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [30])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut<31>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [31]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [31])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_xor<31>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_cy [30]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s11_add0000_lut [31]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [31])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<0>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [17]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [0])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<0>  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [17]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [0])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<0>  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<1>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [18]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [1])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<1>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [0]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [18]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [1])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<1>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [0]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<2>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [19]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [2])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<2>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [1]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [19]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [2])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<2>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [1]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<3>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [20]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [3])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<3>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [2]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [20]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [3])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<3>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [2]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<4>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [21]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [4])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<4>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [3]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [21]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [4])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<4>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [3]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<5>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [22]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [5])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<5>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [4]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [22]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [5])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<5>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [4]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<6>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [23]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [6])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<6>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [5]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [23]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [6])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<6>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [5]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<7>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [24]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [7])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<7>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [6]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [24]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [7])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<7>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [6]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<8>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [25]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [8])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<8>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [7]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [25]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [8])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<8>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [7]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<9>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [26]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [9])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<9>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [8]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [26]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [9])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<9>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [8]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<10>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [27]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [10])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<10>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [9]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [27]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [10])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<10>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [9]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<11>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [28]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [11])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<11>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [10]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [28]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [11])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<11>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [10]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<12>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [29]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [12])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<12>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [11]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [29]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [12])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<12>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [11]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<13>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [30]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [13])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<13>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [12]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [30]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [13])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<13>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [12]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<14>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [31]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [14])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<14>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [13]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [31]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [14])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<14>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [13]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<15>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [15])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<15>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [14]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [15])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<15>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [14]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<16>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [33]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [16])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<16>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [15]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [33]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [16])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<16>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [15]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<17>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [17])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<17>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [16]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [17])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<17>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [16]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<18>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [18]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [18])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<18>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [17]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [18]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [18])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<18>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [17]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [18]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<19>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [19]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [19])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<19>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [18]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [19]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [19])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<19>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [18]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [19]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<20>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [20]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [20])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<20>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [19]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [20]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [20])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<20>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [19]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [20]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [20])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<21>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [21]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [21])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<21>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [20]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [21]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [21])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<21>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [20]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [21]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [21])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<22>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [22]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [22])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<22>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [21]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [22]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [22])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<22>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [21]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [22]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [22])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<23>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [23]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [23])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<23>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [22]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [23]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [23])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<23>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [22]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [23]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [23])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<24>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [24]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [24])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<24>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [23]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [24]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [24])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<24>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [23]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [24]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [24])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<25>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [25]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [25])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<25>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [24]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [25]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [25])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<25>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [24]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [25]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [25])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<26>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [26]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [26])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<26>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [25]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [26]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [26])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<26>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [25]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [26]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [26])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<27>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [27]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [27])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<27>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [26]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [27]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [27])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<27>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [26]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [27]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [27])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<28>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [28]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [28])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<28>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [27]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [28]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [28])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<28>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [27]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [28]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [28])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<29>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [29]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [29])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<29>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [28]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [29]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [29])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<29>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [28]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [29]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [29])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<30>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [30]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [30])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<30>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [29]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [30]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [30])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<30>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [29]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [30]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [30])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<31>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [31]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [31])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy<31>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [30]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [31]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [31])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<31>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [30]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [31]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [31])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut<32>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [32]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [32])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_xor<32>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_cy [31]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s10_add0000_lut [32]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<0>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [0]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [0])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<0>  (
    .CI(\BU2/zero_detect [0]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [0]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [0])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<0>  (
    .CI(\BU2/zero_detect [0]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[0] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<1>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [1]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [1])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<1>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [0]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [1]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [1])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<1>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [0]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[1] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<2>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [2]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [2])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<2>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [1]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [2]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [2])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<2>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [1]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[2] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<3>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [3]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [3])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<3>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [2]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [3]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [3])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<3>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [2]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[3] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<4>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [4]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [4])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<4>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [3]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [4]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [4])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<4>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [3]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[4] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<5>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [5]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [5])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<5>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [4]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [5]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [5])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<5>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [4]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[5] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<6>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [6]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [6])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<6>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [5]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [6]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [6])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<6>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [5]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[6] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<7>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [7]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [7])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<7>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [6]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [7]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [7])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<7>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [6]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[7] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<8>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [8]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [8])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<8>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [7]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [8]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [8])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<8>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [7]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[8] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<9>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [9]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [9])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<9>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [8]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [9]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [9])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<9>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [8]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[9] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<10>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [10]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [10])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<10>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [9]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [10]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [10])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<10>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [9]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[10] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<11>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [11]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [11])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<11>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [10]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [11]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [11])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<11>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [10]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[11] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<12>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [12]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [12])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<12>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [11]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [12]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [12])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<12>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [11]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[12] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<13>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [13]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [13])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<13>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [12]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [13]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [13])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<13>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [12]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[13] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<14>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [14]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [14])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<14>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [13]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [14]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [14])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<14>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [13]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[14] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<15>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [15]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [15])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<15>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [14]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [15]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [15])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<15>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [14]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[15] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<16>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [16]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [16])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<16>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [15]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [16]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [16])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<16>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [15]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[16] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<17>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [17]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [0]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [17])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<17>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [16]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [17]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [17])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<17>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [16]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[17] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<18>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [18]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [1]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [18])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<18>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [17]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [18]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [18]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [18])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<18>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [17]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [18]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[18] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<19>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [19]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [2]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [19])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<19>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [18]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [19]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [19]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [19])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<19>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [18]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [19]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[19] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<20>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [20]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [3]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [20])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<20>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [19]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [20]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [20]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [20])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<20>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [19]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [20]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[20] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<21>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [21]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [4]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [21])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<21>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [20]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [21]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [21]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [21])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<21>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [20]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [21]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[21] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<22>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [22]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [5]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [22])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<22>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [21]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [22]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [22]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [22])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<22>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [21]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [22]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[22] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<23>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [23]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [6]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [23])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<23>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [22]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [23]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [23]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [23])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<23>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [22]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [23]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[23] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<24>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [24]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [7]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [24])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<24>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [23]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [24]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [24]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [24])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<24>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [23]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [24]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[24] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<25>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [25]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [8]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [25])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<25>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [24]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [25]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [25]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [25])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<25>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [24]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [25]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[25] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<26>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [26]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [9]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [26])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<26>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [25]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [26]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [26]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [26])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<26>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [25]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [26]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[26] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<27>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [27]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [10]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [27])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<27>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [26]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [27]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [27]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [27])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<27>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [26]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [27]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[27] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<28>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [28]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [11]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [28])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<28>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [27]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [28]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [28]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [28])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<28>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [27]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [28]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[28] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<29>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [29]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [12]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [29])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<29>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [28]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [29]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [29]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [29])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<29>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [28]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [29]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[29] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<30>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [30]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [13]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [30])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<30>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [29]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [30]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [30]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [30])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<30>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [29]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [30]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[30] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<31>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [31]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [14]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [31])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<31>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [30]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [31]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [31]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [31])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<31>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [30]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [31]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[31] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<32>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [15]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [32])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<32>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [31]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [32]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [32])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<32>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [31]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [32]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[32] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<33>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [16]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [33])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<33>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [32]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [33]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [33])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<33>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [32]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [33]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[33] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<34>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [17]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [34])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<34>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [33]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [34]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [34])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<34>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [33]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [34]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[34] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<35>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [18]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [35])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<35>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [34]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [35]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [35])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<35>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [34]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [35]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[35] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<36>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [19]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [36])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<36>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [35]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [36]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [36])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<36>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [35]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [36]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[36] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<37>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [20]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [37])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<37>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [36]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [37]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [37])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<37>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [36]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [37]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[37] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<38>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [21]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [38])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<38>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [37]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [38]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [38])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<38>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [37]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [38]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[38] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<39>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [22]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [39])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<39>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [38]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [39]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [39])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<39>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [38]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [39]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[39] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<40>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [23]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [40])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<40>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [39]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [40]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [40])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<40>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [39]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [40]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[40] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<41>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [24]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [41])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<41>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [40]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [41]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [41])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<41>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [40]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [41]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[41] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<42>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [25]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [42])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<42>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [41]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [42]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [42])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<42>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [41]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [42]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[42] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<43>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [26]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [43])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<43>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [42]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [43]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [43])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<43>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [42]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [43]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[43] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<44>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [27]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [44])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<44>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [43]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [44]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [44])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<44>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [43]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [44]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[44] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<45>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [28]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [45])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<45>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [44]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [45]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [45])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<45>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [44]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [45]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[45] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<46>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [29]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [46])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<46>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [45]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [46]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [46])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<46>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [45]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [46]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[46] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<47>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [30]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [47])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<47>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [46]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [47]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [47])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<47>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [46]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [47]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[47] )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<48>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [31]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [48])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<48>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [47]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [48]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [48])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<49>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [31]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [49])
  );
  MUXCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy<49>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [48]),
    .DI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .S(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [49]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [49])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut<50>  (
    .I0(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s10 [32]),
    .I1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s11 [31]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [50])
  );
  XORCY   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_xor<50>  (
    .CI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_cy [49]),
    .LI(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/Madd_s20_lut [50]),
    .O(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/s20[52] )
  );
  MULT18X18   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].no_Mreg.m18x18  (
    .A({\BU2/zero_detect [0], a_2[16], a_2[15], a_2[14], a_2[13], a_2[12], a_2[11], a_2[10], a_2[9], a_2[8], a_2[7], a_2[6], a_2[5], a_2[4], a_2[3], 
a_2[2], a_2[1], a_2[0]}),
    .B({\BU2/zero_detect [0], b_3[16], b_3[15], b_3[14], b_3[13], b_3[12], b_3[11], b_3[10], b_3[9], b_3[8], b_3[7], b_3[6], b_3[5], b_3[4], b_3[3], 
b_3[2], b_3[1], b_3[0]}),
    .P({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[0].no_Mreg.m18x18_P<35>_UNCONNECTED 
, \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [34], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [33], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [32], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [31], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [30], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [29], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [28], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [27], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [26], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [25], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [24], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [23], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [22], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [21], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [20], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><0> [0]})
  );
  MULT18X18   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[1].no_Mreg.m18x18  (
    .A({\BU2/zero_detect [0], a_2[16], a_2[15], a_2[14], a_2[13], a_2[12], a_2[11], a_2[10], a_2[9], a_2[8], a_2[7], a_2[6], a_2[5], a_2[4], a_2[3], 
a_2[2], a_2[1], a_2[0]}),
    .B({b_3[32], b_3[32], b_3[32], b_3[31], b_3[30], b_3[29], b_3[28], b_3[27], b_3[26], b_3[25], b_3[24], b_3[23], b_3[22], b_3[21], b_3[20], b_3[19]
, b_3[18], b_3[17]}),
    .P({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[1].no_Mreg.m18x18_P<35>_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[1].no_Mreg.m18x18_P<34>_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[0].bppMULT[1].no_Mreg.m18x18_P<33>_UNCONNECTED 
, \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [32], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [31], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [30], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [29], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [28], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [27], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [26], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [25], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [24], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [23], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [22], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [21], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [20], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<0><1> [0]})
  );
  MULT18X18   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].no_Mreg.m18x18  (
    .A({a_2[32], a_2[32], a_2[32], a_2[31], a_2[30], a_2[29], a_2[28], a_2[27], a_2[26], a_2[25], a_2[24], a_2[23], a_2[22], a_2[21], a_2[20], a_2[19]
, a_2[18], a_2[17]}),
    .B({\BU2/zero_detect [0], b_3[16], b_3[15], b_3[14], b_3[13], b_3[12], b_3[11], b_3[10], b_3[9], b_3[8], b_3[7], b_3[6], b_3[5], b_3[4], b_3[3], 
b_3[2], b_3[1], b_3[0]}),
    .P({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].no_Mreg.m18x18_P<35>_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].no_Mreg.m18x18_P<34>_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[0].no_Mreg.m18x18_P<33>_UNCONNECTED 
, \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [32], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [31], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [30], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [29], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [28], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [27], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [26], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [25], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [24], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [23], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [22], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [21], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [20], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><0> [0]})
  );
  MULT18X18   \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[1].no_Mreg.m18x18  (
    .A({a_2[32], a_2[32], a_2[32], a_2[31], a_2[30], a_2[29], a_2[28], a_2[27], a_2[26], a_2[25], a_2[24], a_2[23], a_2[22], a_2[21], a_2[20], a_2[19]
, a_2[18], a_2[17]}),
    .B({b_3[32], b_3[32], b_3[32], b_3[31], b_3[30], b_3[29], b_3[28], b_3[27], b_3[26], b_3[25], b_3[24], b_3[23], b_3[22], b_3[21], b_3[20], b_3[19]
, b_3[18], b_3[17]}),
    .P({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[1].no_Mreg.m18x18_P<35>_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[1].no_Mreg.m18x18_P<34>_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[1].no_Mreg.m18x18_P<33>_UNCONNECTED 
, 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/use_mult18x18.appMULT[1].bppMULT[1].no_Mreg.m18x18_P<32>_UNCONNECTED 
, \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [31], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [30], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [29], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [28], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [27], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [26], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [25], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [24], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [23], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [22], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [21], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [20], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gMULT18.iMULT18/pi_Mreg<1><1> [0]})
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/zero_detect [0])
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
