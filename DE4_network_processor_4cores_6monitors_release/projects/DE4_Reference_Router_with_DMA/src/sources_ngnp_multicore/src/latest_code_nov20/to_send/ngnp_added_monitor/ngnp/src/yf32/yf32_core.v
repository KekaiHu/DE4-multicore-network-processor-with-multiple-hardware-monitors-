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
// FILE: yf32_core.v (mlite CPU core with Wishbone I/F)
//
// Vertsion: 1.0
//
// Date: 2004/03/29
//
// Author: Yung-Fu Chen (yfchen58@gmail.com)
//
// MODIFICATION HISTORY:
// Date        By         Version  Change Description
//============================================================
// 2004/03/29  yfchen     1.0      1st version
//------------------------------------------------------------------------------

module yf32_core (CLK_I, RST_I, ADR_O, DAT_I, DAT_O, WE_O, SEL_O,
                  STB_O, ACK_I, CYC_O, INT_I);

    input           CLK_I;
    input           RST_I;
    input  [31:0]   DAT_I;
    input           ACK_I;
    input           INT_I;
    output [31:0]   ADR_O;
    output [31:0]   DAT_O;
    output          WE_O;
    output [ 3:0]   SEL_O;
    output          STB_O;
    output          CYC_O;

    wire STB_O = ~RST_I;
    wire CYC_O = ~RST_I;

    mlite_cpu u1_cpu(
        .clk          (CLK_I    ),
        .reset_in     (RST_I    ),
        .intr_in      (INT_I    ),
        .mem_address  (ADR_O    ),
        .mem_data_w   (DAT_O    ),
        .mem_data_r   (DAT_I    ),
        .mem_byte_sel (SEL_O    ),
        .mem_write    (WE_O     ),
        .mem_pause    (~ACK_I   )
    );

endmodule
