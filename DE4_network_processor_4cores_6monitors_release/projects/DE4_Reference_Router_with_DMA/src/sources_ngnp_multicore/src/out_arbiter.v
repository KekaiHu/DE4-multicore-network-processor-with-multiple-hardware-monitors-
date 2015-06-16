//
// Designed by Qiang Wu
//
`timescale 1ns/1ps
`include "NF_2.1_defines.v"
`include "reg_defines_reference_router.v"
`include "registers.v"
module out_arbiter
   (// --- data path interface
    output     [63:0]       out_data,
    output     [7:0]        out_ctrl,
    output  reg             out_wr,
    input                   out_rdy,

	input	[63:0]		in_data0,
	input			in_wr0,
	input			in_req0,
	output			in_ack0,
	input			in_bop0,
	input			in_eop0,
	output			in_outrdy0,

	input	[63:0]		in_data1,
	input			in_wr1,
	input			in_req1,
	output		in_ack1,
	input			in_bop1,
	input			in_eop1,
	output		in_outrdy1,
	
	input	[63:0]	in_data2,
	input			in_wr2,
	input			in_req2,
	output			in_ack2,
	input			in_bop2,
	input			in_eop2,
	output			in_outrdy2,
	
	input	[63:0]	in_data3,
	input			in_wr3,
	input			in_req3,
	output		in_ack3,
	input			in_bop3,
	input			in_eop3,
	output		in_outrdy3,
	

    // --- Register interface
    input                              reg_req_in,
    input                              reg_ack_in,
    input                              reg_rd_wr_L_in,
    input  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_in,
    input  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_in,
    input  [1:0]     reg_src_in,

    output                             reg_req_out,
    output                             reg_ack_out,
    output                             reg_rd_wr_L_out,
    output  [`UDP_REG_ADDR_WIDTH-1:0]  reg_addr_out,
    output  [`CPCI_NF2_DATA_WIDTH-1:0] reg_data_out,
    output  [1:0]    reg_src_out,

    // --- Misc
    input                              clk,
    input                              reset
);

assign reg_req_out = reg_req_in;
assign reg_ack_out = reg_ack_in;
assign reg_rd_wr_L_out = reg_rd_wr_L_in;
assign reg_addr_out = reg_addr_in;
assign reg_data_out = reg_data_in;
assign reg_src_out = reg_src_in;


reg [3:0] in_ack;
assign in_ack0 = in_ack[0];
assign in_ack1 = in_ack[1];
assign in_ack2 = in_ack[2];
assign in_ack3 = in_ack[3];

wire [3:0] in_req;
assign in_req[0] = in_req0;
assign in_req[1] = in_req1;
assign in_req[2] = in_req2;
assign in_req[3] = in_req3;

wire [3:0] in_wr;
assign in_wr[0] = in_wr0;
assign in_wr[1] = in_wr1;
assign in_wr[2] = in_wr2;
assign in_wr[3] = in_wr3;

wire [63:0] in_data[3:0];
assign in_data[0] = in_data0;
assign in_data[1] = in_data1;
assign in_data[2] = in_data2;
assign in_data[3] = in_data3;

wire [3:0] in_bop;
assign in_bop[0] = in_bop0;
assign in_bop[1] = in_bop1;
assign in_bop[2] = in_bop2;
assign in_bop[3] = in_bop3;

wire [3:0] in_eop;
assign in_eop[0] = in_eop0;
assign in_eop[1] = in_eop1;
assign in_eop[2] = in_eop2;
assign in_eop[3] = in_eop3;

//reg [1:0] in_outrdy;
//assign in_outrdy0 = in_outrdy[0];
//assign in_outrdy1 = in_outrdy[1];

assign in_outrdy0 = out_rdy;
assign in_outrdy1 = out_rdy;
assign in_outrdy2 = out_rdy;
assign in_outrdy3 = out_rdy;

reg[1:0] curr_input;
reg[1:0] curr_input_next;
wire[1:0] curr_input_plus_1;
assign curr_input_plus_1 = (curr_input == 2'b11) ? 0 : curr_input + 1;
//assign curr_input_plus_1 = (curr_input == 2'b00) ? 0 : curr_input + 1;


parameter	OA_STATE_IDLE	= 1'b0,
		OA_STATE_TX	= 1'b1;
reg oa_state;
reg oa_state_next;

always @(*) begin
	in_ack = 0;
	curr_input_next = curr_input;
	oa_state_next = oa_state;
	case(oa_state)
		OA_STATE_IDLE: begin
			if(in_req[curr_input]) begin
				oa_state_next = OA_STATE_TX;
			end else begin
				curr_input_next = curr_input_plus_1;
			end
		end
		OA_STATE_TX: begin
			if(in_req[curr_input]) begin
				in_ack[curr_input] = 1;
			end else begin
				oa_state_next = OA_STATE_IDLE;
				curr_input_next = curr_input_plus_1;
			end
		end
		default: begin
			oa_state_next = OA_STATE_IDLE;
		end
	endcase
end

wire [63:0] fifo_in_data;
wire [7:0] fifo_in_ctrl;
wire [7:0] fifo_in_ctrl0;
wire [7:0] fifo_in_ctrl1;
wire [7:0] fifo_in_ctrl2;
wire [7:0] fifo_in_ctrl3;
wire fifo_prog_full;
wire fifo_empty;
wire fifo_wr;
wire fifo_rd;

always @(posedge clk) begin
	if(reset) begin
		oa_state <= 0;
		curr_input <= 2'b00;
	end else begin
		oa_state <= oa_state_next;
		curr_input <= curr_input_next;
		out_wr <= fifo_rd;
	end
end

assign fifo_in_data = (curr_input == 2'b00) ? in_data0 : (curr_input == 2'b01) ? in_data1 : (curr_input == 2'b10) ? in_data2 :  in_data3;
assign fifo_in_ctrl0 = (in_bop0) ? 8'b11111111 : (in_eop0) ? 8'b00000001 : 0 ;
assign fifo_in_ctrl1 = (in_bop1) ? 8'b11111111 : (in_eop1) ? 8'b00000001 : 0 ;
assign fifo_in_ctrl2 = (in_bop2) ? 8'b11111111 : (in_eop2) ? 8'b00000001 : 0 ;
assign fifo_in_ctrl3 = (in_bop3) ? 8'b11111111 : (in_eop3) ? 8'b00000001 : 0 ;
assign fifo_in_ctrl = (curr_input == 2'b00) ? fifo_in_ctrl0 : (curr_input == 2'b01) ? fifo_in_ctrl1 :(curr_input == 2'b10) ? fifo_in_ctrl2 : fifo_in_ctrl3;
assign fifo_wr = (curr_input == 2'b00) ? in_wr0 : (curr_input == 2'b01) ? in_wr1 :(curr_input == 2'b10) ? in_wr2: in_wr3;
assign fifo_rd = (fifo_empty == 1) ? 0 : out_rdy;

small_fifo_test_72 input_fifo(
	.data          ({fifo_in_ctrl, fifo_in_data}),  // Data in
	.wrreq         (fifo_wr),             // Write enable
	.rdreq         (fifo_rd),    // Read the next word
	.q             ({out_ctrl, out_data}),
	.full          (),
	.empty         (fifo_empty),
	.sclr          (reset),
	.clock           (clk),
	.usedw         ()
);

//assign out_wr = (out_rdy == 0) ? 0 : (fifo_empty == 1) ? 0 : 1;
/*
wire [35:0] CONTROL0;
wire [239:0] TRIG0;

chipscope_icon_v1_03_a cs_icon (
	.CONTROL0(CONTROL0)
);

chipscope_ila_single cs_ila (
	.CONTROL(CONTROL0),
	.CLK(clk),
	.TRIG0(TRIG0)
);

assign TRIG0[63:0] = out_data;
assign TRIG0[71:64] = out_ctrl;
assign TRIG0[80] = out_wr;
assign TRIG0[81] = out_rdy;

assign TRIG0[163:100] = in_data0;
assign TRIG0[170] = in_wr0;
assign TRIG0[171] = in_req0;
assign TRIG0[172] = in_ack0;
assign TRIG0[173] = in_bop0;
assign TRIG0[174] = in_eop0;
assign TRIG0[175] = in_outrdy0;

assign TRIG0[180] = oa_state;

assign TRIG0[181] = curr_input;
assign TRIG0[182] = fifo_empty;
assign TRIG0[183] = fifo_wr;
assign TRIG0[184] = fifo_rd;

assign TRIG0[207:200] = fifo_in_ctrl;
*/
endmodule
