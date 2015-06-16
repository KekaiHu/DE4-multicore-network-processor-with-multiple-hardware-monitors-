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
//// Description: pipeline stage ID of ucore processor           ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////


`include "ucore_defines.v"

module pps_id 
  (
   clk_i,rst_i,
   alea_i,
   EX_rdy_i,dmem_rdy_i,imem_rdy_i,
  
   // Datas from IF stage
   IF_addr_i,CTRL_inst_i,IF_it_ok_i,IF_bra_target_i,
   
   // Synchronous output to RF stage
   RF_inst_valid_o,RF_bra_target_o,
   RF_inst_o,RF_addr_o,
   //reg access signal
   RF_use_rega_o,RF_imm_sela_o,RF_use_regb_o,RF_imm_selb_o,RF_cop_rega_o,RF_cop_regb_o,
   RF_reg_waddr_o,RF_reg_we_o,RF_level_o,
   
   //other signals
   RF_bra_o,RF_jmp_o,RF_jr_o,RF_link_o,RF_alu_code_o,RF_op_mem_o,RF_mem_we_o,RF_mem_optype_o,RF_exc_type_o,RF_it_ok_o,RF_ds_o,
 
   // Asynchronous connexion with the register management and data bypass unit
   BP_reg_addra_o,BP_reg_addrb_o,BP_use_rega_o,BP_use_regb_o
   );
 
  parameter Tp = `TP__;
  parameter INST_DE_WIDTH = `INST_DE_WIDTH_;
    
  input clk_i;
  input rst_i;
  
  input EX_rdy_i;
  input dmem_rdy_i;
  input imem_rdy_i;
  input alea_i;               // Unresolved detected : send nop in the pipeline 
  
  // Datas from IF stage
  input [31:0] IF_addr_i;       // Address of the instruction
  input [31:0] CTRL_inst_i;     // The instruction to decode
  input IF_it_ok_i;            // Allow hardware interruptions
  input IF_bra_target_i;
  
  // Synchronous output to EX stage
  output reg RF_inst_valid_o;// a valid instruction send to rf 
  output reg RF_bra_target_o;
  output reg [31:0] RF_inst_o;
  output reg [31:0] RF_addr_o;        // Address of the decoded instruction
    
  //reg access signal
  output reg RF_use_rega_o;
  output reg RF_use_regb_o;
  output reg RF_imm_sela_o;        // selection of imm as oprand 1
  output reg RF_imm_selb_o;        // selection of imm as oprand 2
  output reg RF_cop_rega_o;
  output reg RF_cop_regb_o;
  output reg [`REG_ADDR_WIDTH-1:0] RF_reg_waddr_o;// Address of the dest register of the result
  output reg RF_reg_we_o;         // Effective writing of the result
  output reg [`LEVEL_TYPE_WIDTH-1:0] RF_level_o;// Availability of the result for the data bypass
  
  //other signals
  output reg RF_bra_o;             // Branch decoded
  output reg RF_jmp_o;
  output reg RF_jr_o;
  output reg RF_link_o;            // A link for that instruction
  output reg [`ALU_CTRL_WIDTH-1:0] RF_alu_code_o;    // Alu operation
  output reg RF_op_mem_o;          // Memory operation request
  output reg RF_mem_we_o;             // Type of memory operation (reading or writing)
  output reg [6:0] RF_mem_optype_o; // type of the mem operation
  output reg [`EXC_TYPE_WIDTH-1:0] RF_exc_type_o; // Potential exception detected
  output reg RF_it_ok_o;         // Allow hardware interruptions
  output reg RF_ds_o;
  
  // Asynchronous connexion with the register management and data bypass unit
  output [`REG_ADDR_WIDTH-1:0] BP_reg_addra_o;        // Adress of the first register operand
  output [`REG_ADDR_WIDTH-1:0] BP_reg_addrb_o;        // Address of the second register operand
  output BP_use_rega_o;               // Effective use of operand 1
  output BP_use_regb_o;               // Effective use of operand 2
   
  // Instruction fields
  wire [31:0] inst_code; 
  wire [4:0]  inst_rs,inst_rt,inst_rd,inst_sa;
  wire [15:0] inst_imm;
  wire [25:0] inst_jmp_imm;
 
  //when imem unready send nop instruction
  assign inst_code = ~dmem_rdy_i | ~EX_rdy_i |alea_i ? RF_inst_o:CTRL_inst_i;
  assign inst_rs = inst_code[25:21];
  assign inst_rt = inst_code[20:16];
  assign inst_rd = inst_code[15:11];
  assign inst_sa = inst_code[10:6];
  assign inst_imm = inst_code[15:0];
  assign inst_jmp_imm = inst_code[25:0];
  assign inst_regimm = inst_code[20:16];
  
  //inst decode result
  wire [0:INST_DE_WIDTH-1] inst_decode;
    
  inst_decoder my_decoder
    (
     .inst_code(inst_code),
     .inst_decode(inst_decode)
     );
  
  // Preparation of the synchronous outputs
  // Branch operation
  wire [2:0] de_bra;
  // Branch with link
  wire de_link;
  // Alu operation
  wire [`ALU_CTRL_WIDTH-1:0] de_alu_code;
  // Memory access operation instruction 
  wire de_op_mem;
  // Read/write selection in memory
  wire de_mem_we;
  //type of the mem operation
  wire [6:0] de_mem_optype;
  // Potential exception cause
  wire [`EXC_TYPE_WIDTH-1:0] de_exc_type;
  wire de_cop_org1,de_cop_org2,de_use_reg1,de_use_reg2,de_imm1_sel,de_imm2_sel;
  // Result availability stage for bypass
  wire [`LEVEL_TYPE_WIDTH-1:0] de_level;
  // Writing of result in the bank register
  wire de_reg_we;  
  wire de_bank_des;
  wire [1:0] de_des_sel;
    
  assign de_bra = inst_decode[0:2];
  assign de_link = inst_decode[3];
  assign de_alu_code = inst_decode[4:`ALU_CTRL_WIDTH-1+4];
  assign de_op_mem = inst_decode[`ALU_CTRL_WIDTH+4];
  assign de_mem_we = inst_decode[`ALU_CTRL_WIDTH+5];
  assign de_mem_optype = inst_decode[`ALU_CTRL_WIDTH+6:`ALU_CTRL_WIDTH+12];
  assign de_exc_type = inst_decode[`ALU_CTRL_WIDTH+13:`ALU_CTRL_WIDTH+13+`EXC_TYPE_WIDTH-1];
  assign de_cop_org1 = inst_decode[`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+13];
  assign de_cop_org2 = inst_decode[`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+14];
  assign de_use_reg1 = inst_decode[`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+15];
  assign de_use_reg2 = inst_decode[`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+16];
  assign de_imm1_sel = inst_decode[`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+17];
  assign de_imm2_sel = inst_decode[`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+18];
  assign de_level = inst_decode[`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+19:`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+19+`LEVEL_TYPE_WIDTH-1];
  assign de_reg_we = inst_decode[`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+`LEVEL_TYPE_WIDTH+19];
  assign de_bank_des = inst_decode[`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+`LEVEL_TYPE_WIDTH+20];
  assign de_des_sel = inst_decode[`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+`LEVEL_TYPE_WIDTH+21:`ALU_CTRL_WIDTH+`EXC_TYPE_WIDTH+`LEVEL_TYPE_WIDTH+22];

  // Destination register adress for result
  //reg [`REG_ADDR_WIDTH-1:0] de_dst_reg_addr; 
  //always @(de_des_sel,de_bank_des,inst_rt,inst_rd)
  //begin
  //  case(de_des_sel)//synthesis parallel_case
  //    `tD_RT :  de_dst_reg_addr =  #Tp {de_bank_des,inst_rt}; 
  //    `tD_RD :  de_dst_reg_addr =  #Tp {de_bank_des,inst_rd}; 
  //    `tD_31 :  de_dst_reg_addr =  #Tp {de_bank_des,5'b11111}; 
  //    default:  de_dst_reg_addr =  #Tp 6'bx;  //D_00,don't care
  //  endcase
  //end
 
  wire [`REG_ADDR_WIDTH-1:0] de_dst_reg_addr; 
  assign de_dst_reg_addr = de_des_sel == `tD_RT ? {de_bank_des,inst_rt} :
                               de_des_sel == `tD_RD ? {de_bank_des,inst_rd} :
                               de_des_sel == `tD_31 ? {de_bank_des,5'b11111}: 6'bx; //D_00,don't care
    
  assign BP_reg_addra_o = {de_cop_org1,inst_rs};
  assign BP_use_rega_o  = de_use_reg1;
  assign BP_reg_addrb_o = {de_cop_org2,inst_rt};
  assign BP_use_regb_o  = de_use_reg2;

  reg is_bra;
  
  // Set the synchronous outputs
  always @(posedge clk_i or posedge rst_i)
  begin    
    if (rst_i == 1)
    begin
      is_bra          <= #Tp 1'b0;
      RF_inst_valid_o <= #Tp 1'b0;
      RF_bra_target_o <= #Tp 1'b0;
      RF_inst_o       <= #Tp 32'bx;
      RF_addr_o       <= #Tp 32'bx;
      
      RF_use_rega_o   <= #Tp 1'bx;
      RF_use_regb_o   <= #Tp 1'bx;
      RF_imm_sela_o   <= #Tp 1'bx;
      RF_imm_selb_o   <= #Tp 1'bx;
      RF_cop_rega_o   <= #Tp 1'bx;
      RF_cop_regb_o   <= #Tp 1'bx;
      RF_reg_waddr_o  <= #Tp 6'bx;
      RF_reg_we_o     <= #Tp 1'b0;
      
      RF_bra_o        <= #Tp 0;
      RF_jmp_o        <= #Tp 0;
      RF_jr_o         <= #Tp 0;
      RF_link_o       <= #Tp 0;
      RF_alu_code_o   <= #Tp `ALU_OP_NONE;
      RF_op_mem_o     <= #Tp 1'b0;
      RF_mem_we_o     <= #Tp 1'bx;
      RF_mem_optype_o <= #Tp `tMEM_OP_NULL;
      RF_exc_type_o   <= #Tp `tEXC_NONE;
      RF_level_o      <= #Tp `LVL_RF_;
      RF_it_ok_o      <= #Tp 0;
      
      RF_ds_o         <= #Tp 0;
    end
    else if (EX_rdy_i & dmem_rdy_i & ~alea_i)
    begin
 
      is_bra          <= #Tp |de_bra;
      RF_inst_valid_o <= #Tp imem_rdy_i;
      RF_bra_target_o <= #Tp IF_bra_target_i;
      RF_inst_o       <= #Tp CTRL_inst_i;
      RF_addr_o       <= #Tp IF_addr_i;
           
      RF_use_rega_o   <= #Tp de_use_reg1;
      RF_use_regb_o   <= #Tp de_use_reg2;
      RF_imm_sela_o   <= #Tp de_imm1_sel;
      RF_imm_selb_o   <= #Tp de_imm2_sel;
      RF_cop_rega_o   <= #Tp de_cop_org1;
      RF_cop_regb_o   <= #Tp de_cop_org2;
      RF_reg_waddr_o  <= #Tp de_dst_reg_addr;
      RF_reg_we_o     <= #Tp de_reg_we;
      {RF_jr_o,RF_jmp_o,RF_bra_o} <= #Tp de_bra;
      RF_link_o       <= #Tp de_link;
      RF_alu_code_o   <= #Tp de_alu_code;
      RF_op_mem_o     <= #Tp de_op_mem;
      RF_mem_we_o     <= #Tp de_mem_we;
      RF_mem_optype_o <= #Tp de_mem_optype;
      RF_exc_type_o   <= #Tp de_exc_type;
      RF_level_o      <= #Tp de_level;
      RF_it_ok_o      <= #Tp IF_it_ok_i;
      
      if(RF_addr_o != IF_addr_i)//addr change
      begin
	if(RF_ds_o ==0 && RF_addr_o+4 == IF_addr_i)
	  RF_ds_o      <= #Tp RF_bra_o | RF_jr_o | RF_jmp_o;
	else RF_ds_o   <= #Tp 0;
      end
    end
  end
endmodule
/*
  `define REPORT_INVALID_INST
  `ifdef  REPORT_INVALID_INST
    parameter  DE_INVALID = `DE__INVALID ;// INVALID_inst
    //report a invalid instruction
    always @(inst_decode)
    begin
      if(inst_decode== DE_INVALID)
	$display($time, , , "Invalid instruction addr=%d,inst=%h",IF_addr_i,CTRL_inst_i); 
    end
  `endif
    
  //`define DEBUG_ROM
  `ifdef DEBUG_ROM
    parameter MEM_SIZE = `INST_ROM_SIZE;
    parameter ADDR_WIDTH = `INST_ROM_ADDR_WIDTH;
    parameter DATA_WIDTH = `INST_ROM_DATA_WIDTH;
    parameter START = `INST_ROM_START;
    parameter LATENCY = `INST_ROM_LATENCY;
 
   reg [31:0]  mem [MEM_SIZE-1+START/4:0+START/4];
   initial $readmemh("inst_rom.code",mem);
 
   always @(posedge clk_i)
   begin
     if(~alea_i && dmem_rdy_i && imem_rdy_i && EX_rdy_i && ~rst_i)
     begin
       if(mem[IF_addr_i/4] != CTRL_inst_i)
	 $display($time, , , "ROM incorrect ,IF_addr_i=%x,mem=%x,CTRL_inst_i = %x .",IF_addr_i,mem[IF_addr_i/4],CTRL_inst_i);
     //else $display($time, , ,"ROM correct !");
     end
   end
 `endif
  
endmodule	*/


