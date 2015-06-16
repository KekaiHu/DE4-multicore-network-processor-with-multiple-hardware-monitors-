///////////////////////////////////////////////////////////////////////////////
//
// Module: n_cpci_top.v
// Description: Based on NetFPGA's original cpci_top module.
//
///////////////////////////////////////////////////////////////////////////////

module n_cpci_top
#(parameter DMA_DATA_WIDTH=32) 
  (
				//xCG
				//PCIe interface ports
            output  	wire	   	txs_chip_select,
				output  	wire			txs_read,
				output  	wire 			txs_write,
				output  	wire [31:0]	txs_address,
				output  	wire [9:0]	txs_burst_count,
				output  	wire [31:0]	txs_writedata,
				output  	wire [3:0]	txs_byteenable,
				input 	wire 			txs_read_valid,
				input 	wire [31:0]	txs_readdata,
				input 	wire 			txs_wait_request,				
				
				input 	wire 			rxm_read_bar_1,
				input 	wire     	rxm_write_bar_1,
				input 	wire [31:0] rxm_address_bar_1,
				input 	wire [31:0]	rxm_writedata_bar_1,
				output  	wire 			rxm_wait_request_bar_1,
				output  	wire [31:0] rxm_readdata_bar_1,
				output  	wire 			rxm_read_valid_bar_1,
				
				output   wire 			interrupt_request,
				
				//Other signals

            input          nclk,          // CNET core clock
            output reg     cnet_reset,    // Reset signal to CNET
            input          phy_int_b,     // Interrupt signal from PHY

            output         cpci_rd_wr_L,  // Read/Write signal
            output         cpci_req,      // I/O request signal
            //output [`CPCI_CNET_ADDR_WIDTH-1:0] cpci_addr,
			output [31:0] cpci_addr, //xCG
            inout [`CPCI_CNET_DATA_WIDTH-1:0] cpci_data,
            input          cpci_wr_rdy,   // Write ready from CNET
            input          cpci_rd_rdy,   // Read ready from CNET
            input          cnet_err,      // Error signal from CNET

//here
            // --- CPCI DMA handshake signals 
            output [1:0] cpci_dma_op_code_req,
            output [3:0] cpci_dma_op_queue_id,
            input [1:0] cpci_dma_op_code_ack,
   
            // DMA data and flow control 
            output cpci_dma_vld_c2n,
            input cpci_dma_vld_n2c,
            inout [DMA_DATA_WIDTH-1:0] cpci_dma_data,
            input cpci_dma_q_nearly_full_n2c,
            output cpci_dma_q_nearly_full_c2n,
//to here				
            // Reprogramming signals xCG
            //output         rp_cclk,
            //output         rp_prog_b,
            //input          rp_init_b,
            //output         rp_cs_b,
            //output         rp_rdwr_b,
            //output [7:0]   rp_data,
            //input          rp_done,

            // Debug signals
            //output             cpci_led,      
            //output reg [28:0]  cpci_debug_data,
            //output [1:0]       cpci_debug_clk,

            // Allow reprogramming
            //output         allow_reprog,

            // CNET clock speed
            output         cnet_clk_sel,  // 1 = 125 MHz, 0 = 62.5 MHz

            // Board identification
            input          cpci_jmpr,     // Jumper on board
            input [3:0]    cpci_id,        // Rotary switch on board
			input		   reset
          );
          // synthesis syn_edif_bit_format = "%u<%i>"
          // synthesis syn_edif_scalar_format = "%u"
          // synthesis syn_noclockbuf = 1
          // synthesis syn_hier = "hard"
          //

   
// ==================================================================
// Local signals
// ==================================================================
wire [`PCI_ADDR_WIDTH - 1:0]  pci_addr;
wire [`PCI_BE_WIDTH - 1:0]    pci_be;
wire [`PCI_DATA_WIDTH - 1:0]  pci_data;
wire [`PCI_DATA_WIDTH - 1:0]  pci_data_to_dma;
wire [`PCI_DATA_WIDTH - 1:0]  reg_data;
wire [`PCI_DATA_WIDTH - 1:0]  cnet_data;
wire [`PCI_DATA_WIDTH - 1:0]  dma_data;
wire [`PCI_BE_WIDTH - 1:0]    dma_cbe;

wire [`CPCI_CNET_DATA_WIDTH - 1:0] p2n_data;  // cnet_reg

wire [`CPCI_CNET_ADDR_WIDTH - 1:0] p2n_addr;  // cnet_reg

wire [`CPCI_CNET_DATA_WIDTH - 1:0] n2p_data;

wire [31:0] cnet_rd_time;

wire [`CPCI_CNET_DATA_WIDTH - 1:0] cpci_data_wr;

wire [`PCI_DATA_WIDTH - 1:0]  prog_data;

wire [15:0] dma_pkt_avail;
wire dma_rd_request;
wire [3:0] dma_rd_request_q;
wire [15:0] dma_tx_full;

wire [`PCI_ADDR_WIDTH - 1:0] dma_data_frm_cnet;
wire [`PCI_ADDR_WIDTH - 1:0] dma_data_to_cnet;

wire dma_wr_en;
wire dma_wr_rdy;
wire [3:0] mac_wr_request;
wire dma_wr_store_size;

wire [`PCI_ADDR_WIDTH - 1:0] dma_rd_addr;
wire [3:0] dma_rd_mac;
wire [`PCI_DATA_WIDTH - 1:0] dma_rd_size;

wire [`PCI_ADDR_WIDTH - 1:0] dma_wr_addr;
wire [3:0] dma_wr_mac;
wire [`PCI_DATA_WIDTH - 1:0] dma_wr_size;

wire [31:0] dma_time;
wire [15:0]  dma_retries;

wire [`CPCI_CNET_DATA_WIDTH - 1:0]  dma_data_buf;
wire [`CPCI_CNET_ADDR_WIDTH - 1:0]  dma_addr_buf;

reg cnet_reset_1;

reg cnet_err_d1, cnet_err_sync;
reg phy_int_d1, phy_int_sync;

wire [31:0] n_clk_count;
wire [31:0] clk_chk_p_max;
wire [31:0] clk_chk_n_exp;

wire nclk_int;

reg startup_reset;
//reg reset; xCG

wire [8:0]	dma_xfer_cnt;

   
// Following are temp assignments to prevent signals being removed in synthesis
//

   wire clk;
	assign clk = nclk; //xCG

//xCG
//   assign cpci_debug_clk[1:0] = {~nclk_int, ~clk};
//   always @(posedge clk)
//     cpci_debug_data <= pci_data;

// clock_checker checks the relative frequencies of the PCI clock and
// the sys_clk

   cpci_clock_checker cc (
      .error           (clock_checker_led),   // drive LED
      .n_clk_count     (n_clk_count),
      .clk_chk_p_max   (clk_chk_p_max),
      .clk_chk_n_exp   (clk_chk_n_exp),
      .reset           (reset),
      .shift_amount    (cpci_id),
      .p_clk           (clk),
      .n_clk           (nclk_int)
   );

   // synthesis attribute keep_hierarchy of cc is false;

// ==================================================================
// DLL to deskew the nclk
// ==================================================================
//   BUFGDLL nclk_dll(
//               .I(nclk),
//               .O(nclk_int)
//            ); xCG
assign nclk_int = nclk;

   // synthesis attribute keep_hierarchy of nclk_dll is false;

// ==================================================================
// Instantiate the PCI TOP module
// ==================================================================

//   pcim_top pcim_top (
//               .AD( AD ),
//               .CBE( CBE ),
//               .PAR( PAR ),
//               .FRAME_N( FRAME_N ),
//               .TRDY_N( TRDY_N ),
//               .IRDY_N( IRDY_N ),
//               .STOP_N( STOP_N ),
//               .DEVSEL_N( DEVSEL_N ),
//               .IDSEL( IDSEL ),
//               .INTR_A( INTR_A ),
//               .PERR_N( PERR_N ),
//               .SERR_N( SERR_N ),
//               .REQ_N( REQ_N ),
//               .GNT_N( GNT_N ),
//               .RST_N( RST_N ),
//               .PCLK( PCLK ),
//
//               // Additional ports
//               .reg_hit (reg_hit),
//               .cnet_hit (cnet_hit),
//
//               .reg_we (reg_we),
//               .cnet_we (cnet_we),
//
//               .pci_addr (pci_addr),
//               .pci_data (pci_data),
//               .pci_data_vld (pci_data_vld),
//               .pci_be (pci_be),
//
//	       .pci_retry (pci_retry),
//	       .pci_fatal (pci_fatal),
//
//
//               .reg_data (reg_data),
//               .cnet_data (cnet_data),
//
//               .cnet_retry (cnet_retry),
//               .cnet_reprog (cnet_reprog),
//
//               .reg_vld (reg_vld),
//               .cnet_vld (cnet_vld),
//               .dma_vld (dma_vld),
//
//               .intr_req (intr_req),
//
//               .dma_request (dma_request),
//
//               .dma_data (dma_data),
//               .dma_cbe (dma_cbe),
//
//               .dma_data_vld (dma_data_vld),
//               .dma_src_en (dma_src_en),
//
//
//               .dma_wrdn (dma_wrdn),
//
//               .dma_complete (dma_complete),
//
//               .dma_lat_timeout (dma_lat_timeout),
//               .dma_addr_st (dma_addr_st),
//
//               .dma_data_st (dma_data_st),
//
//
//               .clk (clk),
//               .pci_reset (pci_reset)
//            );
pcie_interface pcie_i
(
				.clk (clk),
				.reset(reset),
				.txs_chip_select (txs_chip_select),
				.txs_read (txs_read),
				.txs_write (txs_write),
				.txs_address (txs_address),
				.txs_burst_count (txs_burst_count),
				.txs_writedata (txs_writedata),
				.txs_byteenable (txs_byteenable),
				.txs_read_valid (txs_read_valid),
				.txs_readdata (txs_readdata),
				.txs_wait_request (txs_wait_request),				
				
				.rxm_read (rxm_read_bar_1),
				.rxm_write (rxm_write_bar_1),
				.rxm_address (rxm_address_bar_1),
				.rxm_writedata (rxm_writedata_bar_1),
				.rxm_wait_request (rxm_wait_request_bar_1),
				.rxm_readdata (rxm_readdata_bar_1),
				.rxm_read_valid (rxm_read_valid_bar_1),
				
				.interrupt_request (interrupt_request),
				
				.reg_hit (reg_hit),
            .cnet_hit (cnet_hit),

            .reg_we (reg_we),
            .cnet_we (cnet_we),

            .pci_addr (pci_addr),
            .pci_data (pci_data),
            .pci_data_vld (pci_data_vld),
            .pci_be (pci_be),
            .pci_retry (pci_retry),
            .pci_fatal (pci_fatal),
            .reg_data (reg_data),
            .cnet_data (cnet_data),

            .cnet_retry (cnet_retry),
            .cnet_reprog (cnet_reprog),

            .reg_vld (reg_vld),
            .cnet_vld (cnet_vld),
				
            .dma_vld (dma_vld),

            .intr_req (intr_req),

            .dma_request (dma_request),
            .dma_data (dma_data),
            .dma_cbe (dma_cbe),

            .dma_data_vld (dma_data_vld),
            .dma_src_en (dma_src_en),

            .dma_wrdn (dma_wrdn),

            .dma_complete (dma_complete),

            .dma_lat_timeout (dma_lat_timeout),
            .dma_addr_st (dma_addr_st),
            .dma_data_st (dma_data_st),

				.pci_data_to_dma (pci_data_to_dma),
				.dma_xfer_cnt (dma_xfer_cnt)
);


// ==================================================================
// Instantiate the register file
// ==================================================================

   reg_file reg_file (
               .pci_addr (pci_addr),
               .reg_hit (reg_hit),
               .reg_we (reg_we),
               .pci_be (pci_be),
               .pci_data (pci_data),
               .pci_data_vld (pci_data_vld),
               .reg_data (reg_data),
               .reg_vld (reg_vld),
               .reg_reset (reg_reset),
               .prog_data (prog_data),
               .prog_data_vld (prog_data_vld),
               .prog_reset (prog_reset),
               .intr_req (intr_req),
               .cnet_hit (cnet_hit),
               .cnet_we (cnet_we),
               .empty (empty),
               .prog_init (prog_init),
               .prog_done (prog_done),
               .cnet_reprog (cnet_reprog),
               .dma_rd_addr (dma_rd_addr),
               .dma_wr_addr (dma_wr_addr),
               .dma_rd_mac (dma_rd_mac),
               .dma_wr_mac (dma_wr_mac),
               .dma_rd_size (dma_rd_size),
               .dma_wr_size (dma_wr_size),
               .dma_rd_owner (dma_rd_owner),
               .dma_wr_owner (dma_wr_owner),
               .dma_rd_done (dma_rd_done),
               .dma_wr_done (dma_wr_done),
               .dma_in_progress (dma_in_progress),
               .dma_time (dma_time),
               .dma_retries (dma_retries),
               .cnet_rd_time (cnet_rd_time),
               .cpci_jmpr (cpci_jmpr),
               .cpci_id (cpci_id),
               .prog_overflow (prog_overflow),
               .prog_error (prog_error),
               .dma_buf_overflow (dma_buf_overflow),
               .dma_rd_size_err (dma_rd_size_err),
               .dma_wr_size_err (dma_wr_size_err),
               .dma_rd_addr_err (dma_rd_addr_err),
               .dma_wr_addr_err (dma_wr_addr_err),
               .dma_rd_mac_err (dma_rd_mac_err),
               .dma_wr_mac_err (dma_wr_mac_err),
               .dma_timeout (dma_xfer_timeout),
               .dma_retry_expire (dma_retry_expire),
               .dma_fatal_err (dma_fatal_err),
               .cnet_rd_timeout (cnet_rd_timeout),
               .cnet_err (cnet_err_sync),
               .dma_rd_intr (dma_rd_intr),
               .dma_wr_intr (dma_wr_intr),
               .phy_intr (phy_int_sync),
               .dma_pkt_avail (dma_pkt_avail),
               .cnet_clk_sel (cnet_clk_sel),
               .cpci_led (cpci_led_reg),
					.n_clk_count(n_clk_count),
               .clk_chk_p_max   (clk_chk_p_max),
               .clk_chk_n_exp   (clk_chk_n_exp),
               .try_cnet_reset (try_cnet_reset),
               .host_is_le (host_is_le),
               //.pci_reset (pci_reset), xCG
			   .pci_reset(reset),
               .clk (clk)
            );

   // synthesis attribute keep_hierarchy of reg_file is false;


// ==================================================================
// CNET register access module
// ==================================================================

   cnet_reg_access cnet_reg_access(
               .pci_addr (pci_addr),
               .pci_be (pci_be),
               .pci_data (pci_data),
               .pci_data_vld (pci_data_vld),
               .cnet_we (cnet_we),
               .cnet_hit (cnet_hit),
               .cnet_data (cnet_data),
               .cnet_vld (cnet_vld),
               .cnet_retry (cnet_retry),
               .p2n_data (p2n_data),
               .p2n_addr (p2n_addr),
               .p2n_we (p2n_we),
               .p2n_req (p2n_req),
               .p2n_full (p2n_full),
               .n2p_data (n2p_data),
               .n2p_rd_rdy (n2p_rd_rdy),
               .cnet_reprog (cnet_reprog),
               .reset (reset),
               .clk (clk)
            );

   // synthesis attribute keep_hierarchy of cnet_reg_access is false;

// ==================================================================
// CNET register interface module (handles clock domain crossing)
// ==================================================================

   cnet_reg_iface cnet_reg_iface (
               .p2n_data (p2n_data),
               .p2n_addr (p2n_addr),
               .p2n_we (p2n_we),
               .p2n_req (p2n_req),
               .p2n_full (p2n_full),
               .p2n_almost_full (p2n_almost_full),
               .n2p_data (n2p_data),
               .n2p_rd_rdy (n2p_rd_rdy),
               .cnet_reprog (cnet_reprog),
               .cnet_hit (cnet_hit),
               .cnet_rd_time (cnet_rd_time),
               .cnet_rd_timeout (cnet_rd_timeout),
               .cpci_rd_wr_L (cpci_rd_wr_L),
               .cpci_req (cpci_req),
               .cpci_addr (cpci_addr),
               .cpci_data_wr (cpci_data_wr),
               .cpci_data_rd (cpci_data),
               .cpci_data_tri_en (cpci_data_tri_en),
               .cpci_wr_rdy (cpci_wr_rdy),
               .cpci_rd_rdy (cpci_rd_rdy),
               .reset (reset),
               .pclk (clk),
               .nclk (nclk_int)
            );
 
   // synthesis attribute keep_hierarchy of cnet_reg_iface is false;
   // synthesis attribute iob of cpci_data_tri_en is true;
   // synthesis attribute iob of cpci_data_wr is true;
   // synthesis attribute iob of cpci_addr is true;
   // synthesis attribute iob of cpci_rd_rdy is true;
   // synthesis attribute iob of cpci_wr_rdy is true;
   // synthesis attribute iob of cpci_req is true;
   // synthesis attribute iob of cpci_data is true;
   // synthesis attribute iob of cpci_rd_wr_L is true;
   // synthesis attribute iob of cpci_tx_full is true;

// ==================================================================
// CNET reprogramming module
// ==================================================================

   cnet_reprogram cnet_reprogram(
            .prog_data (prog_data),
            .prog_data_vld (prog_data_vld),
            .prog_reset (prog_reset),
            .cnet_reprog (cnet_reprog),
            .overflow (prog_overflow),
            .error (prog_error),
	    .empty (empty),
            .init (prog_init),
            .done (), //xCG
            .rp_prog_b (rp_prog_b),
            .rp_init_b (rp_init_b),
            .rp_cclk (rp_cclk),
            .rp_cs_b (rp_cs_b),
            .rp_rdwr_b (rp_rdwr_b),
            .rp_data (rp_data),
            .rp_done (rp_done),
            .reset (reset),
            .clk (clk)
         );
	assign prog_done = 1'b1;

   // synthesis attribute keep_hierarchy of cnet_reprogram is false;

// ==================================================================
// Clock-domain crossing buffer for DMA
// ==================================================================

   wire [31:0] cpci_dma_data_c2n;
   wire        cpci_dma_data_tri_en;

   assign cpci_dma_data = cpci_dma_data_tri_en ? cpci_dma_data_c2n :'b z;
   
   //assign dma_pkt_avail = 4'hffff; //xCG TESTING
   cnet_dma_bus_master cnet_dma_bus_master
     (
      .dma_pkt_avail (dma_pkt_avail), 
      .dma_rd_request (dma_rd_request),
      .dma_rd_request_q (dma_rd_request_q),
      .dma_rd_data (dma_data_frm_cnet),
      .dma_rd_en (dma_rd_en),
      .dma_tx_full (dma_tx_full),
      .dma_nearly_empty (dma_nearly_empty),
      .dma_empty (dma_empty),
      .dma_all_in_buf (dma_all_in_buf),
      .overflow (dma_buf_overflow),
      .cnet_reprog (cnet_reprog),

      .dma_wr_data (dma_data_to_cnet),
      .dma_wr_en (dma_wr_en),
      .dma_wr_rdy (dma_wr_rdy),
      
      // --- CPCI DMA handshake signals 
      //outputs:
      .cpci_dma_op_code_req ( cpci_dma_op_code_req ),
      .cpci_dma_op_queue_id ( cpci_dma_op_queue_id ),

      //inputs:
      .cpci_dma_op_code_ack ( cpci_dma_op_code_ack ),
      
      // DMA data and flow control
      // data transfer in:
      //inputs:  
      .cpci_dma_vld_n2c ( cpci_dma_vld_n2c ),
      .cpci_dma_data_n2c ( cpci_dma_data ),

      //outputs:
      .cpci_dma_q_nearly_full_c2n ( cpci_dma_q_nearly_full_c2n ),
   
      // data transfer out: 
      //outputs:
      .cpci_dma_vld_c2n ( cpci_dma_vld_c2n ),
      .cpci_dma_data_c2n ( cpci_dma_data_c2n ),
      .cpci_dma_data_tri_en ( cpci_dma_data_tri_en ), 

      //inputs: 
      .cpci_dma_q_nearly_full_n2c ( cpci_dma_q_nearly_full_n2c ),
      
      //misc: 
      .reset (reset),
      .pclk (clk),
      .nclk (nclk_int)
      );
   // synthesis attribute keep_hierarchy of cnet_dma_bus_master is false;   
   // synthesis attribute iob of cpci_dma_op_code_req is true;
   // synthesis attribute iob of cpci_dma_op_queue_id is true;
   // synthesis attribute iob of cpci_dma_op_code_ack is true;
   // synthesis attribute iob of cpci_dma_vld_n2c is true;
   // synthesis attribute iob of cpci_dma_data is true;
   // synthesis attribute iob of cpci_dma_q_nearly_full_c2n is true;
   // synthesis attribute iob of cpci_dma_vld_c2n is true;
   // synthesis attribute iob of cpci_dma_data_c2n is true;
   // synthesis attribute iob of cpci_dma_data_tri_en is true;
   // synthesis attribute iob of cpci_dma_q_nearly_full_n2c is true;
 

   
// ==================================================================
// DMA Engine
// ==================================================================

dma_engine dma_engine(
            .pci_data (pci_data_to_dma), //xCG
            .dma_data (dma_data),
            .dma_cbe (dma_cbe),
            .dma_vld (dma_vld),
            .dma_wrdn (dma_wrdn),
            .dma_request (dma_request),
            .dma_complete (dma_complete),
            .dma_data_vld (dma_data_vld),
            .dma_src_en (dma_src_en),
            .dma_lat_timeout (dma_lat_timeout),
            .dma_addr_st (dma_addr_st),
            .dma_data_st (dma_data_st),
            .dma_rd_intr (dma_rd_intr),
            .dma_wr_intr (dma_wr_intr),
            .pci_retry (pci_retry),
            .pci_fatal (pci_fatal),
            .dma_rd_addr (dma_rd_addr),
            .dma_wr_addr (dma_wr_addr),
            .dma_rd_mac (dma_rd_mac),
            .dma_wr_mac (dma_wr_mac),
            .dma_rd_size (dma_rd_size),
            .dma_wr_size (dma_wr_size),
            .dma_rd_owner (dma_rd_owner),
            .dma_wr_owner (dma_wr_owner),
            .dma_rd_done (dma_rd_done),
            .dma_wr_done (dma_wr_done),
            .dma_time (dma_time),
            .dma_timeout (dma_xfer_timeout),
            .dma_retries (dma_retries),
            .dma_retry_expire (dma_retry_expire),
            .dma_rd_size_err (dma_rd_size_err),
            .dma_wr_size_err (dma_wr_size_err),
            .dma_rd_addr_err (dma_rd_addr_err),
            .dma_wr_addr_err (dma_wr_addr_err),
            .dma_rd_mac_err (dma_rd_mac_err),
            .dma_wr_mac_err (dma_wr_mac_err),
            .dma_fatal_err (dma_fatal_err),
            .dma_in_progress (dma_in_progress),
            .host_is_le (host_is_le),
            .dma_pkt_avail (dma_pkt_avail),
            .dma_rd_request (dma_rd_request),
            .dma_rd_request_q (dma_rd_request_q),
            .dma_data_frm_cnet (dma_data_frm_cnet),
            .dma_rd_en (dma_rd_en),
            .dma_data_to_cnet (dma_data_to_cnet),
            .dma_wr_en (dma_wr_en),
            .dma_wr_rdy (dma_wr_rdy),
            .dma_tx_full (dma_tx_full),
            .dma_nearly_empty (dma_nearly_empty),
            .dma_empty (dma_empty),
            .dma_all_in_buf (dma_all_in_buf),
            .cnet_reprog (cnet_reprog),
            .reset (reset),
            .clk (clk),
				.xfer_cnt (dma_xfer_cnt) //xCG
         );

   // synthesis attribute keep_hierarchy of dma_engine is false;

// ==================================================================
// Heartbeat
// ==================================================================
cpci_heartbeat cpci_heartbeat (
        .heartbeat(heartbeat_led),
        .reset    (reset),
        .clk      (clk)
        );

   // synthesis attribute keep_hierarchy of cpci_heartbeat is false;

// ==================================================================
// Chipscope
// ==================================================================
/*chipscope chipscope(
            .cpci_jmpr (cpci_jmpr),
            .cpci_id (cpci_id),
	    .empty (empty),
            .prog_init (prog_init),
            .prog_done (prog_done),
            .cnet_reprog (cnet_reprog),
            .pci_addr (pci_addr),
            .pci_data (pci_data),
            .pci_data_vld (pci_data_vld),
            .reg_hit (reg_hit),
            .reg_we (reg_we),
            .reg_vld (reg_vld),
            .pci_reset (pci_reset),
            .clk (clk)
         );*/


// Generate the global reset signal
//
// Force the chip to reset on startup
initial
begin
   startup_reset = 1;
end
always @(posedge clk)
begin
   startup_reset <= 1'b0;
   //reset <= pci_reset || reg_reset || startup_reset; xCG
end

// Generate the cpci_data signal
assign cpci_data = cpci_data_tri_en ? cpci_data_wr : 'bz;

// Generate the cnet_reset signal
always @(posedge nclk_int)
begin
   //cnet_reset <= cnet_reset_1;
   //cnet_reset_1 <= pci_reset || try_cnet_reset;
   cnet_reset <= reset; //xCG, changed this because was getting x in simulation.
end

// Generate the cnet_err_sync signal
always @(posedge clk)
begin
   //if (pci_reset) begin //xCG
	if (reset) begin
      cnet_err_d1 <= 1'b0;
      cnet_err_sync <= 1'b0;
   end
   else begin
      cnet_err_d1 <= cnet_err;
      cnet_err_sync <= cnet_err_d1;
   end
end

// Generate the phy_int_sync signal
always @(posedge clk)
begin
   //if (pci_reset) begin xCG
	if (reset) begin
      phy_int_d1 <= 1'b0;
      phy_int_sync <= 1'b0;
   end
   else begin
      phy_int_d1 <= ~phy_int_b;
      phy_int_sync <= phy_int_d1;
   end
end

//   assign cpci_led = heartbeat_led;
   assign cpci_led = (cpci_id == 4'h0) ? heartbeat_led : ~clock_checker_led;

// Disallow reprogramming
assign allow_reprog = 1'b1;
   
   
endmodule // cpci_top

/* vim:set shiftwidth=3 softtabstop=3 expandtab: */
