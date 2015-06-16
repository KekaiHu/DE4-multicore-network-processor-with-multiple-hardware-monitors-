//
// Designed by Qiang Wu
//
`timescale 1ns/1ps
`include "NF_2.1_defines.v"
`include "reg_defines_reference_router.v"
`include "registers.v"
module flow_classification
   (
	input       protocol1,
	
	// --- data path interface
	output		[63:0]		out_data0,
	output		[23:0]		out_pkt_route0,
	output				out_wr0,
	output	reg			out_req0,
	input				out_ack0,
	output				out_bypass0,
	output				out_protocol0,
	

	output		[63:0]		out_data1,
	output		[23:0]		out_pkt_route1,
	output				out_wr1,
	output	reg			out_req1,
	input				out_ack1,
	output				out_bypass1,
	output				out_protocol1,
	
	output		[63:0]		out_data2,
	output		[23:0]		out_pkt_route2,
	output				out_wr2,
	output	reg			out_req2,
	input				out_ack2,
	output				out_bypass2,
	output				out_protocol2,
	
	output		[63:0]		out_data3,
	output		[23:0]		out_pkt_route3,
	output				out_wr3,
	output	reg			out_req3,
	input				out_ack3,
	output				out_bypass3,
	output				out_protocol3,

    input  [63:0]            in_data,
    input  [7:0]            in_ctrl,
    input                    in_wr,
    output                    in_rdy,

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
    input                              reset,
	 
	 output                          ppu3_sel,
	 output    								protocol_signal
);

assign reg_req_out = reg_req_in;
assign reg_ack_out = reg_ack_in;
assign reg_rd_wr_L_out = reg_rd_wr_L_in;
assign reg_addr_out = reg_addr_in;
assign reg_data_out = reg_data_in;
assign reg_src_out = reg_src_in;

reg [63:0] out_data[3:0];
reg [23:0] out_pkt_route[3:0];
reg [3:0] out_wr;
reg [3:0] out_req;
reg [3:0] out_ack;
reg [3:0] out_bypass;

assign out_data0 = out_data[0];
assign out_data1 = out_data[1];
assign out_data2 = out_data[2];
assign out_data3 = out_data[3];

assign out_pkt_route0 = out_pkt_route[0];
assign out_pkt_route1 = out_pkt_route[1];
assign out_pkt_route2 = out_pkt_route[2];
assign out_pkt_route3 = out_pkt_route[3];

assign out_wr0 = out_wr[0];
assign out_wr1 = out_wr[1];
assign out_wr2 = out_wr[2];
assign out_wr3 = out_wr[3];

assign out_bypass0 = out_bypass[0];
assign out_bypass1 = out_bypass[1];
assign out_bypass2 = out_bypass[2];
assign out_bypass3 = out_bypass[3];

reg in_rdy_reg;
assign in_rdy = in_rdy_reg;
reg wr_curr;
reg wr_prev;
wire eop;
assign eop = ((wr_curr == 0) && (wr_prev != 0)) ? 1 : 0;
// Added by Hari
reg [2:0] state_protocol;
reg [2:0] state_protocol_next;
parameter PRO_IDLE =3'b000,
PRO_FIND1= 3'b001,
PRO_FIND2= 3'b010,
PRO_FIND3= 3'b011,
PRO_FIND4 = 3'b100;
reg [7:0] protocol;
reg new_packet_signal;
reg protocol_signal_reg;
reg [3:0] protocol_signal_reg_4core;
// Added by Hari
reg [2:0] state;
reg [2:0] state_next;
parameter	FC_IDLE		= 3'b001,
		FC_LOOKUP_ROUTE	= 3'b010,
		FC_REQ		= 3'b011,
		FC_ACK		= 3'b100,
		FC_TX		= 3'b101,
		FC_CANCEL_REQ	= 3'b110,
		FC_WAIT_ACK	= 3'b111;
reg [1:0] pkt_count;
wire [1:0] pkt_count_plus_1;
assign pkt_count_plus_1 = (pkt_count == 2'b11) ? 0 : pkt_count + 1;
//assign pkt_count_plus_1 = (pkt_count == 2'b00) ? 0 : pkt_count + 1;


reg [1:0] curr_output;

reg ppu3_sel_reg;
assign ppu3_sel = ppu3_sel_reg;
//assign curr_output = pkt_count[1];

always @(*) begin
	out_req = 0;
	in_rdy_reg = 0;
	state_next = state;
	case(state)
		FC_IDLE: begin
		//	curr_output = 0;
			out_req = 0;
			in_rdy_reg = 0;
			state_next = FC_LOOKUP_ROUTE;
			new_packet_signal = 0;
		end
		FC_LOOKUP_ROUTE: begin
			curr_output = pkt_count;
			if(pkt_count == 2'b00) begin
				out_pkt_route[curr_output] = 24'b000_000_000_000_000_000_000_011;
				out_bypass[curr_output] = 1;
			end 
			if(pkt_count == 2'b01) begin
				out_pkt_route[curr_output] = 24'b000_000_000_000_000_000_000_011;
				out_bypass[curr_output] = 1;
			end
			if(pkt_count == 2'b10) begin
				out_pkt_route[curr_output] = 24'b000_000_000_000_000_000_000_011;
				out_bypass[curr_output] = 1;
			end
			if(pkt_count == 2'b11) begin
				out_pkt_route[curr_output] = 24'b000_000_000_000_000_000_000_011;
				out_bypass[curr_output] = 1;
			end
			state_next = FC_REQ;
		end
		FC_REQ: begin
			out_req[curr_output] = 1;
			state_next = FC_ACK;
		end
		FC_ACK: begin
			out_req[curr_output] = 1;
			if(out_ack[curr_output]) begin
				state_next = FC_TX;
				new_packet_signal =1;
			end
		end
		FC_TX: begin
			new_packet_signal = 0;
			out_req[curr_output] = 1;
			in_rdy_reg = 1;
			if(eop) begin
				in_rdy_reg = 0;
				state_next = FC_CANCEL_REQ;
			end
		end
		FC_CANCEL_REQ: begin
			in_rdy_reg = 0;
			out_req[curr_output] = 0;
			state_next = FC_WAIT_ACK;
		end
		FC_WAIT_ACK: begin
			if(!out_ack[curr_output]) begin
				state_next = FC_IDLE;
			end
		end
		default: begin
			state_next = FC_IDLE;
		end
	endcase
end

always @(posedge clk) begin
	if(reset) begin
		state <= 0;
		pkt_count <= 2'b0;
	end else begin
		state <= state_next;
		out_req0 <= out_req[0];
		out_req1 <= out_req[1];
		out_req2 <= out_req[2];
		out_req3 <= out_req[3];
		out_ack[0] <= out_ack0;
		out_ack[1] <= out_ack1;
		out_ack[2] <= out_ack2;
		out_ack[3] <= out_ack3;
		


		out_data[curr_output] <= in_data;
		out_wr[curr_output] <= in_wr;
		wr_prev <= wr_curr;
		wr_curr <= in_wr;

		if(state == FC_IDLE) begin
			pkt_count <= pkt_count_plus_1;
		end
	end
end

always@(*)begin
	state_protocol_next = state_protocol;
case(state_protocol)
		PRO_IDLE: begin
		//	curr_output = 0;
			if(new_packet_signal)
			state_protocol_next = PRO_FIND1;
			else
			state_protocol_next = PRO_IDLE;
		end
		PRO_FIND1: begin
		//	curr_output = 0;
		if(in_wr)
		state_protocol_next = PRO_FIND2;
		end
		PRO_FIND2: begin
		state_protocol_next = PRO_FIND3;
		end
		PRO_FIND3: begin
		state_protocol_next = PRO_FIND4;
		end			
		PRO_FIND4: begin
		//	curr_output = 0;
		protocol[7:0] = in_data[7:0];
		state_protocol_next = PRO_IDLE;
		//This is the original protocol bit that use to tell tcp or udp
			/*if(in_data[7:0] == 8'h11) begin
				protocol_signal_reg = 1'b1;
				protocol_signal_reg_4core[curr_output] = 1'b1;
			end	
			else begin
				protocol_signal_reg = 1'b0;  // this was changed just to check for working "Hari" get it back to 1'b0 later
				protocol_signal_reg_4core[curr_output] = 1'b0;
			end*/
		//In the application switch design, protocol bit is used to decide which application is selected in each ppu, this is an input from outside
        	if(protocol1 == 1'b1) begin
				protocol_signal_reg = 1'b0;
				protocol_signal_reg_4core[0] = 1'b1;
				protocol_signal_reg_4core[1] = 1'b1;
				protocol_signal_reg_4core[2] = 1'b0;
				protocol_signal_reg_4core[3] = 1'b0;
				ppu3_sel_reg = 1'b0;
			end	
			else begin
				protocol_signal_reg = 1'b1;  // this was changed just to check for working "Hari" get it back to 1'b0 later
				protocol_signal_reg_4core[0] = 1'b1;
				protocol_signal_reg_4core[1] = 1'b1;
				protocol_signal_reg_4core[2] = 1'b1;
				protocol_signal_reg_4core[3] = 1'b0;
				ppu3_sel_reg = 1'b1;
			end	
		end
endcase
end

assign protocol_signal = protocol_signal_reg;

always @(posedge clk) begin
	if(reset) begin
		state_protocol <= 0;
	end else begin
		state_protocol <= state_protocol_next;
	end
end

assign out_protocol0 = protocol_signal_reg_4core[0];
assign out_protocol1 = protocol_signal_reg_4core[1];
assign out_protocol2 = protocol_signal_reg_4core[2];
assign out_protocol3 = protocol_signal_reg_4core[3];

wire [35:0] CONTROL0;
wire [239:0] TRIG0;
/*
chipscope_icon_v1_03_a cs_icon (
	        .CONTROL0(CONTROL0)
	);

	chipscope_ila_v1_02_a cs_ila (
		        .CONTROL(CONTROL0),
			        .CLK(clk),
				        .TRIG0(TRIG0)
				);

assign TRIG0[63:0] = in_data;
assign TRIG0[71:64] = in_ctrl;
assign TRIG0[80] = in_wr;
assign TRIG0[81] = in_rdy;
assign TRIG0[89:82] = out_data1[7:0];
assign TRIG0[98:90] = out_pkt_route1[8:0];
assign TRIG0[163:100] = out_data0;
assign TRIG0[179:164] = out_pkt_route0;
assign TRIG0[180] = out_wr0;
assign TRIG0[181] = out_req0;
assign TRIG0[182] = out_ack0;
assign TRIG0[183] = out_bypass0;
assign TRIG0[184] = out_wr1;
assign TRIG0[185] = out_req1;
assign TRIG0[186] = out_ack1;
assign TRIG0[187] = out_bypass1;
assign TRIG0[202:200] = state;
assign TRIG0[205:203] = state_next;
assign TRIG0[206] = eop;
*/

endmodule
