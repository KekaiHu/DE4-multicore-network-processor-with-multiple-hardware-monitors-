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
//// Description: pipeline stage RF of ucore processor           ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

module pps_rf 
  (
   clk_i,rst_i,
   alea_i,
   dmem_rdy_i,EX_rdy_i,
   COP0_interrupt_i,
   EX_bra_confirm_i,
   
   //Synchronous from id stage
   ID_addr_i,ID_inst_i,ID_inst_valid_i,ID_bra_target_i,
   //reg access signal
   ID_use_rega_i,ID_use_regb_i,ID_imm_sela_i,ID_imm_selb_i,ID_cop_rega_i,ID_cop_regb_i,
   ID_reg_waddr_i,ID_reg_we_i,ID_level_i,
   //other signals
   ID_bra_i,ID_jmp_i,ID_jr_i,ID_link_i,ID_alu_code_i,ID_op_mem_i,ID_mem_we_i,ID_mem_optype_i,ID_exc_type_i,ID_it_ok_i,ID_ds_i,
   
   // Synchronous output to EX stage
   EX_inst_o,EX_addr_o,EX_addrA4_o,
   EX_bra_o,EX_jmp_o,EX_jr_o,EX_link_o,
   EX_op1_o,EX_op2_o,EX_reg_waddr_o,EX_reg_we_o,EX_alu_code_o,
   EX_op_mem_o,EX_mem_we_o,EX_mem_optype_o,EX_mem_baddr_o,EX_exc_type_o,EX_level_o,EX_it_ok_o,EX_ds_o,
      
   //synchronous signals to renvoi
   BP_depra_o,BP_deprb_o,
   // Asynchronous connexion with the register management and data bypass unit
   BP_reg_raddra_i,BP_reg_raddrb_i,BP_use_rega_i,BP_use_regb_i,
   BP_dataa_i,BP_datab_i
   );
 
  parameter Tp = `TP__;
  
  input clk_i;
  input rst_i;
  input EX_rdy_i;
  input dmem_rdy_i;
  input alea_i;         // Unresolved detected : send nop in the pipeline
  input COP0_interrupt_i;
  input EX_bra_confirm_i;
  
  //Synchronous input from id stage
  input ID_inst_valid_i;
  input ID_bra_target_i;
  input [31:0] ID_addr_i;     // Address of the instruction
  input [31:0] ID_inst_i;     // The instruction to decode
    
  //reg access signal
  input ID_use_rega_i;
  input ID_use_regb_i;
  input ID_imm_sela_i;        // selection of imm as oprand 1
  input ID_imm_selb_i;        // selection of imm as oprand 2
  input ID_cop_rega_i;
  input ID_cop_regb_i;
  
  input [`REG_ADDR_WIDTH-1:0] ID_reg_waddr_i;// Address of the dest register of the result
  input ID_reg_we_i;         // Effective writing of the result
  
  //other signals
  input ID_bra_i;             // Branch decoded
  input ID_jmp_i;
  input ID_jr_i;
  input ID_link_i;            // A link for that instruction
  input [`ALU_CTRL_WIDTH-1:0] ID_alu_code_i;    // Alu operation
  input ID_op_mem_i;          // Memory operation request
  input ID_mem_we_i;             // Type of memory operation (reading or writing)
  input [6:0] ID_mem_optype_i; // type of the mem operation
  input [`EXC_TYPE_WIDTH-1:0] ID_exc_type_i;             // Potential exception detected
  input [`LEVEL_TYPE_WIDTH-1:0] ID_level_i;// Availability of the result for the data bypass
  input ID_it_ok_i;         // Allow hardware interruptions
  input ID_ds_i;
  
  // Synchronous output to EX stage
  output reg [31:0] EX_inst_o;
  output reg [31:0] EX_addr_o;        // Address of the decoded instruction
  output reg [31:0] EX_addrA4_o;      //EX_adr +4
    
  output reg EX_bra_o;             // Branch decoded
  output reg EX_jmp_o;
  output reg EX_jr_o;
  output reg EX_link_o;            // A link for that instruction
  
  output reg [31:0] EX_op1_o;                 // operand 1 for alu
  output reg [31:0] EX_op2_o;                 // operand 2 for alu
  output reg [`ALU_CTRL_WIDTH-1:0] EX_alu_code_o;    // Alu operation
  output reg [`REG_ADDR_WIDTH-1:0] EX_reg_waddr_o;// Addr of the dst reg 
  output reg EX_reg_we_o;         // Effective writing of the result
  
  output reg EX_op_mem_o;             // Memory operation request
  output reg EX_mem_we_o;             // Type of memory operation (reading or writing)
  output reg [6:0] EX_mem_optype_o;  // type of the mem operation
  output reg [1:0] EX_mem_baddr_o;      // byte addr of the mem opeation addr
  
  output reg [`EXC_TYPE_WIDTH-1:0] EX_exc_type_o;             // Potential exception detected
  output reg [`LEVEL_TYPE_WIDTH-1:0] EX_level_o;
  output reg EX_it_ok_o;         // Allow hardware interruptions
  output reg EX_ds_o;
  
  output reg BP_depra_o;
  output reg BP_deprb_o;
  // Asynchronous connexion with the register management and data bypass unit
  input [`REG_ADDR_WIDTH-1:0] BP_reg_raddra_i;   // Addr of the first register operand
  input [`REG_ADDR_WIDTH-1:0] BP_reg_raddrb_i;  // Addr of the second register operand
  input BP_use_rega_i;               // Effective use of operand 1
  input BP_use_regb_i;               // Effective use of operand 2
  input [31:0] BP_dataa_i;        // Operand register 1
  input [31:0] BP_datab_i;        // Operand register 2
 
  wire nodep_ra,dep_ra;
  wire nodep_rb,dep_rb;
  assign nodep_ra = BP_reg_raddra_i[5:0] == 6'b0 || BP_use_rega_i ==0;
  assign dep_ra   = ~nodep_ra && BP_reg_raddra_i == ID_reg_waddr_i && ID_reg_we_i  ==1 ;
  assign nodep_rb = BP_reg_raddrb_i[5:0] == 6'b0 || BP_use_regb_i ==0;
  assign dep_rb   = ~nodep_rb && BP_reg_raddrb_i == ID_reg_waddr_i && ID_reg_we_i  ==1 ;
 
  reg EX_bra_reged;
  always @(posedge clk_i or posedge rst_i)
  begin
    if(rst_i)
      EX_bra_reged <= 1'b0;
    else begin
      if(~EX_bra_reged)
	EX_bra_reged <= EX_bra_confirm_i;
      else if(ID_bra_target_i)
	EX_bra_reged <= 1'b0;
    end
  end
 
  wire clear;
  reg is_ds;
  assign clear = COP0_interrupt_i |
                 (is_ds & (EX_bra_confirm_i | EX_bra_reged) & ~ID_bra_target_i);
  
  wire clear_rf;
  assign clear_rf = ~ID_inst_valid_i | alea_i | clear;
 
  wire [31:0] inst_code; 
  wire [4:0]  inst_rs,inst_rt,inst_rd,inst_sa;
  wire [15:0] inst_imm;
  wire [25:0] inst_jmp_imm;
  
  assign inst_code    = ID_inst_i;
  assign inst_rs      = inst_code[25:21];
  assign inst_rt      = inst_code[20:16];
  assign inst_rd      = inst_code[15:11];
  assign inst_sa      = inst_code[10:6];
  assign inst_imm     = inst_code[15:0];
  assign inst_jmp_imm = inst_code[25:0];
  assign inst_regimm  = inst_code[20:16];
  
  assign BP_reg_addra_o = {ID_cop_rega_i,inst_rs};
  assign BP_use_rega_o  = ID_use_rega_i;
  assign BP_reg_addrb_o = {ID_cop_regb_i,inst_rt};
  assign BP_use_regb_o  = ID_use_regb_i;
  
  wire [31:0] pre_op1,pre_op2;
  
  assign pre_op1 = ID_use_rega_i ? BP_dataa_i:{27'b0,inst_sa}; //imm as operand 1 or don't care
  assign pre_op2 = ID_use_regb_i ? BP_datab_i:
                       ID_imm_selb_i ? {{16{inst_imm[15]}},inst_imm}:{16'b0,inst_imm};//zero extended imm as opreand 2 or don't care
 
  wire [1:0] mem_baddr;
  assign mem_baddr = pre_op1[1:0] + inst_imm[1:0];
 
  wire pre_bra ;
  assign pre_bra = ID_bra_i | ID_jmp_i | ID_jr_i;
  
  // Set the synchronous outputs
  always @(posedge clk_i or posedge rst_i)
  begin    
    if (rst_i == 1)
    begin
      EX_bra_o          <= #Tp 0;
      EX_jmp_o          <= #Tp 0;
      EX_jr_o           <= #Tp 0;
      EX_link_o         <= #Tp 0;
      EX_op1_o          <= #Tp 32'bx;
      EX_op2_o          <= #Tp 32'bx;
      EX_alu_code_o     <= #Tp `ALU_OP_NONE;
      EX_reg_waddr_o    <= #Tp 6'bx;
      EX_reg_we_o       <= #Tp 1'b0;
      EX_op_mem_o       <= #Tp 1'b0;
      EX_mem_we_o       <= #Tp 1'bx;
      EX_mem_optype_o   <= #Tp `tMEM_OP_NULL;
      EX_mem_baddr_o    <= #Tp 2'bx;
      EX_exc_type_o     <= #Tp `tEXC_NONE;
      EX_level_o        <= #Tp `LVL_RF_;
      EX_it_ok_o        <= #Tp 0;
      EX_inst_o         <= #Tp 32'bx;
      EX_addr_o         <= #Tp 32'bx;
      EX_addrA4_o       <= #Tp 32'bx;
 
      BP_depra_o       <= #Tp 0;
      BP_deprb_o       <= #Tp 0;
      EX_ds_o          <= #Tp 0;
      
      is_ds            <= #Tp 0;
    end
    else if ((dmem_rdy_i & EX_rdy_i) | COP0_interrupt_i)
    begin
      EX_addr_o        <= #Tp ID_addr_i;
      EX_ds_o          <= #Tp ID_ds_i;
      
      if (clear_rf)
      begin
	// Nop instruction
	EX_bra_o         <= #Tp 0;
	EX_jmp_o         <= #Tp 0;
	EX_jr_o          <= #Tp 0;
	EX_link_o        <= #Tp 0;
	EX_op1_o         <= #Tp 32'bx;
	EX_op2_o         <= #Tp 32'bx;	
	EX_alu_code_o    <= #Tp `ALU_OP_NONE;
	EX_reg_waddr_o   <= #Tp 6'bx;
	EX_reg_we_o      <= #Tp 0;
	EX_op_mem_o      <= #Tp 0;
	EX_mem_we_o      <= #Tp 0;
	EX_mem_optype_o  <= #Tp `tMEM_OP_NULL;
	EX_mem_baddr_o   <= #Tp 2'bx;
	EX_exc_type_o    <= #Tp `tEXC_NONE;
	EX_level_o       <= #Tp `LVL_RF_;
	
	//if it's not cleared by branch_confirm or COP0_interrupt 
	//signal ,it_ok signal should be enableed 
	if(clear)
	  EX_it_ok_o     <= #Tp 0;
	else 
	  EX_it_ok_o     <= #Tp 1;

	EX_inst_o        <= #Tp 32'bx;
	//EX_addr_o        <= #Tp 32'bx;
	EX_addrA4_o      <= #Tp 32'bx;
	
	BP_depra_o      <= #Tp 0;
	BP_deprb_o      <= #Tp 0;
	
	if(COP0_interrupt_i)
	  is_ds          <= #Tp 0 ;
	
      end    
      else begin // Noraml step
	EX_bra_o         <= #Tp ID_bra_i;
	EX_jmp_o         <= #Tp ID_jmp_i;
	EX_jr_o          <= #Tp ID_jr_i;
	EX_link_o        <= #Tp ID_link_i;
	EX_op1_o         <= #Tp pre_op1;
	EX_op2_o         <= #Tp pre_op2;
	EX_alu_code_o    <= #Tp ID_alu_code_i;
	EX_reg_waddr_o   <= #Tp ID_reg_waddr_i;
	EX_reg_we_o      <= #Tp ID_reg_we_i;
	EX_op_mem_o      <= #Tp ID_op_mem_i;
	EX_mem_we_o      <= #Tp ID_mem_we_i;
	EX_mem_optype_o  <= #Tp ID_mem_optype_i;
	EX_mem_baddr_o   <= #Tp mem_baddr;
	EX_exc_type_o    <= #Tp ID_exc_type_i;
	EX_level_o       <= #Tp ID_level_i;
	EX_it_ok_o       <= #Tp ID_it_ok_i;
	EX_inst_o        <= #Tp ID_inst_i;
	//EX_addr_o        <= #Tp ID_addr_i;
	EX_addrA4_o      <= #Tp ID_addr_i + 4;
		
	BP_depra_o      <= #Tp dep_ra;
	BP_deprb_o      <= #Tp dep_rb;
	
	is_ds           <= #Tp ID_bra_target_i ? 0 : ID_ds_i;
      end 
    end 
  end 
  
endmodule


