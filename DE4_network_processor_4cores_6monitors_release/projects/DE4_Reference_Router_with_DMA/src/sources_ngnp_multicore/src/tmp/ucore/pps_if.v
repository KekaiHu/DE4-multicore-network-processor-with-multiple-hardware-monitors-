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
//// Description: pipeline stage IF of ucore processor           ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////


`include "ucore_defines.v"

module pps_if 
  (
   clk_i,rst_i,
   alea_i,
   EX_rdy_i,dmem_rdy_i,imem_rdy_i,
   
   //branch and exception signals
   bra_i,bra_addr_i,
   exc_i,exc_confirm_i,exc_addr_i,
   
   // Bus controler interface
   CTRL_addr_o,CTRL_req_o,
 
   // Synchronous outputs to ID stage
   ID_addr_o,ID_it_ok_o,// Allow hardware interruptions
   ID_bra_target_o // this instruction is the target of a brach 
   );

  parameter Tp = `TP__;
 
  parameter STA_IDDLE = 0;
  
  input clk_i;
  input rst_i;
  input EX_rdy_i;
  input imem_rdy_i;
  input dmem_rdy_i;
  input alea_i;               // Unresolved detected : send nop in the pipeline 
    
  input bra_i;            // Branch occoured
  input [31:0] bra_addr_i;// Address of the branch
  input exc_i; 	        // Exception occured
  input exc_confirm_i;    //Exception vector send
  input [31:0] exc_addr_i;// Exception vector
 
  // Bus controler interface
  output [31:0] CTRL_addr_o; // Address to read in memory
  output CTRL_req_o;
  
  // Synchronous outputs to ID stage
  output reg [31:0] ID_addr_o; // Address from the read instruction
  output reg ID_it_ok_o;    // Allow hardware interruptions
  output reg ID_bra_target_o;
  
  wire [31:0] pc_inter;  // Value of the pc output, needed for an internal reading
  wire lock;       	    // Specify the authorization of the pc evolution
 
  reg bra_reged;
  reg [31:0] bra_addr_reged;
  
  always @(posedge clk_i or posedge rst_i)
  begin
    if(rst_i)
    begin
      bra_reged      <= 0 ;
      bra_addr_reged <= 32'bx;
    end
    else if(lock & ~bra_reged)//if the pipeline is locked this cycle,register the bra
    begin
      bra_reged      <= bra_i;
      bra_addr_reged <= bra_addr_i;
    end
    else if(~lock) begin
      bra_reged      <= 0 ;
      bra_addr_reged <= 32'bx;
    end
  end
    
  assign  pc_inter =  exc_confirm_i ? exc_addr_i :
                        lock          ? ID_addr_o  :
                        bra_i         ? bra_addr_i :
                        bra_reged     ? bra_addr_reged : ID_addr_o +4;
 
  wire ready;
  assign  ready = EX_rdy_i & dmem_rdy_i & imem_rdy_i;
  
  assign  lock     =    exc_confirm_i     ? 1'b0 :
                        ~ready|exc_i      ? 1'b1 :
                        bra_i | bra_reged ? 1'b0 :
                        alea_i            ? 1'b1 : 1'b0; 
 
   // Connexion of the PC to the memory address bus
  assign CTRL_addr_o = lock ? ID_addr_o : pc_inter;
 
  assign CTRL_req_o  = ~exc_i|exc_confirm_i;//imem_rdy_i &is_ds&~bra_i ? 0 :1;
 
  reg first_cycle;
  
  // Set the results
  always @(posedge clk_i or posedge rst_i)
  begin
    if(rst_i)
    begin 
      ID_addr_o       <= #Tp `ADDR_INIT_;
      first_cycle     <= #Tp 1'b1;
      ID_it_ok_o      <= #Tp 1'b0;
      ID_bra_target_o <= #Tp 1'b0;
      
    end
    else begin
      first_cycle     <= #Tp 1'b0;
      ID_it_ok_o      <= #Tp 1'b1;
      
      if (~lock & ~first_cycle)
      begin
	ID_addr_o       <= #Tp CTRL_addr_o;
	ID_bra_target_o <= #Tp bra_i | bra_reged;
      end
      //else ID_it_ok_o <= #Tp 1'b0; 
    end
  end
  
endmodule
