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
// FILE: pc_next.v (tranlate from pc_next.vhd from opencores.org)
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
// 2004/03/22  yfchen     1.0      Translate from pc_next.vhd
//------------------------------------------------------------------------------

//-------------------------------------------------------------------
// TITLE: Program Counter Next
// AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
// DATE CREATED: 2/8/01
// FILENAME: pc_next.vhd
// PROJECT: Plasma CPU core
// COPYRIGHT: Software placed into the public domain by the author.
//    Software 'as is' without warranty.  Author liable for nothing.
// DESCRIPTION:
//    Implements the Program Counter logic.
//-------------------------------------------------------------------

module pc_next (clk, reset, pc_new, take_branch, pause_in,
                 opcode25_0, pc_source, pc_out, pc_out_plus4);

    input         clk;
    input         reset;
    input  [31:2] pc_new;
    input         take_branch;
    input         pause_in;
    input  [25:0] opcode25_0;
    input  [ 1:0] pc_source;
    output [31:0] pc_out;
    output [31:0] pc_out_plus4;

    reg[31:2] pc_next;

    //   type pc_source_type is (from_inc4, from_opcode25_0, from_branch,
    //                           from_lbranch);

    reg[31:2] pc_reg;

    wire [31:2] pc_inc = pc_reg + 1; //pc_reg+1

    wire   [31:0] pc_out       = {pc_reg, 2'b00} ;
    wire   [31:0] pc_out_plus4 = {pc_inc, 2'b00} ;

    always @(posedge clk or posedge reset)
    begin
       if (reset)
          pc_reg <= `PC_RESET;
       else
          pc_reg <= pc_next;
    end

    always @(pc_source or pc_inc or pc_reg or opcode25_0 or
             take_branch or pc_new or pause_in)
    begin
       case (pc_source)
          `from_inc4         : pc_next = pc_inc;
          `from_opcode25_0   : pc_next = {pc_reg[31:28], opcode25_0};
          default : begin
             //from_branch | from_lbranch =>
             if (take_branch)  pc_next = pc_new;
             else              pc_next = pc_inc;
          end
       endcase
       if (pause_in == 1'b1)
       begin
          pc_next = pc_reg;
       end
    end

endmodule
