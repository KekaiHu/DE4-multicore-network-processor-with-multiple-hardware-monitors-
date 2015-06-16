`timescale 1 ps / 1 ps 
//-----------------------------------------------------------------------------
// Title         : PCI Express BFM Root Port Driver 
// Project       : PCI Express MegaCore function
//-----------------------------------------------------------------------------
// File          : altpcietb_bfm_driver.v
// Author        : Altera Corporation
//-----------------------------------------------------------------------------
// Description :
// This module is driver for the Root Port BFM. It processes the list of
// functions to perform and passes them off to the VC specific interfaces
//-----------------------------------------------------------------------------
// Copyright (c) 2010 Altera Corporation. All rights reserved.  Altera products are
// protected under numerous U.S. and foreign patents, maskwork rights, copyrights and
// other intellectual property laws.  
//
// This reference design file, and your use thereof, is subject to and governed by
// the terms and conditions of the applicable Altera Reference Design License Agreement.
// By using this reference design file, you indicate your acceptance of such terms and
// conditions between you and Altera Corporation.  In the event that you do not agree with
// such terms and conditions, you may not use the reference design file. Please promptly
// destroy any copies you have made.
//
// This reference design file being provided on an "as-is" basis and as an accommodation 
// and therefore all warranties, representations or guarantees of any kind 
// (whether express, implied or statutory) including, without limitation, warranties of 
// merchantability, non-infringement, or fitness for a particular purpose, are 
// specifically disclaimed.  By making this reference design file available, Altera
// expressly does not recommend, suggest or require that this reference design file be
// used in combination with any other product not provided by Altera.
//-----------------------------------------------------------------------------
module altpcietb_bfm_driver (clk_in, rstn, INTA, INTB, INTC, INTD, dummy_out);

parameter RUN_TGT_MEM_TST = 0;
parameter RUN_DMA_MEM_TST = 0;
parameter AVALON_MM_LITE = 0;
parameter MEM_OFFSET = 32'h8000_0000;

   // TEST_LEVEL is a parameter passed in from the top level test bench that
   // could control the amount of testing done. It is not currently used. 
   parameter TEST_LEVEL  = 1;

   `include "altpcietb_bfm_constants.v"
   `include "altpcietb_bfm_log.v"
   `include "altpcietb_bfm_shmem.v"
   `include "altpcietb_bfm_rdwr.v"
   `include "altpcietb_bfm_configure.v"

   // The clk_in and rstn signals are provided for possible use in controlling
   // the transactions issued, they are not currently used.
   input clk_in; 
   input rstn;
   input INTA;
   input INTB;
   input INTC;
   input INTD;
   output dummy_out; 

   // purpose: Use Reads and Writes to test the target memory
   //          The starting offset in the target memory and the
   //          length can be specified
   task target_mem_test;
      input bar_table;      // Pointer to the BAR sizing and
      integer bar_table;    // address information set up by
                            // the configuration routine
      input tgt_bar;        // BAR to use to access the target
      integer tgt_bar;      // memory
      input start_offset;   // Starting offset in the target
      integer start_offset; // memory to use
      input tgt_data_len;   // Length of data to test
      integer tgt_data_len;

      parameter TGT_WR_DATA_ADDR = 1 * (2 ** 16); 
      integer tgt_rd_data_addr; 
      integer err_addr; 

      reg unused_result ;
      
      begin  // target_mem_test
         unused_result = ebfm_display(EBFM_MSG_INFO, "Starting Target Write/Read Test."); 
         unused_result = ebfm_display(EBFM_MSG_INFO, {"  Target BAR = ", dimage1(tgt_bar)}); 
         unused_result = ebfm_display(EBFM_MSG_INFO, {"  Length = ", dimage6(tgt_data_len), ", Start Offset = ", dimage6(start_offset)}); 
         // Setup some data to write to the Target
         shmem_fill(TGT_WR_DATA_ADDR, SHMEM_FILL_DWORD_INC, tgt_data_len, {64{1'b0}}); 
         // Setup an address for the data to read back from the Target
         tgt_rd_data_addr = TGT_WR_DATA_ADDR + (2 * tgt_data_len); 
         // Clear the target data area
         shmem_fill(tgt_rd_data_addr, SHMEM_FILL_ZERO, tgt_data_len, {64{1'b0}}); 
         //
         // Now write the data to the target with this BFM call
         //
         ebfm_barwr(bar_table, tgt_bar, start_offset, TGT_WR_DATA_ADDR, tgt_data_len, 0); 
         //
         // Read the data back from the target in one burst, wait for the read to
         // be complete
         // 
         ebfm_barrd_wait(bar_table, tgt_bar, start_offset, tgt_rd_data_addr, tgt_data_len, 0); 
         // Check the data
         if (shmem_chk_ok(tgt_rd_data_addr, SHMEM_FILL_DWORD_INC, tgt_data_len, {64{1'b0}}, 1'b1))
         begin
            unused_result = ebfm_display(EBFM_MSG_INFO, "  Target Write and Read compared okay!"); 
         end
         else
         begin
            unused_result = ebfm_display(EBFM_MSG_ERROR_FATAL, "  Stopping simulation due to miscompare"); 
         end 
      end
   endtask

  task target_mem_test_lite;
      input bar_table;      // Pointer to the BAR sizing and
      integer bar_table;    // address information set up by
                            // the configuration routine
      input tgt_bar;        // BAR to use to access the target
      integer tgt_bar;      // memory
      input start_offset;   // Starting offset in the target
      integer start_offset; // memory to use
      input tgt_data_len;   // Length of data to test
      integer tgt_data_len;

      parameter TGT_WR_DATA_ADDR = 1 * (2 ** 16); 
      integer tgt_rd_data_addr; 
      integer err_addr; 

      reg unused_result ;
      
      begin  // target_mem_test_lite (single DW)
         unused_result = ebfm_display(EBFM_MSG_INFO, "Starting Target Write/Read Test."); 
         unused_result = ebfm_display(EBFM_MSG_INFO, {"  Target BAR = ", dimage1(tgt_bar)}); 
         unused_result = ebfm_display(EBFM_MSG_INFO, {"  Length = ", dimage6(tgt_data_len), ", Start Offset = ", dimage6(start_offset)}); 
         // Setup some data to write to the Target
         shmem_fill(TGT_WR_DATA_ADDR, SHMEM_FILL_DWORD_INC, 32, {64{1'b0}});  /// 32 bytes
         // Setup an address for the data to read back from the Target
         tgt_rd_data_addr = TGT_WR_DATA_ADDR + (2 * 32);              // 32-bytes
         // Clear the target data area
         shmem_fill(tgt_rd_data_addr, SHMEM_FILL_ZERO, 32, {64{1'b0}}); 
         //
         // Now write the data to the target with this BFM call
         //
         ebfm_barwr(bar_table, tgt_bar, start_offset, TGT_WR_DATA_ADDR, 4, 0); 
         //
         // Read the data back from the target in one burst, wait for the read to
         // be complete
         // 
         ebfm_barrd_wait(bar_table, tgt_bar, start_offset, tgt_rd_data_addr, 4, 0); 
         // Check the data
         if (shmem_chk_ok(tgt_rd_data_addr, SHMEM_FILL_DWORD_INC, 4, {64{1'b0}}, 1'b1))
         begin
            unused_result = ebfm_display(EBFM_MSG_INFO, "  Target Write and Read compared okay!"); 
         end
         else
         begin
            unused_result = ebfm_display(EBFM_MSG_ERROR_FATAL, "  Stopping simulation due to miscompare"); 
         end 
      end
   endtask



   // purpose: This procedure polls the DMA engine until it is done
  task dma_wait_done;
      input bar_table; 
      integer bar_table;
      input setup_bar; 
      integer setup_bar;
      input msi_mem; 
      integer msi_mem;
      

      reg [31:0] dma_sts ;
      reg unused_result;
      begin
         // dma_wait_done
         shmem_fill(msi_mem, SHMEM_FILL_ZERO, 4, {64{1'b0}});
         dma_sts = 32'h00000000 ;
         while (dma_sts != 32'h0000abcd)
         begin
            #10
            dma_sts = shmem_read(msi_mem,4) ;
         end 
         
         unused_result = ebfm_display(EBFM_MSG_INFO, "MSI recieved!");
        // ebfm_barwr_imm(bar_table, setup_bar, 16'h1000,  32'h00000000, 4, 0);  // clear done bit in status reg  
        // unused_result = ebfm_display(EBFM_MSG_INFO, "  Clear interrupt !");
         
         
      end

   endtask

   // purpose: Use the reference design's DMA engine to move data from the BFM's
   // shared memory to the reference design's master memory and then back
   task dma_mem_test;
      input bar_table;      // Pointer to the BAR sizing and
      integer bar_table;    // address information set up by
                            // the configuration routine
      input setup_bar;      // BAR to be used for setting up
      integer setup_bar;    // the DMA operation and checking
                            // the status 
      input start_offset;   // Starting offset in the master
      integer start_offset; // memory 
      input dma_data_len;   // Length of DMA operations 
      integer dma_data_len;

      parameter SCR_MEM = (2 ** 17) - 4; 
      integer dma_rd_data_addr; 
      integer dma_wr_data_addr; 
      integer err_addr; 
      reg [2:0] compl_status;
      reg [2:0]  multi_message_enable;
      reg        msi_enable;
      reg [31:0] msi_capabilities ;
      reg [15:0] msi_data;
      reg [31:0] msi_address;
integer passthru_msk;

      reg unused_result ;
      
      begin
      unused_result = ebfm_display(EBFM_MSG_INFO, "Starting DMA Read/Write Test."); 
         unused_result = ebfm_display(EBFM_MSG_INFO, {"  Setup BAR = ", dimage1(setup_bar)}); 
         unused_result = ebfm_display(EBFM_MSG_INFO, {"  Length = ", dimage6(dma_data_len), 
                                      ", Start Offset = ", dimage6(start_offset)}); 
         dma_rd_data_addr = SCR_MEM + 4 + start_offset; 
         // Setup some data for the DMA to read
         shmem_fill(dma_rd_data_addr, SHMEM_FILL_DWORD_INC, dma_data_len, {64{1'b0}}); 
         
         
         // MSI capabilities
          msi_capabilities = 32'h50;
          msi_address = SCR_MEM;
          msi_data = 16'habcd;
          msi_enable = 1'b0;
          multi_message_enable = 3'b000;
          
         // Program the DMA to Read Data from Shared Memory

      // check the # of passthru bits
         ebfm_barwr_imm(bar_table, setup_bar, 16'h5000,  32'hffffffff, 4, 0);
         ebfm_barrd_wait(bar_table, setup_bar, 16'h5000, SCR_MEM, 4, 0); /// read the status reg
       passthru_msk = shmem_read(SCR_MEM,4) & 32'hffff_fffc;

      // Set PCI Express Interrupt enable (bit 7) in the PCIe-Avalon-MM bridge at address Avalon_Base_Address + 0x50
         ebfm_barwr_imm(bar_table, setup_bar, 16'h4050,  32'h00000080, 4, 0);


      // To program DMA and translation, take the portion of the DMA address that
      // is below passthru bits and program them to DMA. The remaining portion goes
      // to address translation table

      // program address translation table
         ebfm_barwr_imm(bar_table, setup_bar, 16'h5000,  dma_rd_data_addr & passthru_msk, 4, 0);
         ebfm_barwr_imm(bar_table, setup_bar, 16'h5004,  32'h00000000, 4, 0);

         ebfm_barwr_imm(bar_table, setup_bar, 16'h1008,  dma_rd_data_addr & ~passthru_msk, 4, 0);  // reg 1 (read address)   
         ebfm_barwr_imm(bar_table, setup_bar, 16'h1010, MEM_OFFSET, 4, 0);  // reg 2 (write address)  
         ebfm_barwr_imm(bar_table, setup_bar, 16'h1018, dma_data_len, 4, 0);  // reg 3 (dma length)     
         ebfm_barwr_imm(bar_table, setup_bar, 16'h1030, 32'h00000498, 4, 0); //  reg 6 (control)  

          #10
         wait(INTA);
         // check for INTA deassertion
         
         unused_result = ebfm_display(EBFM_MSG_INFO, "Clear Interrupt INTA "); 
         ebfm_barwr_imm(bar_table, setup_bar, 16'h1000,  32'h00000000, 4, 0);  // clear done bit in status reg
         
         #10
         wait(!INTA);
         
         //enable MSI enable
         msi_enable = 1'b1;
         ebfm_cfgwr_imm_wait(1, 0, 0, msi_capabilities, 4, {8'h00, 1'b0, multi_message_enable, 3'b000, msi_enable, 16'h0000}, compl_status);
         ebfm_cfgwr_imm_wait(1, 0, 0, msi_capabilities + 4'h4, 4, msi_address, compl_status);
         ebfm_cfgwr_imm_wait(1, 0, 0, msi_capabilities + 4'hC, 4, msi_data,    compl_status);

        // Setup an area for DMA to write back to
         // Currently DMA Engine Uses lower address bits for it's MRAM and PCIE
         // Addresses. So use the same address we started with
         dma_wr_data_addr = dma_rd_data_addr; 
         shmem_fill(dma_wr_data_addr, SHMEM_FILL_ZERO, dma_data_len, {64{1'b0}}); 
         
         // Program the DMA to Write Data Back to Shared Memory
         ebfm_barwr_imm(bar_table, setup_bar, 16'h1008, MEM_OFFSET , 4, 0);  // reg 1 (read address)   
         ebfm_barwr_imm(bar_table, setup_bar, 16'h1010, dma_wr_data_addr & ~passthru_msk, 4, 0);  // reg 2 (write address)  
         ebfm_barwr_imm(bar_table, setup_bar, 16'h1018, dma_data_len, 4, 0);  // reg 3 (dma length)     
         ebfm_barwr_imm(bar_table, setup_bar, 16'h1030, 32'h00000498, 4, 0); //  reg 6 (control)  
         
          // Wait Until the DMA is done via MSI
         dma_wait_done(bar_table, setup_bar, SCR_MEM);
             
         // Check the data
         if (shmem_chk_ok(dma_rd_data_addr, SHMEM_FILL_DWORD_INC, dma_data_len, {64{1'b0}}, 1'b1))
         begin
            unused_result = ebfm_display(EBFM_MSG_INFO, "  DMA Read and Write compared okay!"); 
         end
         else
         begin
            unused_result = ebfm_display(EBFM_MSG_ERROR_FATAL, "  Stopping simulation due to miscompare"); 
         end 

      end
   endtask

   // purpose: Examine the DUT's BAR setup and pick a reasonable BAR to use
   task find_mem_bar;
      input bar_table; 
      integer bar_table;
      input[5:0] allowed_bars; 
      input min_log2_size; 
      integer min_log2_size;
      output sel_bar;
      integer sel_bar;
       
      integer cur_bar; 
      reg[31:0] bar32; 
      integer log2_size; 
      reg is_mem; 
      reg is_pref; 
      reg is_64b; 

      begin  // find_mem_bar
         cur_bar = 0;
         begin : sel_bar_loop
            while (cur_bar < 6)
            begin
               ebfm_cfg_decode_bar(bar_table, cur_bar, log2_size, is_mem, is_pref, is_64b); 
               if ((is_mem == 1'b1) & (log2_size >= min_log2_size) & ((allowed_bars[cur_bar]) == 1'b1))
               begin
                  sel_bar = cur_bar;
                  disable sel_bar_loop ;
               end 
               if (is_64b == 1'b1)
               begin
                  cur_bar = cur_bar + 2; 
               end
               else
               begin
                  cur_bar = cur_bar + 1; 
               end 
            end 
            sel_bar = 7 ; // Invalid BAR if we get this far...
         end
      end
   endtask

   reg activity_toggle; 
   reg timer_toggle ;
   time time_stamp ;
   localparam TIMEOUT = 200000000 ; // 200 us

   initial
     begin
        time_stamp = $time ;
        activity_toggle = 1'b0;
        timer_toggle    = 1'b0;
   end

   always 
   begin : main  // behavioral

      // If you want to relocate the bar_table, modify the BAR_TABLE_POINTER in altpcietb_bfm_shmem.
      // Directly modifying the bar_table at this location may disable overwrite protection for the bar_table
      // If the bar_table is overwritten incorrectly, this will break the testbench functionality.

      // This constant defines where we save the sizes and programmed addresses
      // of the Endpoint Device Under Test BARs 
      parameter bar_table = BAR_TABLE_POINTER; // Default BAR_TABLE_SIZE is 64 bytes

      // tgt_bar indicates which bar to use for testing the target memory of the
      // reference design.
      integer tgt_bar; 
      integer dma_bar;
      reg     addr_map_4GB_limit;
      reg     unused_result ;
      integer i;
      

      // Setup the Root Port and Endpoint Configuration Spaces
      addr_map_4GB_limit = 1'b0;
      ebfm_cfg_rp_ep(
                     bar_table,         // BAR Size/Address info for Endpoint       
                     1,                 // Bus Number for Endpoint Under Test
                     1,                 // Device Number for Endpoint Under Test
                     512,               // Maximum Read Request Size for Root Port
                     1,                 // Display EP Config Space after setup
                     addr_map_4GB_limit // Limit the BAR assignments to 4GB address map
                     ); 
      activity_toggle <= ~activity_toggle ; 

      // Find a memory BAR to use to test the target memory
      // The reference design implements the target memory on BARs 0,1, 4 or 5
      // We need one at least 4 KB big
   if(AVALON_MM_LITE == 0)
      find_mem_bar(bar_table, 6'b110011, 12, tgt_bar); 
   else
       find_mem_bar(bar_table, 6'b110011, 4, tgt_bar); 
      // Test the reference design's target memory
      
  if(AVALON_MM_LITE == 0)
    begin
      if (RUN_TGT_MEM_TST == 0)
	begin
         unused_result = ebfm_display(EBFM_MSG_WARNING, "Skipping target test."); 
	end
      else if (tgt_bar < 6)
	begin

         target_mem_test(
                         bar_table, // BAR Size/Address info for Endpoint
                         tgt_bar,   // BAR to access target memory with
                         0,         // Starting offset from BAR
                         4096       // Length of memory to test
                         );

      end
      else
        begin
         unused_result = ebfm_display(EBFM_MSG_WARNING, "Unable to find a 4 KB BAR to test Target Memory, skipping target test."); 
        end 
     end
   
  else  // is avalon lite
    begin
      if (RUN_TGT_MEM_TST == 0)
	begin
         unused_result = ebfm_display(EBFM_MSG_WARNING, "Skipping target test."); 
	end
      else 
	begin
    for(i=0; i < 4 ; i=i+1)
      begin
         target_mem_test_lite(
                         bar_table, // BAR Size/Address info for Endpoint
                         tgt_bar,   // BAR to access target memory with
                         i*4,         // Starting offset from BAR
                         4       // Length of memory to test
                         );
       end

      end
     end
    
        
        
        
      activity_toggle <= ~activity_toggle ; 
      // Find a memory BAR to use to setup the DMA channel
      // The reference design implements the DMA channel registers on BAR 2 or 3
      // We need one at least 0x7FFF (CRA 0x4000 + DMA 0x8)
      find_mem_bar(bar_table, 6'b001100, 15, dma_bar); 
      // Test the reference design's DMA channel and master memory
      if (RUN_DMA_MEM_TST == 0)
	begin
         unused_result = ebfm_display(EBFM_MSG_WARNING, "Skipping DMA test."); 
	end
   else if (dma_bar < 6)
      begin
         dma_mem_test(
                      bar_table, // BAR Size/Address info for Endpoint
                      dma_bar,   // BAR to access DMA control registers
                      0,         // Starting offset of DMA memory
                      4096       // Length of memory to test
                      );
 
      end
      else
      begin
         unused_result = ebfm_display(EBFM_MSG_WARNING, "Unable to find a 128B BAR to test setup DMA channel, skipping DMA test."); 
      end 

      // Stop the simulator and indicate successful completion
      unused_result = ebfm_log_stop_sim(1); 
      forever #100000; 
   end 

   always
     begin
        #(TIMEOUT)
          timer_toggle <= ! timer_toggle ;
     end
   
   reg unused_result ;
   // purpose: this is a watchdog timer, if it sees no activity on the activity
   // toggle signal for 200 us it ends the simulation
   always @(activity_toggle or timer_toggle)
     begin : watchdog
        
        if ( ($time - time_stamp) >= TIMEOUT)
          begin
             unused_result = ebfm_display(EBFM_MSG_ERROR_FATAL, "Simulation stopped due to inactivity!"); 
          end
        time_stamp <= $time ;
     end

   always @(INTA)
      begin
         if (INTA)
           unused_result = ebfm_display(EBFM_MSG_INFO, "Interrupt Monitor: Interrupt INTA Asserted");
           else
           unused_result = ebfm_display(EBFM_MSG_INFO, "Interrupt Monitor: Interrupt INTA Deasserted");
      end

endmodule
