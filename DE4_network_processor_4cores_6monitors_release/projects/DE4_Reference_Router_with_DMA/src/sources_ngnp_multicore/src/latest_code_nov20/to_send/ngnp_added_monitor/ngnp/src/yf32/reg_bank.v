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
// FILE: reg_bank.v (tranlate from reg_bank.vhd from opencores.org)
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
// 2004/03/22  yfchen     1.0      Translate from reg_bank.vhd
//------------------------------------------------------------------------------

//-------------------------------------------------------------------
// TITLE: Register Bank
// AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
// DATE CREATED: 2/2/01
// FILENAME: reg_bank.vhd
// PROJECT: Plasma CPU core
// COPYRIGHT: Software placed into the public domain by the author.
//    Software 'as is' without warranty.  Author liable for nothing.
// DESCRIPTION:
//    Implements a register bank with 32 registers that are 32-bits wide.
//    There are two read-ports and one write port.
//-------------------------------------------------------------------

module reg_bank (clk, reset, pause, rs_index, rt_index, rd_index,
                 reg_source_out, reg_target_out, reg_dest_new, intr_enable);

   input         clk;
   input         reset;
   input         pause;
   input  [ 5:0] rs_index;
   input  [ 5:0] rt_index;
   input  [ 5:0] rd_index;
   input  [31:0] reg_dest_new;
   output [31:0] reg_source_out;
   output [31:0] reg_target_out;
   output        intr_enable;

   reg    [31:0] reg_target_out;
   reg    [31:0] reg_source_out;
   reg           intr_enable_reg;
   wire          intr_enable = intr_enable_reg ;

   //controls access to dual-port memories
   reg    [ 4:0] addr_a1;
   wire   [ 4:0] addr_a2 = rt_index[4:0] ;
   reg    [ 4:0] addr_b;
   reg           write_enable;
   wire   [31:0] data_out1;
   wire   [31:0] data_out2;

   always @(posedge clk or posedge reset) begin
      if (reset)
         intr_enable_reg <= 1'b0;
      else
         if (rd_index == 6'b101110)
            //reg_epc CP0 14
            intr_enable_reg <= 1'b0 ; //disable interrupts
         else if (rd_index == 6'b101100)
            intr_enable_reg <= reg_dest_new[0];
   end

   always @(rs_index or intr_enable_reg or data_out1 or rt_index or data_out2 or
            rd_index or pause)
   begin
      //setup for first dual-port memory
      if (rs_index == 6'b101110)
         //reg_epc CP0 14
         addr_a1 = 5'b00000;
      else
         addr_a1 = rs_index[4:0];

      case (rs_index)
         6'b000000 : reg_source_out = `ZERO;
         6'b101100 : reg_source_out = {31'b0, intr_enable_reg};
         6'b111111 : //interrupt vector address = 0x3c
                     reg_source_out = `INTERRUPT_VECTOR; //{24'b0, 8'b00111100};
         default   : reg_source_out = data_out1;
      endcase

      //setup for second dual-port memory
      case (rt_index)
         6'b000000 : reg_target_out = `ZERO;
         default   : reg_target_out = data_out2;
      endcase

      //setup second port (write port) for both dual-port memories
      if (rd_index != 6'b000000 & rd_index != 6'b101100 & ~pause)
         write_enable = 1'b1 ;
      else
         write_enable = 1'b0 ;

      if (rd_index == 6'b101110)
         //reg_epc CP0 14
         addr_b = 5'b00000 ;
      else
         addr_b = rd_index[4:0] ;
   end

   //------------------------------------------------------------
   //-- Pick only ONE of the dual-port RAM implementations below!
   //------------------------------------------------------------

`ifdef reg_mem_type_TRI_PORT_MEM
   // Option #1
   // One tri-port RAM, two read-ports, one write-port
   // 32 registers 32-bits wide

   reg[31:0] tri_port_ram[31:0];
   assign data_out1 = tri_port_ram[addr_a1];
   assign data_out2 = tri_port_ram[addr_a2];
   always @(posedge clk)
      if (write_enable) tri_port_ram[addr_b] = reg_dest_new;

`endif  //tri_port_mem

`ifdef reg_mem_type_DUAL_PORT_MEM
   // Option #2
   // Two dual-port RAMs, each with one read-port and one write-port
   // According to the Xilinx answers database record #4075 this
   // architecture may cause Synplify to infer synchronous dual-port
   // RAM using RAM16x1D.
   reg[31:0] dual_port_ram1[31:0];
   reg[31:0] dual_port_ram2[31:0];
   always @(addr_a1 or addr_a2 or dual_port_ram1) begin
      data_out1 <= dual_port_ram1[addr_a1];
      data_out2 <= dual_port_ram2[addr_a2];
   end
   always @(posedge clk) begin
      if (write_enable) begin
         dual_port_ram1[addr_b] = reg_dest_new;
         dual_port_ram2[addr_b] = reg_dest_new;
      end
   end
`endif  //dual_port_mem

`ifdef reg_mem_type_ALTERA_MEM
   fpga_reg_bank	fpga_reg_bank_inst (
  	  .data        ( reg_dest_new    ),
  	  .wraddress   ( addr_b          ),
  	  .rdaddress_a ( addr_a1         ),
  	  .rdaddress_b ( addr_a2         ),
  	  .wren        ( write_enable & clk ),
  	  .qa          ( data_out1       ),
  	  .qb          ( data_out2       )
  	  );
`endif

endmodule
