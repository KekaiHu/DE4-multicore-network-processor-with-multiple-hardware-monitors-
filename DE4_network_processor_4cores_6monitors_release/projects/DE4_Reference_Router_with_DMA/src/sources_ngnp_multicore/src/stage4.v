//
`timescale 1ns/1ps

module stage4(
	
	  input			        reset,
        input                         core_sp_clk,
        input [31:0]                  dupl_bblock, // use the data fetched from the duplicate ram in the previous stage
        input [31:0]                  jump_bblock,
        output                        pkt_drop //input to the np_core (in case of detected error)
        

);

reg pkt_drop_reg;
assign pkt_drop = pkt_drop_reg;

always @(posedge core_sp_clk)
begin
	if(reset) begin
		pkt_drop_reg <= 0;
		
	end else begin
		
                if  (jump_bblock == dupl_bblock) begin
                    pkt_drop_reg <= 0;
                end else begin
                    pkt_drop_reg <=1;        //interrupt, drop packet
                end
                                                                        
        end        
		
end

endmodule
