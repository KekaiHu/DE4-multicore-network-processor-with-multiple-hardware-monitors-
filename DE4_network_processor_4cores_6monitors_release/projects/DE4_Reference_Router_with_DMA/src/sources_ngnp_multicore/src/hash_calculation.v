///////////////////////////////////////////////////////////////////////////////
// 
// Module: hash_calculation.v
// Project: ngnp
// Description: calculates the 4 bit hash value
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

	module hash_calculation(
		input core_sp_clk,
		input [31:0] instruction_sec_mon,
		input [13:2] read_address,
		input hash_int_ACK,
		input reset,
		output [3:0] hash_value,
		output new_inst_signal
	);
	
	
	reg [5:0] data;
	reg [3:0] hash_result;
	wire [31:0] instruction_old_value;
	reg [31:0] instruction_old_value_reg;
	//wire new_inst_signal;
	reg new_inst_signal_reg;
	reg [11:0] read_address_reg;
	reg [11:0] read_address_old_value_reg;
	reg new_inst_signal_reg_test;
	
	// Calculating the 4 bit hash value 
	always @ (posedge core_sp_clk) begin
		if(reset) begin
			data = 6'b000000;  
			hash_result = 4'b0000;
			instruction_old_value_reg <= instruction_sec_mon;
			read_address_old_value_reg <= read_address_reg;
		end
		else begin
			if(hash_int_ACK) begin
				instruction_old_value_reg <= instruction_sec_mon;
				read_address_old_value_reg <= read_address_reg;
			end	
			else begin
				instruction_old_value_reg <= 32'hffffffff;
				read_address_old_value_reg <= 12'hfff;
			end	
			if((instruction_sec_mon != instruction_old_value) && (hash_int_ACK)) begin
				data = (( instruction_sec_mon[0] + instruction_sec_mon[1] + instruction_sec_mon[2] + instruction_sec_mon[3] + instruction_sec_mon[4] + instruction_sec_mon[5] + instruction_sec_mon[6] + instruction_sec_mon[7] + instruction_sec_mon[8] + instruction_sec_mon[9] + instruction_sec_mon[10] + instruction_sec_mon[11] + instruction_sec_mon[12] + instruction_sec_mon[13] + instruction_sec_mon[14] + instruction_sec_mon[15] + instruction_sec_mon[16] + instruction_sec_mon[17] + instruction_sec_mon[18] + instruction_sec_mon[19] + instruction_sec_mon[20] + instruction_sec_mon[21]+ instruction_sec_mon[22]+ instruction_sec_mon[23]+ instruction_sec_mon[24]+ instruction_sec_mon[25]+ instruction_sec_mon[26]+ instruction_sec_mon[27]+ instruction_sec_mon[28]+ instruction_sec_mon[29]+ instruction_sec_mon[30]+ instruction_sec_mon[31])); 
				hash_result = (data%16);  
				new_inst_signal_reg = 1'b1;
			end	
			else
				new_inst_signal_reg =1'b0;
				
		if((read_address_reg != read_address_old_value_reg) && (hash_int_ACK)) begin				
				new_inst_signal_reg_test = 1'b1;
		end		
		else
			new_inst_signal_reg_test = 1'b0;

	end
end	
	always@(posedge core_sp_clk) begin
		if(reset) begin
			read_address_reg = 0;
		end
		else begin
			read_address_reg <= read_address;
		end
	end	
		
	
	assign instruction_old_value = instruction_old_value_reg;
	assign hash_value = hash_result;
	//assign new_inst_signal =new_inst_signal_reg;
	assign new_inst_signal =new_inst_signal_reg_test;
	
	endmodule