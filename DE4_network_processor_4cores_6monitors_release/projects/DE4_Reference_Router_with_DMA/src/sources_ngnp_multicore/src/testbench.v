`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:51:17 11/29/2011
// Design Name:   np_core
// Module Name:   C:/Hari/Study/Masters_thesis/needtosee/altera_netfpga_08_08_11/Danai_proj/xilinx _test_localram/latest_code_nov20/to_send/ngnp_added_monitor/ngnp/src/testbench.v
// Project Name:  np_core
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: np_core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench();

	// Inputs
	reg out_rdy;
	reg [63:0] in_data;
	reg [7:0] in_ctrl;
	reg in_wr;
	reg reg_req_in;
	reg reg_ack_in;
	reg reg_rd_wr_L_in;
	reg [22:0] reg_addr_in;
	reg [31:0] reg_data_in;
	reg [1:0] reg_src_in;
	reg clk;
	reg core_sp_clk;
	reg reset;
	reg packet_drop;

	// Outputs
	wire [63:0] out_data;
	wire [7:0] out_ctrl;
	wire out_wr;
	wire in_rdy;
	wire reg_req_out;
	wire reg_ack_out;
	wire reg_rd_wr_L_out;
	wire [22:0] reg_addr_out;
	wire [31:0] reg_data_out;
	wire [1:0] reg_src_out;
	wire [31:0] ppu_mem_addr;

	// Instantiate the Unit Under Test (UUT)
	np_core uut (
		.out_data(out_data), 
		.out_ctrl(out_ctrl), 
		.out_wr(out_wr), 
		.out_rdy(out_rdy), 
		.in_data(in_data), 
		.in_ctrl(in_ctrl), 
		.in_wr(in_wr), 
		.in_rdy(in_rdy), 
		.reg_req_in(reg_req_in), 
		.reg_ack_in(reg_ack_in), 
		.reg_rd_wr_L_in(reg_rd_wr_L_in), 
		.reg_addr_in(reg_addr_in), 
		.reg_data_in(reg_data_in), 
		.reg_src_in(reg_src_in), 
		.reg_req_out(reg_req_out), 
		.reg_ack_out(reg_ack_out), 
		.reg_rd_wr_L_out(reg_rd_wr_L_out), 
		.reg_addr_out(reg_addr_out), 
		.reg_data_out(reg_data_out), 
		.reg_src_out(reg_src_out), 
		.clk(clk), 
		.core_sp_clk(clk), 
		.reset(reset), 
		.ppu_mem_addr(ppu_mem_addr), 
		.packet_drop(packet_drop)
	);

	initial begin
		// Initialize Inputs
		out_rdy = 0;
		in_data = 0;
		in_ctrl = 0;
		in_wr = 0;
		reg_req_in = 0;
		reg_ack_in = 0;
		reg_rd_wr_L_in = 0;
		reg_addr_in = 0;
		reg_data_in = 0;
		reg_src_in = 0;
		clk = 0;
		core_sp_clk = 0;
		reset = 1;
		packet_drop = 0;

		// Wait 100 ns for global reset to finish
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);
	@(posedge clk);
	@(negedge clk);   
		// Add stimulus here
		
		reset = 0;
	   out_rdy = 1;
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'hff;
	in_data = 64'h0000000e0004006a;
	
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h004e46324302004e;
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h4632430208004500;
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h005c000040004001;
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h1f9b0a0203020a01;	
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h04020800d0c4b63d;	
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h000f92d3b04c55da;	
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h000008090a0b0c0d;	

	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h0e0f101112131415;		
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h0e0f101112131415;	

	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h161718191a1b1c1d;
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h1e1f202122232425;	
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h262728292a2b2c2d;	
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h2e2f303132333435;	

	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h00;
	in_data = 64'h363738393a3b3c3d;	
	
	@(posedge clk);
	@(negedge clk);
	//@(posedge clk);
	//@(negedge clk);
	
	in_wr = 1;
	in_ctrl = 8'h02;
	in_data = 64'h3e3f3f3f3f3f3f3f;		

	@(posedge clk);
	@(negedge clk);

	
	in_wr = 0;
	in_ctrl = 8'h00;
	in_data = 64'h0;
	end
      
always begin
	#800 clk = ~clk;
end		
		
endmodule
