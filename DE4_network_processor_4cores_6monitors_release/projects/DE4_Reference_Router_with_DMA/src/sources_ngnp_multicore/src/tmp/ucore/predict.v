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
//// Description: branch prediction module of ucore processor    ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"
//`define DEBUG

module predict
  (
   input clk_i,
   input rst_i,

   // Datas from PF pipeline stage
   input [31:0] EI_adr,       // PC of the current instruction extracted
   // Datas from DI pipeline stage
   input DI_bra,             // Branch detected
   input DI_jmp,
   input [31:0] DI_jmp_target,
   input [31:0] DI_adr,      // Address of the branch

   // Datas from EX pipeline stage
   input EX_bra_confirm,     // Confirm if the branch test is ok
   input EX_jr,
   input [31:0] EX_adr,      // Address of the branch
   input [31:0] EX_adresse,  // Result of the branch
   input EX_cleared,       // Define if the EX stage is cleared               
      
   // Outputs to PF pipeline stage
   output reg PR_bra_cmd,        // Defined a branch
   output reg PR_bra_bad,        // Defined a branch to restore from a bad prediction
   output reg [31:0] PR_bra_adr, // New PC
   
   // Clear the pipeline stage : EI
   output reg PR_clear_EI,
   // Clear the pipeline stage : DI
   output reg PR_clear_DI
   );
 
  parameter nb_record = 2 ;
  parameter nb_record_width = 1;//nb_record = 2^nb_record_width
  `define BRA_ADDR [31:0]
  `define CODE_ADDR [63:32]
  `define LAST_BRA [64]
  `define VALID [65]
  
  //Record contained in the table of prediction
  //the arrangement of the table are as follow
  // [31:0] : bra_addr,the target of the branch
  // [63:32] : code_addr, the address of the branch in the code
  // [64] last_bra: if it branch last time
  // [65] valid : if the record if valid
  // Table of predictions
  /*reg [65:0] pred_tab[nb_record-1:0];
 
  reg [65:0] record_add;
  reg [nb_record_width-1:0] next_out; // Next record to be erased in the table
  reg flag_add;
 
  reg [65:0] record_modify;
  reg [nb_record_width-1:0] next_modify; 
  reg flag_modify;
 

  // Update the table of prediction
  always @(posedge clk_i or posedge rst_i)
  begin:CLK_SECTION
    integer i;
    if(rst_i == 1)
    begin
      next_out <= 0;  // At the beginning the first record must be chosen to be filled
      
      for(i=0;i<nb_record;i=i+1)
        pred_tab[i] <= 66'b0;
      
    end
    else begin
      if (flag_add == 1)
      begin
	pred_tab[next_out] <= record_add;
	next_out <= next_out+1; // Next record to be erased
      end
 
      if(flag_modify ==1 && next_modify != next_out)
      begin
	pred_tab[next_modify] <= record_modify;
      end
    end 
  end
*/
  // Do the predictions
  always @(/*EI_adr, DI_bra, DI_adr, EX_adr, */EX_adresse, EX_bra_confirm)
  begin:PREDICT_SECTION1      
    //integer i;    
    //integer index_EI, index_DI , index_EX;    
    
    // Default signal affectations
    //index_EI = nb_record;
    //index_DI = nb_record;
    //index_EX = nb_record;
    
    PR_bra_cmd = 0;
    PR_bra_bad = 0;
    PR_bra_adr = 0;
    PR_clear_DI = 0;
    PR_clear_EI = 0;
     
    /*flag_add = 0;
    //record_add = 66'b0;
    
    //flag_modify = 0;
    //record_modify = 0;
    //next_modify = 66'b0;
    
    // Check a match in the table
    for (i=0;i<nb_record;i=i+1)
    if (pred_tab[i]`VALID  == 1)
    begin
      if (EI_adr == pred_tab[i]`CODE_ADDR) index_EI = i;
      if (DI_adr == pred_tab[i]`CODE_ADDR) index_DI = i;	
      if (EX_adr == pred_tab[i]`CODE_ADDR) index_EX = i;
    end 
    
    // Branch prediciton
    if (index_EI != nb_record)
    begin
      if(pred_tab[index_EI]`LAST_BRA)
      begin
	`ifdef DEBUG
	  $display($time, , ,"\n\npredict a bra,addr=%h,bra_addr=%h,bra=%b,index=%0d .\n",
		   EI_adr,pred_tab[index_EI]`BRA_ADDR,pred_tab[index_EI]`LAST_BRA,index_EI);
	`endif
	PR_bra_cmd = 1;
	PR_bra_adr = pred_tab[index_EI]`BRA_ADDR;
      end
    end
 */
    // Check if the last prediction is ok
    //if (EX_cleared==0 && /*index_EX!=nb_record && pred_tab[index_EX]`LAST_BRA!=*/(EX_bra_confirm||
	//EX_jr == 1))
    //begin
      if( EX_bra_confirm)
      begin
	//set the modify flag and modify record      
	/*next_modify = index_EX;
	//record_modify = pred_tab[index_EX];
	flag_modify = 1;
	
	record_modify`VALID = 1;
	record_modify`LAST_BRA = EX_bra_confirm;
	record_modify`CODE_ADDR = EX_adr;
	record_modify`BRA_ADDR = EX_adresse;
      end*/
      // Clear the pipeline and branch to the new instruction
      PR_bra_bad = 1;
      PR_bra_adr = EX_adresse;
      PR_clear_EI = 1;
      PR_clear_DI = 1;
      
      //if (EX_bra_confirm == 1)
      //begin
      //record_modify`BRA_ADDR = EX_adresse;
      //PR_bra_adr = EX_adresse;
      //end
      //else begin 
	//record_modify`BRA_ADDR = 32'bx;
	//PR_bra_adr = EX_adr+4+4;
      //end
      /*`ifdef DEBUG
	$display($time, , ,"\n\npredict bad,addr=%h,bra_addr=%h,bra=%b,index=%0d .",
		 EX_adr,pred_tab[index_EX]`BRA_ADDR,pred_tab[index_EX]`LAST_BRA,index_EX);
	$display("correct,bra_addr=%h,bra=%b .\n", PR_bra_adr,record_modify`LAST_BRA);
      `endif*/
    end
       
    //check if there is a jmp instruction
    if(DI_jmp)
    begin
      PR_bra_bad = 1;
      PR_bra_adr = DI_jmp_target;
      PR_clear_EI = 1;
    end
    /*else if (DI_bra == 1 && index_DI == nb_record )
    begin // check if it's need to add a record in the table
      `ifdef DEBUG
	$display($time, , ,"\n\ndetect a bra,addr=%h,next_out=%0d .\n", DI_adr,next_out);
      `endif
      flag_add = 1;
      record_add`VALID = 1;          // The record is affected
      record_add`LAST_BRA = 0;       // Can't predict the branch the first time
      record_add`CODE_ADDR = DI_adr; // Save the branch address
      record_add`BRA_ADDR = 32'bx;  // Branch result
    end*/ 
  end
  
endmodule

