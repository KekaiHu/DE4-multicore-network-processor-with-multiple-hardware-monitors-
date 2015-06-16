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
// FILE: alu.v (tranlate from alu.vhd from opencores.org)
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
// 2004/03/22  yfchen     1.0      Translate from alu.vhd
// 2004/10/27  yfchen     1.2      minor coding style change
//------------------------------------------------------------------------------

//-------------------------------------------------------------------
// TITLE: Arithmetic Logic Unit
// AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
// DATE CREATED: 2/8/01
// FILENAME: alu.vhd
// PROJECT: Plasma CPU core
// COPYRIGHT: Software placed into the public domain by the author.
//    Software 'as is' without warranty.  Author liable for nothing.
// DESCRIPTION:
//    Implements the ALU.
//-------------------------------------------------------------------

module alu (a_in, b_in, alu_function, c_alu);

   input  [31:0] a_in        ;
   input  [31:0] b_in        ;
   input  [ 3:0] alu_function;
   output [31:0] c_alu       ;

   //   type alu_function_type is (alu_nothing, alu_add, alu_subtract,
   //                              alu_less_than, alu_less_than_signed,
   //                              alu_or, alu_and, alu_xor, alu_nor);
   wire [32:0] aa      ;
   wire [32:0] bb      ;
   wire [32:0] sum     ;
   wire        do_add  ;
   wire        sign_ext;

   assign do_add   = (alu_function == `alu_add      ) ? 1'b1 : 1'b0 ;
   assign sign_ext = (alu_function == `alu_less_than) ? 1'b0 : 1'b1 ;
   assign aa       = {(a_in[31] & sign_ext), a_in} ;
   assign bb       = {(b_in[31] & sign_ext), b_in} ;

`ifdef alu_type_GENERIC
/*
   wire   [31:0] c_alu;
   assign c_alu = (alu_function==`alu_add |
                   alu_function==`alu_subtract        ) ? sum[31:0]:
                  (alu_function==`alu_less_than |
                   alu_function==`alu_less_than_signed) ? {31'b0, sum[32]}:
                  (alu_function==`alu_or              ) ? a_in | b_in:
                  (alu_function==`alu_and             ) ? a_in & b_in:
                  (alu_function==`alu_xor             ) ? a_in ^ b_in:
                  (alu_function==`alu_nor             ) ? ~(a_in | b_in):
                  32'b0;
*/
    reg    [31:0] c_alu;
    always @(alu_function or sum or a_in or b_in ) begin
        case(alu_function) // synopsys parallel_case
            `alu_add                : c_alu = sum[31:0]         ;
            `alu_subtract           : c_alu = sum[31:0]         ;
            `alu_less_than          : c_alu = {31'b0, sum[32]}  ;
            `alu_less_than_signed   : c_alu = {31'b0, sum[32]}  ;
            `alu_or                 : c_alu = a_in | b_in       ;
            `alu_and                : c_alu = a_in & b_in       ;
            `alu_xor                : c_alu = a_in ^ b_in       ;
            `alu_nor                : c_alu = ~(a_in | b_in)    ;
            default                 : c_alu = 32'b0             ;
        endcase
    end
`endif

`ifdef alu_type_TRISTATE
   assign c_alu = (alu_function == `alu_add |
                   alu_function == `alu_subtract) ? sum[31:0] : {32{1'bz}} ;
   assign c_alu = (alu_function == `alu_less_than |
                   alu_function == `alu_less_than_signed) ? {31'b0, sum[32]} : {32{1'bz}} ;
   assign c_alu = (alu_function == `alu_or) ? a_in | b_in : {32{1'bz}} ;
   assign c_alu = (alu_function == `alu_and) ? a_in & b_in : {32{1'bz}} ;
   assign c_alu = (alu_function == `alu_xor) ? a_in ^ b_in : {32{1'bz}} ;
   assign c_alu = (alu_function == `alu_nor) ? ~(a_in | b_in) : {32{1'bz}} ;
   assign c_alu = (alu_function == `alu_nothing) ? `ZERO : {32{1'bz}} ;
`endif

`ifdef alu_adder_type_GENERIC
   assign sum = (do_add)? aa+bb : aa-bb;
`endif

`ifdef alu_adder_type_ALTERA
   //lpm_adder
// synthesis translate_off
	lpm_add_sub	lpm_add_sub_component (
				.add_sub (do_add ),
				.dataa   (aa     ),
				.datab   (bb     ),
				.result  (sum    ));
	defparam
        lpm_add_sub_component.lpm_width = 33,
		lpm_add_sub_component.lpm_direction = "UNUSED",
		lpm_add_sub_component.lpm_type = "LPM_ADD_SUB",
		lpm_add_sub_component.lpm_hint = "ONE_INPUT_IS_CONSTANT=NO";
// synthesis translate_on
`endif

`ifdef alu_adder_type_DW
   DW01_addsub #(33) DW_adder (
        .A      (aa     ),
        .B      (bb     ),
        .CI     (1'b0   )
        .ADD_SUB(do_add ),
        .SUM    (sum    ));
`endif
endmodule
