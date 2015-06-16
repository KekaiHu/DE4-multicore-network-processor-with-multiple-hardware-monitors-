//
`timescale 1ns/1ps

module stage1(
	
	input	       reset,
      input        core_sp_clk,
	input [31:0] ppu_mem_addr,
	output[12:2] index_addr,
      output       fifo_write
            
);


reg [12:2] index_addr_reg;
assign index_addr = index_addr_reg;

reg fifo_write_reg;
assign fifo_write = fifo_write_reg;


always @ (posedge core_sp_clk) begin
	if(reset) begin
		index_addr_reg <= 0;
               
		 fifo_write_reg <= 0;
                
	end else begin
                
                 fifo_write_reg <= 1;
                if ((ppu_mem_addr[31:12] == 20'b00000000000000000000) && (ppu_mem_addr < 32'h000002ff) )
                begin  
		index_addr_reg <= ppu_mem_addr[12:2];
                
                end 
              
	end
end


endmodule
