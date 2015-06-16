//
// Designed by Qiang Wu
//

`timescale 1ns/1ps
`include "yf32_define.v"
module thread_ctrl(
	input			clk,
	input			reset,
	output		[1:0]	thread_id,
	input		[3:0]	pq_req,
	output	reg		context_save,
	output	reg		context_restore,
	output	reg		freeze_proc,
	input			pause_mult,
	input			pause_ctrl,
	input			thread_giveup,
	output	reg		detachmem,
	output	reg		lock_pipeline
);

parameter	MAX_CREDIT0	=	11'b01000000000,
		MAX_CREDIT1	=	11'b01000000000,
		MAX_CREDIT2	=	11'b01000000000,
		MAX_CREDIT3	=	11'b01000000000;

//parameter	MAX_CREDIT0	=	11'b0001000000,
//		MAX_CREDIT1	=	11'b0010000000,
//		MAX_CREDIT2	=	11'b0100000000,
//		MAX_CREDIT3	=	11'b1001000000;

reg	[4:0]	thread_priority0;
reg	[4:0]	thread_priority1;
reg	[4:0]	thread_priority2;
reg	[4:0]	thread_priority3;

//parameter	THREAD_PRIORITY0	=	5'b01000,
//		THREAD_PRIORITY1	=	5'b01000,
//		THREAD_PRIORITY2	=	5'b01000,
//		THREAD_PRIORITY3	=	5'b01000;

reg	[15:0]	credit_vector0;
reg	[15:0]	credit_vector1;
reg	[15:0]	credit_vector2;
reg	[15:0]	credit_vector3;
wire	[15:0]	credit_vector_next0;
wire	[15:0]	credit_vector_next1;
wire	[15:0]	credit_vector_next2;
wire	[15:0]	credit_vector_next3;
wire		preempt0;
wire		preempt1;
wire		preempt2;
wire		preempt3;
wire	[15:0]	credit_vector_dec0;
assign credit_vector_dec0 = (credit_vector0[15:5] > 0) ? (credit_vector0 - 6'b100000 + thread_priority0): credit_vector0 ;
wire	[15:0]	credit_vector_dec1;
assign credit_vector_dec1 = (credit_vector1[15:5] > 0) ? (credit_vector1 - 6'b100000 + thread_priority1): credit_vector1  ;
wire	[15:0]	credit_vector_dec2;
assign credit_vector_dec2 = (credit_vector2[15:5] > 0) ? (credit_vector2 - 6'b100000 + thread_priority2): credit_vector2  ;
wire	[15:0]	credit_vector_dec3;
assign credit_vector_dec3 = (credit_vector3[15:5] > 0) ? (credit_vector3 - 6'b100000 + thread_priority3): credit_vector3  ;

assign credit_vector_next0 = (thread_id == 2'b00) ? credit_vector_dec0 : 
			(credit_vector0[15:5] < MAX_CREDIT0) ? (credit_vector0 + thread_priority0) : credit_vector0;
assign credit_vector_next1 = (thread_id == 2'b01) ? credit_vector_dec1 : 
			(credit_vector1[15:5] < MAX_CREDIT1) ? (credit_vector1 + thread_priority1) : credit_vector1;
assign credit_vector_next2 = (thread_id == 2'b10) ? credit_vector_dec2 : 
			(credit_vector2[15:5] < MAX_CREDIT2) ? (credit_vector2 + thread_priority2) : credit_vector2;
assign credit_vector_next3 = (thread_id == 2'b11) ? credit_vector_dec3 : 
			(credit_vector3[15:5] < MAX_CREDIT3) ? (credit_vector3 + thread_priority3) : credit_vector3;
assign preempt0 = (credit_vector0[15:5] <= 11'b00000010100) ? 1 : 0;
assign preempt1 = (credit_vector1[15:5] <= 11'b00000010100) ? 1 : 0;
assign preempt2 = (credit_vector2[15:5] <= 11'b00000010100) ? 1 : 0;
assign preempt3 = (credit_vector3[15:5] <= 11'b00000010100) ? 1 : 0;

wire	[10:0]	credit0;
wire	[10:0]	credit1;
wire	[10:0]	credit2;
wire	[10:0]	credit3;
assign credit0 = credit_vector0[15:5];
assign credit1 = credit_vector1[15:5];
assign credit2 = credit_vector2[15:5];
assign credit3 = credit_vector3[15:5];

always @(posedge clk) begin
	if(reset) begin
		credit_vector0 <= {11'b00100000000,5'b00000};
		credit_vector1 <= {11'b00100000000,5'b00000};
		credit_vector2 <= {11'b00100000000,5'b00000};
		credit_vector3 <= {11'b00100000000,5'b00000};
	end else begin
		credit_vector0 <= credit_vector_next0;
		credit_vector1 <= credit_vector_next1;
		credit_vector2 <= credit_vector_next2;
		credit_vector3 <= credit_vector_next3;
	end
end

always @(*) begin
	if(reset) begin
		thread_priority0 = 5'b00010;
		thread_priority1 = 5'b00100;
		thread_priority2 = 5'b01000;
		thread_priority3 = 5'b10010;
	end else begin
		case(pq_req)
			4'b1110 : begin
				thread_priority0 = 5'b01000;
				thread_priority1 = 5'b01011;
				thread_priority2 = 5'b01011;
				thread_priority3 = 5'b01010;
			end
			4'b1100 : begin
				thread_priority0 = 5'b01000;
				thread_priority1 = 5'b01000;
				thread_priority2 = 5'b10000;
				thread_priority3 = 5'b10000;
			end
			default: begin
				thread_priority0 = 5'b00010;
				thread_priority1 = 5'b00100;
				thread_priority2 = 5'b01000;
				thread_priority3 = 5'b10010;
			end
		endcase
	end
end
wire	w0ge1;
wire	w0ge2;
wire	w0ge3;
wire	w1ge2;
wire	w1ge3;
wire	w2ge3;
assign w0ge1 = (credit_vector0[15:5] >= credit_vector1[15:5])? 1 : 0;
assign w0ge2 = (credit_vector0[15:5] >= credit_vector2[15:5])? 1 : 0;
assign w0ge3 = (credit_vector0[15:5] >= credit_vector3[15:5])? 1 : 0;
assign w1ge2 = (credit_vector1[15:5] >= credit_vector2[15:5])? 1 : 0;
assign w1ge3 = (credit_vector1[15:5] >= credit_vector3[15:5])? 1 : 0;
assign w2ge3 = (credit_vector2[15:5] >= credit_vector3[15:5])? 1 : 0;

wire	[5:0]	wvalue;
assign wvalue[0] = w0ge1;
assign wvalue[1] = w0ge2;
assign wvalue[2] = w0ge3;
assign wvalue[3] = w1ge2;
assign wvalue[4] = w1ge3;
assign wvalue[5] = w2ge3;

reg		no_thread_available;
reg	[1:0]	next_thread;

always @(*) begin
	no_thread_available = 0;
	next_thread = 0;
	case(pq_req)
		4'b0000: begin
			no_thread_available = 1;
			next_thread = 2'b00;
		end
		4'b0001: begin
			next_thread = 2'b00;
		end
		4'b0010: begin
			next_thread = 2'b01;
		end
		4'b0011: begin
			if(wvalue[0]) begin
				next_thread = 2'b00;
			end else begin
				next_thread = 2'b01;
			end
		end
		4'b0100: begin
			next_thread = 2'b10;
		end
		4'b0101: begin
			if(wvalue[1]) begin
				next_thread = 2'b00;
			end else begin
				next_thread = 2'b10;
			end
		end
		4'b0110: begin
			if(wvalue[3]) begin
				next_thread = 2'b01;
			end else begin
				next_thread = 2'b10;
			end
		end
		4'b0111: begin
			case({wvalue[3],wvalue[1],wvalue[0]})
				3'b000: begin
					next_thread = 2'b10;
				end
				3'b001: begin
					next_thread = 2'b10;
				end
				3'b011: begin
					next_thread = 2'b00;
				end
				3'b100: begin
					next_thread = 2'b01;
				end
				3'b110: begin
					next_thread = 2'b01;
				end
				3'b111: begin
					next_thread = 2'b00;
				end
				default: begin
					next_thread = 2'b00;
					no_thread_available = 1;
				end
			endcase
		end
		4'b1000: begin
			next_thread = 2'b11;
		end
		4'b1001: begin
			if(wvalue[2]) begin
				next_thread = 2'b00;
			end else begin
				next_thread = 2'b11;
			end
		end
		4'b1010: begin
			if(wvalue[4]) begin
				next_thread = 2'b01;
			end else begin
				next_thread = 2'b11;
			end
		end
		4'b1011: begin
			case({wvalue[4],wvalue[2],wvalue[0]})
				3'b000: begin
					next_thread = 2'b11;
				end
				3'b001: begin
					next_thread = 2'b11;
				end
				3'b011: begin
					next_thread = 2'b00;
				end
				3'b100: begin
					next_thread = 2'b01;
				end
				3'b110: begin
					next_thread = 2'b01;
				end
				3'b111: begin
					next_thread = 2'b00;
				end
				default: begin
					next_thread = 2'b00;
					no_thread_available = 1;
				end
			endcase
		end
		4'b1100: begin
			if(wvalue[5]) begin
				next_thread = 2'b10;
			end else begin
				next_thread = 2'b11;
			end
		end
		4'b1101: begin
			case({wvalue[5],wvalue[2],wvalue[1]})
				3'b000: begin
					next_thread = 2'b11;
				end
				3'b001: begin
					next_thread = 2'b11;
				end
				3'b011: begin
					next_thread = 2'b00;
				end
				3'b100: begin
					next_thread = 2'b10;
				end
				3'b110: begin
					next_thread = 2'b10;
				end
				3'b111: begin
					next_thread = 2'b00;
				end
				default: begin
					next_thread = 2'b00;
					no_thread_available = 1;
				end
			endcase
		end
		4'b1110: begin
			case({wvalue[5],wvalue[4],wvalue[3]})
				3'b000: begin
					next_thread = 2'b11;
				end
				3'b001: begin
					next_thread = 2'b11;
				end
				3'b011: begin
					next_thread = 2'b01;
				end
				3'b100: begin
					next_thread = 2'b10;
				end
				3'b110: begin
					next_thread = 2'b10;
				end
				3'b111: begin
					next_thread = 2'b01;
				end
				default: begin
					next_thread = 2'b00;
					no_thread_available = 1;
				end
			endcase
		end
		4'b1111: begin
			case(wvalue)
				6'b000000: begin
					next_thread = 2'b11;
				end
				6'b000001: begin
					next_thread = 2'b11;
				end
				6'b000011: begin
					next_thread = 2'b11;
				end
				6'b000111: begin
					next_thread = 2'b00;
				end
				6'b001000: begin
					next_thread = 2'b11;
				end
				6'b001010: begin
					next_thread = 2'b11;
				end
				6'b001011: begin
					next_thread = 2'b11;
				end
				6'b001111: begin
					next_thread = 2'b00;
				end
				6'b011000: begin
					next_thread = 2'b01;
				end
				6'b011010: begin
					next_thread = 2'b01;
				end
				6'b011110: begin
					next_thread = 2'b01;
				end
				6'b011111: begin
					next_thread = 2'b00;
				end
				6'b100000: begin
					next_thread = 2'b10;
				end
				6'b100001: begin
					next_thread = 2'b10;
				end
				6'b100101: begin
					next_thread = 2'b10;
				end
				6'b100111: begin
					next_thread = 2'b00;
				end
				6'b110000: begin
					next_thread = 2'b10;
				end
				6'b110100: begin
					next_thread = 2'b10;
				end
				6'b110101: begin
					next_thread = 2'b10;
				end
				6'b110111: begin
					next_thread = 2'b00;
				end
				6'b111000: begin
					next_thread = 2'b01;
				end
				6'b111100: begin
					next_thread = 2'b01;
				end
				6'b111110: begin
					next_thread = 2'b01;
				end
				6'b111111: begin
					next_thread = 2'b00;
				end
				default: begin
					next_thread = 2'b00;
					no_thread_available = 1;
				end
			endcase
		end
	endcase
end

wire preempt;

parameter	THREAD_STATE_INIT		=	4'b0000,
		THREAD_STATE_WAITFORPAUSE	=	4'b0001,
		THREAD_STATE_FREEZE		=	4'b0010,
		THREAD_STATE_SAVECONTEXT	=	4'b0011,
		THREAD_STATE_DETACHMEM		=	4'b0100,
		THREAD_STATE_SELECT		=	4'b0101,
		THREAD_STATE_RESTORECONTEXT	=	4'b0110,
		THREAD_STATE_CALMDOWN		=	4'b0111,
		THREAD_STATE_EXECUTING		=	4'b1000;

reg set_timer;
reg [10:0] new_timer;

wire scheduler_timer_expire;
reg [10:0] scheduler_timer;
wire [10:0] scheduler_timer_dec;
assign scheduler_timer_dec = (scheduler_timer_expire == 1'b1) ? 0 : (scheduler_timer - 1'b1);
assign scheduler_timer_expire = (scheduler_timer == 11'b00000000000) ? 1'b1 : 1'b0;

reg [2:0] delay;
reg [2:0] delay_next;
wire [2:0] delay_plus_1;
assign delay_plus_1 = (delay == 3'b111) ? 0 : delay + 1'b1;

reg [1:0] current_thread;
reg [1:0] current_thread_next;
wire [1:0] current_thread_plus_1;
assign current_thread_plus_1 = (current_thread == 2'b11) ? 0 : current_thread + 1'b1;

assign thread_id = current_thread;

reg [3:0] tc_state;
reg [3:0] tc_state_next;

always @(*)
begin
	set_timer = 0;
	new_timer = 0;
	freeze_proc = 1;
	lock_pipeline = 1;
	detachmem = 0;
	context_save = 0;
	context_restore = 0;
	delay_next = delay;
	current_thread_next = current_thread;
	tc_state_next = tc_state;
	case(tc_state)
		THREAD_STATE_INIT: begin
			tc_state_next = THREAD_STATE_EXECUTING;
		end

		THREAD_STATE_WAITFORPAUSE: begin
			if(pause_mult == 1'b0) begin
				tc_state_next = THREAD_STATE_FREEZE;
			end
		end

		THREAD_STATE_FREEZE: begin
			tc_state_next = THREAD_STATE_SAVECONTEXT;
		end

		THREAD_STATE_SAVECONTEXT: begin
			context_save = 1;
			tc_state_next = THREAD_STATE_DETACHMEM;
		end

		THREAD_STATE_DETACHMEM: begin
			detachmem = 1;
			tc_state_next = THREAD_STATE_SELECT;
		end

		THREAD_STATE_SELECT: begin
			detachmem = 1;
			if(no_thread_available == 1'b0) begin
				set_timer = 1;
				current_thread_next = next_thread;
				delay_next = 0;
				tc_state_next = THREAD_STATE_RESTORECONTEXT;
				case(next_thread)
					2'b00: begin
						new_timer = credit_vector0[15:5];
					end
					2'b01: begin
						new_timer = credit_vector1[15:5];
					end
					2'b10: begin
						new_timer = credit_vector2[15:5];
					end
					2'b11: begin
						new_timer = credit_vector3[15:5];
					end
				endcase
			end
		end

		THREAD_STATE_RESTORECONTEXT: begin
			detachmem = 1;
			lock_pipeline = 0;
			context_restore = 1;
			delay_next = delay_plus_1;
			if(delay == 3'b100) begin
				delay_next = 0;
				tc_state_next = THREAD_STATE_CALMDOWN;
			end
		end

		THREAD_STATE_CALMDOWN: begin
			delay_next = delay_plus_1;
			if(delay == 3'b011) begin
				tc_state_next = THREAD_STATE_EXECUTING;
			end
		end

		THREAD_STATE_EXECUTING: begin
			freeze_proc = 0;
			lock_pipeline = 0;
			delay_next = 0;
			if((preempt == 1'b1)) begin
				tc_state_next = THREAD_STATE_WAITFORPAUSE;
			end
		end

		default: begin
			tc_state_next = THREAD_STATE_WAITFORPAUSE;
		end
	endcase
end


always @(posedge clk)
begin
	if(reset) begin
		tc_state <= THREAD_STATE_INIT;
		current_thread <= 0;
		scheduler_timer <= 11'b00100000000;
		delay <= 0;
	end else begin
		tc_state <= tc_state_next;
		current_thread <= current_thread_next;
		if(set_timer == 1'b1) begin
			scheduler_timer <= new_timer;
		end else begin
			scheduler_timer <= scheduler_timer_dec;
		end
		delay <= delay_next;
	end
end

assign preempt = (thread_id == 2'b00) ?  (preempt0 | thread_giveup ) :
		(thread_id == 2'b01) ?  (preempt1 | thread_giveup ) :
		(thread_id == 2'b10) ?  (preempt2 | thread_giveup ) :
		(preempt3 | thread_giveup ) ;

endmodule
