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
// FILE: mult.v (tranlate from mult.vhd from opencores.org)
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
// 2004/03/22  yfchen     1.0      Translate from mult.vhd
//------------------------------------------------------------------------------

//-------------------------------------------------------------------
// TITLE: Multiplication and Division Unit
// AUTHORS: Steve Rhoads (rhoadss@yahoo.com)
//          Matthias Gruenewald
// DATE CREATED: 1/31/01
// FILENAME: mult.vhd
// PROJECT: Plasma CPU core
// COPYRIGHT: Software placed into the public domain by the author.
//    Software 'as is' without warranty.  Author liable for nothing.
// DESCRIPTION:
//    Implements the multiplication and division unit.
//    Division takes 32 clock cycles.
//    Multiplication normally takes 16 clock cycles.
//    if b <= 0xffff then mult in 8 cycles.
//    if b <= 0xff then mult in 4 cycles.
//
// For multiplication set reg_b = 0x00000000 & b.  The 64-bit result
// will be in reg_b.  The lower bits of reg_b contain the upper
// bits of b that have not yet been multiplied.  For 16 clock cycles
// shift reg_b two bits to the right.  Use the lowest two bits of reg_b
// to multiply by two bits at a time and add the result to the upper
// 32-bits of reg_b (using C syntax):
//    reg_b = (reg_b >> 2) + (((reg_b & 3) * reg_a) << 32);
//
// For division set reg_b = '0' & b & 30_ZEROS.  The answer will be
// in answer_reg and the remainder in reg_a.  For 32 clock cycles
// (using C syntax):
//    answer_reg = (answer_reg << 1);
//    if (reg_a >= reg_b) {
//       answer_reg += 1;
//       reg_a -= reg_b;
//    }
//    reg_b = reg_b >> 1;
//-------------------------------------------------------------------
`include "yf32_define.v"
module mult (clk, reset, a, b, mult_func, c_mult, pause_out);

   input         clk;
   input         reset;
   input  [31:0] a;
   input  [31:0] b;
   input  [ 3:0] mult_func;
   output [31:0] c_mult;
   output        pause_out;

   wire   [31:0] c_mult;
   reg           pause_out;

   //   type mult_function_type is (
   //      mult_nothing, mult_read_lo, mult_read_hi, mult_write_lo,
   //      mult_write_hi, mult_mult, mult_divide, mult_signed_divide);
   reg         do_mult_reg;
   reg         do_signed_reg;
   reg  [ 5:0] count_reg;
   reg  [31:0] reg_a;
   reg  [63:0] reg_b;
   reg  [31:0] answer_reg;
   reg  [33:0] aa;
   reg  [33:0] bb;
   wire [33:0] sum;
   wire [67:0] sum2;
   reg  [33:0] reg_a_times3;
   reg         sign_extend_sig;

   //Used in Xilinx tri-state area optimizated version
   wire [31:0] a_temp_sig;
   wire [31:0] a_neg_sig;
   wire [31:0] b_neg_sig;
   wire [63:0] b_temp_sig;
   wire        a_msb;
   wire        b_msb;
   wire [31:0] answer_temp_sig;

   reg         do_mult_temp;
   reg         do_signed_temp;
   reg  [ 5:0] count_temp;
   reg  [31:0] a_temp;
   reg  [63:0] b_temp;
   reg  [31:0] answer_temp;
   reg         start;
   reg         do_write;
   reg         do_hi;
   reg         sign_extend;

//sum = aa + bb
`ifdef mul_adder_type_GENERIC
   assign sum = (do_mult_reg) ? (aa + bb) : (aa - bb) ;
`endif

//For Altera: sum = aa + bb
`ifdef mul_adder_type_ALTERA
// synthesis translate_off
   //lpm_adder
	lpm_add_sub	lpm_add_sub_component (
				.dataa   (aa         ),
				.add_sub (do_mult_reg),
				.datab   (bb         ),
				.result  (sum        ));
	defparam
        lpm_add_sub_component.lpm_width = 34,
		lpm_add_sub_component.lpm_direction = "UNUSED",
		lpm_add_sub_component.lpm_type = "LPM_ADD_SUB",
		lpm_add_sub_component.lpm_hint = "ONE_INPUT_IS_CONSTANT=NO";
// synthesis translate_on
`endif

// DesignWare Library
`ifdef mul_adder_type_DW
   DW01_addsub #(34) DW_adder (
        .A      (aa     ),
        .B      (bb     ),
        .CI     (1'b0   )
        .ADD_SUB(do_add ),
        .SUM    (sum    ));
`endif

   // Negate signals
   assign a_neg_sig = (~a) + 1;
   assign b_neg_sig = (~b) + 1;
   wire wire_xhdl3 = do_signed_reg & do_mult_reg ;
   always @(wire_xhdl3)
   begin
      sign_extend_sig <= wire_xhdl3;
   end

   // Result
   assign c_mult = (mult_func == `mult_read_lo) ? reg_b[31: 0] :
                   (mult_func == `mult_read_hi) ? reg_b[63:32] : `ZERO ;

   //multiplication/division unit
`ifdef mult_type_GENERIC

   always @(posedge clk or posedge reset)
   begin
      if (reset) begin
          do_mult_reg   <= 1'b0 ;
          do_signed_reg <= 1'b0 ;
          count_reg     <= 6'b0 ;
          reg_a         <= 32'b0;
          reg_b         <= 32'b0;
          answer_reg    <= 32'b0;
          reg_a_times3  <= 34'b0;
      end
      else begin
          do_mult_reg   <= do_mult_temp ;
          do_signed_reg <= do_signed_temp ;
          count_reg     <= count_temp ;
          reg_a         <= a_temp ;
          reg_b         <= b_temp ;
          answer_reg    <= answer_temp ;
          if (start)
             reg_a_times3 <= ({(a_temp[31] & do_signed_temp), a_temp, 1'b0}) +
                             ({(a_temp[31] & do_signed_temp),
                               (a_temp[31] & do_signed_temp), a_temp}) ;
     end
   end

  always @(do_mult_reg or do_signed_reg or count_reg or reg_a or reg_b or
           answer_reg or do_signed_reg or do_mult_reg or mult_func or start or
           a or b or a_neg_sig or b_neg_sig or reg_a_times3 or sum)
   begin
      do_mult_temp   = do_mult_reg;
      do_signed_temp = do_signed_reg;
      count_temp     = count_reg;
      a_temp         = reg_a;
      b_temp         = reg_b;
      answer_temp    = answer_reg;
      sign_extend    = do_signed_reg & do_mult_reg;
      start          = 1'b0;
      do_write       = 1'b0;
      do_hi          = 1'b0;
      case (mult_func) // synopsys parallel_case
         `mult_read_lo :
                  begin
                  end
         `mult_read_hi :
                  begin
                     do_hi = 1'b1;
                  end
         `mult_write_lo :
                  begin
                     do_write = 1'b1;
                  end
         `mult_write_hi :
                  begin
                     do_write = 1'b1;
                     do_hi    = 1'b1;
                  end
         `mult_mult :
                  begin
                     start          = 1'b1;
                     do_mult_temp   = 1'b1;
                     do_signed_temp = 1'b0;
                  end
         `mult_signed_mult :
                  begin
                     start          = 1'b1;
                     do_mult_temp   = 1'b1;
                     do_signed_temp = 1'b1;
                  end
         `mult_divide :
                  begin
                     start          = 1'b1;
                     do_mult_temp   = 1'b0;
                     do_signed_temp = 1'b0;
                  end
         `mult_signed_divide :
                  begin
                     start          = 1'b1;
                     do_mult_temp   = 1'b0;
                     do_signed_temp = a[31] ^ b[31];
                  end
         default :
                  begin
                  end
      endcase

      if (start) begin
         count_temp  =  6'b0;
         answer_temp = 32'b0;
         if (~do_mult_temp) begin

            b_temp[63] = 1'b0;
            if (mult_func != `mult_signed_divide | ~a[31])
               a_temp = a;
            else
               a_temp = a_neg_sig;
            if (mult_func != `mult_signed_divide | ~b[31])
               b_temp[62:31] = b;
            else
               b_temp[62:31] = b_neg_sig;
            b_temp[30:0] = 31'b0;

         end else begin
            //multiply
            if (~do_signed_temp | ~b[31]) begin
               a_temp       = a;
               b_temp[31:0] = b;
            end else begin
               a_temp       = a_neg_sig;
               b_temp[31:0] = b_neg_sig;
            end
            b_temp[63:32] = 32'b0;
         end
      end else if (do_write) begin
         if (do_hi == 1'b0) b_temp[31:0] = a;
         else               b_temp[63:32] = a;
      end

      if (~do_mult_reg)
      begin
         //division
         aa <= {(reg_a[31] & sign_extend), (reg_a[31] & sign_extend), reg_a} ;
         bb <= reg_b[33:0] ;
      end else begin
         //multiplication two-bits at a time
         case (reg_b[1:0]) // synopsys parallel_case
            2'b00  : aa <= {2'b00, `ZERO} ;
            2'b01  : aa <= {(reg_a[31] & sign_extend), (reg_a[31] & sign_extend), reg_a} ;
            2'b10  : aa <= {(reg_a[31] & sign_extend), reg_a, 1'b0} ;
            default: aa <= reg_a_times3 ;
         endcase
         bb <= {(reg_b[63] & sign_extend), (reg_b[63] & sign_extend), reg_b[63:32]} ;
      end

      if (~count_reg[5] & ~start) begin
         count_temp = count_reg + 1;
         if (~do_mult_reg) begin
            //division
            answer_temp[31:1] = answer_reg[30:0];
            if (reg_b[63:32] == `ZERO & (sum[32]) == 1'b0) begin
               a_temp         = sum[31:0]; //aa=aa-bb;
               answer_temp[0] = 1'b1;
            end else begin
               answer_temp[0] = 1'b0;
            end
            if (count_reg != 6'b011111) begin
               b_temp[62:0] = reg_b[63:1];
            end else begin
               //done with divide
               b_temp[63:32] = a_temp;
               if (~do_signed_reg)
                  b_temp[31:0] = answer_temp;
               else
                  b_temp[31:0] = (~answer_temp) + 1;
            end
         end else begin
            // mult_mode
            b_temp[63:30] = sum;
            b_temp[29: 0] = reg_b[31:2];
            if (count_reg == 6'b001000 & ~sign_extend & reg_b[15:0] == 16'b0)
            begin
               //early stop
               count_temp   = 6'b111111;
               b_temp[31:0] = reg_b[47:16];
            end
            if (count_reg == 6'b000100 & ~sign_extend & reg_b[23:0] == 24'b0)
            begin
               //early stop
               count_temp   = 6'b111111;
               b_temp[31:0] = reg_b[55:24];
            end
            count_temp[5] = count_temp[4];
         end
      end
      if (~count_reg[5] & mult_func != `mult_nothing & ~start)
         pause_out <= 1'b1 ;
      else
         pause_out <= 1'b0 ;

   end
`endif

endmodule
