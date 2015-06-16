`include "yf32_define.v"
`include "NF_2.1_defines.v"
`include "reg_defines_reference_router.v"
`include "registers.v"

module CAM_monitor
(
input clk,
//input statemac_clk,
input [3:0] four_bit_hash,
input [11:0] pcin,
input new_inst_signal,
input reset,
output packet_drop_signal,
input  cam_we,
input  [3:0]    cam_wr_addr,
input [31:0] cam_din,
input proc_ack,
output out_ack_reset,
output cam_wr_ack,
input processor_reset_seq,
input packet_done
);

parameter LUT_DEPTH = `ROUTER_OP_LUT_DST_IP_FILTER_TABLE_DEPTH;
//parameter LUT_DEPTH_BITS = 4;
wire [11:0] address_a;
wire [3:0] four_bit_hash_out_one;
reg packet_drop_signal_reg;
reg pre_jump_instr2;
wire [31:0] dfa_ram_output;
reg [31:0] dfa_ram_output_reg;
reg  [15:0] encoded_hash_output;
reg  [15:0] encoded_hash_output_reg;
reg  [15:0] masked_hash_ouput;
reg  [13:0] base_address_reg;
reg [3:0] four_bit_hash_reg;
reg new_inst_signal_reg;
reg start_rom_read;
always@(posedge clk)
begin
	if (reset) begin
		four_bit_hash_reg <= 4'h0;
		dfa_ram_output_reg <= 32'h0;
		new_inst_signal_reg <= 1'b0;
		encoded_hash_output_reg <= 16'h0;
	end
	else begin
		four_bit_hash_reg <= four_bit_hash;
		dfa_ram_output_reg <= dfa_ram_output;
		new_inst_signal_reg <= new_inst_signal;
		encoded_hash_output_reg <= encoded_hash_output;
	end
end 

always@(posedge clk)
begin
	if (reset) begin
		start_rom_read <= 1'b0;
	end
	else begin
		if (new_inst_signal)
		start_rom_read <= 1'b1;
	end
end 

// Add Hash memory block
rom_shared rom(
	.address_a(address_a),
	.address_b(),
	.rden_a(new_inst_signal),
	.clock(clk),
	.q_a(dfa_ram_output),
	.q_b()
	);	
	
// Combinational circuit for new architecture
// Once the ouput of RAM is available
// 1. First do the decoder stage 4 to 16
// 2. Calculate the value of k
// 3. Get the base address along with step 2
//	4. Calculate the next address location

// Size of RAM output (2 bit(state bit) + 14 bit (next state) + 16 bit (input valid bit)) 


// This state machine generates encoded_hash_output & masked_hash_ouput
// encoded_hash_output is used to check whether the input hash is correct
// masked_hash_ouput is used to calculate k 

always@(dfa_ram_output) begin  // dfa_ram_output
		if (reset) begin
			encoded_hash_output = 16'h0;
			masked_hash_ouput = 16'h0;
		end
		else begin
			//four_bit_hash_reg = four_bit_hash;
			//if (new_inst_signal_reg) begin
				case (four_bit_hash_reg)
					4'b0000: begin
						encoded_hash_output = 16'h0001;
						masked_hash_ouput = {15'b0,1'b0};
					end	
					4'b0001: begin
						encoded_hash_output = 16'h0002;
						masked_hash_ouput = {15'b0,dfa_ram_output[0]};
					end	
					4'b0010: begin
						encoded_hash_output = 16'h0004;
						masked_hash_ouput = {14'b0,dfa_ram_output[1:0]};
					end	
					4'b0011: begin
						encoded_hash_output = 16'h0008;
						masked_hash_ouput = {13'b0,dfa_ram_output[2:0]};
					end	
					4'b0100: begin
						encoded_hash_output = 16'h0010;
						masked_hash_ouput = {12'b0,dfa_ram_output[3:0]};
					end	
					4'b0101: begin
						encoded_hash_output = 16'h0020;
						masked_hash_ouput = {11'b0,dfa_ram_output[4:0]};
					end	
					4'b0110: begin
						encoded_hash_output = 16'h0040;
						masked_hash_ouput = {10'b0,dfa_ram_output[5:0]};
					end	
					4'b0111: begin
						encoded_hash_output = 16'h0080;
						masked_hash_ouput = {9'b0,dfa_ram_output[6:0]};
					end	
					4'b1000: begin
						encoded_hash_output = 16'h0100;
						masked_hash_ouput = {8'b0,dfa_ram_output[7:0]};
					end	
					4'b1001: begin
						encoded_hash_output = 16'h0200;
						masked_hash_ouput = {7'b0,dfa_ram_output[8:0]};
					end	
					4'b1010: begin
						encoded_hash_output = 16'h0400;
						masked_hash_ouput = {6'b0,dfa_ram_output[9:0]};
					end	
					4'b1011: begin
						encoded_hash_output = 16'h0800;
						masked_hash_ouput = {5'b0,dfa_ram_output[10:0]};
					end	
					4'b1100: begin
						encoded_hash_output = 16'h1000;
						masked_hash_ouput = {4'b0,dfa_ram_output[11:0]};
					end	
					4'b1101: begin
						encoded_hash_output = 16'h2000;
						masked_hash_ouput = {3'b0,dfa_ram_output[12:0]};
					end	
					4'b1110: begin
						encoded_hash_output = 16'h4000;
						masked_hash_ouput = {2'b0,dfa_ram_output[13:0]};
					end	
					4'b1111: begin
						encoded_hash_output = 16'h8000;
						masked_hash_ouput = {1'b0,dfa_ram_output[14:0]};
					end	
					//default: begin
						//encoded_hash_output = 16'h0;
						//masked_hash_ouput = 16'h0;
					//end					
				endcase	
			//end	
		end
end

// This state machine generates the base address, used for calculating the next RAM address input.
//reg [13:0] base_address_reg;
reg [2:0] state_bit_reg;
always @(dfa_ram_output) begin //dfa_ram_output
		if (reset) begin
			base_address_reg = 14'h0;
			state_bit_reg = 3'h1;
		end
		else begin
			case(dfa_ram_output[31:28])
				4'b0000: begin
					base_address_reg = 14'h0;
					state_bit_reg = 3'h0;
				end
				4'b0001: begin
					base_address_reg = 14'h0;
					state_bit_reg = 3'h1;
				end
				4'b0010: begin
					base_address_reg = 14'h3b5;
					state_bit_reg = 3'h2;
				end
				4'b0011: begin
					base_address_reg = 14'h800;
					state_bit_reg = 3'h3;
				end
				default: begin
					base_address_reg = 14'h0;
				end
			endcase
		end
end		

// This state machine checks for valid input case
reg [15:0] valid_bit_and_value;
reg [15:0] test_valid_bit;
reg hash_valid;
reg drop_signal_reg;

always@(encoded_hash_output)begin  //encoded_hash_output
	if (reset) begin
		valid_bit_and_value = 16'h0;
		drop_signal_reg = 1'b0;
		hash_valid = 1'b0;
		test_valid_bit = 16'b0;
	end
	else begin
		test_valid_bit = (encoded_hash_output|dfa_ram_output[15:0]);
		valid_bit_and_value = (encoded_hash_output&dfa_ram_output[15:0]);
		if(!valid_bit_and_value) begin  // added new_inst_signal
			hash_valid = 1'b0;
			drop_signal_reg = 1'b1;
		end
		else begin
			hash_valid = 1'b1;
			drop_signal_reg = 1'b0;
		end
	end
end


reg addr_reset,addr_reset_next;
// This state machine generates k value
reg  [3:0] k_reg;
always@(*) begin   // masked_hash_ouput
	if (reset | addr_reset | pkt_done_sig) begin
		k_reg = 4'h0;
	end
	else begin
		k_reg = masked_hash_ouput[0] + masked_hash_ouput[1] + masked_hash_ouput[2] + masked_hash_ouput[3] + masked_hash_ouput[4] + masked_hash_ouput[5] + masked_hash_ouput[6] + masked_hash_ouput[7] + masked_hash_ouput[8] + masked_hash_ouput[9] + masked_hash_ouput[10] + masked_hash_ouput[11] + masked_hash_ouput[12] + masked_hash_ouput[13] + masked_hash_ouput[14] + masked_hash_ouput[15];
	end
end

// This calculates the next address location
reg [13:0] dfa_address_reg;
always@(*) begin
	if(reset | addr_reset | pkt_done_sig) begin
		dfa_address_reg = 14'h0;
	end
	else begin
		dfa_address_reg = base_address_reg + dfa_ram_output[27:16]*state_bit_reg + k_reg;
	end
end

reg out_drop_signal,out_drop_signal_next;
reg [2:0] drop_state,drop_state_next;
reg ack_reset,ack_reset_next;
always@(*)begin
	drop_state_next = drop_state;
	out_drop_signal_next = out_drop_signal;
	ack_reset_next = ack_reset;
	addr_reset_next = addr_reset;
	case (drop_state)
		3'b000: begin
			if (drop_signal_reg)begin
				out_drop_signal_next = 1'b1;
				drop_state_next = 3'b001;
				addr_reset_next = 1'b1;
				ack_reset_next = 1'b1;
			end
			else begin
			out_drop_signal_next = 1'b0;
			addr_reset_next = 1'b0;
			ack_reset_next = 1'b0;
			end
		end			
		3'b001: begin
			out_drop_signal_next = 1'b0;
			if (!processor_reset_seq)begin
		   ack_reset_next = 1'b1;	
			drop_state_next = 3'b010;
			addr_reset_next = 1'b1;
			end
			else
			drop_state_next = 3'b001;
	  	end
			3'b010: begin
			out_drop_signal_next = 1'b0;
		   ack_reset_next = 1'b1;	
			drop_state_next = 3'b011;
			addr_reset_next = 1'b1;
	  	end		
			3'b011: begin
			ack_reset_next = 1'b0;
			if (new_inst_signal)begin
				drop_state_next = 3'b100;
				addr_reset_next = 1'b1;
			end
			else
				drop_state_next = 3'b011;
		end
			3'b100: begin
				addr_reset_next = 1'b0;
				drop_state_next = 3'b101;
			end
			3'b101: begin
				drop_state_next = 3'b000;
			end
			default:begin
				drop_state_next = 3'b000;
				out_drop_signal_next = 1'b0;
				ack_reset_next = 1'b0;
				addr_reset_next = 1'b0;
			end			
	endcase
end

always@(posedge clk)
begin
if(reset) begin
	drop_state <= 3'b000;
	out_drop_signal <= 1'b0;
   ack_reset <= 1'b0;
	addr_reset <= 1'b0;
	end
else begin
	drop_state <= drop_state_next;
	out_drop_signal <= out_drop_signal_next;
	ack_reset <= ack_reset_next;
	addr_reset <= addr_reset_next;
	end
end
reg [1:0] pkt_done_state_next,pkt_done_state;
reg pkt_done_sig_next,pkt_done_sig;
reg ack_reset2_next,ack_reset2;

always@(*)begin
	pkt_done_state_next = pkt_done_state;
	pkt_done_sig_next = pkt_done_sig;
	ack_reset2_next = ack_reset2;
	case(pkt_done_state)
		2'b00: begin
			if (packet_done)begin
				pkt_done_sig_next = 1'b1;
				ack_reset2_next = 1'b1;
				pkt_done_state_next = 2'b01;
			end
			else begin
				pkt_done_sig_next = 1'b0;
				ack_reset2_next = 1'b0;
			end
		end
		2'b01: begin
			if (!processor_reset_seq)begin
				pkt_done_sig_next = 1'b1;
				ack_reset2_next = 1'b1;
				pkt_done_state_next = 2'b10;
			end	
			else
				pkt_done_state_next = 2'b01;
		end
		2'b10: begin
			ack_reset2_next = 1'b0;
			if(new_inst_signal) begin
				pkt_done_sig_next = 1'b1;
				pkt_done_state_next = 2'b11;
			end	
			else
				pkt_done_state_next = 2'b10;
		end
		2'b11: begin
				pkt_done_sig_next = 1'b0;
				pkt_done_state_next = 2'b00;
		end
		default: begin
			pkt_done_sig_next = 1'b0;
			pkt_done_state_next = 2'b00;
		end
	endcase	
end

always@(posedge clk)
begin
if(reset) begin
	pkt_done_state <= 2'b00;
	pkt_done_sig <= 1'b0;
	ack_reset2 <= 1'b0;
	end
else begin
	pkt_done_state <= pkt_done_state_next;
	pkt_done_sig <= pkt_done_sig_next;
	ack_reset2 <= ack_reset2_next;
	end
end

assign address_a = pkt_done_sig ? 14'h0 : dfa_address_reg;
assign packet_drop_signal = out_drop_signal;
assign out_ack_reset = ack_reset | ack_reset2;
endmodule 