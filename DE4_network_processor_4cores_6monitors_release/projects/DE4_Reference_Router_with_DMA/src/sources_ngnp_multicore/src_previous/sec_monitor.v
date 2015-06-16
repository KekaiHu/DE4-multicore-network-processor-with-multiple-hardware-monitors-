///////////////////////////////////////////////////////////////////////////////
// 
// Module: sec_monitor.v
// Project: ngnp
// Description: compares currently executed instruction address to monitoring graph contents
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps
`include "NF_2.1_defines.v"
`include "registers.v"
`include "reg_defines_reference_router.v"
  module sec_monitor(
    // --- Misc
    input                              core_sp_clk,
    input [31:0]                       pp_mem_addr,
    input                              reset,
//    input                              fifo_reset,
    output                             drop_packet
);

   


   //-------------------- Internal Parameters ------------------------
   
   //---------------------- Wires and regs----------------------------
  

   //only connections in this file, this is the upper level module that connects the stages
   wire [31:0]                           proc_addr; //connect sp address to stage 1 address where we need to fetch it
   wire [12:2]                           bbr_addr; //signal from stage 2 to the memories to start lookup
   wire [12:2]                           dupl_bbr_addr; //signal from stage 3 to the bbram to start lookup
   
   // memory wires

   wire	[31:0]	bbr_data_out;    //output of memory basic block ram, which goes as input to stage 3
   wire	[31:0]	nhr_data_out;    //output of memory next hop ram, which goes as input to stage 3
   wire	[31:0]	dupl_bbr_data_out; //output of duplicate memory basic block ram, which goes as input to stage 4   

  
   wire fifo_rd_en;
  

   wire fifo_wr_en;

   // fifo wires 

  
   wire [31:0] data_fifo_in;
  // wire [31:0] data_fifo_out;

   //wire empty;
   //wire full;
   wire [31:0] jump_block;
   wire [31:0] fifo_previous_block;
   wire [31:0] fifo_previous_nhop;
   wire [9:0] data_count;

   wire [31:0] previous_bblock;
   wire [31:0] previous_nhop;

   wire [31:0] carry_bblock;
   wire [31:0] carry_nhop;
   wire [31:0] st1_mem_addr;
   wire [31:0] st2_mem_addr;
   wire [31:0] st3_mem_addr;
   

stage1 st1(
     
     .core_sp_clk          (core_sp_clk),
     .reset                (reset),
     .ppu_mem_addr         (pp_mem_addr),
     .index_addr           (bbr_addr),
     .fifo_write           (fifo_wr_en),
     .st1_mem_addr         (st1_mem_addr)
     

     );

stage2 st2(     
     .core_sp_clk          (core_sp_clk),
     .reset                (reset),
     .bblock               (bbr_data_out),
     .nhop                 (nhr_data_out),
     .st1_mem_addr         (st1_mem_addr),
     .previous_bblock      (previous_bblock),
     .previous_nhop        (previous_nhop),
     .fifo_read            (fifo_rd_en),
     .st2_mem_addr         (st2_mem_addr)     
//     .fifo_full            (),
//     .fifo_empty           (),
     
    

);


stage3 st3(     
     .core_sp_clk          (core_sp_clk),
     .reset                (reset),
     .previous_bblock      (previous_bblock),
     .previous_nhop        (previous_nhop),
     .fifo_pr_bblock       (fifo_previous_block),
//     .fifo_full            (),
//     .fifo_empty           (),
     .fifo_pr_nhop         (fifo_previous_nhop),
     .jump_index_addr      (dupl_bbr_addr),
     .jump_bblock          (jump_block),
     .st2_mem_addr         (st2_mem_addr),
     .st3_mem_addr         (st3_mem_addr) 

);

stage4 st4(     
     .core_sp_clk          (core_sp_clk),
     .reset                (reset),
     .dupl_bblock          (dupl_bbr_data_out), 
     .jump_bblock          (jump_block),
     .pkt_drop             (drop_packet),
     .st3_mem_addr         (st3_mem_addr) 


);

bb_ram  bbr(
	.clk		(core_sp_clk), 
	.addr		(bbr_addr[12:2]), 
	.data_in	(), 
	.data_out	(bbr_data_out), 
	.we		(4'b0000), 
	.en		(1'b1), 
	.reset	        (reset)
);


next_hop_ram  nhr(
	.clk		(core_sp_clk), 
	.addr		(bbr_addr[12:2]), 
	.data_in	(), 
	.data_out	(nhr_data_out), 
	.we		(4'b0000), 
	.en		(1'b1), 
	.reset          (reset)
);

bb_ram  duplicate_bbr(
	.clk		(core_sp_clk), 
	.addr		(dupl_bbr_addr[12:2]), 
	.data_in	(), 
	.data_out	(dupl_bbr_data_out), 
	.we		(), 
	.en		(1'b1), 
	.reset	        (reset)
);

small_fifo_test fifo(
	.data          (bbr_data_out),  // Data in
	.wrreq         (fifo_wr_en),             // Write enable
	.rdreq         (fifo_rd_en),    // Read the next word
	.q             (fifo_previous_block),
	.full          (full),
	.empty         (empty),
	.sclr          (reset),
	.clock           (core_sp_clk),
	.usedw         ()
);

small_fifo_test nhop_fifo (
	.data          (nhr_data_out),  // Data in
	.wrreq         (fifo_wr_en),             // Write enable
	.rdreq         (fifo_rd_en),    // Read the next word
	.q             (fifo_previous_nhop),
	.full          (full),
	.empty         (empty),
	.sclr          (reset),
	.clock          (core_sp_clk),
	.usedw         ()
);
	
	
/* wire [31:0] tmp_data_out;

reg [12:2] tmp_addr;
wire [12:2] tmp_addr_inc;
assign tmp_addr_inc = (tmp_addr == 11'b11111111111) ? 0 : (tmp_addr + 1'b1);

always @(posedge core_sp_clk) begin
	if(reset) begin
		tmp_addr <= 0;
	end else begin
		tmp_addr <= tmp_addr_inc;
	end
end

bb_ram  bbr(
	.clk		(core_sp_clk), 
	.addr		(tmp_addr), 
	.data_in	(), 
	.data_out	(tmp_data_out), 
	.we		(4'b0000), 
	.en		(1'b1), 
	.reset	        (reset)
);

*/



endmodule



