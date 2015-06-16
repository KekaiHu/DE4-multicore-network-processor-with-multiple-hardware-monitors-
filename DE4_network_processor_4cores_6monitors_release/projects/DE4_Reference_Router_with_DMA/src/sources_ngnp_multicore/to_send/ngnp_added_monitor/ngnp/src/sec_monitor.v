///////////////////////////////////////////////////////////////////////////////
// 
// Module: sec_monitor.v
// Project: ngnp
// Description: compares currently executed instruction address to monitoring graph contents
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

  module sec_monitor(
    // --- Misc
    input                              core_sp_clk,
    input [31:0]                       pp_mem_addr,
    input                              reset,
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
   

stage1 st1(
     
     .core_sp_clk          (core_sp_clk),
     .reset                (reset),
     .ppu_mem_addr         (pp_mem_addr),
     .index_addr           (bbr_addr),
     .fifo_write           (fifo_wr_en)
   
     

     );

stage2 st2(
     
     .core_sp_clk          (core_sp_clk),
     .reset                (reset),
     .bblock               (bbr_data_out),
     .nhop                 (nhr_data_out),
     .previous_bblock      (previous_bblock),
     .previous_nhop        (previous_nhop),
     .fifo_read            (fifo_rd_en)
     
);


stage3 st3(
     
     .core_sp_clk          (core_sp_clk),
     .reset                (reset),
     .previous_bblock      (previous_bblock),
     .previous_nhop        (previous_nhop),
     .fifo_pr_bblock       (fifo_previous_block),
     .fifo_pr_nhop         (fifo_previous_nhop),
     .jump_index_addr      (dupl_bbr_addr),
     .jump_bblock          (jump_block)

);

stage4 st4(
     
     .core_sp_clk          (core_sp_clk),
     .reset                (reset),
     .dupl_bblock          (dupl_bbr_data_out), 
     .jump_bblock          (jump_block),
     .pkt_drop             (drop_packet)


);

bb_ram  bbr(
	.clk		(core_sp_clk), 
	.addr		(bbr_addr[12:2]), 
	.data_in	(), 
	.data_out	(bbr_data_out), 
	.we		(4'b0000), 
	.en		(1'b1), 
	.reset	(reset)
);


next_hop_ram  nhr(
	.clk		(core_sp_clk), 
	.addr		(bbr_addr[12:2]), 
	.data_in	(), 
	.data_out	(nhr_data_out), 
	.we		(4'b0000), 
	.en		(1'b1), 
	.reset      (reset)
);

bb_ram  duplicate_bbr(
	.clk		(core_sp_clk), 
	.addr		(dupl_bbr_addr[12:2]), 
	.data_in	(), 
	.data_out	(dupl_bbr_data_out), 
	.we		(), 
	.en		(1'b1), 
	.reset	(reset)
);


fifo_generator_v4_4 fifo (
	.clk(core_sp_clk),
	.din(bbr_data_out), // Bus [31 : 0] 
	.rd_en(fifo_rd_en),
	.rst(reset),
	.wr_en(fifo_wr_en),
	.data_count(data_count), // Bus [9 : 0] 
	.dout(fifo_previous_block), // Bus [31 : 0] 
	.empty(empty),
	.full(full),
	.valid(valid),
	.wr_ack(wr_ack));

fifo_generator_v4_4 nhop_fifo (
	.clk(core_sp_clk),
	.din(nhr_data_out), // Bus [31 : 0] 
	.rd_en(fifo_rd_en),
	.rst(reset),
	.wr_en(fifo_wr_en),
	.data_count(), // Bus [9 : 0] 
	.dout(fifo_previous_nhop), // Bus [31 : 0] 
	.empty(),
	.full(),
	.valid(),
	.wr_ack());

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
	.reset	(reset)
);

*/



endmodule



