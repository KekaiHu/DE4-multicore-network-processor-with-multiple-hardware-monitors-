//------------------------------------------------------------------------------
// YF32 -- A small SOC implementation based on mlite (32-bit RISC CPU)
//                                                                       @Taiwan
//------------------------------------------------------------------------------
//
//  YF32 - A SOC implementation based on verilog ported mlite (32-bit RISC CPU)
//  Copyright (C) 2003-2004 Yung-Fu Chen (yfchen58@gmail.com)
//
//------------------------------------------------------------------------------
//  FETURE
//     . verilog ported mlite included
//     . wishbone bus support
//     . simple_pic (programmable interrupt controller)
//     . most MIPS-I(TM) opcode support
//     . do not support excption
//     . do not support "unaligned memory accesses"
//     . only user mode support
//     . 32K byte ROM
//     . 2K byte SRAM
//     . UART/Timer are not fully tested yet
//     . no internal tri-state bus
//  TO DO
//     . integrate UART
//     . integrate LCD/VGA Controller
//     . integrete PS/2 interface
//
//------------------------------------------------------------------------------
// Note:
//      MIPS(R) is a registered trademark and MIPS I(TM) is a trademark of
//      MIPS Technologies, Inc. in the United States and other countries.
//      MIPS Technologies, Inc. does not endorse and is not associated with
//      this project. OpenCores and Steve Rhoads are not affiliated in any way
//      with MIPS Technologies, Inc.
//------------------------------------------------------------------------------
//
// FILE: pipeline.v (tranlate from pipeline.vhd from opencores.org)
//
// Vertsion: 1.0
//
// Date: 2004/03/22
//
// Author: Yung-Fu Chen (yfchen58@gmail.com)
//
// MODIFICATION HISTORY:
// Date        By         Version  Change Description
//============================================================
// 2004/03/22  yfchen     1.0      Translate from pipeline.vhd
//------------------------------------------------------------------------------

//-------------------------------------------------------------------
// TITLE: Pipeline
// AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
// DATE CREATED: 6/24/02
// FILENAME: pipeline.vhd
// PROJECT: Plasma CPU core
// COPYRIGHT: Software placed into the public domain by the author.
//    Software 'as is' without warranty.  Author liable for nothing.
// DESCRIPTION:
//    Controls the three stage pipeline by delaying the signals:
//      a_bus, b_bus, alu/shift/mult_func, c_source, and rs_index.
//-------------------------------------------------------------------
//Note: sigD <= sig after rising_edge(clk)
`include "yf32_define.v"
module pipeline (clk, reset, a_bus, a_busD, b_bus, b_busD, alu_func, alu_funcD,
                 shift_func, shift_funcD, mult_func, mult_funcD, reg_dest,
                 reg_destD, rd_index, rd_indexD, rs_index, rt_index, pc_source,
                 mem_source, a_source, b_source, c_source, c_bus, pause_any,
                 pause_pipeline);

   input         clk;
   input         reset;
   input  [31:0] a_bus;
   input  [31:0] b_bus;
   input  [ 3:0] alu_func;
   input  [ 1:0] shift_func;
   input  [ 3:0] mult_func;
   input  [31:0] reg_dest;
   input  [ 5:0] rd_index;
   input  [ 5:0] rs_index;
   input  [ 5:0] rt_index;
   input  [ 1:0] pc_source;
   input  [ 3:0] mem_source;
   input  [ 1:0] a_source;
   input  [ 1:0] b_source;
   input  [ 2:0] c_source;
   input  [31:0] c_bus;
   input         pause_any;
   output [31:0] a_busD;
   output [31:0] b_busD;
   output [ 3:0] alu_funcD;
   output [ 1:0] shift_funcD;
   output [ 3:0] mult_funcD;
   output [31:0] reg_destD;
   output [ 5:0] rd_indexD;
   output        pause_pipeline;

   reg    [31:0] a_busD;
   reg    [31:0] b_busD;
   reg    [ 3:0] alu_funcD;
   reg    [ 1:0] shift_funcD;
   reg    [ 3:0] mult_funcD;
   reg    [ 5:0] rd_index_reg;
   reg    [31:0] reg_dest_reg;
   reg    [31:0] reg_dest_delay;
   reg    [ 2:0] c_source_reg;
   reg           pause_mult_clock;
   reg           pause_enable_reg;

   wire   [31:0] reg_destD       = reg_dest_delay ;
   wire   [ 5:0] rd_indexD       = rd_index_reg ;
   wire          pause_pipeline  = pause_mult_clock & pause_enable_reg ;
   wire          freeze_pipeline = ~(pause_mult_clock & pause_enable_reg) &
                                   pause_any;

   //When operating in three stage pipeline mode, the following signals
   //are delayed by one clock cycle:  a_bus, b_bus, alu/shift/mult_func,
   //c_source, and rd_index.
   always @(posedge clk or posedge reset) begin
      if (reset) begin
         pause_enable_reg <= 1'b1 ;
         rd_index_reg     <= 6'b000000 ;
         a_busD           <= `ZERO;
         b_busD           <= `ZERO;
         alu_funcD        <= 4'b0000;
         shift_funcD      <= 2'b00;
         mult_funcD       <= 4'b0000;
         reg_dest_reg     <= `ZERO;
         c_source_reg     <= 3'b000;
      end else begin
         if (~freeze_pipeline)
         begin
            if ((rs_index == 6'b000000 | rs_index != rd_index_reg) |
                (a_source != `a_from_reg_source | ~pause_enable_reg))
               a_busD <= a_bus ;
            else
               a_busD <= reg_dest_delay ; //rs from previous operation (bypass stage)

            if ((rt_index == 6'b000000 | rt_index != rd_index_reg) |
                (b_source != `b_from_reg_target | ~pause_enable_reg))
               b_busD <= b_bus ;
            else
               b_busD <= reg_dest_delay ; //rt from previous operation

            alu_funcD    <= alu_func  ;
            shift_funcD  <= shift_func;
            mult_funcD   <= mult_func ;
            reg_dest_reg <= reg_dest  ;
            c_source_reg <= c_source  ;
            rd_index_reg <= rd_index  ;
         end

         if (~pause_enable_reg & ~pause_any)
            pause_enable_reg <= 1'b1 ; //enable pause_pipeline
         else if (pause_mult_clock)
            pause_enable_reg <= 1'b0 ; //disable pause_pipeline

      end
   end

   always @(pc_source or mem_source or mult_func or c_source_reg or
            c_bus or reg_dest_reg) begin
      if ((pc_source != `from_inc4 & pc_source != `from_opcode25_0) |
           mem_source != `mem_fetch |
           (mult_func == `mult_read_lo | mult_func == `mult_read_hi))
         pause_mult_clock = 1'b1;
      else
         pause_mult_clock = 1'b0;

      if (c_source_reg == `c_from_alu)
         reg_dest_delay = c_bus; //delayed by 1 clock cycle via a_busD & b_busD
      else
         reg_dest_delay = reg_dest_reg; //need to delay 1 clock cycle from reg_dest
   end

endmodule
