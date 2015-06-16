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
module in_switch(
	input			clk,
	input			reset,
	output [239:0] TRIG0,

	input		[63:0]	in_data0,
	input		[15:0]	in_pkt_route0,
	input			in_wr0,
	input			in_req0,
	output	reg		in_ack0,

	input		[63:0]	in_data1,
	input		[15:0]	in_pkt_route1,
	input			in_wr1,
	input			in_req1,
	output	reg		in_ack1,

	input		[63:0]	in_data2,
	input		[15:0]	in_pkt_route2,
	input			in_wr2,
	input			in_req2,
	output	reg		in_ack2,

	input		[63:0]	in_data3,
	input		[15:0]	in_pkt_route3,
	input			in_wr3,
	input			in_req3,
	output	reg		in_ack3,

	output		[63:0]	pb_in_data0,
	output		[15:0]	pb_in_pkt_route0,
	output			pb_in_wr0,
	output	reg		pb_in_req0,
	input			pb_in_ack0,
	input			pb_in_empty0,

	output		[63:0]	pb_in_data1,
	output		[15:0]	pb_in_pkt_route1,
	output			pb_in_wr1,
	output	reg		pb_in_req1,
	input			pb_in_ack1,
	input			pb_in_empty1,

	output		[63:0]	pb_in_data2,
	output		[15:0]	pb_in_pkt_route2,
	output			pb_in_wr2,
	output	reg		pb_in_req2,
	input			pb_in_ack2,
	input			pb_in_empty2,

	output		[63:0]	pb_in_data3,
	output		[15:0]	pb_in_pkt_route3,
	output			pb_in_wr3,
	output	reg		pb_in_req3,
	input			pb_in_ack3,
	input			pb_in_empty3
);

reg [3:0] in_req;
reg [3:0] in_ack;
reg [3:0] pb_in_req;
reg [3:0] pb_in_ack;
reg [3:0] pb_in_empty;

reg [63:0] pb_in_data[3:0];
assign pb_in_data0 = pb_in_data[0];
assign pb_in_data1 = pb_in_data[1];
assign pb_in_data2 = pb_in_data[2];
assign pb_in_data3 = pb_in_data[3];

reg [15:0] pb_in_pkt_route[3:0];
assign pb_in_pkt_route0 = pb_in_pkt_route[0];
assign pb_in_pkt_route1 = pb_in_pkt_route[1];
assign pb_in_pkt_route2 = pb_in_pkt_route[2];
assign pb_in_pkt_route3 = pb_in_pkt_route[3];

reg [3:0] pb_in_wr;
assign pb_in_wr0 = pb_in_wr[0];
assign pb_in_wr1 = pb_in_wr[1];
assign pb_in_wr2 = pb_in_wr[2];
assign pb_in_wr3 = pb_in_wr[3];

reg [3:0] rx_in_progress;
reg [1:0] rx_buff0;
reg [1:0] rx_buff1;
reg [1:0] rx_buff2;
reg [1:0] rx_buff3;

reg [1:0] empty_buff;
reg [3:0] empty_buff_req;
reg empty_buff_req0;
reg empty_buff_req1;
reg empty_buff_req2;
reg empty_buff_req3;
reg [3:0] empty_buff_grant;
reg empty_buff_grant0;
reg empty_buff_grant1;
reg empty_buff_grant2;
reg empty_buff_grant3;
reg [1:0] granted_buff0;
reg [1:0] granted_buff1;
reg [1:0] granted_buff2;
reg [1:0] granted_buff3;

reg [1:0] curr_port;
reg [1:0] curr_port_next;
wire [1:0] curr_port_plus_1;
assign curr_port_plus_1 = (curr_port == 2'b11) ? 0 : curr_port + 1;

parameter	EMPTY_BUFF_LOOKUP	= 2'b00,
		EMPTY_BUFF_GRANT	= 2'b01,
		EMPTY_BUFF_WAIT1	= 2'b10,
		EMPTY_BUFF_WAIT2	= 2'b11;
reg [1:0] empty_buff_state;
reg [1:0] empty_buff_state_next;
always @(*)
begin
	curr_port_next = curr_port;
	empty_buff_state_next = empty_buff_state;
	case(empty_buff_state)
		EMPTY_BUFF_LOOKUP: begin
			empty_buff_grant = 0;
			if(pb_in_empty[0]) begin
				empty_buff = 2'b00;
				empty_buff_state_next = EMPTY_BUFF_GRANT;
			end else begin
				if(pb_in_empty[1]) begin
					empty_buff = 2'b01;
					empty_buff_state_next = EMPTY_BUFF_GRANT;
				end else begin
					if(pb_in_empty[2]) begin
						empty_buff = 2'b10;
						empty_buff_state_next = EMPTY_BUFF_GRANT;
					end else begin
						if(pb_in_empty[3]) begin
							empty_buff = 2'b11;
							empty_buff_state_next = EMPTY_BUFF_GRANT;
						end
					end
				end
			end
		end
		EMPTY_BUFF_GRANT: begin
			if(empty_buff_req[curr_port]) begin
				empty_buff_grant[curr_port] = 1;
				empty_buff_state_next = EMPTY_BUFF_WAIT1;
			end
			curr_port_next = curr_port_plus_1;


//			if(empty_buff_req0) begin
//				empty_buff_grant0 = 1;
//				granted_buff0 = empty_buff;
//				empty_buff_state_next = EMPTY_BUFF_WAIT1;
//			end else begin
//				if(empty_buff_req1) begin
//					empty_buff_grant1 = 1;
//					granted_buff1 = empty_buff;
///					empty_buff_state_next = EMPTY_BUFF_WAIT1;
//				end else begin
//					if(empty_buff_req2) begin
//						empty_buff_grant2 = 1;
//						granted_buff2 = empty_buff;
//						empty_buff_state_next = EMPTY_BUFF_WAIT1;
//					end else begin
//						if(empty_buff_req3) begin
//							empty_buff_grant3 = 1;
//							granted_buff3 = empty_buff;
//							empty_buff_state_next = EMPTY_BUFF_WAIT1;
//						end
//					end
//				end
//			end
		end
		EMPTY_BUFF_WAIT1: begin
			empty_buff_grant = 0;
			empty_buff_state_next = EMPTY_BUFF_WAIT2;
		end
		EMPTY_BUFF_WAIT2: begin
			empty_buff_grant = 0;
			empty_buff_state_next = EMPTY_BUFF_LOOKUP;
		end
		default: begin
			empty_buff_grant = 0;
			empty_buff_state_next = EMPTY_BUFF_LOOKUP;
		end
	endcase

end

parameter	PORT_STATE_IDLE			= 3'b001,
		PORT_STATE_BUFF_LOOKUP		= 3'b010,
		PORT_STATE_BUFF_REQ		= 3'b011,
		PORT_STATE_TX			= 3'b100,
		PORT_STATE_CANCEL_BUFF_REQ	= 3'b101;

reg [2:0] port_state0;
reg [2:0] port_state1;
reg [2:0] port_state2;
reg [2:0] port_state3;
reg [2:0] port_state_next0;
reg [2:0] port_state_next1;
reg [2:0] port_state_next2;
reg [2:0] port_state_next3;

always @(*) begin
	empty_buff_req0 = 0;
	empty_buff_req1 = 0;
	empty_buff_req2 = 0;
	empty_buff_req3 = 0;
	pb_in_req = 0;
	port_state_next0 = port_state0;
	case(port_state0)
		PORT_STATE_IDLE: begin
			in_ack[0] = 0;
			rx_in_progress[0] = 0;
			if(in_req[0]) begin
				empty_buff_req0 = 1;
				port_state_next0 = PORT_STATE_BUFF_LOOKUP;
			end
		end
		PORT_STATE_BUFF_LOOKUP: begin
			empty_buff_req0 = 1;
			if(empty_buff_grant0) begin
				rx_buff0 = empty_buff;
				empty_buff_req0 = 0;
				pb_in_req[empty_buff] = 1;
				port_state_next0 = PORT_STATE_BUFF_REQ;
			end
		end
		PORT_STATE_BUFF_REQ: begin
			pb_in_req[rx_buff0] = 1;
			if(pb_in_ack[rx_buff0]) begin
				in_ack[0] = 1;
				rx_in_progress[0] = 1;
				port_state_next0 = PORT_STATE_TX;
			end
		end
		PORT_STATE_TX: begin
			pb_in_req[rx_buff0] = 1;
			in_ack[0] = 1;
			rx_in_progress[0] = 1;
			if(!in_req[0]) begin
				port_state_next0 = PORT_STATE_CANCEL_BUFF_REQ;
			end
		end
		PORT_STATE_CANCEL_BUFF_REQ: begin
			if(!pb_in_ack[rx_buff0]) begin
				in_ack[0] = 0;
				port_state_next0 = PORT_STATE_IDLE;
			end
		end
		default: begin
			in_ack[0] = 0;
			rx_in_progress[0] = 0;
			empty_buff_req0 = 0;
			port_state_next0 = PORT_STATE_IDLE;
		end
	endcase

	port_state_next1 = port_state1;
	case(port_state1)
		PORT_STATE_IDLE: begin
			in_ack[1] = 0;
			rx_in_progress[1] = 0;
			if(in_req[1]) begin
				empty_buff_req1 = 1;
				port_state_next1 = PORT_STATE_BUFF_LOOKUP;
			end
		end
		PORT_STATE_BUFF_LOOKUP: begin
			empty_buff_req1 = 1;
			if(empty_buff_grant1) begin
				rx_buff1 = empty_buff;
				empty_buff_req1 = 0;
				pb_in_req[empty_buff] = 1;
				port_state_next1 = PORT_STATE_BUFF_REQ;
			end
		end
		PORT_STATE_BUFF_REQ: begin
			pb_in_req[rx_buff1] = 1;
			if(pb_in_ack[rx_buff1]) begin
				in_ack[1] = 1;
				rx_in_progress[1] = 1;
				port_state_next1 = PORT_STATE_TX;
			end
		end
		PORT_STATE_TX: begin
			pb_in_req[rx_buff1] = 1;
			in_ack[1] = 1;
			rx_in_progress[1] = 1;
			if(!in_req[1]) begin
				port_state_next1 = PORT_STATE_CANCEL_BUFF_REQ;
			end
		end
		PORT_STATE_CANCEL_BUFF_REQ: begin
			if(!pb_in_ack[rx_buff1]) begin
				in_ack[1] = 0;
				port_state_next1 = PORT_STATE_IDLE;
			end
		end
		default: begin
			in_ack[1] = 0;
			rx_in_progress[1] = 0;
			empty_buff_req1 = 0;
			port_state_next1 = PORT_STATE_IDLE;
		end
	endcase

	port_state_next2 = port_state2;
	case(port_state2)
		PORT_STATE_IDLE: begin
			in_ack[2] = 0;
			rx_in_progress[2] = 0;
			if(in_req[2]) begin
				empty_buff_req2 = 1;
				port_state_next2 = PORT_STATE_BUFF_LOOKUP;
			end
		end
		PORT_STATE_BUFF_LOOKUP: begin
			empty_buff_req2 = 1;
			if(empty_buff_grant2) begin
				rx_buff2 = empty_buff;
				pb_in_req[empty_buff] = 1;
				empty_buff_req2 = 0;
				port_state_next2 = PORT_STATE_BUFF_REQ;
			end
		end
		PORT_STATE_BUFF_REQ: begin
			pb_in_req[rx_buff2] = 1;
			if(pb_in_ack[rx_buff2]) begin
				in_ack[2] = 1;
				rx_in_progress[2] = 1;
				port_state_next2 = PORT_STATE_TX;
			end
		end
		PORT_STATE_TX: begin
			pb_in_req[rx_buff2] = 1;
			in_ack[2] = 1;
			rx_in_progress[2] = 1;
			if(!in_req[2]) begin
				port_state_next2 = PORT_STATE_CANCEL_BUFF_REQ;
			end
		end
		PORT_STATE_CANCEL_BUFF_REQ: begin
			if(!pb_in_ack[rx_buff2]) begin
				in_ack[2] = 0;
				port_state_next2 = PORT_STATE_IDLE;
			end
		end
		default: begin
			in_ack[2] = 0;
			empty_buff_req2 = 0;
			rx_in_progress[2] = 0;
			port_state_next2 = PORT_STATE_IDLE;
		end
	endcase

	port_state_next3 = port_state3;
	case(port_state3)
		PORT_STATE_IDLE: begin
			in_ack[3] = 0;
			rx_in_progress[3] = 0;
			if(in_req[3]) begin
				empty_buff_req3 = 1;
				port_state_next3 = PORT_STATE_BUFF_LOOKUP;
			end
		end
		PORT_STATE_BUFF_LOOKUP: begin
			empty_buff_req3 = 1;
			if(empty_buff_grant3) begin
				rx_buff3 = empty_buff;
				pb_in_req[empty_buff] = 1;
				empty_buff_req3 = 0;
				port_state_next3 = PORT_STATE_BUFF_REQ;
			end
		end
		PORT_STATE_BUFF_REQ: begin
			pb_in_req[rx_buff3] = 1;
			if(pb_in_ack[rx_buff3]) begin
				in_ack[3] = 1;
				rx_in_progress[3] = 1;
				port_state_next3 = PORT_STATE_TX;
			end
		end
		PORT_STATE_TX: begin
			pb_in_req[rx_buff3] = 1;
			in_ack[3] = 1;
			rx_in_progress[3] = 1;
			if(!in_req[3]) begin
				port_state_next3 = PORT_STATE_CANCEL_BUFF_REQ;
			end
		end
		PORT_STATE_CANCEL_BUFF_REQ: begin
			if(!pb_in_ack[rx_buff3]) begin
				in_ack[3] = 0;
				port_state_next3 = PORT_STATE_IDLE;
			end
		end
		default: begin
			in_ack[3] = 0;
			empty_buff_req3 = 0;
			rx_in_progress[3] = 0;
			port_state_next3 = PORT_STATE_IDLE;
		end
	endcase
end



always @(posedge clk)
begin
	if(reset) begin
		port_state0 <= 0;
		port_state1 <= 0;
		port_state2 <= 0;
		port_state3 <= 0;
		empty_buff_state <= 0;
		curr_port <= 0;
	end else begin
		port_state0 <= port_state_next0;
		port_state1 <= port_state_next1;
		port_state2 <= port_state_next2;
		port_state3 <= port_state_next3;
		empty_buff_state <= empty_buff_state_next;
		curr_port <= curr_port_next;

		empty_buff_grant0 <= empty_buff_grant[0];
		empty_buff_grant1 <= empty_buff_grant[1];
		empty_buff_grant2 <= empty_buff_grant[2];
		empty_buff_grant3 <= empty_buff_grant[3];

		empty_buff_req[0] <= empty_buff_req0;
		empty_buff_req[1] <= empty_buff_req1;
		empty_buff_req[2] <= empty_buff_req2;
		empty_buff_req[3] <= empty_buff_req3;

		in_req[0] <= in_req0;
		in_req[1] <= in_req1;
		in_req[2] <= in_req2;
		in_req[3] <= in_req3;

		in_ack0 <= in_ack[0];
		in_ack1 <= in_ack[1];
		in_ack2 <= in_ack[2];
		in_ack3 <= in_ack[3];

		pb_in_req0 <= pb_in_req[0];
		pb_in_req1 <= pb_in_req[1];
		pb_in_req2 <= pb_in_req[2];
		pb_in_req3 <= pb_in_req[3];

		pb_in_ack[0] <= pb_in_ack0;
		pb_in_ack[1] <= pb_in_ack1;
		pb_in_ack[2] <= pb_in_ack2;
		pb_in_ack[3] <= pb_in_ack3;

		pb_in_empty[0] <= pb_in_empty0;
		pb_in_empty[1] <= pb_in_empty1;
		pb_in_empty[2] <= pb_in_empty2;
		pb_in_empty[3] <= pb_in_empty3;


		if(rx_in_progress[0]) begin
			pb_in_data[rx_buff0] <= in_data0;
			pb_in_pkt_route[rx_buff0] <= in_pkt_route0;
			pb_in_wr[rx_buff0] <= in_wr0;
		end
		if(rx_in_progress[1]) begin
			pb_in_data[rx_buff1] <= in_data1;
			pb_in_pkt_route[rx_buff1] <= in_pkt_route1;
			pb_in_wr[rx_buff1] <= in_wr1;
		end
		if(rx_in_progress[2]) begin
			pb_in_data[rx_buff2] <= in_data2;
			pb_in_pkt_route[rx_buff2] <= in_pkt_route2;
			pb_in_wr[rx_buff2] <= in_wr2;
		end
		if(rx_in_progress[3]) begin
			pb_in_data[rx_buff3] <= in_data3;
			pb_in_pkt_route[rx_buff3] <= in_pkt_route3;
			pb_in_wr[rx_buff3] <= in_wr3;
		end
	end
end

//wire [35:0] CONTROL1;
//wire [239:0] TRIG0;
/*
chipscope_ila_v1_02_a cs_ila_inswitch (
	.CONTROL(CONTROL1),
	.CLK(clk),
	.TRIG0(TRIG0)
);
*/
assign TRIG0[63:0] = in_data1;
assign TRIG0[71:64] = in_pkt_route1;
assign TRIG0[80] = in_wr1;
assign TRIG0[81] = in_req1;
assign TRIG0[82] = in_ack1;


assign TRIG0[90] = pb_in_wr0;
assign TRIG0[91] = pb_in_req0;
assign TRIG0[92] = pb_in_ack0;
assign TRIG0[93] = pb_in_empty0;

assign TRIG0[100] = pb_in_wr1;
assign TRIG0[101] = pb_in_req1;
assign TRIG0[102] = pb_in_ack1;
assign TRIG0[103] = pb_in_empty1;

assign TRIG0[110] = pb_in_wr2;
assign TRIG0[111] = pb_in_req2;
assign TRIG0[112] = pb_in_ack2;
assign TRIG0[113] = pb_in_empty2;

assign TRIG0[120] = pb_in_wr3;
assign TRIG0[121] = pb_in_req3;
assign TRIG0[122] = pb_in_ack3;
assign TRIG0[123] = pb_in_empty3;

assign TRIG0[131:130] = empty_buff_state;
assign TRIG0[133:132] = empty_buff;

assign TRIG0[135] = empty_buff_req[0];
assign TRIG0[136] = empty_buff_req[1];
assign TRIG0[137] = empty_buff_req[2];
assign TRIG0[138] = empty_buff_req[3];
assign TRIG0[145] = empty_buff_grant[0];
assign TRIG0[146] = empty_buff_grant[1];
assign TRIG0[147] = empty_buff_grant[2];
assign TRIG0[148] = empty_buff_grant[3];

assign TRIG0[151:150] = curr_port;

assign TRIG0[163:160] = rx_in_progress;

assign TRIG0[171:170] = rx_buff0;
assign TRIG0[173:172] = rx_buff1;
assign TRIG0[175:174] = rx_buff2;
assign TRIG0[177:176] = rx_buff3;

assign TRIG0[182:180] = port_state0;
assign TRIG0[185:183] = port_state1;
assign TRIG0[188:186] = port_state2;
assign TRIG0[191:189] = port_state3;


endmodule
