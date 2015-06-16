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
// FILE: bus_mux.v (tranlate from bus_mux.vhd from opencores.org)
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
// 2004/03/22  yfchen     1.0      Translate from bus_mux.vhd
// 2004/10/27  yfchen     1.2      minor coding style change
//------------------------------------------------------------------------------

//-------------------------------------------------------------------
// TITLE: Bus Multiplexer / Signal Router
// AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
// DATE CREATED: 2/8/01
// FILENAME: bus_mux.vhd
// PROJECT: Plasma CPU core
// COPYRIGHT: Software placed into the public domain by the author.
//    Software 'as is' without warranty.  Author liable for nothing.
// DESCRIPTION:
//    This entity is the main signal router.
//    It multiplexes signals from multiple sources to the correct location.
//    The outputs are as follows:
//       a_bus        : goes to the ALU
//       b_bus        : goes to the ALU
//       reg_dest_out : goes to the register bank
//       take_branch  : goes to pc_next
//-------------------------------------------------------------------
`include "yf32_define.v"
module bus_mux (imm_in, reg_source, a_mux, a_out, reg_target, b_mux, b_out,
                c_bus, c_memory, c_pc, c_pc_plus4, c_mux, reg_dest_out,
                branch_func, take_branch);

   input  [15:0] imm_in;
   input  [31:0] reg_source;
   input  [ 1:0] a_mux;
   input  [31:0] reg_target;
   input  [ 1:0] b_mux;
   input  [31:0] c_bus;
   input  [31:0] c_memory;
   input  [31:0] c_pc;
   input  [31:0] c_pc_plus4;
   input  [ 2:0] c_mux;
   input  [ 2:0] branch_func;

   output [31:0] a_out;
   output [31:0] b_out;
   output [31:0] reg_dest_out;
   output        take_branch;


   reg    [31:0] reg_dest_out;
   reg    [31:0] b_out;
   reg    [31:0] a_out;
   reg           take_branch;

   wire is_equal = (reg_source == reg_target)?1'b1:1'b0;

   //   type a_source_type is (a_from_reg_source, a_from_imm10_6);
   //   type b_source_type is (b_from_reg_target, b_from_imm, b_from_signed_imm);
   //   type c_source_type is (c_from_null, c_from_alu, c_from_shift,
   //      c_from_mult, c_from_memory, c_from_pc, c_from_imm_shift16,
   //      c_from_reg_source_nez, c_from_reg_source_eqz);

// a_mux
   always @(reg_source or imm_in or a_mux or c_pc) begin
      case (a_mux) // synopsys parallel_case
         `a_from_reg_source :
                  begin
                     a_out = reg_source ;
                  end
         `a_from_imm10_6 :
                  begin
                     a_out[31:5] = 27'b0; //`ZERO[31:5]
                     a_out[ 4:0] = imm_in[10:6] ;
                  end
         default :
                  begin
                     //a_from_pc
                     a_out = c_pc ;
                  end
      endcase
   end

// b_mux
   always @(reg_target or imm_in or b_mux)  begin
      case (b_mux) // synopsys parallel_case
         `b_from_reg_target :
                  begin
                     b_out = reg_target ;
                  end
         `b_from_imm :
                  begin
                     b_out = {16'b0, imm_in} ; //`ZERO[31:16]
                  end
         `b_from_signed_imm :
                  begin
                     if (~imm_in[15]) begin
                        b_out[31:16] = 16'b0; //`ZERO[31:16]
                     end else begin
                        b_out[31:16] = 16'b1111111111111111 ;
                     end
                     b_out[15:0] = imm_in ;
                  end
         default :
                  begin
                     //b_from_immX4
                     if (~imm_in[15]) begin
                        b_out[31:18] = 14'b00000000000000 ;
                     end else begin
                        b_out[31:18] = 14'b11111111111111 ;
                     end
                     b_out[17:0] = {imm_in, 2'b00} ;
                  end
      endcase
   end

// c_mux
   always @(c_bus or c_memory or c_pc or c_pc_plus4 or imm_in or c_mux) begin
      case (c_mux) // synopsys parallel_case
         `c_from_alu :
                  begin
                     // | c_from_shift | c_from_mult =>
                     reg_dest_out = c_bus ;
                  end
         `c_from_memory :
                  begin
                     reg_dest_out = c_memory ;
                  end
         `c_from_pc :
                  begin
                     reg_dest_out = {c_pc[31:3], 3'b000} ; //backup one opcode
                  end
         `c_from_pc_plus4 :
                  begin
                     reg_dest_out = c_pc_plus4 ;
                  end
         `c_from_imm_shift16 :
                  begin
                     reg_dest_out = {imm_in, 16'b0}; //`ZERO[15:0]
                  end
         //`c_from_reg_source_nez:
         //????
         //`from_reg_source_eqz:
         //????
         default :
                  begin
                     reg_dest_out = c_bus ;
                  end
      endcase
   end

// take_branch
   always @(branch_func or reg_source or is_equal) begin
      case (branch_func) // synopsys parallel_case
         `branch_ltz : take_branch = reg_source[31];
         `branch_lez : take_branch = reg_source[31] | is_equal ;
         `branch_eq  : take_branch = is_equal ;
         `branch_ne  : take_branch = ~is_equal ;
         `branch_gez : take_branch = ~reg_source[31] ;
         `branch_gtz : take_branch = ~reg_source[31] & ~is_equal ;
         `branch_yes : take_branch = 1'b1 ;
//         default     : take_branch = is_equal ;
         default     : take_branch = 1'b0 ;
      endcase
   end
endmodule
