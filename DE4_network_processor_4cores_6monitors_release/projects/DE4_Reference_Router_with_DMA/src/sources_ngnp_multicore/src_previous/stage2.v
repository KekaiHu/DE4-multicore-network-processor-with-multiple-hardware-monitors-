//
`timescale 1ns/1ps

module stage2(
	
	  input			        reset,
        input                         core_sp_clk,
        input [31:0]                  bblock, // data fetched from the ram in the previous stage
        input [31:0]                  nhop,
        output reg [31:0]             previous_bblock,
        output reg [31:0]             previous_nhop,
        output                        fifo_read
             
);


reg fifo_read_reg;
assign fifo_read = fifo_read_reg;

reg to_fifo_reg;
assign to_fifo = to_fifo_reg;


always @(posedge core_sp_clk)
begin
	if(reset) begin
                    
                   previous_bblock <= 0;
		       previous_nhop <= 0;
                   fifo_read_reg <= 0;
                                    
		
	end else begin
		
                   previous_bblock <= bblock;
		       previous_nhop <= nhop;
                   fifo_read_reg <= 1;
                                 
        end        
		
end

endmodule
