//
// Designed by Qiang Wu
//
//	0: up
//	1: left
//	2: down
//	3: right

`timescale 1ns/1ps
`include "NF_2.1_defines.v"
`include "reg_defines_reference_router.v"
`include "registers.v"
module out_switch(
	input			clk,
	input			reset,
	output		[239:0]	TRIG0,

	input		[63:0]	pb_out_data0,
	input		[15:0]	pb_out_pkt_route0,
	input			pb_out_wr0,
	input			pb_out_req0,
	output			pb_out_ack0,
	input		[1:0]	pb_out_neighbor0,
	input			pb_out_bop0,
	input			pb_out_eop0,
	output			pb_out_rdy0,

	input		[63:0]	pb_out_data1,
	input		[15:0]	pb_out_pkt_route1,
	input			pb_out_wr1,
	input			pb_out_req1,
	output			pb_out_ack1,
	input		[1:0]	pb_out_neighbor1,
	input			pb_out_bop1,
	input			pb_out_eop1,
	output			pb_out_rdy1,

	input		[63:0]	pb_out_data2,
	input		[15:0]	pb_out_pkt_route2,
	input			pb_out_wr2,
	input			pb_out_req2,
	output			pb_out_ack2,
	input		[1:0]	pb_out_neighbor2,
	input			pb_out_bop2,
	input			pb_out_eop2,
	output			pb_out_rdy2,

	input		[63:0]	pb_out_data3,
	input		[15:0]	pb_out_pkt_route3,
	input			pb_out_wr3,
	input			pb_out_req3,
	output			pb_out_ack3,
	input		[1:0]	pb_out_neighbor3,
	input			pb_out_bop3,
	input			pb_out_eop3,
	output			pb_out_rdy3,

	output	reg	[63:0]	out_data0,
	output	reg	[15:0]	out_pkt_route0,
	output	reg		out_wr0,
	output	reg		out_req0,
	input			out_ack0,
	output	reg		out_bop0,
	output	reg		out_eop0,
	input			out_rdy0,

	output	reg	[63:0]	out_data1,
	output	reg	[15:0]	out_pkt_route1,
	output	reg		out_wr1,
	output	reg		out_req1,
	input			out_ack1,
	output	reg		out_bop1,
	output	reg		out_eop1,
	input			out_rdy1,

	output	reg	[63:0]	out_data2,
	output	reg	[15:0]	out_pkt_route2,
	output	reg		out_wr2,
	output	reg		out_req2,
	input			out_ack2,
	output	reg		out_bop2,
	output	reg		out_eop2,
	input			out_rdy2,

	output	reg	[63:0]	out_data3,
	output	reg	[15:0]	out_pkt_route3,
	output	reg		out_wr3,
	output	reg		out_req3,
	input			out_ack3,
	output	reg		out_bop3,
	output	reg		out_eop3,
	input			out_rdy3
);

reg [3:0] pb_out_ack;
assign pb_out_ack0 = pb_out_ack[0];
assign pb_out_ack1 = pb_out_ack[1];
assign pb_out_ack2 = pb_out_ack[2];
assign pb_out_ack3 = pb_out_ack[3];

wire [3:0] pb_out_req;
assign pb_out_req[0] = pb_out_req0;
assign pb_out_req[1] = pb_out_req1;
assign pb_out_req[2] = pb_out_req2;
assign pb_out_req[3] = pb_out_req3;

wire [1:0] pb_out_neighbor[3:0];
assign pb_out_neighbor[0] = pb_out_neighbor0;
assign pb_out_neighbor[1] = pb_out_neighbor1;
assign pb_out_neighbor[2] = pb_out_neighbor2;
assign pb_out_neighbor[3] = pb_out_neighbor3;

wire [63:0] pb_out_data [3:0];
assign pb_out_data[0] = pb_out_data0;
assign pb_out_data[1] = pb_out_data1;
assign pb_out_data[2] = pb_out_data2;
assign pb_out_data[3] = pb_out_data3;

wire [16:0] pb_out_pkt_route [3:0];
assign pb_out_pkt_route[0] = pb_out_pkt_route0;
assign pb_out_pkt_route[1] = pb_out_pkt_route1;
assign pb_out_pkt_route[2] = pb_out_pkt_route2;
assign pb_out_pkt_route[3] = pb_out_pkt_route3;

wire [3:0] pb_out_wr;
assign pb_out_wr[0] = pb_out_wr0;
assign pb_out_wr[1] = pb_out_wr1;
assign pb_out_wr[2] = pb_out_wr2;
assign pb_out_wr[3] = pb_out_wr3;

wire [3:0] pb_out_bop;
assign pb_out_bop[0] = pb_out_bop0;
assign pb_out_bop[1] = pb_out_bop1;
assign pb_out_bop[2] = pb_out_bop2;
assign pb_out_bop[3] = pb_out_bop3;

wire [3:0] pb_out_eop;
assign pb_out_eop[0] = pb_out_eop0;
assign pb_out_eop[1] = pb_out_eop1;
assign pb_out_eop[2] = pb_out_eop2;
assign pb_out_eop[3] = pb_out_eop3;

reg tx_in_progress0;
reg tx_in_progress1;
reg tx_in_progress2;
reg tx_in_progress3;


reg [1:0] curr_buff0;
reg [1:0] curr_buff1;
reg [1:0] curr_buff2;
reg [1:0] curr_buff3;
reg [1:0] curr_buff0_next;
reg [1:0] curr_buff1_next;
reg [1:0] curr_buff2_next;
reg [1:0] curr_buff3_next;
wire [1:0] curr_buff0_plus_1;
wire [1:0] curr_buff1_plus_1;
wire [1:0] curr_buff2_plus_1;
wire [1:0] curr_buff3_plus_1;
assign curr_buff0_plus_1 = (curr_buff0 == 2'b11) ? 0 : curr_buff0 + 1;
assign curr_buff1_plus_1 = (curr_buff1 == 2'b11) ? 0 : curr_buff1 + 1;
assign curr_buff2_plus_1 = (curr_buff2 == 2'b11) ? 0 : curr_buff2 + 1;
assign curr_buff3_plus_1 = (curr_buff3 == 2'b11) ? 0 : curr_buff3 + 1;

wire [1:0] pb_nei0;
wire [1:0] pb_nei1;
wire [1:0] pb_nei2;
wire [1:0] pb_nei3;
assign pb_nei0 = pb_out_neighbor[curr_buff0];
assign pb_nei1 = pb_out_neighbor[curr_buff1];
assign pb_nei2 = pb_out_neighbor[curr_buff2];
assign pb_nei3 = pb_out_neighbor[curr_buff3];

parameter	OS_IDLE		= 3'b001,
		OS_LOOKUP_BUFF	= 3'b010,
		OS_PORT_REQ	= 3'b011,
		OS_TX		= 3'b100,
		OS_CANCEL	= 3'b101;

reg [2:0] os_state0;
reg [2:0] os_state_next0;
reg [2:0] os_state1;
reg [2:0] os_state_next1;
reg [2:0] os_state2;
reg [2:0] os_state_next2;
reg [2:0] os_state3;
reg [2:0] os_state_next3;

always @(*)
begin
	pb_out_ack = 0;
	curr_buff0_next = curr_buff0;
	os_state_next0 = os_state0;
	case(os_state0)
		OS_IDLE: begin
			out_req0 = 0;
			tx_in_progress0 = 0;
			os_state_next0 = OS_LOOKUP_BUFF;
		end
		OS_LOOKUP_BUFF: begin
			out_req0 = 0;
			if(pb_out_req[curr_buff0]) begin
				if(pb_nei0 == 2'b00) begin
					os_state_next0 = OS_PORT_REQ;
				end else begin
					curr_buff0_next = curr_buff0_plus_1;
				end
			end else begin
				curr_buff0_next = curr_buff0_plus_1;
			end
		end
		OS_PORT_REQ: begin
			out_req0 = 1;
			if(out_ack0) begin
				os_state_next0 = OS_TX;
			end
		end
		OS_TX: begin
			out_req0 = 1;
			if(pb_out_req[curr_buff0]) begin
				tx_in_progress0 = 1;
				pb_out_ack[curr_buff0] = 1;
			end else begin
				tx_in_progress0 = 0;
				os_state_next0 = OS_CANCEL;
			end
		end
		OS_CANCEL: begin
			out_req0 = 0;
			if(!out_ack0) begin
				pb_out_ack[curr_buff0] = 0;
				os_state_next0 = OS_IDLE;
			end
		end
		default: begin
			out_req0 = 0;
			tx_in_progress0 = 0;
			os_state_next0 = OS_IDLE;
		end
	endcase

	curr_buff1_next = curr_buff1;
	os_state_next1 = os_state1;
	case(os_state1)
		OS_IDLE: begin
			out_req1 = 0;
			tx_in_progress1 = 0;
			os_state_next1 = OS_LOOKUP_BUFF;
		end
		OS_LOOKUP_BUFF: begin
			out_req1 = 0;
			if(pb_out_req[curr_buff1]) begin
				if(pb_nei1 == 2'b01) begin
					os_state_next1 = OS_PORT_REQ;
				end else begin
					curr_buff1_next = curr_buff1_plus_1;
				end
			end else begin
				curr_buff1_next = curr_buff1_plus_1;
			end
		end
		OS_PORT_REQ: begin
			out_req1 = 1;
			if(out_ack1) begin
				os_state_next1 = OS_TX;
			end
		end
		OS_TX: begin
			out_req1 = 1;
			if(pb_out_req[curr_buff1]) begin
				tx_in_progress1 = 1;
				pb_out_ack[curr_buff1] = 1;
			end else begin
				tx_in_progress1 = 0;
				os_state_next1 = OS_CANCEL;
			end
		end
		OS_CANCEL: begin
			out_req1 = 0;
			if(!out_ack1) begin
				pb_out_ack[curr_buff1] = 0;
				os_state_next1 = OS_IDLE;
			end
		end
		default: begin
			out_req1 = 0;
			tx_in_progress1 = 0;
			os_state_next1 = OS_IDLE;
		end
	endcase

	curr_buff2_next = curr_buff2;
	os_state_next2 = os_state2;
	case(os_state2)
		OS_IDLE: begin
			out_req2 = 0;
			tx_in_progress2 = 0;
			os_state_next2 = OS_LOOKUP_BUFF;
		end
		OS_LOOKUP_BUFF: begin
			out_req2 = 0;
			if(pb_out_req[curr_buff2]) begin
				if(pb_nei2 == 2'b10) begin
					os_state_next2 = OS_PORT_REQ;
				end else begin
					curr_buff2_next = curr_buff2_plus_1;
				end
			end else begin
				curr_buff2_next = curr_buff2_plus_1;
			end
		end
		OS_PORT_REQ: begin
			out_req2 = 1;
			if(out_ack2) begin
				os_state_next2 = OS_TX;
			end
		end
		OS_TX: begin
			out_req2 = 1;
			if(pb_out_req[curr_buff2]) begin
				tx_in_progress2 = 1;
				pb_out_ack[curr_buff2] = 1;
			end else begin
				tx_in_progress2 = 0;
				os_state_next2 = OS_CANCEL;
			end
		end
		OS_CANCEL: begin
			out_req2 = 0;
			if(!out_ack2) begin
				pb_out_ack[curr_buff2] = 0;
				os_state_next2 = OS_IDLE;
			end
		end
		default: begin
			out_req2 = 0;
			tx_in_progress2 = 0;
			os_state_next2 = OS_IDLE;
		end
	endcase

	curr_buff3_next = curr_buff3;
	os_state_next3 = os_state3;
	case(os_state3)
		OS_IDLE: begin
			out_req3 = 0;
			tx_in_progress3 = 0;
			os_state_next3 = OS_LOOKUP_BUFF;
		end
		OS_LOOKUP_BUFF: begin
			out_req3 = 0;
			if(pb_out_req[curr_buff3]) begin
				if(pb_nei3 == 2'b11) begin
					os_state_next3 = OS_PORT_REQ;
				end else begin
					curr_buff3_next = curr_buff3_plus_1;
				end
			end else begin
				curr_buff3_next = curr_buff3_plus_1;
			end
		end
		OS_PORT_REQ: begin
			out_req3 = 1;
			if(out_ack3) begin
				os_state_next3 = OS_TX;
			end
		end
		OS_TX: begin
			out_req3 = 1;
			if(pb_out_req[curr_buff3]) begin
				tx_in_progress3 = 1;
				pb_out_ack[curr_buff3] = 1;
			end else begin
				tx_in_progress3 = 0;
				os_state_next3 = OS_CANCEL;
			end
		end
		OS_CANCEL: begin
			out_req3 = 0;
			if(!out_ack3) begin
				pb_out_ack[curr_buff3] = 0;
				os_state_next3 = OS_IDLE;
			end
		end
		default: begin
			out_req3 = 0;
			tx_in_progress3 = 0;
			os_state_next3 = OS_IDLE;
		end
	endcase

end

always @(posedge clk)
begin
	if(reset) begin
		os_state0 <= 0;
		os_state1 <= 0;
		os_state2 <= 0;
		os_state3 <= 0;
		curr_buff0 <= 0;
		curr_buff1 <= 0;
		curr_buff2 <= 0;
		curr_buff3 <= 0;
	end else begin
		os_state0 <= os_state_next0;
		os_state1 <= os_state_next1;
		os_state2 <= os_state_next2;
		os_state3 <= os_state_next3;
		curr_buff0 <= curr_buff0_next;
		curr_buff1 <= curr_buff1_next;
		curr_buff2 <= curr_buff2_next;
		curr_buff3 <= curr_buff3_next;

		if(tx_in_progress0) begin
			out_data0	<= pb_out_data[curr_buff0];
			out_pkt_route0	<= pb_out_pkt_route[curr_buff0];
			out_wr0		<= pb_out_wr[curr_buff0];
			out_bop0	<= pb_out_bop[curr_buff0];
			out_eop0	<= pb_out_eop[curr_buff0];
		end
		if(tx_in_progress1) begin
			out_data1	<= pb_out_data[curr_buff1];
			out_pkt_route1	<= pb_out_pkt_route[curr_buff1];
			out_wr1		<= pb_out_wr[curr_buff1];
			out_bop1	<= pb_out_bop[curr_buff1];
			out_eop1	<= pb_out_eop[curr_buff1];
		end
		if(tx_in_progress2) begin
			out_data2	<= pb_out_data[curr_buff2];
			out_pkt_route2	<= pb_out_pkt_route[curr_buff2];
			out_wr2		<= pb_out_wr[curr_buff2];
			out_bop2	<= pb_out_bop[curr_buff2];
			out_eop2	<= pb_out_eop[curr_buff2];
		end
		if(tx_in_progress3) begin
			out_data3	<= pb_out_data[curr_buff3];
			out_pkt_route3	<= pb_out_pkt_route[curr_buff3];
			out_wr3		<= pb_out_wr[curr_buff3];
			out_bop3	<= pb_out_bop[curr_buff3];
			out_eop3	<= pb_out_eop[curr_buff3];
		end

	end

end

assign pb_out_rdy0 = (tx_in_progress0 == 1'b1 && curr_buff0 == 2'b00) ? out_rdy0 :
			(tx_in_progress1 == 1'b1 && curr_buff1 == 2'b00) ? out_rdy1 :
			(tx_in_progress2 == 1'b1 && curr_buff2 == 2'b00) ? out_rdy2 :
			(tx_in_progress3 == 1'b1 && curr_buff3 == 2'b00) ? out_rdy3 : 0 ;
assign pb_out_rdy1 = (tx_in_progress0 == 1'b1 && curr_buff0 == 2'b01) ? out_rdy0 :
			(tx_in_progress1 == 1'b1 && curr_buff1 == 2'b01) ? out_rdy1 :
			(tx_in_progress2 == 1'b1 && curr_buff2 == 2'b01) ? out_rdy2 :
			(tx_in_progress3 == 1'b1 && curr_buff3 == 2'b01) ? out_rdy3 : 0 ;
assign pb_out_rdy2 = (tx_in_progress0 == 1'b1 && curr_buff0 == 2'b10) ? out_rdy0 :
			(tx_in_progress1 == 1'b1 && curr_buff1 == 2'b10) ? out_rdy1 :
			(tx_in_progress2 == 1'b1 && curr_buff2 == 2'b10) ? out_rdy2 :
			(tx_in_progress3 == 1'b1 && curr_buff3 == 2'b10) ? out_rdy3 : 0 ;
assign pb_out_rdy3 = (tx_in_progress0 == 1'b1 && curr_buff0 == 2'b11) ? out_rdy0 :
			(tx_in_progress1 == 1'b1 && curr_buff1 == 2'b11) ? out_rdy1 :
			(tx_in_progress2 == 1'b1 && curr_buff2 == 2'b11) ? out_rdy2 :
			(tx_in_progress3 == 1'b1 && curr_buff3 == 2'b11) ? out_rdy3 : 0 ;

assign TRIG0[0] = pb_out_wr0;
assign TRIG0[1] = pb_out_req0;
assign TRIG0[2] = pb_out_ack0;
assign TRIG0[3] = pb_out_bop0;
assign TRIG0[4] = pb_out_eop0;
assign TRIG0[5] = pb_out_rdy0;

assign TRIG0[10] = pb_out_wr1;
assign TRIG0[11] = pb_out_req1;
assign TRIG0[12] = pb_out_ack1;
assign TRIG0[13] = pb_out_bop1;
assign TRIG0[14] = pb_out_eop1;
assign TRIG0[15] = pb_out_rdy1;

assign TRIG0[20] = pb_out_wr2;
assign TRIG0[21] = pb_out_req2;
assign TRIG0[22] = pb_out_ack2;
assign TRIG0[23] = pb_out_bop2;
assign TRIG0[24] = pb_out_eop2;
assign TRIG0[25] = pb_out_rdy2;

assign TRIG0[30] = pb_out_wr3;
assign TRIG0[31] = pb_out_req3;
assign TRIG0[32] = pb_out_ack3;
assign TRIG0[33] = pb_out_bop3;
assign TRIG0[34] = pb_out_eop3;
assign TRIG0[35] = pb_out_rdy3;

assign TRIG0[40] = out_wr3;
assign TRIG0[41] = out_req3;
assign TRIG0[42] = out_ack3;
assign TRIG0[43] = out_bop3;
assign TRIG0[44] = out_eop3;
assign TRIG0[45] = out_rdy3;

assign TRIG0[50] = tx_in_progress0;
assign TRIG0[51] = tx_in_progress1;
assign TRIG0[52] = tx_in_progress2;
assign TRIG0[53] = tx_in_progress3;
assign TRIG0[61:60] = curr_buff0;
assign TRIG0[63:62] = curr_buff1;
assign TRIG0[65:64] = curr_buff2;
assign TRIG0[67:66] = curr_buff3;

assign TRIG0[92:90] = os_state0;
assign TRIG0[95:93] = os_state1;
assign TRIG0[98:96] = os_state2;
assign TRIG0[101:99] = os_state3;

assign TRIG0[173:110] = out_data3;

endmodule
