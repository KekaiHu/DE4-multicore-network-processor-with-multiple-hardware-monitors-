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
//// Description: register file of ucore processor               ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

`define BLOCK_RAM

module regfile
  (
   clk_i,rst_i,    //sys signal   
   enc,portc,dinc, // Write signal,reg address to write ,its data and byte selection
   ena,porta,douta,//read porta
   enb,portb,doutb //read portb
   );
 
  //the regfile,it act as the precesser's inter register bank and 
  //it's coprocesser0's register bank
  //that is,0~31 are it's internal register bank and 32~63 are coprocesser's register bank
  //so the bit 5 of the reg addr in is the general register sel signal,when it's 1,sellect the 
  //coprosser's register bank, when '0',select the general register bank
  
  input clk_i;
  input rst_i;
  
  // Write signal;reg address to write,its data and byte selection
  input enc;
  input [5:0] portc;
  input [31:0] dinc;
 
  //porta
  input  ena;
  input  [5:0] porta;
  output [31:0] douta;
  //portb
  input  enb;
  input  [5:0] portb;
  output [31:0] doutb;
   
  `ifndef BLOCK_RAM
 
  //porta
  //input ena;
  //input [5:0] porta;
  //output reg [31:0] douta;
  //portb
  //input enb;
  //input [5:0] portb;
  //output reg [31:0] doutb;

  // The register bank
  reg [63:0] mem[31:0];
  
  always @(posedge clk_i or posedge rst_i)
  begin
    if(rst_i)
    begin:INITIAL_SECTION
      integer i;
      for(i=0;i<32;i=i+1) mem[i] <= 32'b0;
    end 
    else begin
      douta <= ena?mem[porta]:32'b0;
      doutb <= enb?mem[portb]:32'b0;
            
      if (enc && portc != 0)
      begin
	mem[portc] <= dinc;
      end
    end
  end
  
 `else
 
   wire      [31 : 0] tempa, tempb;
   wire               collision_a, collision_b;
   reg                collision_a_reged, collision_b_reged;
   reg       [31 : 0] dinc_reged;
   wire                enc_inter;
   assign enc_inter   = enc & portc != 0;
   assign collision_a = (porta == portc) && ena && enc_inter;
   assign collision_b = (portb == portc) && enb && enc_inter;
   
   always @(posedge clk_i or posedge rst_i)
   begin
     if (rst_i) 
     begin
       collision_a_reged <= 1'b0;
       collision_b_reged <= 1'b0;
       dinc_reged        <= 32'b0;
     end
     else begin
       collision_a_reged <= collision_a;
       collision_b_reged <= collision_b;
       dinc_reged        <= dinc;
     end
   end

   assign douta = collision_a_reged ? dinc_reged : tempa;
   assign doutb = collision_b_reged ? dinc_reged : tempb;
   
   RAMB16_S36_S36 ram0
     (
      .DOA(tempa),
      .DOB(),     
      .DOPA(),
      .DOPB(),
      .ADDRA({3'b0,porta}),
      .ADDRB({3'b0,portc}), 
      .CLKA(clk_i),
      .CLKB(clk_i),
      .DIA(32'b0), 
      .DIB(dinc),
      .DIPA(4'b0),
      .DIPB(4'b0),
      .ENA(ena & ~collision_a),    
      .ENB(enc_inter),    
      .SSRA(rst_i), 
      .SSRB(rst_i), 
      .WEA(1'b0),   
      .WEB(1'b1)    
      );
   
   RAMB16_S36_S36 ram1
     (
      .DOA(tempb),
      .DOB(),     
      .DOPA(),
      .DOPB(),
      .ADDRA({3'b0,portb}),
      .ADDRB({3'b0,portc}), 
      .CLKA(clk_i),
      .CLKB(clk_i),
      .DIA(32'b0), 
      .DIB(dinc),
      .DIPA(4'b0),
      .DIPB(4'b0),
      .ENA(enb && ~collision_b),  
      .ENB(enc_inter),  
      .SSRA(rst_i), 
      .SSRB(rst_i), 
      .WEA(1'b0),   
      .WEB(1'b1)    
      );
  
 `endif
 
endmodule
