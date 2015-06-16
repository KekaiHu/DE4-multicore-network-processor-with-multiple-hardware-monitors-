/////////////////////////////////////////////////////////////////////
////  Author: Zhangfeifei                                        ////
////                                                             ////
////  Advanced Test Technology Laboratory,                        ////
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
//// Description: system coprosser 0 of ucore processor          ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

module syscop
  (
   clk_i,rst_i,
   
   // Datas from the pipeline
   MEM_addr_i,MEM_inst_i,MEM_exc_type_i,MEM_it_ok_i,MEM_mem_we_i,MEM_ds_i,
   
   // Hardware interruption
   nmi_i,it_hw_i,
   // Interruption controls
   interrupt_o,interrupt_confirm_o,interrupt_vect_o,
   
   // Writing request to register bank
   BP_reg_wdata_o,BP_reg_waddr_o,BP_reg_we_o,
   // Reading request to register bank
   BP_reg_raddr_o,BP_reg_re_o,BP_reg_rdata_i,
   
   //detect the writing signal to regfile to maintain a right itmask
   MEM_reg_waddr_i,MEM_reg_we_i,MEM_reg_wdata_i
   );
  parameter Tp = `TP__;
  
  //cop0 operation definiiton
  parameter COP0_FUNC_ERET  = 26'b1000_0000_0000_0000_0000_011000;
  parameter COP0_FUNC_DERET = 26'b1000_0000_0000_0000_0000_011111;
  parameter COP0_FUNC_WAIT  = 26'b1xxx_xxxx_xxxx_xxxx_xxxx_100000;
  
  parameter COP0_ERET  = 6'b011000;
  parameter COP0_DERET = 6'b011111;
  parameter COP0_WAIT  = 6'b100000;
  
  //copro register address definitons
  parameter ADDR_COMMAND  = 0;   
  parameter ADDR_STATUS   = 12;  
  parameter ADDR_CAUSE    = 13;
  parameter ADDR_ADDRESS  = 14;  
  parameter ADDR_VECTIT   = 15;
  parameter ADDR_INST     = 16;
  parameter ADDR_MASK     = 17;
  parameter ADDR_MASK_SAVED = 18;
  
  //state definition
  parameter STA_IDDLE          = 7'b0000001;
  parameter STA_WRITE_CAUSE    = 7'b0000010;
  parameter STA_SET_MASK       = 7'b0000100;
  parameter STA_WRITE_INST     = 7'b0001000;
  parameter STA_WRITE_ADDRESS  = 7'b0010000;
  parameter STA_SEND_INTERRUPT = 7'b0100000;
  parameter STA_READ_RETADDR   = 7'b1000000;
  
  input         clk_i;
  input         rst_i;
  
  // Datas from the pipeline
  input [31:0]  MEM_addr_i;
  input [31:0]  MEM_inst_i;
  input [`EXC_TYPE_WIDTH-1:0] MEM_exc_type_i;
  input         MEM_it_ok_i;
  input         MEM_mem_we_i;
  input         MEM_ds_i;
  
  // Hardware interruption
  input nmi_i;
  input [`HW_IT_NUM-1:0] it_hw_i;           // Hardware interruption detected
  
  // Interruption controls
  output        interrupt_o;       // Interruption deteceted
  output        interrupt_confirm_o; // Interruption vector send
  output [31:0] interrupt_vect_o;  // Interruption vector
  reg           interrupt_confirm_o;
  reg    [31:0] interrupt_vect_o;
    
  // Writing request to register bank
  output [31:0] BP_reg_wdata_o;       // Data to write
  output [`REG_ADDR_WIDTH-1-1:0]  BP_reg_waddr_o; // Address of the register to write
  output        BP_reg_we_o;          // Writing request
  reg    [31:0] BP_reg_wdata_o;
  reg    [`REG_ADDR_WIDTH-1-1:0]  BP_reg_waddr_o;
  reg           BP_reg_we_o;
  
  // Reading request to register bank
  output [`REG_ADDR_WIDTH-1-1:0]  BP_reg_raddr_o;        // Address of the first register
  reg    [`REG_ADDR_WIDTH-1-1:0]  BP_reg_raddr_o;     
  output        BP_reg_re_o;
  reg           BP_reg_re_o;
  input  [31:0] BP_reg_rdata_i;      // Value of register 1
 
  input  [`REG_ADDR_WIDTH-1:0]  MEM_reg_waddr_i;
  input         MEM_reg_we_i;
  input  [31:0] MEM_reg_wdata_i;
 
  wire [31:0] ALL1;
  assign ALL1 = 32'hffffffff;
  
  wire write_to_mask;
  assign write_to_mask = MEM_reg_we_i & MEM_reg_waddr_i[`REG_ADDR_WIDTH-1:0] == ADDR_MASK +32;
  
  reg [31:0] it_mask;
  reg [6:0] nex_sta;
  
  reg exception;
  reg interruption;
  reg eret,eret_reged;
  reg [31:0] exc_cause,exc_cause_reged;
 
  reg nmi_reged;
  reg [`HW_IT_NUM-1:0] it_hw_reged;
  reg interruption_reged;
  reg interrupt_o_reged;
  reg read_start;
  
  assign interrupt_o = interrupt_o_reged | exception | interruption;
    
  always @(MEM_exc_type_i,MEM_inst_i,MEM_it_ok_i,it_hw_reged,nmi_reged,MEM_ds_i)
  begin
    exception         =  0;
    interruption      =  0;
    eret              =  0;
    exc_cause         =  32'b0;
    case(MEM_exc_type_i)//synthesis full_case //synthesis parallel_case
      `tEXC_OVERFLOW,
      `tEXC_ILLEGAL_INST,
      `tEXC_SYSCALL,
      `tEXC_BREAK,
      `tEXC_COP0:
      begin
	exception                      =  1;
	exc_cause[31]                  = MEM_ds_i;
	exc_cause[30:`EXC_TYPE_WIDTH]  = 0;
	exc_cause[`EXC_TYPE_WIDTH-1:0] = MEM_exc_type_i;
	
	//when exc is of cop0 type,it must be a legal instrction,
	//so we do not need to check if it's a legal one
	if(MEM_exc_type_i == `tEXC_COP0) 
	begin
	  case(MEM_inst_i[5:0])// synthesis parallel_case
	    COP0_ERET : eret =  1;
	    COP0_DERET: eret =  1;
	    COP0_WAIT : eret =  0;
	    default   : eret =  0;
	  endcase
	end
      end
      `tEXC_NONE:
      if((nmi_reged ||(|it_hw_reged)) &MEM_it_ok_i)
      begin
	exc_cause[31]                  = MEM_ds_i;
	exc_cause[30:`HW_IT_NUM+`EXC_TYPE_WIDTH+1] = 0;
	exc_cause[`EXC_TYPE_WIDTH-1:0] = 0;
	interruption                   =  1;
	exc_cause[`HW_IT_NUM+`EXC_TYPE_WIDTH:`EXC_TYPE_WIDTH] = 
	  nmi_reged      ? 5'b10000:
	  it_hw_reged[3] ? 5'b01000:
	  it_hw_reged[2] ? 5'b00100:
	  it_hw_reged[1] ? 5'b00010:
	  it_hw_reged[0] ? 5'b00001:5'bxxxxx;
      end
    endcase
  end
  
  always @(posedge clk_i or posedge rst_i)
  begin
    if(rst_i)
    begin
      read_start         <= #Tp 1'bx;
      BP_reg_we_o        <= #Tp 0;
      BP_reg_wdata_o     <= #Tp 32'bx;
      BP_reg_waddr_o     <= #Tp 5'bx;
      BP_reg_raddr_o     <= #Tp 5'bx;
      BP_reg_re_o        <= #Tp 0;
      interrupt_confirm_o <= #Tp 0;
      interrupt_o_reged  <= #Tp 0;
      interrupt_vect_o   <= #Tp 32'bx;
      it_mask            <= #Tp 0;
      it_hw_reged        <= #Tp 0;
      nmi_reged          <= #Tp 0;
      eret_reged         <= #Tp 0;
      exc_cause_reged    <= #Tp 32'bx;
      interruption_reged <= #Tp 0;
      nex_sta            <= #Tp STA_IDDLE;
    end
    else begin : SYSCOP_STATEMACHINE
      reg [`HW_IT_NUM-1:0] it_mask_tmp;
      if(write_to_mask & ~interruption) 
	begin
	  it_mask[`HW_IT_NUM-1:0] <= #Tp MEM_reg_wdata_i[`HW_IT_NUM-1:0];
	  it_mask_tmp = MEM_reg_wdata_i[`HW_IT_NUM-1:0];
	end
	else 
	  it_mask_tmp = it_mask[`HW_IT_NUM-1:0];
 
      if(~nmi_reged) nmi_reged <= nmi_i;
      //here HW_IT_NUM == 4
      if(~it_hw_reged[0])	it_hw_reged[0] <= it_hw_i[0]& ~it_mask_tmp[0] ;
      if(~it_hw_reged[1])	it_hw_reged[1] <= it_hw_i[1]& ~it_mask_tmp[1] ;
      if(~it_hw_reged[2])	it_hw_reged[2] <= it_hw_i[2]& ~it_mask_tmp[2] ;
      if(~it_hw_reged[3])	it_hw_reged[3] <= it_hw_i[3]& ~it_mask_tmp[3] ;
      
      case(nex_sta)//synthesis parallel_case
	STA_IDDLE:
	begin
	  read_start         <= #Tp 1'b0;
	  interrupt_o_reged  <= #Tp 0;
	  interrupt_confirm_o <= #Tp 0;
	  interrupt_vect_o   <= #Tp 32'bx;
	  BP_reg_we_o        <= #Tp 0;
	  BP_reg_wdata_o     <= #Tp 32'bx;
	  BP_reg_waddr_o     <= #Tp 5'bx;
	  BP_reg_raddr_o     <= #Tp 5'bx;
	  BP_reg_re_o        <= #Tp 0;
	  
	  interruption_reged <= #Tp interruption;
	  	  
	  if(exception || interruption)
	  begin
	    interrupt_o_reged <= #Tp 1;
	    exc_cause_reged  <= #Tp exc_cause;
	    //interrupt_vect_o <= #Tp 32'b0;
	
	    if(~eret)
	    begin
	      eret_reged     <= #Tp 0;
	      // save mask  the  to regbank
	      BP_reg_wdata_o <= #Tp it_mask;
	      BP_reg_waddr_o <= #Tp ADDR_MASK_SAVED;
	      BP_reg_we_o    <= #Tp 1;
	
	      //disable interrupt
	      it_mask[`HW_IT_NUM-1:0] <= #Tp ALL1[`HW_IT_NUM-1:0];
		
	      nex_sta        <= #Tp STA_WRITE_CAUSE;
	    end
	    else begin
	      eret_reged     <= #Tp 1;
	
	      read_start     <= #Tp 1'b1;
	      BP_reg_re_o    <= #Tp 1;
	      BP_reg_raddr_o <= #Tp ADDR_MASK_SAVED;
	      nex_sta        <= #Tp STA_SET_MASK; 
	    end
	  end
	  else nex_sta       <= #Tp STA_IDDLE;
	end
	STA_WRITE_CAUSE:
	begin
	  BP_reg_wdata_o     <= #Tp exc_cause_reged;
	  BP_reg_waddr_o     <= #Tp ADDR_CAUSE;
	  BP_reg_we_o        <= #Tp 1;
	      
	  if(interruption_reged)
	    nex_sta          <= #Tp STA_WRITE_ADDRESS;
	  else nex_sta       <= #Tp STA_WRITE_INST;
	end
	STA_WRITE_INST:
	begin
	  BP_reg_wdata_o      <= #Tp MEM_inst_i;
	  BP_reg_waddr_o      <= #Tp ADDR_INST;
	  BP_reg_we_o         <= #Tp 1;
	  nex_sta             <= #Tp STA_WRITE_ADDRESS;
	end
	STA_WRITE_ADDRESS:
	begin
	  //note:
	  // 1: only INST_INVALID  and hw interruption can occur in delay slot,
	  // in this case ,the return address points to the brach instruction of 
	  // this delay slot,when the programmer deals the invalid instruction 
	  //exception ,he should notice this
	  // 2: in other case, when it's a exception or the interrupted instruction is 
	  // a mem write and has been done by the mem ,the return address points to the 
	  // instrction follow it
	  // 3: by defalut ,i.e it's a interruption and the interrupted instruction is not
	  // a finished mem write,the return address points to the interruptted instruction
	  if(MEM_ds_i) 
	    BP_reg_wdata_o    <= #Tp MEM_addr_i + (~4+1);//MEM_addr_i-4;
	  else if(~interruption_reged | MEM_mem_we_i)
	    BP_reg_wdata_o    <= #Tp MEM_addr_i+4;
	  else 
	    BP_reg_wdata_o    <= #Tp MEM_addr_i;
	  
	  BP_reg_waddr_o      <= #Tp ADDR_ADDRESS;
	  BP_reg_we_o         <= #Tp 1;
	  nex_sta             <= #Tp STA_SET_MASK;
	end
	STA_SET_MASK:
	begin
	  if(~eret_reged)
	  begin
	    BP_reg_waddr_o   <= #Tp ADDR_MASK;
	    BP_reg_we_o      <= #Tp 1;
	    BP_reg_wdata_o   <= #Tp it_mask;//here it_mask == all1
	    nex_sta          <= #Tp STA_SEND_INTERRUPT;	
	  end
	  else begin
	    if(read_start)
	    begin
	      BP_reg_re_o    <= 1;
	      BP_reg_raddr_o <= #Tp ADDR_ADDRESS;
	      nex_sta        <= STA_SET_MASK;
	      read_start     <= 1'b0;
	    end
	    else begin
	      BP_reg_waddr_o <= #Tp ADDR_MASK;
	      BP_reg_we_o    <= #Tp 1;
	      BP_reg_wdata_o <= #Tp BP_reg_rdata_i;
	      it_mask        <= #Tp BP_reg_rdata_i;
	    
	      BP_reg_re_o    <= 1;
	      BP_reg_raddr_o <= #Tp ADDR_ADDRESS;
	      nex_sta        <= #Tp STA_READ_RETADDR;
	    end
	  end
	end
	STA_SEND_INTERRUPT:
	begin
	  BP_reg_we_o         <= #Tp 0;
	  interrupt_confirm_o <= #Tp 1;
	  interrupt_vect_o    <= #Tp `EXC_ENTRANCE;
	  if(interruption_reged)
	    {nmi_reged,it_hw_reged} <=  #Tp {nmi_reged,it_hw_reged} & ~exc_cause_reged[`HW_IT_NUM+`EXC_TYPE_WIDTH:`EXC_TYPE_WIDTH];
	  nex_sta             <= #Tp STA_IDDLE;
	end
	STA_READ_RETADDR:
	begin
	  BP_reg_we_o       <= #Tp 0;
	  BP_reg_re_o       <= #Tp 0;
	  interrupt_confirm_o <= #Tp 1;
	  interrupt_vect_o  <= #Tp BP_reg_rdata_i;
	  nex_sta           <= #Tp STA_IDDLE;
	end
	default:
	begin
	  nex_sta            <= #Tp STA_IDDLE;
	  read_start         <= #Tp 1'bx;
	  BP_reg_we_o        <= #Tp 0;
	  BP_reg_wdata_o     <= #Tp 32'bx;
	  BP_reg_waddr_o     <= #Tp 5'bx;
	  BP_reg_raddr_o     <= #Tp 5'bx;
	  BP_reg_re_o        <= #Tp 0;
	  interrupt_confirm_o <= #Tp 0;
	  interrupt_o_reged  <= #Tp 0;
	  interrupt_vect_o   <= #Tp 32'bx;
	  interruption_reged <= #Tp 0;
	  it_mask            <= #Tp 0;
	  it_hw_reged        <= #Tp 0;
	  eret_reged         <= #Tp 0;
	  nmi_reged          <= #Tp 0;
	  exc_cause_reged    <= #Tp 32'bx;
	end
      endcase
    end
  end
  
endmodule
