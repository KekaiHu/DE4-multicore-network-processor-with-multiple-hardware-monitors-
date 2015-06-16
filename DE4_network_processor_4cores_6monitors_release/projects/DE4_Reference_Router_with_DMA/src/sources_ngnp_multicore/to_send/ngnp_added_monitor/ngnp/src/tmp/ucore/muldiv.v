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
//// Description: multify and division module of alu             ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

module muldiv
  (
   clk_i,rst_i,//sys signal
   op_type,op1,op2,
   rdy,res
   );
  
  parameter  OP_MULT  = `ALU_OP_MULT; // hilo = op1 * op2 signed 
  parameter  OP_MULTU = `ALU_OP_MULTU;// hilo = op1 * op2 unsigned
  parameter  OP_DIV   = `ALU_OP_DIV;  // hilo = {op1 % op2 ,op1 /op2 } signed 
  parameter  OP_DIVU  = `ALU_OP_DIVU; // hilo = {op1 % op2 ,op1 /op2 } unsigned
  parameter  OP_MFHI  = `ALU_OP_MFHI; // move from hi
  parameter  OP_MFLO  = `ALU_OP_MFLO; // move from lo
  parameter  OP_MTHI  = `ALU_OP_MTHI; // move to hi
  parameter  OP_MTLO  = `ALU_OP_MTLO; // move to lo
  parameter  OP_NONE  = `ALU_OP_NONE;

  input         clk_i;
  input         rst_i;
  input  [7:0]  op_type;
  input  [31:0] op1;
  input  [31:0] op2;
  output [31:0] res;
  output        rdy;
 
  reg           rdy;
   
  reg    [64:0] hilo;
  reg    [32:0] op2_reged;
  reg    [5:0]  count; 
  reg           op1_sign_reged;
  reg           op2_sign_reged;
  reg           sub_or_yn;
 
  wire   [32:0] nop2_reged;//nop2_reged = ~op2_reged +1; 
  assign nop2_reged = ~op2_reged +1;
 
  reg           sign;
  reg           mul;
  reg           start;
   
  assign res = (op_type == OP_MFLO )?hilo[31:0]: hilo[63:32];//op_type == OP_MFHI or other    
 
  reg           overflow;
  //signals that control the result descision
  reg           finish;
  reg           add1;  //if the quotient will add 1 at the end of the divide operation
  reg           addop2; //if the remainder will add op2 at the end of the divide operation
  reg           addnop2;//if the remainder will add ~op2+1 at the end of the divide operation 
  
  always @( posedge clk_i or posedge rst_i)
  begin
    if(rst_i)
    begin
      count          = 6'bx;
      hilo           = 65'bx;
      op2_reged      = 33'bx;
      op1_sign_reged = 1'bx;
      op2_sign_reged = 1'bx;
      sub_or_yn      = 1'bx;
      rdy            = 1'b1;
      start          = 1'bx;
      sign           = 1'bx;
      mul            = 1'bx;
      overflow       = 1'bx;
      
      finish         = 1'bx; 
      add1           = 1'bx;
      addop2         = 1'bx;
      addnop2        = 1'bx;
      //end of if rst_i 
    end
    else begin
      //$fdisplay(log,$time, , , "op_type = %x,MTHI=%x ",op_type,OP_MTHI);
      
      if(op_type == OP_MTHI || op_type == OP_MTLO)
      begin
	if(op_type == OP_MTHI) hilo[64:32] = {1'b0,op1};
	if(op_type == OP_MTLO) hilo[31:0]  = op1;
	rdy = 1;
      end
      else if(rdy)
      begin
	start = (op_type == OP_MULT) || (op_type == OP_MULTU) || (op_type == OP_DIV)  || (op_type == OP_DIVU);
	mul   = (op_type == OP_MULT) || (op_type == OP_MULTU);
	sign  = (op_type == OP_MULT) || (op_type == OP_DIV);
	
	if(start)
	begin:START_SECTION
	  reg [32:0] over;
	  
	  op2_reged       = {sign        ?op2[31]      :1'b0 ,op2};
	  hilo            = {~mul && sign?{33{op1[31]}}:33'b0,op1};
	  count           = 6'b000000;
	  rdy             = 0;
	  op1_sign_reged  = sign?op1[31]:0;
	  op2_sign_reged  = sign?op2[31]:0; 
	  sub_or_yn       = 0;
	  
	  //only in case of signed divide,and the two operand are all 
	  //negtive value,we check the overflow condition 
	  over            = ~op2_reged + {op1[31],op1};
	  overflow        = sign && ~mul ? op1_sign_reged && op2_sign_reged && ~over[32] : 0;
	  
	  finish          = 0;
	  //end of if start
	end
	//end of if rdy
      end
      else if(start)
      begin
	if(overflow)
	begin
	  //when overflow ,the remander is op1,and quotient is zero
	  hilo[63:0] = {hilo[31:0],32'b0};
	  rdy        = 1;
	end
	else if(!count[5])
	begin
	  if(mul)
	  begin
	    if(sign)
	    begin
	      case({hilo[0],sub_or_yn}) //synthesis parallel_case
		2'b10:hilo[64:32] = hilo[64:32] + nop2_reged;
		2'b01:hilo[64:32] = hilo[64:32] + op2_reged;
		default:;//do nothing
	      endcase 
	      //shift right
	      {hilo[63:0],sub_or_yn} = hilo[64:0];
	    end
	    else begin
	      if(hilo[0]) hilo[64:32] = hilo[64:32] + op2_reged;    
	      hilo      = {1'b0,hilo[64:1]};
	    end
	  end
	  else begin
	    sub_or_yn  = hilo[64]== op2_sign_reged;
	    hilo[64:1] = hilo[63:0];
	    
	    hilo[64:32] = sub_or_yn ? hilo[64:32] + nop2_reged : hilo[64:32] + op2_reged;
	    	    
	    hilo[0]    = hilo[64]== op2_sign_reged;	  
	  end
	  
	  count        = count + 1'b1;
	  //end of else if(!count[5])
	end
	else begin
	  if(finish)
	  begin
	    if(add1)   hilo[31:0]  = hilo[31:0] + 1;
	    case({addop2,addnop2})//synthesis parallel_case
	      2'b10:   hilo[64:32] = hilo[64:32] + op2_reged;
	      2'b01:   hilo[64:32] = hilo[64:32] + nop2_reged;
	      default: ;
	    endcase
	    rdy = 1;
	    //end of if finish
	  end
	  else begin
	    {add1,addop2,addnop2} = 3'b000;
	    finish                = 1;
	
	    if(~mul)
	    begin:LAST_CYCLE_DEAL_SECTION
	///////////////////////////////////////////////////////////////////////////////
	      reg eqz,eqop2,eqnop2;
	      eqz    = hilo[64:32] == 0;
	      eqop2  = hilo[64:32] == op2_reged;
	      eqnop2 = hilo[64:32] == nop2_reged;
	      //reg add111,addop21,addnop21;
	      //{add11,addop21,addnop21} = 3'b000;
	      casex({op1_sign_reged,op2_sign_reged,eqz,eqop2,eqnop2})//synthesis parallel_case
		5'b101xx : {add1,addop2,addnop2} = 3'b000;
		5'b100x1 : {add1,addop2,addnop2} = 3'b010;
		5'b111xx : {add1,addop2,addnop2} = 3'b100;
		5'b1101x : {add1,addop2,addnop2} = 3'b101;
		default :
		begin:LAST_CYCLE_DEAL_SECTION_DEFAULT
	
		  reg op1s_eq_op2s,op1s_eq_h64;
		  op1s_eq_op2s = op1_sign_reged == op2_sign_reged;
		  op1s_eq_h64  = op1_sign_reged == hilo[64];
	
		  add1 = ~op1s_eq_op2s;
		  case({op1s_eq_op2s,op1s_eq_h64})//synthesis parallel_case
		    2'b00:   {addop2,addnop2} = 2'b01;
		    2'b10:   {addop2,addnop2} = 2'b10;
		    default: {addop2,addnop2} = 2'b00;
		  endcase
		end
	      endcase
	  //////////////////////////////////////////////////////////    
	      /*if(op1_sign_reged == 1 && op2_sign_reged == 0 && hilo[64:32] == 0)
		{add1,addop2,addnop2} = 3'b000;
	      else if(op1_sign_reged == 1 && op2_sign_reged == 0 && hilo[64:32] == nop2_reged)
		{add1,addop2,addnop2} = 3'b010;
	      else if(op1_sign_reged == 1 && op2_sign_reged == 1 && hilo[64:32] == 0 )
		{add1,addop2,addnop2} = 3'b100;
	      else if(op1_sign_reged == 1 && op2_sign_reged == 1 && hilo[64:32] == op2_reged)
		{add1,addop2,addnop2} = 3'b101;
	      else begin
		if(op1_sign_reged != op2_sign_reged) 
		  add1 = 1;
		
		if(op1_sign_reged != hilo[64])
		begin
		  if (op1_sign_reged == op2_sign_reged) 
		    addop2 = 1;
		  else 
		    addnop2 = 1;
		end
	      end*/
	    end
	  end
	end
      end
    end
  end
  
endmodule