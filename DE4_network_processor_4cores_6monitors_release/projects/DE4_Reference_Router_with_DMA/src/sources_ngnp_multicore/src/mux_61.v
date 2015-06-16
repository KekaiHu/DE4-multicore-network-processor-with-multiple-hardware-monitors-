// This is a 6 to 1 mux that inputs from the 6 monitors and outputs to the 4 cpus
// Author: Kekai Hu. Mar 1, 2013

module mux_61(
    input       [2:0] sel,
	 
	 input out_ack_reset_0,
	 input packet_drop_signal_0,
	 
	 input out_ack_reset_1,
	 input packet_drop_signal_1,
	 
	 input out_ack_reset_2,
	 input packet_drop_signal_2,

	 input out_ack_reset_3,
	 input packet_drop_signal_3,
	 
	 input out_ack_reset_4,
	 input packet_drop_signal_4,
	 
	 input out_ack_reset_5,
	 input packet_drop_signal_5,
	 
	 output out_ack_reset_out,
	 output packet_drop_signal_out
);

    reg out_ack_reset_out_reg;
	 reg packet_drop_signal_out_reg;
	 
     always @(*) begin
     case (sel)
	    3'b000: begin
		      out_ack_reset_out_reg = out_ack_reset_0;
		      packet_drop_signal_out_reg = packet_drop_signal_0;
		      end
			
		3'b001: begin
		     out_ack_reset_out_reg = out_ack_reset_1;
		     packet_drop_signal_out_reg = packet_drop_signal_1;
			  end
			
		3'b010: begin
		     out_ack_reset_out_reg = out_ack_reset_2;
		     packet_drop_signal_out_reg = packet_drop_signal_2;
			  end
			
		3'b011: begin
		     out_ack_reset_out_reg = out_ack_reset_3;
		     packet_drop_signal_out_reg = packet_drop_signal_3;
			  end
			
		3'b100: begin
		     out_ack_reset_out_reg = out_ack_reset_4;
		     packet_drop_signal_out_reg = packet_drop_signal_4;
			  end
			
		3'b101: begin
		     out_ack_reset_out_reg = out_ack_reset_5;
		     packet_drop_signal_out_reg = packet_drop_signal_5;
			  end
			
		default: begin
		     out_ack_reset_out_reg = 0;
		     packet_drop_signal_out_reg = 0;
			  end
	   endcase
		end
	   
		assign out_ack_reset_out = out_ack_reset_out_reg;
		assign packet_drop_signal_out = packet_drop_signal_out_reg;
		
endmodule
		