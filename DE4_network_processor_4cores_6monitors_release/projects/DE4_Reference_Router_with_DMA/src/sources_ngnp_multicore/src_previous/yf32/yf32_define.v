//------------------------------------------------------------------------------
// YF32 -- A small SOC implementation based on mlite (32-bit RISC CPU)
//                                                                       @Taiwan
//------------------------------------------------------------------------------
//
//  YF32 - A SOC implementation based on verilog ported mlite (32-bit RISC CPU)
//  Copyright (C) 2003-2004 Yung-Fu Chen (yfchen58@gmail.com)
//
//  This code is free software; you can redistribute it and/or modify it under
//  the terms of the GNU Lesser General Public License as published by the Free
//  Software Foundation; either version 2.1 of the License, or (at your option)
//  any later version.
//
//  This code is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License
//  for more details.
//
//  Full details of the license can be found in
//  http://www.gnu.org/copyleft/gpl.html
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
// FILE: yf32_define.v (tranlate from mlite_pack.vhd from opencores.org)
//
// Vertsion: 1.1
//
// Date: 2004/03/26
//
// Author: Yung-Fu Chen (yfchen58@gmail.com)
//
// MODIFICATION HISTORY:
// Date        By         Version  Change Description
//============================================================
// 2004/03/22  yfchen     1.0      Translate from mlite_pack.vhd
// 2004/03/26  yfchen     1.1      rename mlite_pack.vhd to yf32_define.v
//------------------------------------------------------------------------------

//-------------------------------------------------------------------
// TITLE: Plasma Misc. Package
// AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
// DATE CREATED: 2/15/01
// FILENAME: mlite_pack.vhd
// PROJECT: Plasma CPU core
// COPYRIGHT: Software placed into the public domain by the author.
//    Software 'as is' without warranty.  Author liable for nothing.
// DESCRIPTION:
//    Data types, constants, and add functions needed for the Plasma CPU.
//-------------------------------------------------------------------

`define ZERO     32'b00000000000000000000000000000000
`define ONES     32'b11111111111111111111111111111111
`define HIGH_Z   32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ

`define INTERRUPT_VECTOR 32'h00000008

// ============================================
// pc_next.v
// ---------
`define PC_RESET        32'b0
//
`define from_inc4       2'b00
`define from_opcode25_0 2'b01
`define from_branch     2'b10
`define from_lbranch    2'b11
// ============================================

// ============================================
// alu.v
// -----
`define alu_adder_type_GENERIC
//`define alu_adder_type_ALTERA
`define alu_type_GENERIC
//`define alu_type_TRISTATE
//
`define alu_nothing          4'b0000
`define alu_add              4'b0001
`define alu_subtract         4'b0010
`define alu_less_than        4'b0011
`define alu_less_than_signed 4'b0100
`define alu_or               4'b0101
`define alu_and              4'b0110
`define alu_xor              4'b0111
`define alu_nor              4'b1000
// ============================================

// ============================================
// bus_mux.v
// -----
`define a_from_reg_source  2'b00
`define a_from_imm10_6     2'b01
`define a_from_pc          2'b10
`define b_from_reg_target  2'b00
`define b_from_imm         2'b01
`define b_from_signed_imm  2'b10
`define b_from_immX4       2'b11
`define c_from_null        4'b000
`define c_from_alu         4'b001
`define c_from_shift       4'b001 //same as alu
`define c_from_mult        4'b001 //same as alu
`define c_from_memory      4'b010
`define c_from_pc          4'b011
`define c_from_pc_plus4    4'b100
`define c_from_imm_shift16 4'b101
`define c_from_reg_sourcen 4'b110
`define branch_ltz         3'b000
`define branch_lez         3'b001
`define branch_eq          3'b010
`define branch_ne          3'b011
`define branch_gez         3'b100
`define branch_gtz         3'b101
`define branch_yes         3'b110
// ============================================

// ============================================
// shifter.v
// -----

`define shifter_type_GENERIC
//`define shifter_type_TRISTATE

`define shift_nothing        2'b00
`define shift_left_unsigned  2'b01
`define shift_right_signed   2'b11
`define shift_right_unsigned 2'b10
// ============================================

// ============================================
// mult.v
// -----
`define mul_adder_type_GENERIC
//`define mul_adder_type_ALTERA
//
`define mult_type_GENERIC

`define mult_nothing       4'b0000
`define mult_read_lo       4'b0001
`define mult_read_hi       4'b0010
`define mult_write_lo      4'b0011
`define mult_write_hi      4'b0100
`define mult_mult          4'b0101
`define mult_signed_mult   4'b0110
`define mult_divide        4'b0111
`define mult_signed_divide 4'b1000
// ============================================

// ============================================
// mem_ctrl.v
// -----

// Byte Ordering
// 00 = big_endian
// 11 = little_endian
`define mem_byte_ordering 2'b00
//
//`define mem_dat_w_TRISTATE
//
`define mem_fetch   4'b0000
`define mem_read32  4'b0100
`define mem_write32 4'b0101
`define mem_read16  4'b1000
`define mem_read16s 4'b1010
`define mem_write16 4'b1001
`define mem_read8   4'b1100
`define mem_read8s  4'b1110
`define mem_write8  4'b1101
// ============================================

// ============================================
// reg_bank.v
// -----
`define reg_mem_type_TRI_PORT_MEM
//`define reg_mem_type_DUAL_PORT_MEM
//`define reg_mem_type_ALTERA_MEM
// ============================================

// ============================================
// mlite_cpu.v
// -----
//`define mlite_cpu_pipeline2
`define mlite_cpu_pipeline3
// ============================================
