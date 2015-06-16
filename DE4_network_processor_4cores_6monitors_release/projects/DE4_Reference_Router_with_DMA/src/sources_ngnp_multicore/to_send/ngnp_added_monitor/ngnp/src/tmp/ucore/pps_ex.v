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
//// Description: pipeline stage EX of ucore processor           ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

module pps_ex 
  (
   clk_i,rst_i,//global signal
   dmem_rdy_i,
 
   // Datas from RF stage
   RF_inst_i,RF_addr_i,RF_addrA4_i,
   RF_bra_i,RF_jmp_i,RF_jr_i,RF_link_i,
   
   RF_op1_i,RF_op2_i,RF_alu_code_i,
   RF_reg_waddr_i,RF_reg_we_i,RF_level_i,
     
   RF_op_mem_i,RF_mem_we_i,RF_mem_optype_i,RF_mem_baddr_i,
   RF_exc_type_i,RF_it_ok_i,RF_ds_i,
   
   IF_bra_confirm_o,IF_bra_addr_o,//branch signals
   
   MEM_inst_o,MEM_addr_o,
   MEM_reg_data_o,MEM_reg_waddr_o,MEM_reg_we_o,MEM_level_o,//reg request signals
   MEM_mem_req_o,MEM_mem_we_o,MEM_mem_optype_o,MEM_mem_data_o,MEM_mem_addr_o,
   MEM_mem_bwsel_o,MEM_mem_baddr_o,MEM_op2_o,//mem op signals
   MEM_exc_type_o,MEM_it_ok_o,MEM_ds_o,
   rdy_o,

   BP_depra_o,BP_deprb_o,BP_reg_rdy_o,
   // Asynchronous connexion with the register management and data bypass unit
   BP_reg_raddra_i,BP_reg_raddrb_i,BP_use_rega_i,BP_use_regb_i
   );
  
  parameter Tp = `TP__;
 
  input clk_i;
  input rst_i;
  input dmem_rdy_i;
   
  // Datas from RF stage
  input [31:0] RF_inst_i;
  input [31:0] RF_addr_i;                  // Instruction address
  input [31:0] RF_addrA4_i; 
    
  input RF_bra_i;              // Branch instruction
  input RF_jmp_i;
  input RF_jr_i;
  input RF_link_i;             // Branch with link
  input [31:0] RF_op1_i;                  // Operand 1 for alu
  input [31:0] RF_op2_i;                  // Operand 2 for alu
  input [`ALU_CTRL_WIDTH-1:0] RF_alu_code_i;     // Alu operation
  input [`REG_ADDR_WIDTH-1:0]  RF_reg_waddr_i;  // Destination register address for the result
  input RF_reg_we_i;          // Effective writing of the result
  input RF_op_mem_i;           // Memory operation
  input RF_mem_we_i;              // Type of memory operation (read or write)
  input [6:0] RF_mem_optype_i; // type of the mem operation
  input [1:0] RF_mem_baddr_i;
  
  input [`EXC_TYPE_WIDTH-1:0] RF_exc_type_i;            // Potential cause exception
  input [`LEVEL_TYPE_WIDTH-1:0] RF_level_i;  // Availability stage of the result for bypassing
  input RF_it_ok_i;            // Allow hardware interruptions
  input RF_ds_i;
  
  //branch signals
  output reg        IF_bra_confirm_o;     // Branch execution confirmation
  output reg [31:0] IF_bra_addr_o;             // Address calculation result
  
  // Synchronous outputs to MEM stage
  output reg [31:0] MEM_reg_data_o;            // Ual result
  output reg [`REG_ADDR_WIDTH-1:0] MEM_reg_waddr_o; // Destination register for the result
  output reg        MEM_reg_we_o;         // Effective writing of the result
  output reg [`LEVEL_TYPE_WIDTH-1:0] MEM_level_o;// Availability stage of result for bypassing
  
  //mem operation signals
  output reg        MEM_mem_req_o;          // Memory operation needed
  output reg        MEM_mem_we_o;
  output reg [6:0]  MEM_mem_optype_o;
  output reg [31:0] MEM_mem_data_o;
  output reg [31:0] MEM_mem_addr_o;
  output reg [3:0]  MEM_mem_bwsel_o;
  output reg [1:0]  MEM_mem_baddr_o;
  output reg [31:0] MEM_op2_o;
  
  output reg [`EXC_TYPE_WIDTH-1:0]  MEM_exc_type_o; // Potential cause exception
  output reg [31:0] MEM_inst_o;
  output reg [31:0] MEM_addr_o;                 // Instruction address

  output reg MEM_it_ok_o;           // Allow hardware interruptions
  output reg MEM_ds_o;
  
  output     rdy_o;
 
  output reg BP_depra_o;
  output reg BP_deprb_o;
  output reg BP_reg_rdy_o;
  
  // Asynchronous connexion with the register management and data bypass unit
  input [`REG_ADDR_WIDTH-1:0] BP_reg_raddra_i;  // Adress of the first register operand
  input [`REG_ADDR_WIDTH-1:0] BP_reg_raddrb_i;  // Address of the second register operand
  input BP_use_rega_i;               // Effective use of operand 1
  input BP_use_regb_i;               // Effective use of operand 2
     
  wire [31:0] op1,op2;
  assign op1 = RF_op1_i;
  assign op2 = RF_op2_i;
  
  wire [31:0] MEM_offset ;
  assign MEM_offset = {{16{RF_inst_i[15]}},RF_inst_i[15:0]};
  
  wire [31:0] JMP_offset ;
  assign JMP_offset = {RF_addrA4_i[31:28],RF_inst_i[25:0],2'b00};
  
  wire [31:0] BRA_offset ;
  assign BRA_offset = {{14{RF_inst_i[15]}},RF_inst_i[15:0],2'b00};
  
  wire [31:0] alu_res;      // Alu result output
  wire branch_flag;
  
  wire pre_reg_we;  // Output of mux selection for writing command to register
  wire [31:0] pre_alu_res;      // Mux selection of the data to write
  wire [31:0] pre_bra_addr;
  //wire pre_bra;
  wire pre_bra_confirm;  // Result of the test in alu when branch instruction
  wire [`EXC_TYPE_WIDTH-1:0] pre_exc_type;// Preparation of the exception detection signal
  wire alu_overflow;  // Dectection of the alu overflow
  wire [31:0] mem_addr;
    
  // Alu instantiation
  alu my_alu (
	      .clk_i(clk_i), 
	      .rst_i(rst_i), 
	      .op1(op1),
	      .op2(RF_op_mem_i?MEM_offset:op2),
	      .ctrl(RF_alu_code_i),
	      .res(alu_res),
	      .mem_addr(mem_addr),
	      .branch_flag(branch_flag),
	      .overflow(alu_overflow),
	      .rdy(rdy_o)
	      );
  
  // Calculation of the future outputs
  assign pre_reg_we  = (RF_link_i == `tLINK) ? pre_bra_confirm:RF_reg_we_i;
  assign pre_alu_res = (RF_link_i == `tLINK) ? (RF_addrA4_i+4):alu_res;
  assign pre_bra_confirm = (RF_bra_i && branch_flag) | RF_jr_i | RF_jmp_i;
  //assign pre_bra         = RF_bra_i | RF_jr_i | RF_jmp_i;
  assign pre_bra_addr    = RF_jr_i     ? op1                    :
                               RF_jmp_i    ? JMP_offset             :
                                             RF_addrA4_i+BRA_offset ;//bra or don't care
  
  assign pre_exc_type = (RF_exc_type_i == `tEXC_OVERFLOW && alu_overflow==0) ? `tEXC_NONE : RF_exc_type_i;
 
  wire nodep_ra,dep_ra;
  wire nodep_rb,dep_rb;
  assign nodep_ra = BP_reg_raddra_i[5:0] == 6'b0 || BP_use_rega_i ==0;
  assign dep_ra   = ~nodep_ra && BP_reg_raddra_i == RF_reg_waddr_i  && pre_reg_we  ==1 ;
  assign nodep_rb = BP_reg_raddrb_i[5:0] == 6'b0 || BP_use_regb_i ==0;
  assign dep_rb   = ~nodep_rb && BP_reg_raddrb_i == RF_reg_waddr_i  && pre_reg_we  ==1 ;
  wire   data_rdy;
  assign data_rdy = RF_level_i >= `LVL_EX_;
 
  //mem_data_o generation
  reg [31:0] mem_data;
  
  always @(RF_mem_optype_i,RF_mem_baddr_i,op2)
  begin
    case(RF_mem_optype_i)//synthesis parallel_case
      //`tMEM_OP_HWORDU: //will not exist
      `tMEM_OP_HWORD:
      begin
	case(RF_mem_baddr_i[1])//synthesis parallel_case
	  1'b1:   mem_data = {op2[15:0],16'bx};//4'b1100;
	  1'b0:   mem_data = {16'bx,op2[15:0]};//4'b0011;
	  default:mem_data = 32'bx;
	endcase
      end
      //`tMEM_OP_BYTEU: //will not exist
      `tMEM_OP_BYTE :
      begin
	case(RF_mem_baddr_i[1:0])//synthesis parallel_case
	  2'b11: mem_data = {op2[7:0],24'bx};//dmem_bwsel_o = 4'b1000;	
	  2'b10: mem_data = {8'bx,op2[7:0],16'bx};//dmem_bwsel_o = 4'b0100;
	  2'b01: mem_data = {16'bx,op2[7:0],8'bx};//dmem_bwsel_o = 4'b0010;
	  2'b00: mem_data = {24'bx,op2[7:0]};//dmem_bwsel_o = 4'b0001;	   
	endcase
      end
      `tMEM_OP_WORD :mem_data = op2;
      `tMEM_OP_WR   :
      begin
	case(RF_mem_baddr_i[1:0])//synthesis parallel_case
	  2'b11: mem_data = {op2[7:0],24'bx};//dmem_bwsel_o = 4'b1000;
	  2'b10: mem_data = {op2[15:0],16'bx};//dmem_bwsel_o = 4'b1100;
	  2'b01: mem_data = {op2[23:0],8'bx};//dmem_bwsel_o = 4'b1110;
	  2'b00: mem_data = op2;//dmem_bwsel_o = 4'b1111;	  
	endcase
      end
      `tMEM_OP_WL   :
      begin
	case(RF_mem_baddr_i[1:0])//synthesis parallel_case
	  2'b11: mem_data = op2;//dmem_bwsel_o = 4'b1111;
	  2'b10: mem_data = {8'bx,op2[31:8]};//dmem_bwsel_o =  4'b0111;
	  2'b01: mem_data = {16'bx,op2[31:16]};//dmem_bwsel_o = 4'b0011;
	  2'b00: mem_data = {24'bx,op2[31:24]};//dmem_bwsel_o = 4'b0001;	  
	endcase
      end
      default      : mem_data = 32'bx;
    endcase
  end
 
  //bwsel generation
  reg [3:0] mem_bwsel;
 
  always @(RF_mem_optype_i,RF_mem_baddr_i[1:0])
  begin
    case(RF_mem_optype_i)//synthesis parallel_case
      `tMEM_OP_HWORD ,
      `tMEM_OP_HWORDU: 
      begin
	case(RF_mem_baddr_i[1])//synthesis parallel_case
	  1'b1:    mem_bwsel = 4'b1100;
	  1'b0:    mem_bwsel = 4'b0011;
	  default: mem_bwsel = 4'b0011;
	endcase
      end
      `tMEM_OP_BYTE ,
      `tMEM_OP_BYTEU :
      begin
	case(RF_mem_baddr_i[1:0])//synthesis parallel_case
	  2'b11: mem_bwsel = 4'b1000;	  
	  2'b10: mem_bwsel = 4'b0100;
	  2'b01: mem_bwsel = 4'b0010;
	  2'b00: mem_bwsel = 4'b0001;
	endcase
      end
      `tMEM_OP_WORD :
      begin
	mem_bwsel = 4'b1111;
      end
      `tMEM_OP_WR   :
      begin
	case(RF_mem_baddr_i[1:0])//synthesis parallel_case
	  2'b11: mem_bwsel = 4'b1000;
	  2'b10: mem_bwsel = 4'b1100;
	  2'b01: mem_bwsel = 4'b1110;
	  2'b00: mem_bwsel = 4'b1111;	  
	endcase
      end
      `tMEM_OP_WL   :
      begin
	case(RF_mem_baddr_i[1:0])//synthesis parallel_case
	  2'b11: mem_bwsel = 4'b1111;
	  2'b10: mem_bwsel = 4'b0111;
	  2'b01: mem_bwsel = 4'b0011;
	  2'b00: mem_bwsel = 4'b0001;	  
	endcase
      end
      default: mem_bwsel = 4'b0000;
    endcase
  end
  
  // Set the synchronous outputs
  always @(posedge clk_i or posedge rst_i)
  begin
    if(rst_i)
    begin
      //branch signal
      IF_bra_confirm_o     <= #Tp 1'b0;
      IF_bra_addr_o        <= #Tp 32'bx;
      //register signal
      MEM_reg_data_o       <= #Tp 32'bx;
      MEM_reg_waddr_o      <= #Tp `REG_ADDR_WIDTH'bx;
      MEM_reg_we_o         <= #Tp 0;
      MEM_level_o          <= #Tp `LVL_RF_;
      //mem op signals
      MEM_mem_we_o         <= #Tp 1'bx;         
      MEM_mem_optype_o     <= #Tp 7'bx;
      MEM_mem_data_o       <= #Tp 32'bx; 
      MEM_mem_addr_o       <= #Tp 32'bx;
      MEM_mem_req_o        <= #Tp 0;
      MEM_mem_bwsel_o      <= #Tp 4'b0000;
      MEM_mem_baddr_o      <= #Tp 2'bxx;
      MEM_op2_o            <= #Tp 32'bx;
      //others
      MEM_addr_o           <= #Tp 32'bx;
      MEM_inst_o           <= #Tp 32'bx;
      
      MEM_exc_type_o       <= #Tp `tEXC_NONE;
      MEM_it_ok_o          <= #Tp 0;
      MEM_ds_o             <= #Tp 0;
      
      BP_depra_o          <= #Tp 0;
      BP_deprb_o          <= #Tp 0;
      BP_reg_rdy_o        <= #Tp 1;
     
    end
    else if(dmem_rdy_i)
    begin
      
      //branch signal
      IF_bra_confirm_o     <= #Tp pre_bra_confirm;
      IF_bra_addr_o        <= #Tp pre_bra_addr;
      //register signal
      MEM_reg_data_o       <= #Tp pre_alu_res;
      MEM_reg_waddr_o      <= #Tp RF_reg_waddr_i;
      MEM_reg_we_o         <= #Tp rdy_o & pre_reg_we;
      MEM_level_o          <= #Tp RF_level_i;
      //mem op signals
      MEM_mem_we_o         <= #Tp RF_mem_we_i;         
      MEM_mem_optype_o     <= #Tp RF_mem_optype_i;
      MEM_mem_data_o       <= #Tp mem_data;
      MEM_mem_addr_o       <= #Tp mem_addr;
      MEM_mem_req_o        <= #Tp RF_op_mem_i;
      MEM_mem_bwsel_o      <= #Tp mem_bwsel;
      MEM_mem_baddr_o      <= #Tp RF_mem_baddr_i;
      MEM_op2_o            <= #Tp op2;
      //others
      MEM_addr_o           <= #Tp RF_addr_i;
      MEM_inst_o           <= #Tp RF_inst_i;
     
      MEM_exc_type_o       <= #Tp pre_exc_type;
      MEM_it_ok_o          <= #Tp RF_it_ok_i;
      MEM_ds_o             <= #Tp RF_ds_i;
      
      BP_depra_o          <= #Tp dep_ra;
      BP_deprb_o          <= #Tp dep_rb;
      BP_reg_rdy_o        <= #Tp data_rdy;
    end 
  end
    
endmodule
