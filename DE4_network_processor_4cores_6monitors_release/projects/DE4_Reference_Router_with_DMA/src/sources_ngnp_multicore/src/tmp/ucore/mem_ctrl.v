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
//// Description: mem interface to data_mem and inst_mem         ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Change log:                                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`include "ucore_defines.v"

module mem_ctrl
  (
   clk_i,
   // Interface with IF stage 
   IF_addr_i,IF_req_i,
   // Interface with ID stage 
   ID_inst_o,
   // Interface with the MEM Stage
   MEM_req_i,MEM_we_i,MEM_addr_i,MEM_data_i,MEM_bwsel_i,
   // Interface with the WB Stage
   WB_data_o,
   // data_ram interface signals
   dmem_cyc_o,dmem_stb_o,dmem_waddr_o,dmem_raddr_o,dmem_we_o,dmem_bwsel_o,dmem_ack_i,dmem_data_i,dmem_data_o,   
   //inst_rom interface
   imem_cyc_o, imem_stb_o, imem_addr_o, imem_ack_i, imem_inst_i,
 
   // Pipeline progress control signal
   dmem_rdy_o,imem_rdy_o
   );
  
  input         clk_i;
  
  // Interface for the Instruction Extraction Stage
  input         IF_req_i;
  input  [31:0] IF_addr_i;     // The address of the data to read
  output [31:0] ID_inst_o;   // Instruction from the memory
  
  //inst_rom interface
  output        imem_cyc_o; 
  output        imem_stb_o; 
  output [31:0] imem_addr_o; 
  input         imem_ack_i; 
  input  [31:0] imem_inst_i;
  
  // Interface with the MEM Stage
  input         MEM_req_i;       // Request to access the ram
  input         MEM_we_i;        // Read/Write request
  input  [31:0] MEM_addr_i;      // Address in ram
  input  [31:0] MEM_data_i;      // Data to write in ram
  input  [3:0]  MEM_bwsel_i;
  
  // Interface with the WB Stage
  output [31:0] WB_data_o;     // Data from the ram to the WB stage
    
  // RAM interface signals
  output        dmem_cyc_o;     // Request to ram
  output        dmem_stb_o;     // Request to ram
  output [31:0] dmem_waddr_o;   // Address of the data to write
  output [31:0] dmem_raddr_o;   // Address of the data to read
  output        dmem_we_o;      // Read/Write request
  output [3:0]  dmem_bwsel_o;   // byte selection signal
  input         dmem_ack_i;     // Acknowledge from the memory
  input  [31:0] dmem_data_i;    // Data from the memory
  output [31:0] dmem_data_o;    // Data to the memory
  
  // Pipeline progress control signal
  output        dmem_rdy_o;
  output        imem_rdy_o;
  
  assign imem_cyc_o = IF_req_i;//1'b1;
  assign imem_stb_o = IF_req_i;//1'b1;
  assign imem_addr_o = IF_addr_i;
  assign ID_inst_o = imem_inst_i;
 
  assign dmem_we_o   = MEM_we_i;
  assign dmem_cyc_o  = MEM_req_i;
  assign dmem_stb_o  = MEM_req_i;
  assign dmem_waddr_o = {MEM_addr_i[31:2],2'b00};
  assign dmem_raddr_o = {MEM_addr_i[31:2],2'b00};
  assign dmem_data_o  = MEM_data_i;
  assign dmem_bwsel_o = MEM_bwsel_i;
  assign WB_data_o    = dmem_data_i;

  
  reg dmem_req_reged; 
  reg imem_req_reged;
  always @(posedge clk_i)
  begin
    dmem_req_reged <= dmem_cyc_o & dmem_stb_o;
    imem_req_reged <= IF_req_i;
  end

  assign dmem_rdy_o   = dmem_ack_i | ~dmem_req_reged;
  assign imem_rdy_o   = imem_ack_i | ~imem_req_reged;

endmodule