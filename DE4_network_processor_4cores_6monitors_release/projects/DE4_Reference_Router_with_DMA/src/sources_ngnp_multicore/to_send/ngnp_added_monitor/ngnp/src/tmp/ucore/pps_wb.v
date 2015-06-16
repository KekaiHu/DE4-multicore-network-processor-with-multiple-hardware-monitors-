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
//// Description: pipeline stage WB of ucore processor           ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

module pps_wb 
  (
   clk_i,rst_i,
 
   CTRL_data_i,
   MEM_op_mem_i,MEM_mem_optype_i,MEM_mem_baddr_i,MEM_op2_i,
   MEM_reg_waddr_i,MEM_reg_data_i,MEM_reg_we_i,
 
   // Synchronous outputs for bypass unit 
   BP_reg_waddr_o,BP_reg_we_o,BP_reg_data_o,
   
   BP_depra_o,BP_deprb_o,
   // Asynchronous connexion with the register management and data bypass unit
   BP_reg_raddra_i,BP_reg_raddrb_i,BP_use_rega_i,BP_use_regb_i
   );

  parameter Tp = `TP__;
  
  input clk_i;
  input rst_i;
   
  input [31:0] CTRL_data_i;   // Data from memory
  input        MEM_op_mem_i;
  input [6:0]  MEM_mem_optype_i;
  input [1:0]  MEM_mem_baddr_i;
  input [31:0] MEM_op2_i;
  input [`REG_ADDR_WIDTH-1:0] MEM_reg_waddr_i; // Dest register address for the result
  input        MEM_reg_we_i;           // Effective writing of the result
  input [31:0] MEM_reg_data_i;    // Result of alu operation
    
  // Synchronous outputs for bypass unit 
  output reg  [`REG_ADDR_WIDTH-1:0] BP_reg_waddr_o; // Destination register address
  output reg         BP_reg_we_o;         // Writing of the destination register
  output reg  [31:0] BP_reg_data_o;            // Data to write (from alu or memory)
 
  output reg BP_depra_o;
  output reg BP_deprb_o;
  // Asynchronous connexion with the register management and data bypass unit
  input [`REG_ADDR_WIDTH-1:0] BP_reg_raddra_i; // Adress of the first register operand
  input [`REG_ADDR_WIDTH-1:0] BP_reg_raddrb_i;// Address of the second register operand
  input BP_use_rega_i;               // Effective use of operand 1
  input BP_use_regb_i;               // Effective use of operand 2
 
  wire nodep_ra,dep_ra;
  wire nodep_rb,dep_rb;
  assign nodep_ra = BP_reg_raddra_i[5:0] == 6'b0 || BP_use_rega_i ==0;
  assign dep_ra = ~nodep_ra && BP_reg_raddra_i == MEM_reg_waddr_i  && MEM_reg_we_i  ==1 ;
  assign nodep_rb = BP_reg_raddrb_i[5:0] == 6'b0 || BP_use_regb_i ==0;
  assign dep_rb = ~nodep_rb && BP_reg_raddrb_i == MEM_reg_waddr_i  && MEM_reg_we_i  ==1 ;
 
  //load data in
  reg [31:0] mem_data;
  always @(MEM_mem_optype_i,MEM_mem_baddr_i[1:0],CTRL_data_i,MEM_op2_i)
  begin
    case(MEM_mem_optype_i)//synthesis parallel_case
      `tMEM_OP_HWORD: 
      begin
	case(MEM_mem_baddr_i[1])//synthesis parallel_case
	  1'b1: mem_data = {{16{CTRL_data_i[31]}},CTRL_data_i[31:16]};//4'b1100
	  1'b0: mem_data = {{16{CTRL_data_i[15]}},CTRL_data_i[15:0]};//4'b0011
	  default:mem_data = 32'bx;
	endcase
      end
      `tMEM_OP_HWORDU: 
      begin
	case(MEM_mem_baddr_i[1])//synthesis parallel_case
	  1'b1: mem_data = {16'b0,CTRL_data_i[31:16]};//4'b1100
	  1'b0: mem_data = {16'b0,CTRL_data_i[15:0]};//4'b0011
	  default:mem_data = 32'bx;
	endcase
      end
      `tMEM_OP_BYTE :
      begin
	case(MEM_mem_baddr_i[1:0])//synthesis parallel_case
	  2'b11: mem_data = {{24{CTRL_data_i[31]}},CTRL_data_i[31:24]};//bwsel_o = 4'b1000;
	  2'b10: mem_data = {{24{CTRL_data_i[23]}},CTRL_data_i[23:16]};//bwsel_o = 4'b0100;
	  2'b01: mem_data = {{24{CTRL_data_i[15]}},CTRL_data_i[15:8]};//bwsel_o = 4'b0010;
	  2'b00: mem_data = {{24{CTRL_data_i[7]}},CTRL_data_i[7:0]};//bwsel_o = 4'b0001;
	endcase
      end
      `tMEM_OP_BYTEU:
      begin
	case(MEM_mem_baddr_i[1:0])//synthesis parallel_case
	  2'b11: mem_data = {24'b0,CTRL_data_i[31:24]};//bwsel_o = 4'b1000;
	  2'b10: mem_data = {24'b0,CTRL_data_i[23:16]};//bwsel_o = 4'b0100;
	  2'b01: mem_data = {24'b0,CTRL_data_i[15:8]};//bwsel_o = 4'b0010;
	  2'b00: mem_data = {24'b0,CTRL_data_i[7:0]};//bwsel_o = 4'b0001;	  
	endcase
      end
      `tMEM_OP_WORD :
      begin
	mem_data = CTRL_data_i;//dmem_bwsel_o = 4'b1111;
      end
      `tMEM_OP_WR   :
      begin
	case(MEM_mem_baddr_i[1:0])//synthesis parallel_case
	  2'b11: mem_data = {MEM_op2_i[31:8],CTRL_data_i[31:24]};//dmem_bwsel_o= 4'b1000;
	  2'b10: mem_data = {MEM_op2_i[31:16],CTRL_data_i[31:16]};//dmem_bwsel_o= 4'b1100;
	  2'b01: mem_data = {MEM_op2_i[31:24],CTRL_data_i[31:8]};//dmem_bwsel_o= 4'b1110;
	  2'b00: mem_data = CTRL_data_i;//dmem_bwsel_o = 4'b1111;	  
	endcase
      end
      `tMEM_OP_WL   :
      begin
	case(MEM_mem_baddr_i[1:0])//synthesis parallel_case
	  2'b11: mem_data = CTRL_data_i;//dmem_bwsel_o = 4'b1111;
	  2'b10: mem_data = {CTRL_data_i[23:0],MEM_op2_i[7:0]};//dmem_bwsel_o =  4'b0111;
	  2'b01: mem_data = {CTRL_data_i[15:0],MEM_op2_i[15:0]};//dmem_bwsel_o = 4'b0011;
	  2'b00: mem_data = {CTRL_data_i[7:0],MEM_op2_i[23:0]};//dmem_bwsel_o = 4'b0001;  
	endcase
      end
      default      : mem_data = 32'bx;
    endcase
  end
  
  always @(posedge clk_i or posedge rst_i)
  begin
    if (rst_i == 1)
    begin
      BP_reg_waddr_o <= #Tp `REG_ADDR_WIDTH'bx;
      BP_reg_we_o    <= #Tp 0;
      BP_reg_data_o  <= #Tp 32'bx;
      BP_depra_o     <= #Tp 0;
      BP_deprb_o     <= #Tp 0;
    end
    else begin
      BP_reg_waddr_o <= #Tp MEM_reg_waddr_i;
      BP_reg_we_o    <= #Tp MEM_reg_we_i;
      BP_reg_data_o  <= #Tp MEM_op_mem_i? mem_data:MEM_reg_data_i;
      BP_depra_o     <= #Tp dep_ra;
      BP_deprb_o     <= #Tp dep_rb;
    end 
  end 


endmodule
