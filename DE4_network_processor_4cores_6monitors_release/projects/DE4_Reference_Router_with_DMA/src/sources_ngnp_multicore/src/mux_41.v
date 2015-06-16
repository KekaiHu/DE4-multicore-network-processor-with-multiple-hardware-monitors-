// This is a 4 to 1 mux that inputs from the 4 cpus and outputs to the monitors
// Author: Kekai Hu. Mar 1, 2013

module mux_41(
    input       [1:0] sel,
	 
	 input       [3:0] four_bit_hash_0,
	 input       new_inst_signal_0,
	 input       processor_reset_seq_0,
	 input       sp_pkt_done_0,
	 input       sp_interrupt_wire_0,	

	 input       [3:0] four_bit_hash_1,
	 input       new_inst_signal_1,
	 input       processor_reset_seq_1,
	 input       sp_pkt_done_1,
	 input       sp_interrupt_wire_1,
	 
	 input       [3:0] four_bit_hash_2,
	 input       new_inst_signal_2,
	 input       processor_reset_seq_2,
	 input       sp_pkt_done_2,
	 input       sp_interrupt_wire_2, 

	 input       [3:0] four_bit_hash_3,
	 input       new_inst_signal_3,
	 input       processor_reset_seq_3,
	 input       sp_pkt_done_3,
	 input       sp_interrupt_wire_3,
	 
	 output       [3:0] four_bit_hash_out,
	 output       new_inst_signal_out,
	 output       processor_reset_seq_out,
	 output       sp_pkt_done_out,
	 output       sp_interrupt_wire_out
	 );
	 
	 reg       [3:0] four_bit_hash_out_reg;
	 reg       new_inst_signal_out_reg;
	 reg       processor_reset_seq_out_reg;
	 reg       sp_pkt_done_out_reg;
	 reg       sp_interrupt_wire_out_reg;
	 
	 always @(*) begin
	 case (sel)
	     2'b00: begin
			   four_bit_hash_out_reg = four_bit_hash_0;
				new_inst_signal_out_reg = new_inst_signal_0;
				processor_reset_seq_out_reg = processor_reset_seq_0;
				sp_pkt_done_out_reg = sp_pkt_done_0;
				sp_interrupt_wire_out_reg = sp_interrupt_wire_0;
				end
				
			2'b01: begin
			   four_bit_hash_out_reg = four_bit_hash_1;
				new_inst_signal_out_reg = new_inst_signal_1;
				processor_reset_seq_out_reg = processor_reset_seq_1;
				sp_pkt_done_out_reg = sp_pkt_done_1;
				sp_interrupt_wire_out_reg = sp_interrupt_wire_1;
				end
				
			2'b10:begin
			   four_bit_hash_out_reg = four_bit_hash_2;
				new_inst_signal_out_reg = new_inst_signal_2;
				processor_reset_seq_out_reg = processor_reset_seq_2;
				sp_pkt_done_out_reg = sp_pkt_done_2;
				sp_interrupt_wire_out_reg = sp_interrupt_wire_2;
				end
				
			2'b11:begin
			   four_bit_hash_out_reg = four_bit_hash_3;
				new_inst_signal_out_reg = new_inst_signal_3;
				processor_reset_seq_out_reg = processor_reset_seq_3;
				sp_pkt_done_out_reg = sp_pkt_done_3;
				sp_interrupt_wire_out_reg = sp_interrupt_wire_3;
				end
	  endcase
	  end

	  assign four_bit_hash_out = four_bit_hash_out_reg;
	  assign	new_inst_signal_out = new_inst_signal_out_reg;
	  assign processor_reset_seq_out = processor_reset_seq_out_reg;
	  assign sp_pkt_done_out = sp_pkt_done_out_reg;
	  assign sp_interrupt_wire_out = sp_interrupt_wire_out_reg;
	  
endmodule
