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
// FILE: mem_ctrl.v (tranlate from mem_ctrl.vhd from opencores.org)
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
// 2004/03/22  yfchen     1.0      Translate from mem_ctrl.vhd
// 2004/10/27  yfchen     1.2      minor coding style change
// 2004/10/29  yfchen     1.3      fix mem_byte_sel bug when read
//------------------------------------------------------------------------------

//-------------------------------------------------------------------
// TITLE: Memory Controller
// AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
// DATE CREATED: 1/31/01
// FILENAME: mem_ctrl.vhd
// PROJECT: Plasma CPU core
// COPYRIGHT: Software placed into the public domain by the author.
//    Software 'as is' without warranty.  Author liable for nothing.
// DESCRIPTION:
//    Memory controller for the Plasma CPU.
//    Supports Big or Little Endian mode.
//    Four cycles for a write unless a(31)='1' then two cycles.
//    This entity could implement interfaces to:
//       Data cache
//       Address cache
//       Memory management unit (MMU)
//       DRAM controller
//-------------------------------------------------------------------
`include "yf32_define.v"
module mem_ctrl (clk, reset, pause_in, nullify_op, address_pc, opcode_out,
                 address_data, mem_source, data_write, data_read, pause_out,
                 mem_address, mem_data_w, mem_data_r, mem_byte_sel, mem_write,address_next_out);

   parameter ACCURATE_TIMING  = 1'b0;

   parameter STATE_FETCH      = 2'b00;
   parameter STATE_ADDR       = 2'b01;
   parameter STATE_WRITE      = 2'b10;
   parameter STATE_PAUSE      = 2'b11;

   input         clk;
   input         reset;
   input         pause_in;
   input         nullify_op;
   input  [31:0] address_pc;
   input  [31:0] address_data;
   input  [ 3:0] mem_source;
   input  [31:0] data_write;
   input  [31:0] mem_data_r;

   output [31:0] opcode_out;
   output [31:0] data_read;
   output        pause_out;
   output [31:0] mem_address;
   output [31:0] mem_data_w;
   output [ 3:0] mem_byte_sel;
   output        mem_write;
	output [31:0] address_next_out;

   wire   [ 1:0] little_endian = `mem_byte_ordering;
   reg    [31:0] opcode_out;
   reg    [31:0] data_read;
   reg           pause_out;
   reg    [31:0] mem_address;
   reg    [31:0] mem_data_w;
   reg    [ 3:0] mem_byte_sel;

   reg           mem_write;

   reg    [31:0] opcode_reg;
   reg    [31:0] next_opcode_reg;
   reg    [ 1:0] mem_state_reg;

   //ACCURATE_TIMING notes:
   //The VHDL compiler's timing calculation isn't able to realize that
   //memory reads take two clock cycles.  It notices that reg_bank:reg_dest
   //is dependent on mem_ctrl:mem_data_r which is dependent on
   //mem_ctrl:mem_address which is dependent on alu:c_alu.  However,
   //this dependency is only true for memory read or write cycles
   //which are multiple clock cycles.  Enabling ACCURATE_TIMING
   //creates an additional 32-bit register that does nothing other
   //than letting the VHDL compiler accurately predict the maximum
   //clock speed.

   reg   [31:0] address_reg;
   reg          write_reg;
   reg   [ 3:0] byte_sel_reg;
   reg   [ 1:0] mem_state_next_sig;
   reg   [31:0] opcode_next_sig;
   reg          write_next_sig;
   reg   [ 3:0] byte_sel_next_sig;

   reg   [31:0] data;
   reg   [31:0] opcode_next;
   reg   [ 3:0] byte_sel_next;
   reg   [ 3:0] byte_sel;
   reg          write_next;
   reg          write_line;
   reg   [ 1:0] mem_state_next;
   reg          pause;
   reg   [31:0] address;
   reg   [ 1:0] bits;
   reg   [31:0] mem_data_w_v;

   always @(posedge clk or posedge reset) begin
      if (reset) begin
         mem_state_reg   <= STATE_FETCH ;
         opcode_reg      <= `ZERO ;
         next_opcode_reg <= `ZERO ;
      end else begin
         mem_state_reg   <= mem_state_next_sig ;
         opcode_reg      <= opcode_next_sig ;
         if (mem_state_reg == STATE_FETCH)
             next_opcode_reg <= mem_data_r ;
      end
   end

`ifdef ACCURATE_TIMING
   always @(posedge clk or posedge reset)
   begin
      if (reset) begin
          address_reg  <= 0;
          write_reg    <= 0;
          byte_sel_reg <= 0;
      else begin
          address_reg  <= address_data ;
          write_reg    <= write_next_sig ;
          byte_sel_reg <= byte_sel_next_sig ;
      end
   end
`else
   always @(address_data or write_next_sig or byte_sel_next_sig)
   begin
      address_reg  = address_data ;
      write_reg    = write_next_sig ;
      byte_sel_reg = byte_sel_next_sig ;
   end
`endif

   always @(reset or pause_in or nullify_op or address_pc or address_data or
            mem_source or data_write or mem_data_r or opcode_reg or
            next_opcode_reg or mem_state_reg or address_reg or write_reg or
            byte_sel_reg or little_endian)
   begin

      byte_sel_next  = 4'b0000;
      write_next     = 1'b0;
      pause          = 1'b0;
      mem_state_next = mem_state_reg;
      data           = `ZERO;
      mem_data_w_v   = `ZERO;
      case (mem_source) // synopsys parallel_case
         `mem_read32 :
                  begin
                     data = mem_data_r;
                     byte_sel_next = 4'b1111; // yfchen modified
                  end
         `mem_read16, `mem_read16s :
                  begin
                     if (address_reg[1] == little_endian[1]) begin
                        data[15:0] = mem_data_r[31:16];
                        byte_sel_next = 4'b1100; // yfchen modified
                     end else begin
                        data[15:0] = mem_data_r[15:0];
                        byte_sel_next = 4'b0011; // yfchen modified
                     end
                     if (mem_source == `mem_read16 | ~data[15]) begin
                        data[31:16] = 16'h0000; //`ZERO[31:16];
                     end else begin
                        data[31:16] = 16'hFFFF; //`ONES[31:16];
                     end
                  end
         `mem_read8, `mem_read8s :
                  begin
                     bits = address_reg[1:0] ^ little_endian;
                     case (bits) // synopsys parallel_case
                        2'b00  : data[7:0] = mem_data_r[31:24];
                        2'b01  : data[7:0] = mem_data_r[23:16];
                        2'b10  : data[7:0] = mem_data_r[15: 8];
                        default: data[7:0] = mem_data_r[ 7: 0];
                     endcase
                     if (mem_source == `mem_read8 | ~data[7]) begin
                        data[31:8] = 24'h000000; //`ZERO[31:8];
                     end else begin
                        data[31:8] = 24'hffffff; //`ONES[31:8];
                     end
                     case (bits) // yfchen modified
                        2'b00   : byte_sel_next = 4'b1000;
                        2'b01   : byte_sel_next = 4'b0100;
                        2'b10   : byte_sel_next = 4'b0010;
                        default : byte_sel_next = 4'b0001;
                     endcase
                  end
         `mem_write32 :
                  begin
                     write_next    = 1'b1;
                     mem_data_w_v  = data_write;
                     byte_sel_next = 4'b1111;
                  end
         `mem_write16 :
                  begin
                     write_next   = 1'b1;
                     mem_data_w_v = {data_write[15:0], data_write[15:0]};
                     if (address_data[1] == little_endian[1]) begin
                        byte_sel_next = 4'b1100;
                     end else begin
                        byte_sel_next = 4'b0011;
                     end
                  end
         `mem_write8 :
                  begin
                     write_next   = 1'b1;
                     mem_data_w_v = {data_write[7:0], data_write[7:0],
                                     data_write[7:0], data_write[7:0]};
                     bits         = address_data[1:0] ^ little_endian;
                     case (bits)
                        2'b00   : byte_sel_next = 4'b1000;
                        2'b01   : byte_sel_next = 4'b0100;
                        2'b10   : byte_sel_next = 4'b0010;
                        default : byte_sel_next = 4'b0001;
                     endcase
                  end
         default :
                  begin
                  end
      endcase
      byte_sel_next_sig <= byte_sel_next ;
      write_next_sig    <= write_next ;
      
      opcode_next = opcode_reg;
      case (mem_state_reg) // synopsys parallel_case
         //State Machine
         STATE_FETCH :
                  begin
                     address    = address_pc;
                     write_line = 1'b0;
                     byte_sel   = 4'b0000;
						//	mem_state_next = STATE_ADDR;
						//	opcode_next = mem_data_r;
                     if (mem_source == `mem_fetch) begin
                        //opcode fetch
                        mem_state_next = STATE_FETCH;
                        if (~pause_in) 
                            opcode_next = mem_data_r;
                     end else begin
                        //memory read or write
                        pause = 1'b1;
                        if (~pause_in) 
                            mem_state_next = STATE_ADDR;
                     end
                  end
         STATE_ADDR :
                  begin
                     //address lines pre-hold
                     address    = address_reg;
                     write_line = write_reg;
                     if (write_reg & address_reg[31])
                     begin
                        pause    = 1'b1;
                        byte_sel = 4'b0000;
                        if (pause_in == 1'b0) begin
                           mem_state_next = STATE_WRITE; //4 cycle access
                        end
                     end else begin
                        byte_sel = byte_sel_reg;
                        if (~pause_in) begin
                           opcode_next    = next_opcode_reg;
                           mem_state_next = STATE_FETCH; //2 cycle access
                        end
                     end
                  end
         STATE_WRITE :
                  begin
                     pause      = 1'b1;
                     address    = address_reg;
                     write_line = write_reg;
                     byte_sel   = byte_sel_reg;
                     if (~pause_in) begin
                        mem_state_next = STATE_PAUSE;
                     end
                  end
         default :
                  begin
                     //STATE_PAUSE address lines post-hold
                     address    = address_reg;
                     write_line = write_reg;
                     byte_sel   = 4'b0000;
                     if (~pause_in) begin
                        opcode_next    = next_opcode_reg;
                        mem_state_next = STATE_FETCH;
                     end
                  end
      endcase
      
      if (nullify_op & ~pause_in)
         opcode_next = `ZERO; //NOP after beql
         
      mem_state_next_sig <= mem_state_next;      
      opcode_next_sig    <= opcode_next;
      
      if (reset) write_line = 1'b0;
      
      opcode_out   <= opcode_reg;
      data_read    <= data;
      pause_out    <= pause;
      mem_byte_sel <= byte_sel;
      mem_address  <= address;
      mem_write    <= write_line;

      mem_data_w <= mem_data_w_v ;
      
//`ifdef mem_dat_w_TRISTATE
//      if (~write_line)
//         mem_data_w <= `HIGH_Z ; //ZERO;
//`endif         

   end //data_proc
assign address_next_out = address_reg;
	
endmodule
