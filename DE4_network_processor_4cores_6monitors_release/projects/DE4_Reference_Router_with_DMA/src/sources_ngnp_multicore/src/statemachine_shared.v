module statemachine_shared(
input clk,
input statemac_clk,
input [3:0] four_bit_hash0,
input [3:0] four_bit_hash1,
input [3:0] four_bit_hash2,
input [3:0] four_bit_hash3,
input [11:0] pcin_0,
input [11:0] pcin_1,
input [11:0] pcin_2,
input [11:0] pcin_3,
input new_inst_signal0,
input new_inst_signal1,
input new_inst_signal2,
input new_inst_signal3,
input reset,
output packet_drop_signal0,
output packet_drop_signal1,
output packet_drop_signal2,
output packet_drop_signal3
);

reg [3:0] four_bit_hash;
wire [3:0] four_bit_hash_new [3:0];
reg [10:0] state_reg_new [3:0];
reg [10:0] next_state_new [3:0];
reg [10:0] state_reg,next_state;
reg [9:0] pc;
reg packet_drop_signal_register;
reg packet_drop_signal_out [3:0];
wire [3:0] state_signal;
reg [3:0] state_signal_next;
reg inst_sig_shift[3:0];

reg [10:0] state_reg_zero,state_reg_one,state_reg_two,state_reg_three;
reg [10:0] next_state_zero,next_state_two,next_state_three,next_state_one;
reg [10:0] next_state_zero_register,next_state_one_register,next_state_two_register,next_state_three_register;
reg [10:0] next_address_zero,next_address_one,next_address_two,next_address_three;
reg [10:0] next_address_zero_reg,next_address_one_reg,next_address_two_reg,next_address_three_reg;
reg next_state_zero_changed,next_state_one_changed,next_state_two_changed,next_state_three_changed;
reg [9:0] address_a,address_b;
wire [3:0] four_bit_hash_zero,four_bit_hash_one;
reg [3:0] four_bit_hash_two,four_bit_hash_three;
reg packet_drop_signal_register_zero,packet_drop_signal_register_one,packet_drop_signal_register_two,packet_drop_signal_register_three;
wire [3:0] four_bit_hash_out_one,four_bit_hash_out_two;
reg packet_drop_signal_rom_zero,packet_drop_signal_rom_one,packet_drop_signal_rom_two,packet_drop_signal_rom_three;
reg [3:0] four_bit_hash2_shift,four_bit_hash3_shift;
reg [10:0] next_state_two_shift_register,next_state_three_shift_register;
reg [10:0] next_address_zero_changed,next_address_one_changed,next_address_two_changed,next_address_three_changed;
reg new_inst_signal0_shift,new_inst_signal1_shift,new_inst_signal2_shift,new_inst_signal3_shift;
reg [3:0] four_bit_hash_out_core_zero,four_bit_hash_out_core_one,four_bit_hash_out_core_two,four_bit_hash_out_core_three;
reg [10:0] next_address_one_reg_copy,next_address_one_reg_copy_again;
reg [10:0] next_address_zero_reg_copy,next_address_zero_reg_copy_again;
reg [10:0] next_address_two_reg_copy,next_address_two_reg_copy_again;
reg [10:0] next_address_three_reg_copy,next_address_three_reg_copy_again;
reg check_one,inside_signal;
reg [10:0] next_address_zero_reg_replica,next_address_one_reg_replica,next_address_two_reg_replica,next_address_three_reg_replica;
reg inst_sig_shift2_again,inst_sig_shift3_again;
reg packet_drop_signal_rom_zero_xor,packet_drop_signal_rom_one_xor,packet_drop_signal_rom_two_xor,packet_drop_signal_rom_three_xor;
reg packet_drop_signal_rom_zero_xor0,packet_drop_signal_rom_one_xor1,packet_drop_signal_rom_two_xor2,packet_drop_signal_rom_three_xor3;
wire [9:0] pc_0,pc_1;
reg [9:0] pc_2,pc_3;
wire test_drop_zero,test_drop_two,test_drop_one,test_drop_three;	
	//`define 1000 = 1000;

	always @(posedge statemac_clk) begin	
		if (reset) begin
			next_state_zero_register = next_state_zero;
			next_state_one_register = next_state_one;
			next_state_two_register = next_state_two;
			next_state_three_register = next_state_three;
			state_reg_zero = 0;
			state_reg_two = 0;
			state_reg_three = 0;
			state_reg_one = 0;
		//	state_signal = 4'b0;
			address_a = 0;
			address_b = 0;
			next_address_zero_reg = 0;
			next_address_zero = 0;
			next_address_one_reg = 0;
			next_address_one = 0;
			next_address_two_reg = 0;
			next_address_two = 0;
			next_address_three_reg = 0;
			next_address_three = 0;
			packet_drop_signal_rom_zero = 0;
			packet_drop_signal_rom_one = 0;
			packet_drop_signal_rom_two = 0;
			packet_drop_signal_rom_three = 0;
			next_state_zero_register =0;
			next_state_one_register =0;
			next_state_two_register =0;
			next_state_three_register =0;
			next_address_one_changed =0;
			next_address_zero_changed =0;
			next_address_two_changed =0;
			next_address_three_changed =0;
			check_one = 0;
			next_address_one_reg_replica =0;
			next_address_two_reg_replica =0;
			next_address_three_reg_replica =0;
			next_address_zero_reg_replica =0;
			inside_signal =0;
			packet_drop_signal_rom_zero =0;
			packet_drop_signal_rom_one =0;
			packet_drop_signal_rom_two =0;
			packet_drop_signal_rom_three =0;
		end
		else begin
		inst_sig_shift[0] <= new_inst_signal0;
		inst_sig_shift[1] <= new_inst_signal1;
		inst_sig_shift[2] <= new_inst_signal2;
		inst_sig_shift[3] <= new_inst_signal3;
		new_inst_signal0_shift <= inst_sig_shift[0];
		new_inst_signal1_shift <= inst_sig_shift[1];
		new_inst_signal2_shift <= inst_sig_shift[2];
		new_inst_signal3_shift <= inst_sig_shift[3];
		
		four_bit_hash2_shift <= four_bit_hash2;
		four_bit_hash3_shift <= four_bit_hash3;

	four_bit_hash_two <= four_bit_hash2;
	four_bit_hash_three <= four_bit_hash3;	
	pc_2 <= pcin_2[11:2];
	pc_3 <= pcin_3[11:2];
	
		if(state_signal == 4'b0000)begin		
		
						packet_drop_signal_rom_two_xor = packet_drop_signal_rom_two;
						packet_drop_signal_rom_three_xor = packet_drop_signal_rom_three;
						packet_drop_signal_rom_zero_xor0 =packet_drop_signal_rom_zero_xor;
						packet_drop_signal_rom_one_xor1 =packet_drop_signal_rom_one_xor;
						next_address_two_reg_copy = next_address_two_reg;
						next_address_three_reg_copy = next_address_three_reg;
						
						next_state_two_register <= next_state_two;
						next_state_three_register <= next_state_three;		
		
		
		
				next_address_one_reg_copy_again <= next_address_one_reg_copy;
				next_address_zero_reg_copy_again <= next_address_zero_reg_copy;		
						
						
					if(new_inst_signal0)begin
					state_reg_zero = next_address_zero + 1;
						if(next_state_zero_changed) begin
							next_address_zero = next_address_zero_changed;
							address_a = next_address_zero;
						end
						else begin
							next_address_zero_reg = next_address_zero + 1;
							next_address_zero_reg_replica <= next_address_zero_reg;
							address_a = next_address_zero_reg;
							next_address_zero <= next_address_zero_reg;
						end	
					end
					
					if(new_inst_signal1)begin
					state_reg_one = next_address_one + 1;
						if(next_state_one_changed) begin
							next_address_one = next_address_one_changed;
							address_b = next_address_one;
						end
						else begin
							next_address_one_reg = next_address_one + 1;
							next_address_one_reg_replica <= next_address_one_reg;
							address_b = next_address_one_reg;
							next_address_one <= next_address_one_reg;
						end	
					end
					
				if(next_state_two_register != next_state_two && (next_state_two!= 2000))begin
					next_state_two_changed = 1'b1;
					next_address_two_changed = next_state_two;
					end
				else
					next_state_two_changed = 1'b0;
				if(next_state_three_register != next_state_three && (next_state_three!= 2000))begin
					next_state_three_changed = 1'b1;
					next_address_three_changed = next_state_three;
					end
				else
					next_state_three_changed = 1'b0;					

							
							
				if((inst_sig_shift[0] == 1) && (!next_state_zero_changed) &&(next_address_zero_reg_replica != next_address_zero_reg_copy_again))begin
					if(four_bit_hash_out_one != four_bit_hash0)
						packet_drop_signal_rom_zero = 1'b1;
					else 
						packet_drop_signal_rom_zero = 1'b0;
				end
				if((inst_sig_shift[1] == 1) && (!next_state_one_changed) &&(next_address_one_reg_replica != next_address_one_reg_copy_again))begin
						inside_signal = 1'b0;
					if(four_bit_hash_out_two != four_bit_hash1) begin
						packet_drop_signal_rom_one = 1'b1;
						check_one = 1'b0;
					end	
					else begin
						packet_drop_signal_rom_one = 1'b0;
						check_one = 1'b1;
					end		
				end	
					

			//		state_signal = 4'b0001;
					
				end	
			else if(state_signal == 4'b0001)begin
						inside_signal = 1'b1;
						packet_drop_signal_rom_two_xor2 =packet_drop_signal_rom_two_xor;
						packet_drop_signal_rom_three_xor3 =packet_drop_signal_rom_three_xor;
						packet_drop_signal_rom_zero_xor = packet_drop_signal_rom_zero;
						packet_drop_signal_rom_one_xor = packet_drop_signal_rom_one;
						next_address_one_reg_copy = next_address_one_reg;
						next_address_zero_reg_copy = next_address_zero_reg;
			
						next_state_zero_register <= next_state_zero;
						next_state_one_register <= next_state_one;
						
		inst_sig_shift2_again = inst_sig_shift[2];
		inst_sig_shift3_again = inst_sig_shift[3];
						
						
				next_address_two_reg_copy_again <= next_address_two_reg_copy;
				next_address_three_reg_copy_again <= next_address_three_reg_copy;
				
					if(inst_sig_shift[2])begin
					state_reg_two = next_address_two + 1;
						if(next_state_two_changed) begin
							next_address_two = next_address_two_changed;
							address_a = next_address_two;
						end
						else begin
							next_address_two_reg = next_address_two + 1;
							next_address_two_reg_replica <= next_address_two_reg;
							address_a = next_address_two_reg;
							next_address_two <= next_address_two_reg;
						end	
					end
					
					if(inst_sig_shift[3])begin
					state_reg_three = next_address_three + 1;
						if(next_state_three_changed) begin
							next_address_three = next_address_three_changed;
							address_b = next_address_three;
						end
						else begin
							next_address_three_reg = next_address_three + 1;
							next_address_three_reg_replica <= next_address_three_reg;
							address_b = next_address_three_reg;
							next_address_three <= next_address_three_reg;
						end	
					end		

				if(next_state_zero_register != next_state_zero && (next_state_zero!= 2000))begin
					next_state_zero_changed = 1'b1;
					next_address_zero_changed = next_state_zero;
					end
				else
					next_state_zero_changed = 1'b0;
				if(next_state_one_register != next_state_one && (next_state_one!= 2000))begin
					next_state_one_changed = 1'b1;
					next_address_one_changed = next_state_one;
					end
				else
					next_state_one_changed = 1'b0;									

							
				if((inst_sig_shift2_again == 1) && (!next_state_two_changed) &&(next_address_two_reg_replica != next_address_two_reg_copy_again))begin
					if(four_bit_hash_out_one != four_bit_hash_two)
						packet_drop_signal_rom_two = 1'b1;
					else 
						packet_drop_signal_rom_two = 1'b0;
				end
				if((inst_sig_shift3_again == 1) && (!next_state_three_changed) &&(next_address_three_reg_replica != next_address_three_reg_copy_again))begin
					if(four_bit_hash_out_two != four_bit_hash_three) begin
						packet_drop_signal_rom_three = 1'b1;
					end	
					else begin
						packet_drop_signal_rom_three = 1'b0;
					end		
				end		
				
			//	state_signal = 4'b0000;
			end	
		end	
 	end 	

	
assign four_bit_hash_zero = four_bit_hash0;
assign four_bit_hash_one = four_bit_hash1;

	
always@(posedge statemac_clk) begin
	if(reset)begin
		state_signal_next = 4'b0;
	end
	else begin
		if (state_signal == 4'b0000) begin
			state_signal_next <= 4'b0001;
		end	
		else if (state_signal == 4'b0001) begin
			state_signal_next <= 4'b0000;
		end
		
		if (new_inst_signal0_shift)begin
			 four_bit_hash_out_core_zero = four_bit_hash_out_one;
			end 
		if (new_inst_signal1_shift)begin
			 four_bit_hash_out_core_one = four_bit_hash_out_two;
		end	 
		if (new_inst_signal2_shift)begin
			 four_bit_hash_out_core_two = four_bit_hash_out_one;
		end	 
		if (new_inst_signal3_shift)begin
			 four_bit_hash_out_core_three = four_bit_hash_out_two;			 	
		end	 
	end
end	
	
assign state_signal = state_signal_next;
	

	
assign pc_0 = pcin_0[11:2];
assign pc_1 = pcin_1[11:2];

cm_rom_final rom(
	.address_a(address_a),
	.address_b(address_b),
	.clock(statemac_clk),
	.q_a(four_bit_hash_out_one),
	.q_b(four_bit_hash_out_two));
	
/*	
rom_shared rom(
	.address_a(address_a),
	.address_b(address_b),
	.clock(statemac_clk),
	.q_a(four_bit_hash_out_one),
	.q_b(four_bit_hash_out_two)
	);	
	*/
/*	
always@(*)begin
if(!next_state_zero_changed)
	
end	
	*/
	
//assign pc[0] = pc_in0[11:2];
//assign pc[1] = pc_in1[11:2];
//assign pc[2] = pc_in2[11:2];
//assign pc[3] = pc_in3[11:2];


always@(*)begin
case(state_reg_zero) 
0: next_state_zero =0;
1: begin if(four_bit_hash_zero == 7) next_state_zero = 4; else if (four_bit_hash_zero == 3) next_state_zero = 2; else next_state_zero = 2000;  end 
3: begin if(four_bit_hash_zero == 4) next_state_zero = 21; else if (four_bit_hash_zero == 7) next_state_zero = 4; else next_state_zero = 2000;  end 
15: begin if(four_bit_hash_zero == 5 && pc_0 == 12) next_state_zero = 12; else if (four_bit_hash_zero == 5 && pc_0 == 16) next_state_zero = 16; else next_state_zero = 2000;  end 
19: begin if(four_bit_hash_zero == 5) next_state_zero = 196; else if (four_bit_hash_zero == 3) next_state_zero = 20; else next_state_zero = 2000;  end 
21: begin if(four_bit_hash_zero == 3) next_state_zero = 20; else if (four_bit_hash_zero == 9) next_state_zero = 22; else next_state_zero = 2000;  end 
49: begin if(four_bit_hash_zero == 6) next_state_zero = 194; else if (four_bit_hash_zero == 8) next_state_zero = 50; else next_state_zero = 2000;  end 
95: begin if(four_bit_hash_zero == 14) next_state_zero = 152; else if (four_bit_hash_zero == 7) next_state_zero = 96; else next_state_zero = 2000;  end 
104: begin if(four_bit_hash_zero == 10 && pc_0 == 148) next_state_zero = 148; else if (four_bit_hash_zero == 10 && pc_0 == 105) next_state_zero = 105; else next_state_zero = 2000;  end 
108: begin if(four_bit_hash_zero == 13) next_state_zero = 120; else if (four_bit_hash_zero == 7) next_state_zero = 109; else next_state_zero = 2000;  end 
119: begin if(four_bit_hash_zero == 6) next_state_zero = 112; else if (four_bit_hash_zero == 13) next_state_zero = 120; else next_state_zero = 2000;  end 
124: begin if(four_bit_hash_zero == 13) next_state_zero = 137; else if (four_bit_hash_zero == 3) next_state_zero = 125; else next_state_zero = 2000;  end 
136: begin if(four_bit_hash_zero == 5) next_state_zero = 129; else if (four_bit_hash_zero == 13) next_state_zero = 137; else next_state_zero = 2000;  end 
151: begin if(four_bit_hash_zero == 15) next_state_zero = 141; else if (four_bit_hash_zero == 14) next_state_zero = 152; else next_state_zero = 2000;  end 
256: begin if(four_bit_hash_zero == 9) next_state_zero = 271; else if (four_bit_hash_zero == 4) next_state_zero = 257; else next_state_zero = 2000;  end 
270: begin if(four_bit_hash_zero == 6) next_state_zero = 263; else if (four_bit_hash_zero == 9) next_state_zero = 271; else next_state_zero = 2000;  end 
147: begin if(four_bit_hash_zero == 5) next_state_zero = 284; else if (four_bit_hash_zero == 12) next_state_zero = 10; else next_state_zero = 2000;  end 
193: begin if(four_bit_hash_zero == 7 && pc_0 == 96) next_state_zero = 96; else if (four_bit_hash_zero == 9) next_state_zero = 10; else next_state_zero = 2000;  end 
283: begin if(four_bit_hash_zero == 5 && pc_0 == 81) next_state_zero = 81; else if (four_bit_hash_zero == 5 && pc_0 == 284) next_state_zero = 284; else next_state_zero = 2000;  end 
288: begin if(four_bit_hash_zero == 6) next_state_zero = 217; else if (four_bit_hash_zero == 15) next_state_zero = 289; else next_state_zero = 2000;  end 
2000: begin packet_drop_signal_register_zero = 1'b1; end endcase
end


always@(*)begin
case(state_reg_one)
0: next_state_one =0; 
1: begin if(four_bit_hash_one == 7) next_state_one = 4; else if (four_bit_hash_one == 3) next_state_one = 2; else next_state_one = 2000;  end 
3: begin if(four_bit_hash_one == 4) next_state_one = 21; else if (four_bit_hash_one == 7) next_state_one = 4; else next_state_one = 2000;  end 
15: begin if(four_bit_hash_one == 5 && pc_1 == 12) next_state_one = 12; else if (four_bit_hash_one == 5 && pc_1 == 16) next_state_one = 16; else next_state_one = 2000;  end 
19: begin if(four_bit_hash_one == 5) next_state_one = 196; else if (four_bit_hash_one == 3) next_state_one = 20; else next_state_one = 2000;  end 
21: begin if(four_bit_hash_one == 3) next_state_one = 20; else if (four_bit_hash_one == 9) next_state_one = 22; else next_state_one = 2000;  end 
49: begin if(four_bit_hash_one == 6) next_state_one = 194; else if (four_bit_hash_one == 8) next_state_one = 50; else next_state_one = 2000;  end 
95: begin if(four_bit_hash_one == 14) next_state_one = 152; else if (four_bit_hash_one == 7) next_state_one = 96; else next_state_one = 2000;  end 
104: begin if(four_bit_hash_one == 10 && pc_1 == 148) next_state_one = 148; else if (four_bit_hash_one == 10 && pc_1 == 105) next_state_one = 105; else next_state_one = 2000;  end 
108: begin if(four_bit_hash_one == 13) next_state_one = 120; else if (four_bit_hash_one == 7) next_state_one = 109; else next_state_one = 2000;  end 
119: begin if(four_bit_hash_one == 6) next_state_one = 112; else if (four_bit_hash_one == 13) next_state_one = 120; else next_state_one = 2000;  end 
124: begin if(four_bit_hash_one == 13) next_state_one = 137; else if (four_bit_hash_one == 3) next_state_one = 125; else next_state_one = 2000;  end 
136: begin if(four_bit_hash_one == 5) next_state_one = 129; else if (four_bit_hash_one == 13) next_state_one = 137; else next_state_one = 2000;  end 
151: begin if(four_bit_hash_one == 15) next_state_one = 141; else if (four_bit_hash_one == 14) next_state_one = 152; else next_state_one = 2000;  end 
256: begin if(four_bit_hash_one == 9) next_state_one = 271; else if (four_bit_hash_one == 4) next_state_one = 257; else next_state_one = 2000;  end 
270: begin if(four_bit_hash_one == 6) next_state_one = 263; else if (four_bit_hash_one == 9) next_state_one = 271; else next_state_one = 2000;  end 
147: begin if(four_bit_hash_one == 5) next_state_one = 284; else if (four_bit_hash_one == 12) next_state_one = 10; else next_state_one = 2000;  end 
193: begin if(four_bit_hash_one == 7 && pc_1 == 96) next_state_one = 96; else if (four_bit_hash_one == 9) next_state_one = 10; else next_state_one = 2000;  end 
283: begin if(four_bit_hash_one == 5 && pc_1 == 81) next_state_one = 81; else if (four_bit_hash_one == 5 && pc_1 == 284) next_state_one = 284; else next_state_one = 2000;  end 
288: begin if(four_bit_hash_one == 6) next_state_one = 217; else if (four_bit_hash_one == 15) next_state_one = 289; else next_state_one = 2000;  end 
2000: begin packet_drop_signal_register_one = 1'b1; end endcase
end

always@(*)begin
case(state_reg_two) 
0: next_state_two =0;
1: begin if(four_bit_hash_two == 7) next_state_two = 4; else if (four_bit_hash_two == 3) next_state_two = 2; else next_state_two = 2000;  end 
3: begin if(four_bit_hash_two == 4) next_state_two = 21; else if (four_bit_hash_two == 7) next_state_two = 4; else next_state_two = 2000;  end 
15: begin if(four_bit_hash_two == 5 && pc_2 == 12) next_state_two = 12; else if (four_bit_hash_two == 5 && pc_2 == 16) next_state_two = 16; else next_state_two = 2000;  end 
19: begin if(four_bit_hash_two == 5) next_state_two = 196; else if (four_bit_hash_two == 3) next_state_two = 20; else next_state_two = 2000;  end 
21: begin if(four_bit_hash_two == 3) next_state_two = 20; else if (four_bit_hash_two == 9) next_state_two = 22; else next_state_two = 2000;  end 
49: begin if(four_bit_hash_two == 6) next_state_two = 194; else if (four_bit_hash_two == 8) next_state_two = 50; else next_state_two = 2000;  end 
95: begin if(four_bit_hash_two == 14) next_state_two = 152; else if (four_bit_hash_two == 7) next_state_two = 96; else next_state_two = 2000;  end 
104: begin if(four_bit_hash_two == 10 && pc_2 == 148) next_state_two = 148; else if (four_bit_hash_two == 10 && pc_2 == 105) next_state_two = 105; else next_state_two = 2000;  end 
108: begin if(four_bit_hash_two == 13) next_state_two = 120; else if (four_bit_hash_two == 7) next_state_two = 109; else next_state_two = 2000;  end 
119: begin if(four_bit_hash_two == 6) next_state_two = 112; else if (four_bit_hash_two == 13) next_state_two = 120; else next_state_two = 2000;  end 
124: begin if(four_bit_hash_two == 13) next_state_two = 137; else if (four_bit_hash_two == 3) next_state_two = 125; else next_state_two = 2000;  end 
136: begin if(four_bit_hash_two == 5) next_state_two = 129; else if (four_bit_hash_two == 13) next_state_two = 137; else next_state_two = 2000;  end 
151: begin if(four_bit_hash_two == 15) next_state_two = 141; else if (four_bit_hash_two == 14) next_state_two = 152; else next_state_two = 2000;  end 
256: begin if(four_bit_hash_two == 9) next_state_two = 271; else if (four_bit_hash_two == 4) next_state_two = 257; else next_state_two = 2000;  end 
270: begin if(four_bit_hash_two == 6) next_state_two = 263; else if (four_bit_hash_two == 9) next_state_two = 271; else next_state_two = 2000;  end 
147: begin if(four_bit_hash_two == 5) next_state_two = 284; else if (four_bit_hash_two == 12) next_state_two = 10; else next_state_two = 2000;  end 
193: begin if(four_bit_hash_two == 7 && pc_2 == 96) next_state_two = 96; else if (four_bit_hash_two == 9) next_state_two = 10; else next_state_two = 2000;  end 
283: begin if(four_bit_hash_two == 5 && pc_2 == 81) next_state_two = 81; else if (four_bit_hash_two == 5 && pc_2 == 284) next_state_two = 284; else next_state_two = 2000;  end 
288: begin if(four_bit_hash_two == 6) next_state_two = 217; else if (four_bit_hash_two == 15) next_state_two = 289; else next_state_two = 2000;  end 
2000: begin packet_drop_signal_register_two = 1'b1; end endcase
end

always@(*)begin
case(state_reg_three)
0: next_state_three =0; 
1: begin if(four_bit_hash_three == 7) next_state_three = 4; else if (four_bit_hash_three == 3) next_state_three = 2; else next_state_three = 2000;  end 
3: begin if(four_bit_hash_three == 4) next_state_three = 21; else if (four_bit_hash_three == 7) next_state_three = 4; else next_state_three = 2000;  end 
15: begin if(four_bit_hash_three == 5 && pc_3 == 12) next_state_three = 12; else if (four_bit_hash_three == 5 && pc_3 == 16) next_state_three = 16; else next_state_three = 2000;  end 
19: begin if(four_bit_hash_three == 5) next_state_three = 196; else if (four_bit_hash_three == 3) next_state_three = 20; else next_state_three = 2000;  end 
21: begin if(four_bit_hash_three == 3) next_state_three = 20; else if (four_bit_hash_three == 9) next_state_three = 22; else next_state_three = 2000;  end 
49: begin if(four_bit_hash_three == 6) next_state_three = 194; else if (four_bit_hash_three == 8) next_state_three = 50; else next_state_three = 2000;  end 
95: begin if(four_bit_hash_three == 14) next_state_three = 152; else if (four_bit_hash_three == 7) next_state_three = 96; else next_state_three = 2000;  end 
104: begin if(four_bit_hash_three == 10 && pc_3 == 148) next_state_three = 148; else if (four_bit_hash_three == 10 && pc_3 == 105) next_state_three = 105; else next_state_three = 2000;  end 
108: begin if(four_bit_hash_three == 13) next_state_three = 120; else if (four_bit_hash_three == 7) next_state_three = 109; else next_state_three = 2000;  end 
119: begin if(four_bit_hash_three == 6) next_state_three = 112; else if (four_bit_hash_three == 13) next_state_three = 120; else next_state_three = 2000;  end 
124: begin if(four_bit_hash_three == 13) next_state_three = 137; else if (four_bit_hash_three == 3) next_state_three = 125; else next_state_three = 2000;  end 
136: begin if(four_bit_hash_three == 5) next_state_three = 129; else if (four_bit_hash_three == 13) next_state_three = 137; else next_state_three = 2000;  end 
151: begin if(four_bit_hash_three == 15) next_state_three = 141; else if (four_bit_hash_three == 14) next_state_three = 152; else next_state_three = 2000;  end 
256: begin if(four_bit_hash_three == 9) next_state_three = 271; else if (four_bit_hash_three == 4) next_state_three = 257; else next_state_three = 2000;  end 
270: begin if(four_bit_hash_three == 6) next_state_three = 263; else if (four_bit_hash_three == 9) next_state_three = 271; else next_state_three = 2000;  end 
147: begin if(four_bit_hash_three == 5) next_state_three = 284; else if (four_bit_hash_three == 12) next_state_three = 10; else next_state_three = 2000;  end 
193: begin if(four_bit_hash_three == 7 && pc_3 == 96) next_state_three = 96; else if (four_bit_hash_three == 9) next_state_three = 10; else next_state_three = 2000;  end 
283: begin if(four_bit_hash_three == 5 && pc_3 == 81) next_state_three = 81; else if (four_bit_hash_three == 5 && pc_3 == 284) next_state_three = 284; else next_state_three = 2000;  end 
288: begin if(four_bit_hash_three == 6) next_state_three = 217; else if (four_bit_hash_three == 15) next_state_three = 289; else next_state_three = 2000;  end 
2000: begin packet_drop_signal_register_three = 1'b1; end endcase
end

assign test_drop_zero = packet_drop_signal_rom_zero_xor0^packet_drop_signal_rom_zero;
assign test_drop_two = packet_drop_signal_rom_two_xor2^packet_drop_signal_rom_two;
assign test_drop_one = packet_drop_signal_rom_one_xor1^packet_drop_signal_rom_one;
assign test_drop_three = packet_drop_signal_rom_three_xor3^packet_drop_signal_rom_three;
/*
assign packet_drop_signal0 = packet_drop_signal_rom_zero;
assign packet_drop_signal1 = packet_drop_signal_rom_one;
assign packet_drop_signal2 = packet_drop_signal_rom_two;
assign packet_drop_signal3 = packet_drop_signal_rom_three;
*/
assign packet_drop_signal0 = (packet_drop_signal_rom_zero_xor0)?packet_drop_signal_rom_zero_xor0^packet_drop_signal_rom_zero:0;
assign packet_drop_signal1 = (packet_drop_signal_rom_two_xor2)?packet_drop_signal_rom_two_xor2^packet_drop_signal_rom_two:0;
assign packet_drop_signal2 = (packet_drop_signal_rom_one_xor1)?packet_drop_signal_rom_one_xor1^packet_drop_signal_rom_one:0;
assign  packet_drop_signal3 = (packet_drop_signal_rom_three_xor3)?packet_drop_signal_rom_three_xor3^packet_drop_signal_rom_three:0;
endmodule