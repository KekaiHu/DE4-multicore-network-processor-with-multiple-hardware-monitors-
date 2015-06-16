
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
//// Description: bypass unit of ucore processor                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

module bypass
  ( 
   clk_i,rst_i,
   
   //Register access signals
   ID_reg_raddra_i,ID_usea_i,ID_reg_raddrb_i,ID_useb_i,  
 
   //synchonrous input from the pipeline stage
   RF_depra_i,RF_deprb_i,
   EX_depra_i,EX_deprb_i,EX_reg_data_i,EX_reg_rdy_i,
   MEM_depra_i,MEM_deprb_i,MEM_reg_data_i,MEM_reg_rdy_i,
   WB_depra_i,WB_deprb_i,
   //regfile write singals
   WB_reg_we_i,WB_reg_waddr_i,WB_reg_data_i,
 
   //asynchonrous output to the pipelne stage
   BP_reg_raddra_o,BP_reg_raddrb_o,BP_use_rega_o,BP_use_regb_o,
      
   //connetcion to sys cop0
   COP0_reg_waddr_i,COP0_reg_wdata_i,COP0_reg_we_i,
   COP0_reg_raddr_i,COP0_reg_rdata_o,COP0_reg_re_i,
   
   //Writing commands for writing in the registers
   doutc,portc,enc,
   //Reading commands for Reading in the registers
   ena,porta,dina,
   enb,portb,dinb,
 
   //data and unresolve singnal to pipeline
   RF_dataa_o,RF_datab_o,
   alea_o
   );
 
  input         clk_i;
  input         rst_i;
  
  // Register access signals
  input [`REG_ADDR_WIDTH-1:0] ID_reg_raddra_i;    // Operand a address
  input         ID_usea_i;                        // Operand a utilisation
  input [`REG_ADDR_WIDTH-1:0] ID_reg_raddrb_i;   // Operand b address
  input         ID_useb_i;                       // Operand b utilisation
 
  // Bypass signals of the intermediary datas
  input RF_depra_i;
  input RF_deprb_i;
   
  input EX_depra_i;
  input EX_deprb_i;
  input EX_reg_rdy_i;
  input [31:0]  EX_reg_data_i;
 
  input MEM_depra_i;
  input MEM_deprb_i;
  input MEM_reg_rdy_i;
  input [31:0] MEM_reg_data_i;
 
  input WB_depra_i;
  input WB_deprb_i;
  input [`REG_ADDR_WIDTH-1:0] WB_reg_waddr_i; // Register destination of the result
  input         WB_reg_we_i;    // Writing register request
  input [31:0]  WB_reg_data_i;       // Data to used
 
  //asynchronous output to the pipeline stages
  output [`REG_ADDR_WIDTH-1:0] BP_reg_raddra_o;  // Addr of the first register operand
  output [`REG_ADDR_WIDTH-1:0] BP_reg_raddrb_o;  // Addr of the second register operand
  output BP_use_rega_o;               // Effective use of operand 1
  output BP_use_regb_o;               // Effective use of operand 2
 
  //////////////////////////////////////////////////////////////////////////////////////
  input [`REG_ADDR_WIDTH-1-1:0] COP0_reg_waddr_i;
  input [31:0] COP0_reg_wdata_i;
  input COP0_reg_we_i;
  
  input [`REG_ADDR_WIDTH-1-1:0] COP0_reg_raddr_i;
  output [31:0] COP0_reg_rdata_o;
  input COP0_reg_re_i;
 
  // Writing commands for writing in the registers
  output [31:0] doutc;    // Data to write
  output [`REG_ADDR_WIDTH-1:0]  portc;      // Address of the register to write
  output        enc; // Selection in the internal registers
  
  // Reading commands for Reading in the registers
  output        ena;
  output [`REG_ADDR_WIDTH-1:0]  porta;      // Address of the first register to read
  input  [31:0] dina; // Value of operand 1 from the internal registers
 
  output        enb;
  output [`REG_ADDR_WIDTH-1:0]   portb; // Value of operand 2 from the internal registers
  input [31:0] dinb;      // Address of the second register to read

  output [31:0] RF_dataa_o;
  output [31:0] RF_datab_o; 
  output        alea_o;  // Unresolved hazards detected
 
  
  assign BP_reg_raddra_o = ID_reg_raddra_i;
  assign BP_use_rega_o   = ID_usea_i;
  assign BP_reg_raddrb_o = ID_reg_raddrb_i;
  assign BP_use_regb_o   = ID_useb_i;
  
  // Connexion of the writing command signals
  assign enc   = COP0_reg_we_i? 1:WB_reg_we_i;
  assign doutc = COP0_reg_we_i? COP0_reg_wdata_i:WB_reg_data_i;
  assign portc = COP0_reg_we_i? {1'b1,COP0_reg_waddr_i}:WB_reg_waddr_i;
  
  // Connexion of the reading command signals
  assign ena   = ID_usea_i ;
  assign porta = ID_reg_raddra_i;     
  assign enb   = COP0_reg_re_i? 1 : ID_useb_i ;
  assign portb = COP0_reg_re_i? {1'b1,COP0_reg_raddr_i} : ID_reg_raddrb_i;     
 
  assign COP0_reg_rdata_o = dinb;
 
  assign RF_dataa_o  =  //RF_depra_i ? RF_reg_data_i: //there is no data produced by rf
                       EX_depra_i  ? EX_reg_data_i  : 
                       MEM_depra_i ? MEM_reg_data_i :
                       WB_depra_i  ? WB_reg_data_i  : dina;//32'bx;//don't care
 
  assign RF_datab_o  =  //RF_deprb_i ? RF_reg_data_i: //there is no data produced by rf
                       EX_deprb_i  ? EX_reg_data_i  : 
                       MEM_deprb_i ? MEM_reg_data_i :
                       WB_deprb_i  ? WB_reg_data_i  : dinb;//32'bx;//don't care
 
  wire unres_rf,unres_ex,unres_mem,unres_wb;
  wire rf_ready,ex_ready,mem_ready,wb_ready;
  
  assign rf_ready  = 0;
  assign ex_ready  = EX_reg_rdy_i ;
  assign mem_ready = MEM_reg_rdy_i;
  assign wb_ready  = 1;
  
  //assign unres_rf  = (RF_depra_i  | RF_deprb_i ) & !rf_ready;
  assign unres_rf  = (RF_depra_i  | RF_deprb_i ) ;
  assign unres_ex  = (EX_depra_i  | EX_deprb_i ) & !ex_ready;
  assign unres_mem = (MEM_depra_i | MEM_deprb_i) & !mem_ready;
  //assign unres_wb  = (WB_depra_i  | WB_deprb_i ) & !wb_ready;
  assign unres_wb  = 0;
  
  //assign alea_o      = unres_rf | unres_ex | unres_mem | unres_wb;
  assign alea_o      = unres_rf | unres_ex | unres_mem ;

endmodule
