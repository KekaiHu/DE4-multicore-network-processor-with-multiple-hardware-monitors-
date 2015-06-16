//
// Designed by Qiang Wu
//

`timescale 1ns/1ps

module packet_buffer_bypass(
	input			clk,
	input			reset,
	output		[239:0]	TRIG0,

	input		[63:0]	in_data,
	input		[23:0]	in_pkt_route,
	input			in_wr,
	output	reg		in_empty,
	input			in_req,
	output	reg		in_ack,

	output	reg	[63:0]	out_data,
	output	reg	[23:0]	out_pkt_route,
	output	reg		out_wr,
	output	reg		out_req,
	input			out_ack,
	output	reg	[1:0]	out_neighbor,
	output	reg		out_bop,
	output	reg		out_eop,
	input			out_rdy,
	output	reg		out_bypass
);

reg wea;
reg web;
reg [8:0] addra;
reg [8:0] addrb;
reg [31:0] dia;
reg [31:0] dib;
wire [31:0] doa;
wire [31:0] dob;
wire [3:0]  dipa;
wire [3:0]  dipb;

RAMB16_S36_S36 pm(
	.DOA	(doa),
	.DOB	(dob),
	.DOPA	(),
	.DOPB	(),
	.ADDRA	(addra),
	.ADDRB	(addrb),
	.CLKA	(clk),
	.CLKB	(clk),
	.DIA	(dia),
	.DIB	(dib),
	.DIPA	(dipa),
	.DIPB	(dipb),
	.ENA	(1'b1),
	.ENB	(1'b1),
	.SSRA	(reset),
	.SSRB	(reset),
	.WEA	(wea),
	.WEB	(web)
); 

reg [7:0] pkt_len;
reg [7:0] send_len;

parameter	BUFF_EMPTY		= 3'b001,
		BUFF_RECV_PKT		= 3'b010,
		BUFF_SEND_REQ		= 3'b100,
		BUFF_SEND_PKT		= 3'b101,
		BUFF_SEND_CANCEL	= 3'b110;
wire eop;
reg state_idle;
reg state_pkt_send;
reg need_process;

reg [2:0] buff_state;
reg [2:0] buff_state_next;

always @(*)
begin
	buff_state_next = buff_state;
	in_ack = 0;
	out_req = 0;
	in_empty = 0;
	{wea, web} = 2'b00;
	out_wr = 0;
	state_idle = 0;
	state_pkt_send = 0;
	case(buff_state)
		BUFF_EMPTY: begin
			state_idle = 1;
			if(in_req) begin
				in_ack = 1;
				buff_state_next = BUFF_RECV_PKT;
			end else begin
				in_empty = 1;
			end
		end
		BUFF_RECV_PKT: begin
			in_ack = 1;
			if(in_wr) begin
				{wea, web} = 2'b11;
				{dia, dib} = in_data;
				addra = {pkt_len, 1'b0};
				addrb = {pkt_len, 1'b1};
				out_neighbor = in_pkt_route[1:0];
				out_bypass = in_pkt_route[5];
				out_pkt_route = {3'b000, in_pkt_route[23:3]};
			end
			if(!in_req) begin
				buff_state_next = BUFF_SEND_REQ;
			end
		end

		BUFF_SEND_REQ: begin
			out_req = 1;
			if(out_ack) begin
				buff_state_next = BUFF_SEND_PKT;
			end
		end

		BUFF_SEND_PKT: begin
			out_req = 1;
			state_pkt_send = 1;
			if(out_rdy) begin
				if(send_len <= pkt_len+1) begin
					addra = {send_len, 1'b0};
					addrb = {send_len, 1'b1};
					out_data = {doa, dob};
					out_wr = (send_len < 1) ? 0 : (send_len > pkt_len) ? 0 : 1;
					out_bop = (send_len == 1) ? 1 : 0;
					out_eop = (send_len == pkt_len) ? 1 : 0;
				end
			end
			if(eop) begin
				buff_state_next = BUFF_SEND_CANCEL;
			end
		end

		BUFF_SEND_CANCEL: begin
			out_req = 0;
			if(!out_ack) begin
				buff_state_next = BUFF_EMPTY;
			end
		end

		default: begin
			buff_state_next = BUFF_EMPTY;
		end
	endcase
end


always @(posedge clk)
begin
	if(reset) begin
		buff_state <= 0;
	end else begin
		buff_state <= buff_state_next;
	end

	if(state_idle) begin
		pkt_len <= 0;
		send_len <= 0;
	end
	if(in_wr) begin
		pkt_len <= pkt_len + 1'b1;
	end

	if(state_pkt_send && out_rdy) begin
		send_len <= send_len + 1'b1;
	end
end

assign eop = (send_len == pkt_len+1) ? 1 : 0;


assign TRIG0[63:0] = in_data;
assign TRIG0[79:64] = in_pkt_route;
assign TRIG0[80] = in_wr;
assign TRIG0[81] = in_empty;
assign TRIG0[82] = in_req;
assign TRIG0[83] = in_ack;

assign TRIG0[147:84] = out_data;
assign TRIG0[163:148] = out_pkt_route;
assign TRIG0[164] = out_wr;
assign TRIG0[165] = out_req;
assign TRIG0[166] = out_ack;
assign TRIG0[168:167] = out_neighbor;
assign TRIG0[169] = out_bop;
assign TRIG0[170] = out_eop;
assign TRIG0[171] = out_rdy;

assign TRIG0[175:172] = dia[7:4];
assign TRIG0[179:176] = doa[7:4];

assign TRIG0[207:200] = pkt_len;
assign TRIG0[217:210] = send_len;
assign TRIG0[218] = eop;
assign TRIG0[219] = state_idle;
assign TRIG0[220] = state_pkt_send;

assign TRIG0[232:230] = buff_state;


endmodule
