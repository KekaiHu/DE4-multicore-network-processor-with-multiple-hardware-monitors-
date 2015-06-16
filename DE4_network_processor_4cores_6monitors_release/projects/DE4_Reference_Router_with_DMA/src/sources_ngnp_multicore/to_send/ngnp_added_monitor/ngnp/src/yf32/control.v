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
// FILE: control.v (tranlate from control.vhd from opencores.org)
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
// 2004/03/22  yfchen     1.0      Translate from control.vhd
// 2004/10/27  yfchen     1.2      minor coding style change
//------------------------------------------------------------------------------

//-------------------------------------------------------------------
// TITLE: Controller / Opcode Decoder
// AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
// DATE CREATED: 2/8/01
// FILENAME: control.vhd
// PROJECT: Plasma CPU core
// COPYRIGHT: Software placed into the public domain by the author.
//    Software 'as is' without warranty.  Author liable for nothing.
// NOTE:  MIPS(tm) is a registered trademark of MIPS Technologies.
//    MIPS Technologies does not endorse and is not associated with
//    this project.
// DESCRIPTION:
//    Controls the CPU by decoding the opcode and generating control
//    signals to the rest of the CPU.
//    This entity decodes the MIPS(tm) opcode into a
//    Very-Long-Word-Instruction.
//    The 32-bit opcode is converted to a
//       6+6+6+16+5+2+3+3+2+2+3+2+4 = 60 bit VLWI opcode.
//    Based on information found in:
//       "MIPS RISC Architecture" by Gerry Kane and Joe Heinrich
//       and "The Designer's Guide to VHDL" by Peter J. Ashenden
//-------------------------------------------------------------------

module control (opcode, intr_signal, rs_index, rt_index, rd_index, imm_out,
                alu_func, shift_func, mult_func, branch_func, a_source_out,
                b_source_out, c_source_out, pc_source_out, mem_source_out);


   input  [31:0] opcode;
   input         intr_signal;

   output [ 5:0] rs_index;
   output [ 5:0] rt_index;
   output [ 5:0] rd_index;
   output [15:0] imm_out;
   output [ 3:0] alu_func;
   output [ 1:0] shift_func;
   output [ 3:0] mult_func;
   output [ 2:0] branch_func;
   output [ 1:0] a_source_out;
   output [ 1:0] b_source_out;
   output [ 2:0] c_source_out;
   output [ 1:0] pc_source_out;
   output [ 3:0] mem_source_out;

   reg    [ 5:0] rs_index;
   reg    [ 5:0] rt_index;
   reg    [ 5:0] rd_index;
   reg    [15:0] imm_out;
   reg    [ 3:0] alu_func;
   reg    [ 1:0] shift_func;
   reg    [ 3:0] mult_func;
   reg    [ 2:0] branch_func;
   reg    [ 1:0] a_source_out;
   reg    [ 1:0] b_source_out;
   reg    [ 2:0] c_source_out;
   reg    [ 1:0] pc_source_out;
   reg    [ 3:0] mem_source_out;

   reg    [ 5:0] op;
   reg    [ 5:0] func;
   reg    [ 5:0] rs;
   reg    [ 5:0] rt;
   reg    [ 5:0] rd;
   reg    [ 4:0] rtx;
   reg    [15:0] imm;
   reg    [ 3:0] alu_function;
   reg    [ 1:0] shift_function;
   reg    [ 3:0] mult_function;
   reg    [ 1:0] a_source;
   reg    [ 1:0] b_source;
   reg    [ 2:0] c_source;
   reg    [ 1:0] pc_source;
   reg    [ 2:0] branch_function;
   reg    [ 3:0] mem_source;

   always @(opcode or intr_signal)
   begin
      alu_function    = `alu_nothing;
      shift_function  = `shift_nothing;
      mult_function   = `mult_nothing;
      a_source        = `a_from_reg_source;
      b_source        = `b_from_reg_target;
      c_source        = `c_from_null;
      pc_source       = `from_inc4;
      branch_function = `branch_eq;
      mem_source      = `mem_fetch;
      op              = opcode[31:26];
      rs              = {1'b0, opcode[25:21]};
      rt              = {1'b0, opcode[20:16]};
      rtx             = opcode[20:16];
      rd              = {1'b0, opcode[15:11]};
      func            = opcode[5:0];
      imm             = opcode[15:0];
      case (op) // synopsys parallel_case
         6'b000000 :
                  begin
                     //SPECIAL
                     case (func) // synopsys parallel_case
                        6'b000000 :
                                 begin
                                    //SLL   r[rd]=r[rt]<<re;
                                    a_source       = `a_from_imm10_6     ;
                                    c_source       = `c_from_shift       ;
                                    shift_function = `shift_left_unsigned;
                                 end
                        6'b000010 :
                                 begin
                                    //SRL   r[rd]=u[rt]>>re;
                                    a_source       = `a_from_imm10_6      ;
                                    c_source       = `c_from_shift        ;
                                    shift_function = `shift_right_unsigned;
                                 end
                        6'b000011 :
                                 begin
                                    //SRA   r[rd]=r[rt]>>re;
                                    a_source       = `a_from_imm10_6    ;
                                    c_source       = `c_from_shift      ;
                                    shift_function = `shift_right_signed;
                                 end
                        6'b000100 :
                                 begin
                                    //SLLV  r[rd]=r[rt]<<r[rs];
                                    c_source       = `c_from_shift       ;
                                    shift_function = `shift_left_unsigned;
                                 end
                        6'b000110 :
                                 begin
                                    //SRLV  r[rd]=u[rt]>>r[rs];
                                    c_source       = `c_from_shift        ;
                                    shift_function = `shift_right_unsigned;
                                 end
                        6'b000111 :
                                 begin
                                    //SRAV  r[rd]=r[rt]>>r[rs];
                                    c_source       = `c_from_shift      ;
                                    shift_function = `shift_right_signed;
                                 end
                        6'b001000 :
                                 begin
                                    //JR    s->pc_next=r[rs];
                                    pc_source       = `from_branch;
                                    alu_function    = `alu_add    ;
                                    branch_function = `branch_yes ;
                                 end
                        6'b001001 :
                                 begin
                                    //JALR  r[rd]=s->pc_next; s->pc_next=r[rs];
                                    c_source        = `c_from_pc_plus4;
                                    pc_source       = `from_branch;
                                    alu_function    = `alu_add;
                                    branch_function = `branch_yes;
                                 end
                        6'b001010 :
                                 begin
                                 end
                        //MOVZ  if(!r[rt]) r[rd]=r[rs]; /*IV*/
                        //         c_source := c_from_reg_source_eqz;
                        6'b001011 :
                                 begin
                                 end
                        //MOVN  if(r[rt]) r[rd]=r[rs];  /*IV*/
                        //         c_source := from_reg_source_nez;
                        6'b001100 :
                                 begin
                                 end
                        //SYSCALL
                        //         if(r[4]==0) printf("0x%8.8lx ",r[5]);
                        6'b001101 :
                                 begin
                                 end
                        //BREAK s->wakeup=1;
                        6'b001111 :
                                 begin
                                 end
                        //SYNC  s->wakeup=1;
                        6'b010000 :
                                 begin
                                    //MFHI  r[rd]=s->hi;
                                    c_source      = `c_from_mult;
                                    mult_function = `mult_read_hi;
                                 end
                        6'b010001 :
                                 begin
                                    //FTHI  s->hi=r[rs];
                                    mult_function = `mult_write_hi;
                                 end
                        6'b010010 :
                                 begin
                                    //MFLO  r[rd]=s->lo;
                                    c_source      = `c_from_mult;
                                    mult_function = `mult_read_lo;
                                 end
                        6'b010011 :
                                 begin
                                    //MTLO  s->lo=r[rs];
                                    mult_function = `mult_write_lo;
                                 end
                        6'b011000 :
                                 begin
                                    //MULT  s->lo=r[rs]*r[rt]; s->hi=0;
                                    mult_function = `mult_signed_mult;
                                 end
                        6'b011001 :
                                 begin
                                    //MULTU s->lo=r[rs]*r[rt]; s->hi=0;
                                    mult_function = `mult_mult;
                                 end
                        6'b011010 :
                                 begin
                                    //DIV   s->lo=r[rs]/r[rt]; s->hi=r[rs]%r[rt];
                                    mult_function = `mult_signed_divide;
                                 end
                        6'b011011 :
                                 begin
                                    //DIVU  s->lo=r[rs]/r[rt]; s->hi=r[rs]%r[rt];
                                    mult_function = `mult_divide;
                                 end
                        6'b100000 :
                                 begin
                                    //ADD   r[rd]=r[rs]+r[rt];
                                    c_source     = `c_from_alu;
                                    alu_function = `alu_add;
                                 end
                        6'b100001 :
                                 begin
                                    //ADDU  r[rd]=r[rs]+r[rt];
                                    c_source     = `c_from_alu;
                                    alu_function = `alu_add;
                                 end
                        6'b100010 :
                                 begin
                                    //SUB   r[rd]=r[rs]-r[rt];
                                    c_source    = `c_from_alu;
                                    alu_function = `alu_subtract;
                                 end
                        6'b100011 :
                                 begin
                                    //SUBU  r[rd]=r[rs]-r[rt];
                                    c_source     = `c_from_alu;
                                    alu_function = `alu_subtract;
                                 end
                        6'b100100 :
                                 begin
                                    //AND   r[rd]=r[rs]&r[rt];
                                    c_source     = `c_from_alu;
                                    alu_function = `alu_and;
                                 end
                        6'b100101 :
                                 begin
                                    //OR    r[rd]=r[rs]|r[rt];
                                    c_source     = `c_from_alu;
                                    alu_function = `alu_or;
                                 end
                        6'b100110 :
                                 begin
                                    //XOR   r[rd]=r[rs]^r[rt];
                                    c_source     = `c_from_alu;
                                    alu_function = `alu_xor;
                                 end
                        6'b100111 :
                                 begin
                                    //NOR   r[rd]=~(r[rs]|r[rt]);
                                    c_source     = `c_from_alu;
                                    alu_function = `alu_nor;
                                 end
                        6'b101010 :
                                 begin
                                    //SLT   r[rd]=r[rs]<r[rt];
                                    c_source     = `c_from_alu;
                                    alu_function = `alu_less_than_signed;
                                 end
                        6'b101011 :
                                 begin
                                    //SLTU  r[rd]=u[rs]<u[rt];
                                    c_source     = `c_from_alu;
                                    alu_function = `alu_less_than;
                                 end
                        6'b101101 :
                                 begin
                                    //DADDU r[rd]=r[rs]+u[rt];
                                    c_source     = `c_from_alu;
                                    alu_function = `alu_add;
                                 end
                        6'b110001 :
                                 begin
                                 end
                        //TGEU
                        6'b110010 :
                                 begin
                                 end
                        //TLT
                        6'b110011 :
                                 begin
                                 end
                        //TLTU
                        6'b110100 :
                                 begin
                                 end
                        //TEQ
                        6'b110110 :
                                 begin
                                 end
                        //TNE
                        default :
                                 begin
                                 end
                     endcase
                  end
         6'b000001 :
                  begin
                     //REGIMM
                     rt              = 6'b000000;
                     rd              = 6'b011111;
                     a_source        = `a_from_pc;
                     b_source        = `b_from_immX4;
                     alu_function    = `alu_add;
                     pc_source       = `from_branch;
                     branch_function = `branch_gtz;
                     //if(test) pc=pc+imm*4
                     case (rtx)
                        5'b10000 :
                                 begin
                                    //BLTZAL  r[31]=s->pc_next; branch=r[rs]<0;
                                    c_source        = `c_from_pc_plus4;
                                    branch_function = `branch_ltz;
                                 end
                        5'b00000 :
                                 begin
                                    //BLTZ    branch=r[rs]<0;
                                    branch_function = `branch_ltz;
                                 end
                        5'b10001 :
                                 begin
                                    //BGEZAL  r[31]=s->pc_next; branch=r[rs]>=0;
                                    c_source        = `c_from_pc_plus4;
                                    branch_function = `branch_gez;
                                 end
                        5'b00001 :
                                 begin
                                    //BGEZ    branch=r[rs]>=0;
                                    branch_function = `branch_gez;
                                 end
                        5'b10010 :
                                 begin
                                    //BLTZALL r[31]=s->pc_next; lbranch=r[rs]<0;
                                    c_source        = `c_from_pc_plus4;
                                    pc_source       = `from_lbranch;
                                    branch_function = `branch_ltz;
                                 end
                        5'b00010 :
                                 begin
                                    //BLTZL   lbranch=r[rs]<0;
                                    pc_source       = `from_lbranch;
                                    branch_function = `branch_ltz;
                                 end
                        5'b10011 :
                                 begin
                                    //BGEZALL r[31]=s->pc_next; lbranch=r[rs]>=0;
                                    c_source        = `c_from_pc_plus4;
                                    pc_source       = `from_lbranch;
                                    branch_function = `branch_gez;
                                 end
                        5'b00011 :
                                 begin
                                    //BGEZL   lbranch=r[rs]>=0;
                                    pc_source       = `from_lbranch;
                                    branch_function = `branch_gez;
                                 end
                        default :
                                 begin
                                 end
                     endcase
                  end
         6'b000011 :
                  begin
                     //JAL    r[31]=s->pc_next; s->pc_next=(s->pc&0xf0000000)|target;
                     c_source  = `c_from_pc_plus4;
                     rd        = 6'b011111;
                     pc_source = `from_opcode25_0;
                  end
         6'b000010 :
                  begin
                     //J      s->pc_next=(s->pc&0xf0000000)|target;
                     pc_source = `from_opcode25_0;
                  end
         6'b000100 :
                  begin
                     //BEQ    branch=r[rs]==r[rt];
                     a_source        = `a_from_pc;
                     b_source        = `b_from_immX4;
                     alu_function    = `alu_add;
                     pc_source       = `from_branch;
                     branch_function = `branch_eq;
                  end
         6'b000101 :
                  begin
                     //BNE    branch=r[rs]!=r[rt];
                     a_source        = `a_from_pc;
                     b_source        = `b_from_immX4;
                     alu_function    = `alu_add;
                     pc_source       = `from_branch;
                     branch_function = `branch_ne;
                  end
         6'b000110 :
                  begin
                     //BLEZ   branch=r[rs]<=0;
                     a_source        = `a_from_pc;
                     b_source        = `b_from_immX4;
                     alu_function    = `alu_add;
                     pc_source       = `from_branch;
                     branch_function = `branch_lez;
                  end
         6'b000111 :
                  begin
                     //BGTZ   branch=r[rs]>0;
                     a_source        = `a_from_pc;
                     b_source        = `b_from_immX4;
                     alu_function    = `alu_add;
                     pc_source       = `from_branch;
                     branch_function = `branch_gtz;
                  end
         6'b001000 :
                  begin
                     //ADDI   r[rt]=r[rs]+(short)imm;
                     b_source     = `b_from_signed_imm;
                     c_source     = `c_from_alu;
                     rd           = rt;
                     alu_function = `alu_add;
                  end
         6'b001001 :
                  begin
                     //ADDIU  u[rt]=u[rs]+(short)imm;
                     b_source     = `b_from_signed_imm;
                     c_source     = `c_from_alu;
                     rd           = rt;
                     alu_function = `alu_add;
                  end
         6'b001010 :
                  begin
                     //SLTI   r[rt]=r[rs]<(short)imm;
                     b_source     = `b_from_signed_imm;
                     c_source     = `c_from_alu;
                     rd           = rt;
                     alu_function = `alu_less_than_signed;
                  end
         6'b001011 :
                  begin
                     //SLTIU  u[rt]=u[rs]<(unsigned long)(short)imm;
                     b_source     = `b_from_imm;
                     c_source     = `c_from_alu;
                     rd           = rt;
                     alu_function = `alu_less_than;
                  end
         6'b001100 :
                  begin
                     //ANDI   r[rt]=r[rs]&imm;
                     b_source     = `b_from_imm;
                     c_source     = `c_from_alu;
                     rd           = rt;
                     alu_function = `alu_and;
                  end
         6'b001101 :
                  begin
                     //ORI    r[rt]=r[rs]|imm;
                     b_source     = `b_from_imm;
                     c_source     = `c_from_alu;
                     rd           = rt;
                     alu_function = `alu_or;
                  end
         6'b001110 :
                  begin
                     //XORI   r[rt]=r[rs]^imm;
                     b_source     = `b_from_imm;
                     c_source     = `c_from_alu;
                     rd           = rt;
                     alu_function = `alu_xor;
                  end
         6'b001111 :
                  begin
                     //LUI    r[rt]=(imm<<16);
                     c_source = `c_from_imm_shift16;
                     rd       = rt;
                  end
         6'b010000 :
                  begin
                     //COP0
                     alu_function = `alu_or;
                     c_source     = `c_from_alu;
                     if ((opcode[23]) == 1'b0) begin
                        //move from CP0
                        rs = {1'b1, opcode[15:11]};
                        rt = 6'b000000;
                        rd = {1'b0, opcode[20:16]};
                     end else begin
                        //move to CP0
                        rs = 6'b000000;
                        rd[5] = 1'b1;
                     end
                  end
         6'b010001 :
                  begin
                  end
         //COP1
         6'b010010 :
                  begin
                  end
         //COP2
         6'b010011 :
                  begin
                  end
         //COP3
         6'b010100 :
                  begin
                     //BEQL   lbranch=r[rs]==r[rt];
                     a_source        = `a_from_pc;
                     b_source        = `b_from_immX4;
                     alu_function    = `alu_add;
                     pc_source       = `from_lbranch;
                     branch_function = `branch_eq;
                  end
         6'b010101 :
                  begin
                     //BNEL   lbranch=r[rs]!=r[rt];
                     a_source        = `a_from_pc;
                     b_source        = `b_from_immX4;
                     alu_function    = `alu_add;
                     pc_source       = `from_lbranch;
                     branch_function = `branch_ne;
                  end
         6'b010110 :
                  begin
                     //BLEZL  lbranch=r[rs]<=0;
                     a_source        = `a_from_pc;
                     b_source        = `b_from_immX4;
                     alu_function    = `alu_add;
                     pc_source       = `from_lbranch;
                     branch_function = `branch_lez;
                  end
         6'b010111 :
                  begin
                     //BGTZL  lbranch=r[rs]>0;
                     a_source        = `a_from_pc;
                     b_source        = `b_from_immX4;
                     alu_function    = `alu_add;
                     pc_source       = `from_lbranch;
                     branch_function = `branch_gtz;
                  end
         6'b100000 :
                  begin
                     //LB     r[rt]=*(signed char*)ptr;
                     a_source     = `a_from_reg_source;
                     b_source     = `b_from_signed_imm;
                     alu_function = `alu_add;
                     rd           = rt;
                     c_source     = `c_from_memory;
                     mem_source   = `mem_read8s; //address=(short)imm+r[rs];
                  end
         6'b100001 :
                  begin
                     //LH     r[rt]=*(signed short*)ptr;
                     a_source     = `a_from_reg_source;
                     b_source     = `b_from_signed_imm;
                     alu_function = `alu_add;
                     rd           = rt;
                     c_source     = `c_from_memory;
                     mem_source   = `mem_read16s; //address=(short)imm+r[rs];
                  end
         6'b100010 :
                  begin
                     //LWL    //Not Implemented
                     a_source     = `a_from_reg_source;
                     b_source     = `b_from_signed_imm;
                     alu_function = `alu_add;
                     rd           = rt;
                     c_source     = `c_from_memory;
                     mem_source   = `mem_read32;
                  end
         6'b100011 :
                  begin
                     //LW     r[rt]=*(long*)ptr;
                     a_source     = `a_from_reg_source;
                     b_source     = `b_from_signed_imm;
                     alu_function = `alu_add;
                     rd           = rt;
                     c_source     = `c_from_memory;
                     mem_source   = `mem_read32;
                  end
         6'b100100 :
                  begin
                     //LBU    r[rt]=*(unsigned char*)ptr;
                     a_source     = `a_from_reg_source;
                     b_source     = `b_from_signed_imm;
                     alu_function = `alu_add;
                     rd           = rt;
                     c_source     = `c_from_memory;
                     mem_source   = `mem_read8; //address=(short)imm+r[rs];
                  end
         6'b100101 :
                  begin
                     //LHU    r[rt]=*(unsigned short*)ptr;
                     a_source     = `a_from_reg_source;
                     b_source     = `b_from_signed_imm;
                     alu_function = `alu_add;
                     rd           = rt;
                     c_source     = `c_from_memory;
                     mem_source   = `mem_read16; //address=(short)imm+r[rs];
                  end
         6'b100110 :
                  begin
                  end
         //LWR    //Not Implemented
         6'b101000 :
                  begin
                     //SB     *(char*)ptr=(char)r[rt];
                     a_source     = `a_from_reg_source;
                     b_source     = `b_from_signed_imm;
                     alu_function = `alu_add;
                     mem_source   = `mem_write8; //address=(short)imm+r[rs];
                  end
         6'b101001 :
                  begin
                     //SH     *(short*)ptr=(short)r[rt];
                     a_source     = `a_from_reg_source;
                     b_source     = `b_from_signed_imm;
                     alu_function = `alu_add;
                     mem_source   = `mem_write16;
                  end
         6'b101010 :
                  begin
                     //SWL    //Not Implemented
                     a_source     = `a_from_reg_source;
                     b_source     = `b_from_signed_imm;
                     alu_function = `alu_add;
                     mem_source   = `mem_write32; //address=(short)imm+r[rs];
                  end
         6'b101011 :
                  begin
                     //SW     *(long*)ptr=r[rt];
                     a_source     = `a_from_reg_source;
                     b_source     = `b_from_signed_imm;
                     alu_function = `alu_add;
                     mem_source   = `mem_write32; //address=(short)imm+r[rs];
                  end
         6'b101110 :
                  begin
                  end
         //SWR    //Not Implemented
         6'b101111 :
                  begin
                  end
         //CACHE
         6'b110000 :
                  begin
                  end
         //LL     r[rt]=*(long*)ptr;
         6'b110001 :
                  begin
                  end
         //LWC1
         6'b110010 :
                  begin
                  end
         //LWC2
         6'b110011 :
                  begin
                  end
         //LWC3
         6'b110101 :
                  begin
                  end
         //LDC1
         6'b110110 :
                  begin
                  end
         //LDC2
         6'b110111 :
                  begin
                  end
         //LDC3
         6'b111000 :
                  begin
                  end
         //SC     *(long*)ptr=r[rt]; r[rt]=1;
         6'b111001 :
                  begin
                  end
         //SWC1
         6'b111010 :
                  begin
                  end
         //SWC2
         6'b111011 :
                  begin
                  end
         //SWC3
         6'b111101 :
                  begin
                  end
         //SDC1
         6'b111110 :
                  begin
                  end
         //SDC2
         6'b111111 :
                  begin
                  end
         //SDC3
         default :
                  begin
                  end
      endcase

      if (c_source == `c_from_null) begin
         rd = 6'b000000;
      end

      if (intr_signal) begin
         rs              = 6'b111111; //interrupt vector
         rt              = 6'b000000;
         rd              = 6'b101110; //save PC in EPC
         alu_function    = `alu_or;
         shift_function  = `shift_nothing;
         mult_function   = `mult_nothing;
         branch_function = `branch_yes;
         a_source        = `a_from_reg_source;
         b_source        = `b_from_reg_target;
         c_source        = `c_from_pc;
         pc_source       = `from_lbranch;
         mem_source      = `mem_fetch;
      end

      rs_index       = rs ;
      rt_index       = rt ;
      rd_index       = rd ;
      imm_out        = imm ;
      alu_func       = alu_function ;
      shift_func     = shift_function ;
      mult_func      = mult_function ;
      branch_func    = branch_function ;
      a_source_out   = a_source ;
      b_source_out   = b_source ;
      c_source_out   = c_source ;
      pc_source_out  = pc_source ;
      mem_source_out = mem_source ;
   end
endmodule
