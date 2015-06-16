//This module interfaces with Altera's PCIe core.
//However, the NetFPGA DMA engine expects signals that were in Xilinx's PCI core.
//This module mimicks that behavior, so that only minimal changes to the NETFPGA code are required.
//Module: pcie_interface



module pcie_interface
(
				input						clk,
				input						reset,
				//PCIe signals: Avalon-MM
				output  	reg	   	txs_chip_select,
				output  	reg			txs_read,
				output  	reg 			txs_write,
				output  	reg [31:0]	txs_address,
				output  	reg [9:0]	txs_burst_count,
				output  	reg [31:0]	txs_writedata,
				output  	reg [3:0]	txs_byteenable,
				input 	 				txs_read_valid,
				input 	 [31:0]		txs_readdata,
				input 	 				txs_wait_request,				
				
				input 	wire 			rxm_read,
				input 	wire     	rxm_write,
				input 	wire [31:0] rxm_address,
				input 	wire [31:0]	rxm_writedata,
				output  	reg 			rxm_wait_request,
				output  	reg [31:0]  rxm_readdata,
				output  	reg 			rxm_read_valid,
				
				output	wire 			interrupt_request, //an Avalon interrupt causes the PCIe core to send a legacy PCI interrupt
				
				//signals that interface with the CPCI modules.
				//These are from pci_userapp.v, with original comments
				output reg     		reg_hit,       // Indicates a hit on the CPCI registers
            output reg     		cnet_hit,      // Indicates a hit on the CNET address range

            output reg     		reg_we,        // Write enable signal for CPCI registers
            output reg     		cnet_we,       // Write enable signal for CNET

            output reg [`PCI_ADDR_WIDTH-1:0]   pci_addr,      // The address of the current transaction
            output reg [`PCI_DATA_WIDTH-1:0]   pci_data,      // The current data DWORD
            output reg       						pci_data_vld,  // Indicates data on pci_data is valid
            output [`PCI_BE_WIDTH-1:0]     		pci_be,        // Byte enables for current transaction

            output         		pci_retry,     // Retry signal from CSRs
            output         		pci_fatal,     // Fatal signal from CSRs


            input [`PCI_DATA_WIDTH-1:0]   reg_data,      // Data to be read for registers
            input [`PCI_DATA_WIDTH-1:0]   cnet_data,     // Data to be read for CNET

            input          		cnet_retry,    // Generate a retry for CNET
            input         			cnet_reprog,   // Is CNET being reprogrammed

            input          		reg_vld,       // Is the data on reg_data valid?
            input          		cnet_vld,      // Is the data on cnet_data valid?
				
            input          		dma_vld,       // Is the data on dma_data valid?

            input          		intr_req,      // Interrupt request

            input         			dma_request,   // Transaction request for DMA

            input [`PCI_DATA_WIDTH-1:0] 	dma_data,      // Data from DMA block
            input [`PCI_BE_WIDTH-1:0]   	dma_cbe,       // Command/byte enables for DMA block

            output reg        	dma_data_vld,  // Indicates data should be captured
            output reg        	dma_src_en,    // Next piece of data should be provided
                                          // on dma_data

            input          		dma_wrdn,      // Logic high = Write, low = read

            input          		dma_complete,  // Complete signal

            output        			dma_lat_timeout, // Latency timer has expired
            output reg        	dma_addr_st,   // Indicates that the core is 
                                          // currently in the address phase
            output reg        	dma_data_st,    // Core in the data state
				
				//xCG
				output reg [`PCI_DATA_WIDTH-1:0]	pci_data_to_dma, //original design used pci_data for both destinations
																				 //Separating them makes it a bit easier
				input	[8:0]					dma_xfer_cnt	//Tells us how many words are in a burst.
															//captured at the start of a transaction, from dma_engine_pci_xfer.v xfer_cnt
);

//-----------------------------------------------
//Receiver (Target) State Machine
//-----------------------------------------------
reg [1:0] r_state, r_state_next;
parameter R_IDLE = 2'b00, R_WAIT = 2'b01, R_FIN = 2'b10;
reg wait_request_next, read_valid_next;
reg [31:0] readdata_next;
reg reg_hit_next, reg_we_next, cnet_hit_next, cnet_we_next;
reg [31:0] pci_addr_next, pci_data_next;
reg pci_data_vld_next;

//Sequential block
always @(posedge clk, posedge reset)
begin
	if (reset) begin
		r_state <= R_IDLE;
		rxm_wait_request <= 1'b1; //assert during reset according to Avalon-MM spec
		rxm_readdata <= 'b0;
		rxm_read_valid <= 1'b0;
		reg_hit <= 1'b0;
		reg_we <= 1'b0;
		cnet_hit <= 1'b0;
		cnet_we <= 1'b0;
		pci_data_vld <= 1'b0;
	end
	else begin
		r_state <= r_state_next;
		rxm_wait_request <= wait_request_next;
		rxm_readdata <= readdata_next;
		rxm_read_valid <= read_valid_next;
		reg_hit <= reg_hit_next;
		reg_we <= reg_we_next;
		cnet_hit <= cnet_hit_next;
		cnet_we <= cnet_we_next;
		pci_addr <= pci_addr_next;
		pci_data <= pci_data_next;
		pci_data_vld <= pci_data_vld_next;
	end
end

//Combinational block
always @(*) //rxm_read or rxm_write or rxm_address or rxm_writedata or reg_data or cnet_data or reg_vld or cnet_vld)
begin
	//defaults
	r_state_next = r_state;
	wait_request_next = rxm_wait_request;
	readdata_next = rxm_readdata;
	read_valid_next = rxm_read_valid;
	reg_hit_next = reg_hit;
	reg_we_next = reg_we;
	cnet_hit_next = cnet_hit;
	cnet_we_next = cnet_we;
	pci_addr_next = pci_addr;
	pci_data_next = pci_data;
	pci_data_vld_next = pci_data_vld;
	
	case (r_state)
		R_IDLE: begin
			wait_request_next = 1'b0;
			if (rxm_read || rxm_write) begin
				wait_request_next = 1'b1; //tell the Avalon master we aren't ready yet
				//Use the same logic as in pci_userapp.v to determine if this is for registers or CNET
				if (rxm_address[`CPCI_CNET_ADDR_WIDTH-1:22] == 'h0) begin
					reg_hit_next = 1'b1;
					reg_we_next = rxm_write;
				end
				else begin //if (rxm_address[26:22] != 5'b0) begin
					cnet_hit_next = 1'b1;
					cnet_we_next = rxm_write;
				end
				
				//hand the data over
				pci_addr_next = rxm_address;
				pci_data_next = rxm_writedata;
				pci_data_vld_next = rxm_write;
				
				r_state_next = R_WAIT;
			end
		end
		
		R_WAIT: begin
			//there is no confirmation for a write. So we can just move on.
			if (rxm_write) begin
				wait_request_next = 1'b0;
				r_state_next = R_FIN;
			//for reads:
			end
			else if (reg_hit && reg_vld) begin //if registers are done reading
				readdata_next = reg_data;
				read_valid_next = 1'b1;
				//deassert waitrequest so Avalon master knows this is valid data
				wait_request_next = 1'b0;
				r_state_next = R_FIN;
			end
			else if (cnet_hit && cnet_vld) begin //cnet done reading
				readdata_next = cnet_data;
				read_valid_next = 1'b1;
				wait_request_next = 1'b0;
				r_state_next = R_FIN;
			end
		end
		
		R_FIN: begin
			//clean up
			reg_hit_next = 1'b0;
			reg_we_next = 1'b0;
			cnet_hit_next = 1'b0;
			cnet_we_next = 1'b0;
			pci_data_vld_next = 1'b0;
			read_valid_next = 1'b0;
			r_state_next = R_IDLE;
		end
		default: r_state_next = R_IDLE;
	endcase
end					


assign pci_be = 4'b1111; //Byte enables are active low, but pci_userapp.v inverted them. Assume enabled.

//The Avalon interface doesn't give us these. so just tie them down.
assign pci_retry = 1'b0;
assign pci_fatal = 1'b0;

//-----------------------------------------------
//Initiator State Machine
//-----------------------------------------------
reg [2:0] i_state, i_state_next;
//The original Xilinx PCI core had an address phase and a data phase. This state machine emulates that.
//During the address phase, the application presents the address and the command. 
//During the data phase, it presents data. The core uses a "src_en" signal to indicate to the application
//that it should present the next piece of data.
//For Avalon burst transfers, the size of the transfer must be known beforehand. So I simply modified the dma_engine to pass
//us this information, which it already calculated anyway.
parameter I_IDLE = 3'b000, I_ADDRESS = 3'b001, I_READ = 3'b010, I_READ_WAIT = 3'b011, I_WRITE = 3'b100, I_WRITE_WAIT = 3'b101,I_WRITE_WAIT2 = 3'b110;

reg dma_data_st_next, dma_addr_st_next;
reg [31:0] txs_address_next;
reg [9:0] txs_burst_count_next;
reg txs_read_next, txs_write_next, txs_chip_select_next;
reg dma_data_vld_next;
reg [31:0] pci_data_to_dma_next;
reg [31:0] txs_writedata_next;
reg dma_src_en_next;
reg [3:0] txs_byte_enable_next;

//counter to keep track of transaction progress
reg[8:0] write_count, write_count_next;

//Sequential block
always @(posedge clk or posedge reset)
begin
	if (reset) begin
		i_state <= I_IDLE;
		
		dma_data_st <= 1'b0;
		dma_addr_st <= 1'b0;
		txs_burst_count <= 'b0;
		txs_read <= 1'b0;
		txs_write <= 1'b0;
		txs_chip_select <= 1'b0;
		dma_data_vld <= 1'b0;
		dma_src_en <= 1'b0;
		write_count <= 9'b0;
		txs_byteenable <= 4'b0;
	end
	else begin
		i_state <= i_state_next;
		
		dma_data_st <= dma_data_st_next;
		dma_addr_st <= dma_addr_st_next;
		txs_address <= txs_address_next;
		txs_read <= txs_read_next;
		txs_write <= txs_write_next;
		txs_chip_select <= txs_chip_select_next;
		txs_burst_count <= txs_burst_count_next;
		dma_data_vld <= dma_data_vld_next;
		pci_data_to_dma <= pci_data_to_dma_next;
		dma_src_en <= dma_src_en_next;
		txs_writedata <= txs_writedata_next;
		write_count <= write_count_next;
		txs_byteenable <= txs_byte_enable_next;
	end
end

//Combination block
always @(*)//txs_read_valid or txs_readdata or txs_wait_request or dma_vld or dma_request 
	//or dma_data or dma_cbe or dma_wrdn or dma_complete)
begin
	//defaults
	i_state_next = i_state;
	dma_addr_st_next = dma_addr_st;
	dma_data_st_next = dma_data_st;
	txs_address_next = txs_address;
	txs_read_next = txs_read;
	txs_write_next = txs_write;
	txs_burst_count_next = txs_burst_count;
	txs_chip_select_next = txs_chip_select;
	dma_data_vld_next = 1'b0;
	pci_data_to_dma_next = pci_data_to_dma;
	dma_src_en_next = 1'b0;
	txs_writedata_next = txs_writedata;
	txs_byte_enable_next = txs_byteenable;
	write_count_next     = write_count; // Added by Hari
	
	case (i_state)
		I_IDLE: begin
		txs_byte_enable_next = 4'b0;
		txs_address_next = 32'b0;
		txs_burst_count_next = 10'b0;
		dma_data_vld_next = 1'b0;
			if (dma_request) begin
				i_state_next = I_ADDRESS;
				dma_addr_st_next = 1'b1;
			end
		end
		I_ADDRESS: begin
			if (dma_vld) begin
				if (dma_wrdn) begin
					i_state_next = I_WRITE;
					//dma_src_en_next = 1'b1; //  Added by Hari
					//dma_data_vld_next = 1'b1; // Added by Hari
				end
				else begin
					i_state_next = I_READ;
				end
				//The dma engine puts the address on its data line in the address phase.
				txs_address_next = dma_data;
				dma_data_st_next = 1'b1;
				dma_addr_st_next = 1'b0;
			end
		end
		I_READ: begin
			
			i_state_next = I_READ_WAIT;
			txs_read_next = 1'b1;
			txs_burst_count_next = 'b1;
			txs_chip_select_next = 1'b1;
			txs_byte_enable_next = ~dma_cbe;
		end
		I_READ_WAIT: begin
			if (txs_read_valid) begin
				i_state_next = I_IDLE;
				dma_data_st_next = 1'b0;
				dma_addr_st_next = 1'b0;
				txs_read_next = 1'b0;
				txs_chip_select_next = 1'b0;
				txs_burst_count_next = 10'b0;
				dma_data_vld_next = 1'b1;
				pci_data_to_dma_next = txs_readdata;				
			end
		end
		I_WRITE: begin
			if (!txs_wait_request) begin
				i_state_next = I_WRITE_WAIT;
				txs_write_next = 1'b1;
				txs_burst_count_next = {1'b0, dma_xfer_cnt};  //dma_xfer_cnt -1 ??
				txs_chip_select_next = 1'b1;
				txs_writedata_next = dma_data;
				dma_src_en_next = 1'b1; //tells the DMA engine we want the next piece of data on dma_data
				txs_byte_enable_next = ~dma_cbe; //pci has active low byte enables
				dma_data_vld_next = 1'b1; // added by Hari
				write_count_next = write_count + 1; // Added by Hari
			end	
		end
		I_WRITE_WAIT: begin
			if (write_count == (txs_burst_count[8:0])) begin
				i_state_next = I_WRITE_WAIT2;
				//dma_data_st_next = 1'b0;
				//dma_addr_st_next = 1'b0;
				//txs_write_next = 1'b0;
				//txs_chip_select_next = 1'b0;
				//txs_byte_enable_next = 4'b0;
				write_count_next = 9'b0;
				dma_data_vld_next = 1'b0;  // Added by Hari
				dma_src_en_next = 1'b0;  // Added by Hari
			end	
			else begin
				if (!txs_wait_request) begin
					write_count_next = write_count + 1;
					txs_writedata_next = dma_data;
					dma_src_en_next = 1'b1;
					dma_data_vld_next = 1'b1;
					txs_byte_enable_next = ~dma_cbe;
				end
				else begin
					dma_src_en_next = 1'b0;
					dma_data_vld_next = 1'b0;
				end
		   end
		 end	
		 I_WRITE_WAIT2: begin
			if (!txs_wait_request) begin
				i_state_next = I_IDLE;
				dma_data_st_next = 1'b0;
				dma_addr_st_next = 1'b0;
				txs_write_next = 1'b0;
				txs_chip_select_next = 1'b0;
				txs_byte_enable_next = 4'b0;
				write_count_next = 9'b0;
				dma_data_vld_next = 1'b0;  // Added by Hari
				dma_src_en_next = 1'b0;  // Added by Hari
			end	
		end
	endcase
end
		
assign dma_lat_timeout = 1'b0;

assign interrupt_request = intr_req;
endmodule
