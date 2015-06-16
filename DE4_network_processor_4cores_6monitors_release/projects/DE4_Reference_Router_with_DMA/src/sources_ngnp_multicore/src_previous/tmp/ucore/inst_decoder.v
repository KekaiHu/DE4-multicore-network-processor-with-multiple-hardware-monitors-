/////////////////////////////////////////////////////////////////////
////  Author: Zhangfeifei                                        ////
////                                                             ////
////  Advance Test Technology Laboratory,                        ////
////  Institute of Computing Technology,                         ////
////  Chinese Academy of Sciences                                ////
////                                                             ////
////  If you encountered any problem, please contact :           ////
////  Email: zhangfeifei@ict.ac.cn or whitewill@opencores.org    ////
////  Tel: +86-10-6256 5533 ext. 5673                            ////
////                                                             ////
////  Downloaded from:                                           ////
////     http://www.opencores.org/pdownloads.cgi/list/ucore      ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2005-2006 Zhangfeifei                         ////
////                         zhangfeifei@ict.ac.cn               ////
////                                                             ////
////                                                             ////
//// This source file may be used and distributed freely without ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and any derivative work contains the  ////
//// original copyright notice and the associated disclaimer.    ////
////                                                             ////
//// Please let the author know if it is used                    ////
//// for commercial purpose.                                     ////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                             ////
//// Date of Creation: 2005.12.3                                 ////
////                                                             ////
//// Version: 0.0.1                                              ////
////                                                             ////
//// Description: inst decoder of ucore processor,used by pps_id ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

module inst_decoder(inst_code,inst_decode);
 
  parameter INST_DE_WIDTH = `INST_DE_WIDTH_;
  parameter
  DE_INVALID = `DE__INVALID ,// INVALID_inst
  //special(opcode = 6'b000000)
  DE_SLL     = `DE__SLL     ,// SLL
  DE_SRL     = `DE__SRL     ,// SRL
  DE_SRA     = `DE__SRA     ,// SRA
  DE_SLLV    = `DE__SLLV    ,// SLLV
  DE_SRLV    = `DE__SRLV    ,// SRLV
  DE_SRAV    = `DE__SRAV    ,// SRAV
  DE_JR      = `DE__JR      ,// JR
  DE_JALR    = `DE__JALR    ,// JALR
  DE_SYSCALL = `DE__SYSCALL ,// SYSCALL
  DE_BREAK   = `DE__BREAK   ,// BREAK
  DE_MFHI    = `DE__MFHI    ,// MFHI
  DE_MTHI    = `DE__MTHI    ,// MTHI
  DE_MFLO    = `DE__MFLO    ,// MFLO
  DE_MTLO    = `DE__MTLO    ,// MTLO
  DE_SUB     = `DE__SUB     ,// SUB
  DE_SUBU    = `DE__SUBU    ,// SUBU
  DE_ADD     = `DE__ADD     ,// ADD
  DE_ADDU    = `DE__ADDU    ,// ADDU
  DE_AND     = `DE__AND     ,// AND
  DE_MULT    = `DE__MULT    ,// MULT
  DE_MULTU   = `DE__MULTU   ,// MULTU
  DE_NOR     = `DE__NOR     ,// NOR
  DE_OR      = `DE__OR      ,// OR
  DE_SLT     = `DE__SLT     ,// SLT
  DE_SLTU    = `DE__SLTU    ,// SLTU
  DE_XOR     = `DE__XOR     ,// XOR
  DE_DIV     = `DE__DIV     ,// DIV
  DE_DIVU    = `DE__DIVU    ,// DIVU
  //REGIMM
  DE_BGEZ    = `DE__BGEZ    ,// BGEZ
  DE_BGEZAL  = `DE__BGEZAL  ,// BGEZAL
  DE_BLTZ    = `DE__BLTZ    ,// BLTZ
  DE_BLTZAL  = `DE__BLTZAL  ,// BLTZAL
  //NORMAL
  DE_ORI     = `DE__ORI     ,// ORI
  DE_ADDI    = `DE__ADDI    ,// ADDI
  DE_ADDIU   = `DE__ADDIU   ,// ADDIU
  DE_ANDI    = `DE__ANDI    ,// ANDI
  DE_BEQ     = `DE__BEQ     ,// BEQ
  DE_BGTZ    = `DE__BGTZ    ,// BGTZ
  DE_BLEZ    = `DE__BLEZ    ,// BLEZ
  DE_BNE     = `DE__BNE     ,// BNE
  DE_J       = `DE__J       ,// J
  DE_JAL     = `DE__JAL     ,// JAL
  DE_LUI     = `DE__LUI     ,// LUI
  DE_SLTI    = `DE__SLTI    ,// SLTI
  DE_SLTIU   = `DE__SLTIU   ,// SLTIU
  DE_LW      = `DE__LW      ,// LW
  DE_SW      = `DE__SW      ,// SW
  DE_LB      = `DE__LB      ,// LB
  DE_LH      = `DE__LH      ,// LH
  DE_LWL     = `DE__LWL     ,// LWL
  DE_LBU     = `DE__LBU     ,// LBU
  DE_LHU     = `DE__LHU     ,// LHU
  DE_LWR     = `DE__LWR     ,// LWR
  DE_SB      = `DE__SB      ,// SB
  DE_SH      = `DE__SH      ,// SH
  DE_SWL     = `DE__SWL     ,// SWL
  DE_SWR     = `DE__SWR     ,// SWR
  DE_XORI    = `DE__XORI    ,// XORI
  DE_COP0    = `DE__COP0    ,// COP0
  //DE_SWC0  = `DE__SWC0    ,// SWC0
  //DE_LWC0  = `DE__LWC0    ,// LWC0
  DE_MFC0    = `DE__MFC0    ,// MFC0
  DE_MTC0    = `DE__MTC0    ;// MTC0
  
  //cop0 operation definiiton
  parameter COP0_FUNC_ERET  = 26'b1000_0000_0000_0000_0000_011000;
  parameter COP0_FUNC_DERET = 26'b1000_0000_0000_0000_0000_011111;
  parameter COP0_FUNC_WAIT  = 26'b1xxx_xxxx_xxxx_xxxx_xxxx_100000;
 
  input [31:0] inst_code; 
  output reg [0:INST_DE_WIDTH-1] inst_decode;
   
  // Instruction fields
  wire [5:0]  inst_op,inst_func;
  wire [4:0]  inst_regimm;//,inst_rs,inst_rt,inst_rd,inst_sa;
  //wire [15:0] inst_imm;
  //wire [25:0] inst_jmp_imm;
  //wire [19:0] inst_exc_code;//the code field for syscall and break func
  wire [4:0]  inst_cop0_func;//cop0's function code filed
  wire [25:0] inst_cop0_code;//cop0's code field
  
  assign inst_op        = inst_code[31:26];
  assign inst_func      = inst_code[5:0];
  assign inst_regimm    = inst_code[20:16];
  //assign inst_rs        = inst_code[25:21];
  //assign inst_rt        = inst_code[20:16];
  //assign inst_rd        = inst_code[15:11];
  //assign inst_sa        = inst_code[10:6];
  //assign inst_imm       = inst_code[15:0];
  //assign inst_jmp_imm   = inst_code[25:0];
  assign inst_cop0_func = inst_code[25:21];
  assign inst_cop0_code = inst_code[25:0];
  
  //Instruction decoding
  always @(inst_op,inst_func,inst_regimm,inst_cop0_func,inst_cop0_code)
  begin
    case (inst_op)//synthesis parallel_case
      'd0://special operation 
      begin
	case (inst_func) //synthesis parallel_case
	  'd0://SLL rd,rt,sa
	  begin
	    inst_decode = DE_SLL ;
	  end
	  'd2://SRL rd,rt,sa
	  begin
	    inst_decode = DE_SRL ;
	  end
	  'd3://SRA rd,rt,sa
	  begin
	    inst_decode = DE_SRA ;
	  end
	  'd4://SLLV rd,rt,rs
	  begin
	    inst_decode = DE_SLLV ;
	  end
	  'd6://SRLV rd,rt,rs
	  begin
	    inst_decode = DE_SRLV ;
	  end
	  'd7://SRAV rd,rt,rs
	  begin
	    inst_decode = DE_SRAV ;
	  end
	  'd8://JR rs
	  begin
	    inst_decode = DE_JR ;
	  end
	  'd9://JALR jalr rs(rd=31) or jalr rd,rs
	  begin
	    inst_decode = DE_JALR ;
	  end
	  'd12://SYSCALL
	  begin
	    inst_decode = DE_SYSCALL ;
	  end
	  'd13://BREAK
	  begin
	    inst_decode = DE_BREAK ;
	  end
	  'd16://MFHI rd
	  begin
	    inst_decode = DE_MFHI ;
	  end
	  'd17://MTHI rs
	  begin
	    inst_decode = DE_MTHI ;
	  end
	  'd18://MFLO rd
	  begin
	    inst_decode = DE_MFLO ;
	  end
	  'd19://MTLO rs
	  begin
	    inst_decode = DE_MTLO ;
	  end
	  'd24://MULT rs,rt
	  begin
	    inst_decode = DE_MULT ;
	  end
	  'd25://MULTU rs,rt
	  begin
	    inst_decode = DE_MULTU ;
	  end
	  'd26://DIV rs,rt
	  begin
	    inst_decode = DE_DIV ;
	  end
	  'd27://DIVU rs,rt
	  begin
	    inst_decode = DE_DIVU ;
	  end
	  'd32://ADD rd,rs,rt
	  begin
	    inst_decode = DE_ADD ;
	  end
	  'd33://ADDU rd,rs,rt
	  begin
	    inst_decode = DE_ADDU ;
	  end
	  'd34://SUB rd,rs,rt
	  begin
	    inst_decode = DE_SUB ;
	  end
	  'd35://SUBU rd,rs,rt
	  begin
	    inst_decode = DE_SUBU ;
	  end
	  'd36://AND rd,rs,rt
	  begin
	    inst_decode = DE_AND ;
	  end
	  'd37://OR rd,rs,rt
	  begin
	    inst_decode = DE_OR ;
	  end
	  'd38://XOR rd,rs,rt
	  begin
	    inst_decode = DE_XOR ;
	  end
	  'd39://NOR rd,rs,rt
	  begin
	    inst_decode = DE_NOR ;
	  end
	  'd42://SLT rd,rs,rt
	  begin
	    inst_decode = DE_SLT ;
	  end
	  'd43://SLTU rd,rs,rt
	  begin
	    inst_decode = DE_SLTU ;
	  end
	  default: 
	  begin
	    inst_decode = DE_INVALID ;
	  end
	endcase
      end
      'd1://regimm opreation
      begin
	case (inst_regimm) //synthesis parallel_case
	  'd0://BLTZ rs,offset(signed)
	  begin
	    inst_decode = DE_BLTZ ;
	  end
	  'd1://BGEZ rs,offset(signed)
	  begin
	    inst_decode = DE_BGEZ ;
	  end
	  'd16://BLTZAL rs,offset(signed)
	  begin
	    inst_decode = DE_BLTZAL ;
	  end
	  'd17://BGEZAL rs,offset(signed)
	  begin
	    inst_decode = DE_BGEZAL ;
	  end
	  default: 
	  begin
	    inst_decode  = DE_INVALID ;
	  end
	endcase
      end
      'd2://J imm26({pc[31:28],imm26,00})
      begin
	inst_decode = DE_J ;
      end
      'd3://JAL imm26({pc[31:28],imm26,00})
      begin
	inst_decode = DE_JAL ;
      end
      'd4://BEQ rs,rt,offset(signed)
      begin
	inst_decode = DE_BEQ ;
      end
      'd5://BNE rs,rt,offset(signed)
      begin
	inst_decode = DE_BNE ;
      end
      'd6://BLEZ rs,offset(signed)
      begin
	inst_decode = DE_BLEZ ;
      end
      'd7://BGTZ rs,offset(signed)
      begin
	inst_decode = DE_BGTZ ;
      end
      'd8://ADDI rt,rs,imm16(singed)
      begin
	inst_decode = DE_ADDI ;
      end
      'd9://ADDIU rt,rs,imm16(singed)
      begin
	inst_decode = DE_ADDIU ;
      end
      'd10://SLTI rt,rs,imm16(singed)
      begin
	inst_decode = DE_SLTI ;
      end
      'd11://SLTIU rt,rs,imm16(singed)
      begin
	inst_decode = DE_SLTIU ;
      end
      'd12://ANDI rt,rs,imm16(singed)
      begin
	inst_decode = DE_ANDI ;
      end
      'd13://ORI rt,rs,imm16(singed)
      begin
	inst_decode = DE_ORI ;
      end
      'd14://XORI rt,rs,imm16(singed)
      begin
	inst_decode = DE_XORI ;
      end
      'd15://LUI rt,imm16
      begin
	inst_decode = DE_LUI ;
      end
      'd16://COP0 func
      begin
	case(inst_cop0_func) //synthesis parallel_case
	  'd0://mfc0 rt,rd // GPR[rd] = CPR[rt] //differ to mips32 definition
	  begin
	    inst_decode = DE_MFC0;
	  end
	  'd4://mtc0 rt,rd // CPR[rd] = GPR[rt] //follow the mips32 definition
	  begin
	    inst_decode = DE_MTC0;
	  end
	  default:
	  begin
	    casex(inst_cop0_code) //synthesis parallel_case
	      COP0_FUNC_DERET,
		COP0_FUNC_ERET,
		COP0_FUNC_WAIT:
	      begin
		inst_decode = DE_COP0;
	      end
	      default:
	      begin
		inst_decode = DE_INVALID;
	      end
	    endcase
	  end
	endcase
      end
      'd32://LB rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_LB ;
      end
      'd33://LH rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_LH ;
      end
      'd34://LWL rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_LWL ;
      end
      'd35://LW rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_LW ;
      end
      'd36://LBU rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_LBU ;
      end
      'd37://LHU rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_LHU ;
      end
      'd38://LWR rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_LWR ;
      end
      'd40://SB rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_SB ;
      end
      'd41://SH rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_SH ;
      end
      'd42://SWL rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_SWL ;
      end
      'd43://SW rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_SW ;
      end
      'd46://SWR rt,offset(base) (offset:signed;base:rs)
      begin
	inst_decode = DE_SWR ;
      end
      default: 
      begin
	inst_decode  = DE_INVALID ;
      end
    endcase
  end

endmodule