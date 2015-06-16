//
`timescale 1ns/1ps

module stage3(
	
	  input			      reset,
        input                       core_sp_clk,
        input [31:0]                previous_bblock,
        input [31:0]                previous_nhop,
        input [31:0]		      fifo_pr_bblock,    // previous block read from the fifo
        input [31:0]                fifo_pr_nhop,
        output [12:2]     	      jump_index_addr,
        output [31:0]               jump_bblock
      
);



reg [12:2]     	      jump_index_addr_reg;
assign jump_index_addr = jump_index_addr_reg;

reg [31:0]     	      jump_bblock_reg;
reg [31:0]     	      jump_bblock_reg_tmp;


assign jump_bblock = jump_bblock_reg;

always @(posedge core_sp_clk)
begin
	if(reset) begin          
		        jump_index_addr_reg <= 0;
                    jump_bblock_reg <= 32'b00000000000000000000000000000001;
		    end else begin
		
                
                if ((fifo_pr_bblock == previous_bblock) || ((fifo_pr_bblock+1'b1) == previous_bblock) || ((fifo_pr_bblock-1'b1) == previous_bblock)) begin
                    
                    jump_index_addr_reg <= 0;
                    jump_bblock_reg_tmp <= 32'b00000000000000000000000000000001;
                          
                          end else begin
                    
                    jump_index_addr_reg <= fifo_pr_nhop[12:2];
                    jump_bblock_reg_tmp <= previous_bblock;
		    
                                   end
		    jump_bblock_reg <= jump_bblock_reg_tmp;
        end        
		
end

endmodule
