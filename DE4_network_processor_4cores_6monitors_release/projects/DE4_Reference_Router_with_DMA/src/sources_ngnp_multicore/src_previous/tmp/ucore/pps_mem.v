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
//// Description: pipeline stage MEM of ucore processor           ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

module pps_mem 
  (
   //global signals 
   clk_i,rst_i,dmem_rdy_i,
   
   // Datas from EX stage
   EX_inst_i,EX_addr_i,
   EX_reg_waddr_i,EX_reg_data_i,EX_reg_we_i,EX_level_i,
   EX_mem_req_i,EX_mem_we_i,EX_mem_optype_i,EX_mem_data_i,EX_mem_addr_i,EX_mem_bwsel_i,EX_mem_baddr_i,EX_op2_i,
   EX_exc_type_i,EX_it_ok_i,EX_ds_i,
 
   //singnals from cop0
   COP0_interrupt_i,
   //singnals to cop0
   COP0_addr_o,COP0_inst_o,COP0_exc_type_o,COP0_it_ok_o,COP0_mem_we_o,COP0_ds_o,

   //signals to mem_ctrl   
   CTRL_mem_req_o,CTRL_mem_we_o,CTRL_mem_data_o,CTRL_mem_addr_o,CTRL_mem_bwsel_o,
    
   //signals to WB stage
   WB_op_mem_o,WB_mem_optype_o,WB_mem_baddr_o,WB_op2_o,
   WB_reg_waddr_o,WB_reg_we_o,WB_reg_data_o,WB_level_o,

   BP_depra_o,BP_deprb_o,BP_reg_rdy_o,
   // Asynchronous connexion with the register management and data bypass unit
   BP_reg_raddra_i,BP_reg_raddrb_i,BP_use_rega_i,BP_use_regb_i
   );
 
  parameter Tp = `TP__;
  
  input         clk_i;
  input         rst_i;
  input         dmem_rdy_i;             // Unconditionnal locking of the outputs
  
  // Datas from Execution stage
  input [31:0]  EX_inst_i;
  input [31:0]  EX_addr_i;            // Instruction and it's address
  
  input [`REG_ADDR_WIDTH-1:0] EX_reg_waddr_i;// Destination register address for the result
  input [31:0]  EX_reg_data_i;        // Result of alu operation
  input         EX_reg_we_i;          // Effective writing of the result
  input [`LEVEL_TYPE_WIDTH-1:0] EX_level_i; // Availability stage for the result for bypassing
  
  //memory operation value
  input         EX_mem_req_i;
  input         EX_mem_we_i;
  input [6:0]   EX_mem_optype_i;
  input [31:0]  EX_mem_data_i;
  input [31:0]  EX_mem_addr_i; 
  input [3:0]   EX_mem_bwsel_i;
  input [1:0]   EX_mem_baddr_i;
  input [31:0]  EX_op2_i;
  
  input [`EXC_TYPE_WIDTH-1:0]   EX_exc_type_i;        // Potential exception cause
  input         EX_it_ok_i;           // Allow hardware interruptions
  input         EX_ds_i;
  
  input         COP0_interrupt_i;
 
  output reg  [31:0] COP0_addr_o;
  output reg  [31:0] COP0_inst_o;      // Instruction and it's address
  output reg  [`EXC_TYPE_WIDTH-1:0]  COP0_exc_type_o;  // Potential exception cause
  output reg         COP0_it_ok_o;      // Allow hardware interruptions
  output reg         COP0_mem_we_o;    //write operation to mem
  output reg         COP0_ds_o;       //this intruction is a delay slot
  
  //connection to mem ctrl
  output        CTRL_mem_req_o;
  output        CTRL_mem_we_o;
  output [31:0] CTRL_mem_data_o;
  output [31:0] CTRL_mem_addr_o;
  output [3:0]  CTRL_mem_bwsel_o;
 
  output reg         WB_op_mem_o;
  output reg  [6:0]  WB_mem_optype_o;
  output reg  [1:0]  WB_mem_baddr_o;
  output reg  [31:0] WB_op2_o;
  output reg  [`REG_ADDR_WIDTH-1:0] WB_reg_waddr_o; // Destination register address
  output reg         WB_reg_we_o;    // Writing of the destination register
  output reg  [31:0] WB_reg_data_o;  // Data to write (from alu or memory)
  output reg  [`LEVEL_TYPE_WIDTH-1:0] WB_level_o;     // Availability stage for the result for bypassing
 
  output reg BP_depra_o;
  output reg BP_deprb_o;
  output reg BP_reg_rdy_o;
  // Asynchronous connexion with the register management and data bypass unit
  input [`REG_ADDR_WIDTH-1:0] BP_reg_raddra_i;        // Adress of the first register operand
  input [`REG_ADDR_WIDTH-1:0] BP_reg_raddrb_i;        // Address of the second register operand
  input BP_use_rega_i;               // Effective use of operand 1
  input BP_use_regb_i;               // Effective use of operand 2
 
  wire nodep_ra,dep_ra;
  wire nodep_rb,dep_rb;
  assign nodep_ra = BP_reg_raddra_i[5:0] == 6'b0 || BP_use_rega_i ==0;
  assign dep_ra   = ~nodep_ra && BP_reg_raddra_i == EX_reg_waddr_i  && EX_reg_we_i  ==1 ;
  assign nodep_rb = BP_reg_raddrb_i[5:0] == 6'b0 || BP_use_regb_i ==0;
  assign dep_rb   = ~nodep_rb && BP_reg_raddrb_i == EX_reg_waddr_i  && EX_reg_we_i  ==1 ;
  wire   data_rdy;
  assign data_rdy = EX_level_i >= `LVL_MEM_;
 
  reg [2:0] interrupt_reged;
  always @(posedge clk_i)
  begin
    interrupt_reged <= #Tp {interrupt_reged[1:0],COP0_interrupt_i};
  end
  //wire  exception;
  //assign exception = COP0_exc_type_o != `tEXC_NONE;
  wire   clear_mem;
  assign clear_mem = /*exception |*/ COP0_interrupt_i | 
                         interrupt_reged[2] | interrupt_reged[1] |interrupt_reged[0];
  reg        mem_req_reged;
  reg        mem_we_reged;
  reg [31:0] mem_data_reged;
  reg [31:0] mem_addr_reged;
  reg [3:0]  mem_bwsel_reged;
 
  always @(posedge clk_i or posedge rst_i)
  begin
    if(rst_i)
    begin
      mem_req_reged   <= 1'b0;
      mem_we_reged    <= 1'bx;
      mem_data_reged  <= 32'bx;
      mem_addr_reged  <= 32'bx;
      mem_bwsel_reged <= 4'bx;
    end
    else begin
      mem_req_reged   <= CTRL_mem_req_o;
      mem_we_reged    <= CTRL_mem_we_o;
      mem_data_reged  <= CTRL_mem_data_o;
      mem_addr_reged  <= CTRL_mem_addr_o;
      mem_bwsel_reged <= CTRL_mem_bwsel_o;
    end
  end
  
  //when interrupt occured ,clear the  mem req
  assign CTRL_mem_req_o    = dmem_rdy_i ? ~clear_mem & EX_mem_req_i : mem_req_reged;
  assign CTRL_mem_we_o     = dmem_rdy_i ? EX_mem_we_i    : mem_we_reged;
  assign CTRL_mem_data_o   = dmem_rdy_i ? EX_mem_data_i  : mem_data_reged;
  assign CTRL_mem_addr_o   = dmem_rdy_i ? EX_mem_addr_i  : mem_addr_reged;
  assign CTRL_mem_bwsel_o  = dmem_rdy_i ? EX_mem_bwsel_i : mem_bwsel_reged;
 
  wire [`EXC_TYPE_WIDTH-1:0] exc_type;
  assign exc_type =(EX_exc_type_i==`tEXC_ILLEGAL_INST)|~EX_ds_i? EX_exc_type_i : `tEXC_NONE;
 
  // Set the synchronous outputs
  always @(posedge clk_i or posedge rst_i)
  begin
    if (rst_i == 1)
    begin
      COP0_addr_o     <= #Tp 32'bx;
      COP0_inst_o     <= #Tp 32'bx;
      COP0_exc_type_o <= #Tp `tEXC_NONE;
      COP0_it_ok_o    <= #Tp 0;
      COP0_mem_we_o   <= #Tp 1'b0;
      COP0_ds_o       <= #Tp 0;
             
      WB_op_mem_o     <= #Tp 0;
      WB_mem_optype_o <= #Tp `tMEM_OP_NULL;
      WB_mem_baddr_o  <= #Tp 2'bx;
      WB_op2_o        <= #Tp 32'bx;
      WB_reg_waddr_o  <= #Tp `REG_ADDR_WIDTH'bx;
      WB_reg_we_o     <= #Tp 0;
      WB_reg_data_o   <= #Tp 32'bx;
      WB_level_o      <= #Tp `LVL_RF_;
      
      BP_depra_o     <= #Tp 0;
      BP_deprb_o     <= #Tp 0;
      BP_reg_rdy_o   <= #Tp 1;
    end
    else if(dmem_rdy_i)
    begin
      if(clear_mem)
      begin
	COP0_exc_type_o <= #Tp `tEXC_NONE;
	COP0_it_ok_o    <= #Tp 1'b0;
	
	//COP0_ds_o       <= #Tp 0;
	
	WB_op_mem_o     <= #Tp 0;
	WB_mem_optype_o <= #Tp `tMEM_OP_NULL;
	WB_mem_baddr_o  <= #Tp 2'bx;
	WB_op2_o        <= #Tp 32'bx;
	
	WB_reg_waddr_o <= #Tp `REG_ADDR_WIDTH'bx;
	WB_reg_we_o    <= #Tp 0;
	WB_reg_data_o  <= #Tp 32'bx;
	WB_level_o     <= #Tp `LVL_RF_;
	BP_depra_o    <= #Tp 0;
	BP_deprb_o    <= #Tp 0;
	BP_reg_rdy_o  <= #Tp 1;
      end
      else begin
	// Normal evolution 
	COP0_addr_o     <= #Tp EX_addr_i;
	COP0_inst_o     <= #Tp EX_inst_i;
	COP0_exc_type_o <= #Tp exc_type;
	
	//when a instruction is a mem write and is in the delay slot
	//it can not be interrupted
	COP0_it_ok_o    <= #Tp EX_ds_i&EX_mem_req_i&EX_mem_we_i ? 0: EX_it_ok_i;
	COP0_mem_we_o   <= #Tp EX_mem_req_i & EX_mem_we_i;
	COP0_ds_o       <= #Tp EX_ds_i;
	
	WB_op_mem_o     <= #Tp EX_mem_req_i;
	WB_mem_optype_o <= #Tp EX_mem_optype_i;
	WB_mem_baddr_o  <= #Tp EX_mem_baddr_i;
	WB_op2_o        <= #Tp EX_op2_i;
	WB_reg_waddr_o  <= #Tp EX_reg_waddr_i;
	WB_reg_we_o     <= #Tp EX_reg_we_i;
	WB_reg_data_o   <= #Tp EX_reg_data_i;
	WB_level_o      <= #Tp EX_level_i;
	
	BP_depra_o     <= #Tp dep_ra;
	BP_deprb_o     <= #Tp dep_rb;
	BP_reg_rdy_o   <= #Tp data_rdy;
      end
    end 
  end 
    
endmodule
