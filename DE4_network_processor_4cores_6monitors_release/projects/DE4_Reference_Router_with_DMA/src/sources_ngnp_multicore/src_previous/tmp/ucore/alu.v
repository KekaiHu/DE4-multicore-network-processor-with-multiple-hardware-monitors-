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
//// Description: alu of ucore processor                         ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

module alu (
	    clk_i,rst_i,
	    op1,op2,        // Operand 
	    ctrl,           // Opearator control
	    res,            // The result is 32 bit long
	    mem_addr,
	    branch_flag,    // set to 1 when the branch is taken
	    overflow,       // Overflow of the result
	    rdy             //data rdy
	    );

  parameter ALUCTRL_WIDTH=`ALU_CTRL_WIDTH;
 
  parameter  OP_NONE  = `ALU_OP_NONE; 
  // ADD &SUB
  parameter  OP_ADD   = `ALU_OP_ADD;  // op1 + op2 signed
  parameter  OP_ADDU  = `ALU_OP_ADDU; // op1 + op2 unsigned
  parameter  OP_SUB   = `ALU_OP_SUB;  // op1 - op2 signed
  parameter  OP_SUBU  = `ALU_OP_SUBU; // op1 - op2 unsigned
  // Tests : result to one if ok
  parameter  OP_SLT   = `ALU_OP_SLT;  // op1 < op2 (signed)
  parameter  OP_SLTU  = `ALU_OP_SLTU; // op1 < op2 (unsigned)
  parameter  OP_EQ    = `ALU_OP_EQ;   // op1 == op2
  parameter  OP_NEQ   = `ALU_OP_NEQ;  // op1 != op2
  parameter  OP_LTZ   = `ALU_OP_LTZ;  // op1 < 0
  parameter  OP_GTZ   = `ALU_OP_GTZ;  // op1 > 0
  parameter  OP_LEZ   = `ALU_OP_LEZ;  // op1 <= 0
  parameter  OP_GEZ   = `ALU_OP_GEZ;  // op1 >= 0
  // Logical operations
  parameter  OP_AND   = `ALU_OP_AND;  // and 
  parameter  OP_OR    = `ALU_OP_OR;   // or
  parameter  OP_XOR   = `ALU_OP_XOR;  // xor
  parameter  OP_NOR   = `ALU_OP_NOR;  // nor
  // Shifts
  parameter  OP_SLL   = `ALU_OP_SLL;  // shift left logic
  parameter  OP_SRL   = `ALU_OP_SRL;  // shift right logic
  parameter  OP_SRA   = `ALU_OP_SRA;  // shift right arithmetic
  parameter  OP_LUI   = `ALU_OP_LUI;  // load 16bits imm into reg
  // Operations which do nothing but are useful
  parameter  OP_OP2   = `ALU_OP_OP2;  // return op2
  // MULT & DIV
  parameter  OP_MULT  = `ALU_OP_MULT; // hilo = op1 * op2 signed 
  parameter  OP_MULTU = `ALU_OP_MULTU;// hilo = op1 * op2 unsigned
  parameter  OP_DIV   = `ALU_OP_DIV;  // hilo = {op1 % op2 ,op1 /op2 } signed 
  parameter  OP_DIVU  = `ALU_OP_DIVU; // hilo = {op1 % op2 ,op1 /op2 } unsigned
  parameter  OP_MFHI  = `ALU_OP_MFHI; // move from hi
  parameter  OP_MFLO  = `ALU_OP_MFLO; // move from lo
  parameter  OP_MTHI  = `ALU_OP_MTHI; // move to hi
  parameter  OP_MTLO  = `ALU_OP_MTLO; // move to lo

  input clk_i;
  input rst_i;
  
  input  [31:0]              op1;  // Operand 1
  input  [31:0]              op2;  // Operand 2
  input  [ALUCTRL_WIDTH-1:0] ctrl; // Opearator control
  
  output [31:0]              res; // The result is 32 bit long
  output [31:0]              mem_addr;
  output                     branch_flag;
  output                     overflow;// Overflow of the result
  output                     rdy;
 
  reg    [31:0]              res;
  reg                        branch_flag;
  reg                        rdy;
  
  //##################### ADD & SUB OPERATIONS ######################
  wire  [32:0] op1_inter, op2_inter;  // Effective operands of the adder (33 bits)
  wire         nop2_sel;              //select the opposite of op2
  wire         sign_op1;                   // High bit of op 1
  wire         sign_op2;                   // High bit of op 2
  wire         sign;                      // Signed operation (bit sign extension)
  wire         [32:0] res_add;         // Result of the adder
  
  //  Process if the operation is signed compliant
  assign sign      = ctrl==OP_ADD | ctrl==OP_SUB | ctrl==OP_SLT;
  assign sign_op1  = sign & op1[31];
  assign sign_op2  = sign & op2[31];
  // -op2 to obtain a substraction
  assign nop2_sel  = ctrl==OP_SUB | ctrl==OP_SUBU | ctrl==OP_SLT | ctrl==OP_SLTU;
  assign op2_inter = /*nop2_sel  ? ~{sign_op2,op2}+1:*/{sign_op2,op2};
  assign op1_inter = {sign_op1,op1};
  assign res_add   = nop2_sel ? op1_inter - op2_inter : op1_inter + op2_inter;// +nop2_sel;
  //Only ADD and SUB can overflow
  assign overflow  = /*(ctrl==OP_ADD || ctrl==OP_SUB) &&*/ res_add[31] ^ res_add[32];
  assign mem_addr  = res_add[31:0];//here we give the add result directly to tell the synthesis tool we only use the adder of alu when caculate the address of the mem operation 
  //##################### shift OPERATIONS ######################
  
  wire  [4:0] shift_val ;          // Value of the shift
  wire [31:0] res_shl,res_shr;    // Results of left and right shifter
    
  // Value of the shift for the programmable shifter
  assign shift_val = op1[4:0];
  assign res_shl = op2<<shift_val;
  assign res_shr = (ctrl==OP_SRA && op2[31]==1'b1)? /*(op2>>> shift_val)*/~(~op2>> shift_val):op2>>shift_val;
 
  //##################### mul&div OPERATIONS ######################
 
  wire [31:0] res_muldiv;
  wire rdy_muldiv;
  muldiv my_muldiv 
    (
     .clk_i(clk_i),
     .rst_i(rst_i),
     .op_type(ctrl[7:0]),
     .op1(op1),
     .op2(op2),
     .rdy(rdy_muldiv),
     .res(res_muldiv)
     );
 
  //##################### misc OPERATIONS ######################
  
  wire [31:0] res_lui;             // Result of Load Upper Immediate
  assign res_lui = {op2[15:0],16'b0};
   
  //##################### res selection ######################
 
  always @(ctrl,res_add,op1,op2,res_shl,res_shr,res_lui,res_muldiv,rdy_muldiv)
  begin
    rdy = 1'b1;
    branch_flag = 1'bx;
    res  = 32'bx;
    case(ctrl) /*synthesis full_case */ /*synthesis parallel_case */
      OP_ADD,
      OP_ADDU,
      OP_SUB,
      OP_SUBU: res = res_add[31:0];
      OP_SLTU,
      OP_SLT:  res = {31'b0,res_add[32]};
      OP_AND:  res = op1&op2;
      OP_OR:   res = op1|op2;
      OP_NOR:  res = ~(op1|op2);
      OP_XOR:  res = op1^op2;
      OP_EQ:   branch_flag = ~(|(op1^op2));
      OP_NEQ:  branch_flag = |(op1^op2);
      OP_LTZ:  branch_flag = op1[31];
      OP_GTZ:  branch_flag = ~op1[31] && (|op1[30:0]);
      OP_LEZ:  branch_flag = op1[31] |(~|op1);
      OP_GEZ:  branch_flag = ~op1[31];
      // Shifts
      OP_SLL:  res = res_shl;
      OP_SRL,
      OP_SRA:  res = res_shr;
      OP_LUI:  res = res_lui;
      // Internal registers
      OP_MFHI,
      OP_MFLO:
      begin
	      rdy = rdy_muldiv;
	      res = res_muldiv;
      end
      OP_OP2:  res = op2;
      // Unknown operation or nul result desired
      //default: res = 32'bx;
    endcase        
  end

endmodule
