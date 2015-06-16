//Legal Notice: (C)2013 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

///** This Verilog HDL file is used for simulation in simple DMA design example
//*
//* This file is the top level of the testbench
//*/
module pcie_compiler_0_testbench (
                                   // inputs:
                                    clk125_out,
                                    clk250_out,
                                    clk500_out,
                                    powerdown_ext,
                                    rate_ext,
                                    reconfig_fromgxb,
                                    rxpolarity0_ext,
                                    test_out,
                                    tx_out0,
                                    txcompl0_ext,
                                    txdata0_ext,
                                    txdatak0_ext,
                                    txdetectrx_ext,
                                    txelecidle0_ext,

                                   // outputs:
                                    busy_altgxb_reconfig,
                                    cal_blk_clk,
                                    clk125_in,
                                    fixedclk_serdes,
                                    gxb_powerdown,
                                    pcie_rstn,
                                    phystatus_ext,
                                    pipe_mode,
                                    pll_powerdown,
                                    reconfig_clk,
                                    reconfig_togxb,
                                    refclk,
                                    rx_in0,
                                    rxdata0_ext,
                                    rxdatak0_ext,
                                    rxelecidle0_ext,
                                    rxstatus0_ext,
                                    rxvalid0_ext,
                                    test_in
                                 )
;

  parameter PIPE_MODE_SIM = 1'b1;
  parameter TEST_LEVEL = 1;
  parameter NUM_CONNECTED_LANES = 8;
  parameter FAST_COUNTERS = 1'b1;


  output           busy_altgxb_reconfig;
  output           cal_blk_clk;
  output           clk125_in;
  output           fixedclk_serdes;
  output           gxb_powerdown;
  output           pcie_rstn;
  output           phystatus_ext;
  output           pipe_mode;
  output           pll_powerdown;
  output           reconfig_clk;
  output  [  3: 0] reconfig_togxb;
  output           refclk;
  output           rx_in0;
  output  [  7: 0] rxdata0_ext;
  output           rxdatak0_ext;
  output           rxelecidle0_ext;
  output  [  2: 0] rxstatus0_ext;
  output           rxvalid0_ext;
  output  [ 39: 0] test_in;
  input            clk125_out;
  input            clk250_out;
  input            clk500_out;
  input   [  1: 0] powerdown_ext;
  input            rate_ext;
  input   [ 16: 0] reconfig_fromgxb;
  input            rxpolarity0_ext;
  input   [  8: 0] test_out;
  input            tx_out0;
  input            txcompl0_ext;
  input   [  7: 0] txdata0_ext;
  input            txdatak0_ext;
  input            txdetectrx_ext;
  input            txelecidle0_ext;

  wire             bfm_log_common_dummy_out;
  wire             bfm_req_intf_common_dummy_out;
  wire             bfm_shmem_common_dummy_out;
  wire             busy_altgxb_reconfig;
  wire             cal_blk_clk;
  wire             clk125_in;
  wire    [  7: 0] connected_bits;
  wire    [  3: 0] connected_lanes;
  wire             dummy_out;
  wire             ep_clk250_out;
  wire             ep_clk500_out;
  wire             ep_clk_in;
  wire             ep_clk_out;
  wire             ep_core_clk_out;
  wire    [  4: 0] ep_ltssm;
  wire             fixedclk_serdes;
  wire    [  1: 0] gnd_powerdown1_ext;
  wire    [  1: 0] gnd_powerdown2_ext;
  wire    [  1: 0] gnd_powerdown3_ext;
  wire    [  1: 0] gnd_powerdown4_ext;
  wire    [  1: 0] gnd_powerdown5_ext;
  wire    [  1: 0] gnd_powerdown6_ext;
  wire    [  1: 0] gnd_powerdown7_ext;
  wire             gnd_rp_rx_in1;
  wire             gnd_rp_rx_in2;
  wire             gnd_rp_rx_in3;
  wire             gnd_rp_rx_in4;
  wire             gnd_rp_rx_in5;
  wire             gnd_rp_rx_in6;
  wire             gnd_rp_rx_in7;
  wire             gnd_rxpolarity1_ext;
  wire             gnd_rxpolarity2_ext;
  wire             gnd_rxpolarity3_ext;
  wire             gnd_rxpolarity4_ext;
  wire             gnd_rxpolarity5_ext;
  wire             gnd_rxpolarity6_ext;
  wire             gnd_rxpolarity7_ext;
  wire             gnd_txcompl1_ext;
  wire             gnd_txcompl2_ext;
  wire             gnd_txcompl3_ext;
  wire             gnd_txcompl4_ext;
  wire             gnd_txcompl5_ext;
  wire             gnd_txcompl6_ext;
  wire             gnd_txcompl7_ext;
  wire    [  7: 0] gnd_txdata1_ext;
  wire    [  7: 0] gnd_txdata2_ext;
  wire    [  7: 0] gnd_txdata3_ext;
  wire    [  7: 0] gnd_txdata4_ext;
  wire    [  7: 0] gnd_txdata5_ext;
  wire    [  7: 0] gnd_txdata6_ext;
  wire    [  7: 0] gnd_txdata7_ext;
  wire             gnd_txdatak1_ext;
  wire             gnd_txdatak2_ext;
  wire             gnd_txdatak3_ext;
  wire             gnd_txdatak4_ext;
  wire             gnd_txdatak5_ext;
  wire             gnd_txdatak6_ext;
  wire             gnd_txdatak7_ext;
  wire             gnd_txdetectrx1_ext;
  wire             gnd_txdetectrx2_ext;
  wire             gnd_txdetectrx3_ext;
  wire             gnd_txdetectrx4_ext;
  wire             gnd_txdetectrx5_ext;
  wire             gnd_txdetectrx6_ext;
  wire             gnd_txdetectrx7_ext;
  wire             gnd_txelecidle1_ext;
  wire             gnd_txelecidle2_ext;
  wire             gnd_txelecidle3_ext;
  wire             gnd_txelecidle4_ext;
  wire             gnd_txelecidle5_ext;
  wire             gnd_txelecidle6_ext;
  wire             gnd_txelecidle7_ext;
  wire             gxb_powerdown;
  wire             local_rstn;
  wire             ltssm_dummy_out;
  wire             open_phystatus1_ext;
  wire             open_phystatus2_ext;
  wire             open_phystatus3_ext;
  wire             open_phystatus4_ext;
  wire             open_phystatus5_ext;
  wire             open_phystatus6_ext;
  wire             open_phystatus7_ext;
  wire             open_rp_tx_out1;
  wire             open_rp_tx_out2;
  wire             open_rp_tx_out3;
  wire             open_rp_tx_out4;
  wire             open_rp_tx_out5;
  wire             open_rp_tx_out6;
  wire             open_rp_tx_out7;
  wire    [  7: 0] open_rxdata1_ext;
  wire    [  7: 0] open_rxdata2_ext;
  wire    [  7: 0] open_rxdata3_ext;
  wire    [  7: 0] open_rxdata4_ext;
  wire    [  7: 0] open_rxdata5_ext;
  wire    [  7: 0] open_rxdata6_ext;
  wire    [  7: 0] open_rxdata7_ext;
  wire             open_rxdatak1_ext;
  wire             open_rxdatak2_ext;
  wire             open_rxdatak3_ext;
  wire             open_rxdatak4_ext;
  wire             open_rxdatak5_ext;
  wire             open_rxdatak6_ext;
  wire             open_rxdatak7_ext;
  wire             open_rxelecidle1_ext;
  wire             open_rxelecidle2_ext;
  wire             open_rxelecidle3_ext;
  wire             open_rxelecidle4_ext;
  wire             open_rxelecidle5_ext;
  wire             open_rxelecidle6_ext;
  wire             open_rxelecidle7_ext;
  wire    [  2: 0] open_rxstatus1_ext;
  wire    [  2: 0] open_rxstatus2_ext;
  wire    [  2: 0] open_rxstatus3_ext;
  wire    [  2: 0] open_rxstatus4_ext;
  wire    [  2: 0] open_rxstatus5_ext;
  wire    [  2: 0] open_rxstatus6_ext;
  wire    [  2: 0] open_rxstatus7_ext;
  wire             open_rxvalid1_ext;
  wire             open_rxvalid2_ext;
  wire             open_rxvalid3_ext;
  wire             open_rxvalid4_ext;
  wire             open_rxvalid5_ext;
  wire             open_rxvalid6_ext;
  wire             open_rxvalid7_ext;
  wire             pcie_rstn;
  wire    [  3: 0] phy_sel_code;
  wire             phystatus0_ext;
  wire             phystatus_ext;
  wire             pipe_mode;
  wire             pipe_mode_sig2;
  wire             pll_powerdown;
  wire    [  1: 0] powerdown0_ext;
  reg              reconfig_clk /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102"  */;
  wire    [  3: 0] reconfig_togxb;
  wire    [  3: 0] ref_clk_sel_code;
  wire             refclk;
  wire    [  4: 0] rp_ltssm;
  wire             rp_pclk;
  wire             rp_phystatus0_ext;
  wire             rp_phystatus1_ext;
  wire             rp_phystatus2_ext;
  wire             rp_phystatus3_ext;
  wire             rp_phystatus4_ext;
  wire             rp_phystatus5_ext;
  wire             rp_phystatus6_ext;
  wire             rp_phystatus7_ext;
  wire    [  1: 0] rp_powerdown0_ext;
  wire    [  1: 0] rp_powerdown1_ext;
  wire    [  1: 0] rp_powerdown2_ext;
  wire    [  1: 0] rp_powerdown3_ext;
  wire    [  1: 0] rp_powerdown4_ext;
  wire    [  1: 0] rp_powerdown5_ext;
  wire    [  1: 0] rp_powerdown6_ext;
  wire    [  1: 0] rp_powerdown7_ext;
  wire             rp_rate;
  wire             rp_rstn;
  wire             rp_rx_in0;
  wire    [  7: 0] rp_rxdata0_ext;
  wire    [  7: 0] rp_rxdata1_ext;
  wire    [  7: 0] rp_rxdata2_ext;
  wire    [  7: 0] rp_rxdata3_ext;
  wire    [  7: 0] rp_rxdata4_ext;
  wire    [  7: 0] rp_rxdata5_ext;
  wire    [  7: 0] rp_rxdata6_ext;
  wire    [  7: 0] rp_rxdata7_ext;
  wire             rp_rxdatak0_ext;
  wire             rp_rxdatak1_ext;
  wire             rp_rxdatak2_ext;
  wire             rp_rxdatak3_ext;
  wire             rp_rxdatak4_ext;
  wire             rp_rxdatak5_ext;
  wire             rp_rxdatak6_ext;
  wire             rp_rxdatak7_ext;
  wire             rp_rxelecidle0_ext;
  wire             rp_rxelecidle1_ext;
  wire             rp_rxelecidle2_ext;
  wire             rp_rxelecidle3_ext;
  wire             rp_rxelecidle4_ext;
  wire             rp_rxelecidle5_ext;
  wire             rp_rxelecidle6_ext;
  wire             rp_rxelecidle7_ext;
  wire             rp_rxpolarity0_ext;
  wire             rp_rxpolarity1_ext;
  wire             rp_rxpolarity2_ext;
  wire             rp_rxpolarity3_ext;
  wire             rp_rxpolarity4_ext;
  wire             rp_rxpolarity5_ext;
  wire             rp_rxpolarity6_ext;
  wire             rp_rxpolarity7_ext;
  wire    [  2: 0] rp_rxstatus0_ext;
  wire    [  2: 0] rp_rxstatus1_ext;
  wire    [  2: 0] rp_rxstatus2_ext;
  wire    [  2: 0] rp_rxstatus3_ext;
  wire    [  2: 0] rp_rxstatus4_ext;
  wire    [  2: 0] rp_rxstatus5_ext;
  wire    [  2: 0] rp_rxstatus6_ext;
  wire    [  2: 0] rp_rxstatus7_ext;
  wire             rp_rxvalid0_ext;
  wire             rp_rxvalid1_ext;
  wire             rp_rxvalid2_ext;
  wire             rp_rxvalid3_ext;
  wire             rp_rxvalid4_ext;
  wire             rp_rxvalid5_ext;
  wire             rp_rxvalid6_ext;
  wire             rp_rxvalid7_ext;
  wire    [ 31: 0] rp_test_in;
  wire    [511: 0] rp_test_out;
  wire             rp_tx_out0;
  wire             rp_txcompl0_ext;
  wire             rp_txcompl1_ext;
  wire             rp_txcompl2_ext;
  wire             rp_txcompl3_ext;
  wire             rp_txcompl4_ext;
  wire             rp_txcompl5_ext;
  wire             rp_txcompl6_ext;
  wire             rp_txcompl7_ext;
  wire    [  7: 0] rp_txdata0_ext;
  wire    [  7: 0] rp_txdata1_ext;
  wire    [  7: 0] rp_txdata2_ext;
  wire    [  7: 0] rp_txdata3_ext;
  wire    [  7: 0] rp_txdata4_ext;
  wire    [  7: 0] rp_txdata5_ext;
  wire    [  7: 0] rp_txdata6_ext;
  wire    [  7: 0] rp_txdata7_ext;
  wire             rp_txdatak0_ext;
  wire             rp_txdatak1_ext;
  wire             rp_txdatak2_ext;
  wire             rp_txdatak3_ext;
  wire             rp_txdatak4_ext;
  wire             rp_txdatak5_ext;
  wire             rp_txdatak6_ext;
  wire             rp_txdatak7_ext;
  wire             rp_txdetectrx0_ext;
  wire             rp_txdetectrx1_ext;
  wire             rp_txdetectrx2_ext;
  wire             rp_txdetectrx3_ext;
  wire             rp_txdetectrx4_ext;
  wire             rp_txdetectrx5_ext;
  wire             rp_txdetectrx6_ext;
  wire             rp_txdetectrx7_ext;
  wire             rp_txelecidle0_ext;
  wire             rp_txelecidle1_ext;
  wire             rp_txelecidle2_ext;
  wire             rp_txelecidle3_ext;
  wire             rp_txelecidle4_ext;
  wire             rp_txelecidle5_ext;
  wire             rp_txelecidle6_ext;
  wire             rp_txelecidle7_ext;
  wire             rx_in0;
  wire    [  7: 0] rxdata0_ext;
  wire             rxdatak0_ext;
  wire             rxelecidle0_ext;
  wire    [  2: 0] rxstatus0_ext;
  wire             rxvalid0_ext;
  wire    [  5: 0] swdn_out;
  wire    [ 39: 0] test_in;
  wire             txdetectrx0_ext;
  assign gnd_rp_rx_in1 = 1;
  assign gnd_rp_rx_in2 = 1;
  assign gnd_rp_rx_in3 = 1;
  assign gnd_rp_rx_in4 = 1;
  assign gnd_rp_rx_in5 = 1;
  assign gnd_rp_rx_in6 = 1;
  assign gnd_rp_rx_in7 = 1;
  assign ep_ltssm = test_out[4 : 0];
  assign rp_ltssm = rp_test_out[324 : 320];
  assign gnd_txdata1_ext = 0;
  assign gnd_txdatak1_ext = 0;
  assign gnd_txdetectrx1_ext = 0;
  assign gnd_txelecidle1_ext = 0;
  assign gnd_rxpolarity1_ext = 0;
  assign gnd_txcompl1_ext = 0;
  assign gnd_powerdown1_ext = 0;
  assign gnd_txdata2_ext = 0;
  assign gnd_txdatak2_ext = 0;
  assign gnd_txdetectrx2_ext = 0;
  assign gnd_txelecidle2_ext = 0;
  assign gnd_rxpolarity2_ext = 0;
  assign gnd_txcompl2_ext = 0;
  assign gnd_powerdown2_ext = 0;
  assign gnd_txdata3_ext = 0;
  assign gnd_txdatak3_ext = 0;
  assign gnd_txdetectrx3_ext = 0;
  assign gnd_txelecidle3_ext = 0;
  assign gnd_rxpolarity3_ext = 0;
  assign gnd_txcompl3_ext = 0;
  assign gnd_powerdown3_ext = 0;
  assign gnd_txdata4_ext = 0;
  assign gnd_txdatak4_ext = 0;
  assign gnd_txdetectrx4_ext = 0;
  assign gnd_txelecidle4_ext = 0;
  assign gnd_rxpolarity4_ext = 0;
  assign gnd_txcompl4_ext = 0;
  assign gnd_powerdown4_ext = 0;
  assign gnd_txdata5_ext = 0;
  assign gnd_txdatak5_ext = 0;
  assign gnd_txdetectrx5_ext = 0;
  assign gnd_txelecidle5_ext = 0;
  assign gnd_rxpolarity5_ext = 0;
  assign gnd_txcompl5_ext = 0;
  assign gnd_powerdown5_ext = 0;
  assign gnd_txdata6_ext = 0;
  assign gnd_txdatak6_ext = 0;
  assign gnd_txdetectrx6_ext = 0;
  assign gnd_txelecidle6_ext = 0;
  assign gnd_rxpolarity6_ext = 0;
  assign gnd_txcompl6_ext = 0;
  assign gnd_powerdown6_ext = 0;
  assign gnd_txdata7_ext = 0;
  assign gnd_txdatak7_ext = 0;
  assign gnd_txdetectrx7_ext = 0;
  assign gnd_txelecidle7_ext = 0;
  assign gnd_rxpolarity7_ext = 0;
  assign gnd_txcompl7_ext = 0;
  assign gnd_powerdown7_ext = 0;
  //Div down 100Mhz refclk with T-Flop
  always @(posedge refclk or negedge pcie_rstn)
    begin
      if (pcie_rstn == 0)
          reconfig_clk <= 0;
      else 
        reconfig_clk <= ~reconfig_clk;
    end


  assign clk125_in = ep_clk_in;
  assign ref_clk_sel_code = 0;
  assign phy_sel_code = 6;
  assign powerdown0_ext = powerdown_ext;
  assign txdetectrx0_ext = txdetectrx_ext;
  assign phystatus_ext = phystatus0_ext;
  assign busy_altgxb_reconfig = 0;
  assign fixedclk_serdes = ep_clk_in;
  assign cal_blk_clk = ep_clk_out;
  assign reconfig_togxb = 4'b0010;
  assign gxb_powerdown = ~pcie_rstn;
  assign pll_powerdown = ~pcie_rstn;
  assign ep_clk250_out = clk250_out;
  assign ep_clk500_out = clk500_out;
  assign ep_core_clk_out = 0;
  assign ep_clk_in = clk125_out;
  assign rp_pclk = (rp_rate == 1) ?  ep_clk500_out : ep_clk250_out;
  assign ep_clk_out = (rate_ext == 1) ?  ep_clk500_out : ep_clk250_out;
  assign rx_in0 = (connected_bits[0] == 1'b1) ?  rp_tx_out0 : 1;
  assign rp_rx_in0 = tx_out0;
  assign local_rstn = 1;
  assign test_in[2 : 1] = 0;
  assign test_in[8 : 4] = 0;
  assign test_in[9] = 1;
  assign test_in[39 : 10] = 0;
  //Bit 3: Work around simulation Reciever Detect issue for Stratix IV GX
  assign test_in[3] = ~pipe_mode;

  //Bit 0: Speed up the simulation but making counters faster than normal
  assign test_in[0] = FAST_COUNTERS;

  //Compute number of lanes to hookup
  assign connected_lanes = NUM_CONNECTED_LANES;

  assign connected_bits = connected_lanes[3] ? 8'hFF : connected_lanes[2] ? 8'h0F : connected_lanes[1] ? 8'h03 : 8'h01;
  assign rp_test_in[31 : 8] = 0;
  assign rp_test_in[6] = 0;
  assign rp_test_in[4] = 0;
  assign rp_test_in[2 : 1] = 0;
  //Bit 0: Speed up the simulation but making counters faster than normal
  assign rp_test_in[0] = 1;

  //Bit 3: Forces all lanes to detect the receiver
  //For Stratix GX we must force but can use Rx Detect for
  //the generic PIPE interface
  assign rp_test_in[3] = ~pipe_mode;

  //Bit 5: Disable polling.compliance
  assign rp_test_in[5] = 1;

  //Bit 7: Disable any entrance to low power link states (for Stratix GX)
  //For Stratix GX we must disable but can use Low Power for
  //the generic PIPE interface
  assign rp_test_in[7] = ~pipe_mode;

  //When the phy is Stratix GX we can allow the pipe_mode to be disabled 
  //otherwise we need to force pipe_mode on
  assign pipe_mode_sig2 = PIPE_MODE_SIM;

  assign pipe_mode = ((phy_sel_code == 4'h0) || (phy_sel_code == 4'h2) || (phy_sel_code == 4'h6) || (phy_sel_code == 4'h7)) ? pipe_mode_sig2 : 1'b1;
  altpcietb_bfm_rp_top_x8_pipen1b rp
    (
      .clk250_in (ep_clk250_out),
      .clk500_in (ep_clk500_out),
      .local_rstn (local_rstn),
      .pcie_rstn (rp_rstn),
      .phystatus0_ext (rp_phystatus0_ext),
      .phystatus1_ext (rp_phystatus1_ext),
      .phystatus2_ext (rp_phystatus2_ext),
      .phystatus3_ext (rp_phystatus3_ext),
      .phystatus4_ext (rp_phystatus4_ext),
      .phystatus5_ext (rp_phystatus5_ext),
      .phystatus6_ext (rp_phystatus6_ext),
      .phystatus7_ext (rp_phystatus7_ext),
      .pipe_mode (pipe_mode),
      .powerdown0_ext (rp_powerdown0_ext),
      .powerdown1_ext (rp_powerdown1_ext),
      .powerdown2_ext (rp_powerdown2_ext),
      .powerdown3_ext (rp_powerdown3_ext),
      .powerdown4_ext (rp_powerdown4_ext),
      .powerdown5_ext (rp_powerdown5_ext),
      .powerdown6_ext (rp_powerdown6_ext),
      .powerdown7_ext (rp_powerdown7_ext),
      .rate_ext (rp_rate),
      .rx_in0 (rp_rx_in0),
      .rx_in1 (gnd_rp_rx_in1),
      .rx_in2 (gnd_rp_rx_in2),
      .rx_in3 (gnd_rp_rx_in3),
      .rx_in4 (gnd_rp_rx_in4),
      .rx_in5 (gnd_rp_rx_in5),
      .rx_in6 (gnd_rp_rx_in6),
      .rx_in7 (gnd_rp_rx_in7),
      .rxdata0_ext (rp_rxdata0_ext),
      .rxdata1_ext (rp_rxdata1_ext),
      .rxdata2_ext (rp_rxdata2_ext),
      .rxdata3_ext (rp_rxdata3_ext),
      .rxdata4_ext (rp_rxdata4_ext),
      .rxdata5_ext (rp_rxdata5_ext),
      .rxdata6_ext (rp_rxdata6_ext),
      .rxdata7_ext (rp_rxdata7_ext),
      .rxdatak0_ext (rp_rxdatak0_ext),
      .rxdatak1_ext (rp_rxdatak1_ext),
      .rxdatak2_ext (rp_rxdatak2_ext),
      .rxdatak3_ext (rp_rxdatak3_ext),
      .rxdatak4_ext (rp_rxdatak4_ext),
      .rxdatak5_ext (rp_rxdatak5_ext),
      .rxdatak6_ext (rp_rxdatak6_ext),
      .rxdatak7_ext (rp_rxdatak7_ext),
      .rxelecidle0_ext (rp_rxelecidle0_ext),
      .rxelecidle1_ext (rp_rxelecidle1_ext),
      .rxelecidle2_ext (rp_rxelecidle2_ext),
      .rxelecidle3_ext (rp_rxelecidle3_ext),
      .rxelecidle4_ext (rp_rxelecidle4_ext),
      .rxelecidle5_ext (rp_rxelecidle5_ext),
      .rxelecidle6_ext (rp_rxelecidle6_ext),
      .rxelecidle7_ext (rp_rxelecidle7_ext),
      .rxpolarity0_ext (rp_rxpolarity0_ext),
      .rxpolarity1_ext (rp_rxpolarity1_ext),
      .rxpolarity2_ext (rp_rxpolarity2_ext),
      .rxpolarity3_ext (rp_rxpolarity3_ext),
      .rxpolarity4_ext (rp_rxpolarity4_ext),
      .rxpolarity5_ext (rp_rxpolarity5_ext),
      .rxpolarity6_ext (rp_rxpolarity6_ext),
      .rxpolarity7_ext (rp_rxpolarity7_ext),
      .rxstatus0_ext (rp_rxstatus0_ext),
      .rxstatus1_ext (rp_rxstatus1_ext),
      .rxstatus2_ext (rp_rxstatus2_ext),
      .rxstatus3_ext (rp_rxstatus3_ext),
      .rxstatus4_ext (rp_rxstatus4_ext),
      .rxstatus5_ext (rp_rxstatus5_ext),
      .rxstatus6_ext (rp_rxstatus6_ext),
      .rxstatus7_ext (rp_rxstatus7_ext),
      .rxvalid0_ext (rp_rxvalid0_ext),
      .rxvalid1_ext (rp_rxvalid1_ext),
      .rxvalid2_ext (rp_rxvalid2_ext),
      .rxvalid3_ext (rp_rxvalid3_ext),
      .rxvalid4_ext (rp_rxvalid4_ext),
      .rxvalid5_ext (rp_rxvalid5_ext),
      .rxvalid6_ext (rp_rxvalid6_ext),
      .rxvalid7_ext (rp_rxvalid7_ext),
      .swdn_out (swdn_out),
      .test_in (rp_test_in),
      .test_out (rp_test_out),
      .tx_out0 (rp_tx_out0),
      .tx_out1 (open_rp_tx_out1),
      .tx_out2 (open_rp_tx_out2),
      .tx_out3 (open_rp_tx_out3),
      .tx_out4 (open_rp_tx_out4),
      .tx_out5 (open_rp_tx_out5),
      .tx_out6 (open_rp_tx_out6),
      .tx_out7 (open_rp_tx_out7),
      .txcompl0_ext (rp_txcompl0_ext),
      .txcompl1_ext (rp_txcompl1_ext),
      .txcompl2_ext (rp_txcompl2_ext),
      .txcompl3_ext (rp_txcompl3_ext),
      .txcompl4_ext (rp_txcompl4_ext),
      .txcompl5_ext (rp_txcompl5_ext),
      .txcompl6_ext (rp_txcompl6_ext),
      .txcompl7_ext (rp_txcompl7_ext),
      .txdata0_ext (rp_txdata0_ext),
      .txdata1_ext (rp_txdata1_ext),
      .txdata2_ext (rp_txdata2_ext),
      .txdata3_ext (rp_txdata3_ext),
      .txdata4_ext (rp_txdata4_ext),
      .txdata5_ext (rp_txdata5_ext),
      .txdata6_ext (rp_txdata6_ext),
      .txdata7_ext (rp_txdata7_ext),
      .txdatak0_ext (rp_txdatak0_ext),
      .txdatak1_ext (rp_txdatak1_ext),
      .txdatak2_ext (rp_txdatak2_ext),
      .txdatak3_ext (rp_txdatak3_ext),
      .txdatak4_ext (rp_txdatak4_ext),
      .txdatak5_ext (rp_txdatak5_ext),
      .txdatak6_ext (rp_txdatak6_ext),
      .txdatak7_ext (rp_txdatak7_ext),
      .txdetectrx0_ext (rp_txdetectrx0_ext),
      .txdetectrx1_ext (rp_txdetectrx1_ext),
      .txdetectrx2_ext (rp_txdetectrx2_ext),
      .txdetectrx3_ext (rp_txdetectrx3_ext),
      .txdetectrx4_ext (rp_txdetectrx4_ext),
      .txdetectrx5_ext (rp_txdetectrx5_ext),
      .txdetectrx6_ext (rp_txdetectrx6_ext),
      .txdetectrx7_ext (rp_txdetectrx7_ext),
      .txelecidle0_ext (rp_txelecidle0_ext),
      .txelecidle1_ext (rp_txelecidle1_ext),
      .txelecidle2_ext (rp_txelecidle2_ext),
      .txelecidle3_ext (rp_txelecidle3_ext),
      .txelecidle4_ext (rp_txelecidle4_ext),
      .txelecidle5_ext (rp_txelecidle5_ext),
      .txelecidle6_ext (rp_txelecidle6_ext),
      .txelecidle7_ext (rp_txelecidle7_ext)
    );


  altpcietb_bfm_driver drvr
    (
      .INTA (swdn_out[0]),
      .INTB (swdn_out[1]),
      .INTC (swdn_out[2]),
      .INTD (swdn_out[3]),
      .clk_in (rp_pclk),
      .dummy_out (dummy_out),
      .rstn (pcie_rstn)
    );

  defparam drvr.TEST_LEVEL = 1;

  altpcietb_ltssm_mon ltssm_mon
    (
      .dummy_out (ltssm_dummy_out),
      .ep_ltssm (ep_ltssm),
      .rp_clk (rp_pclk),
      .rp_ltssm (rp_ltssm),
      .rstn (pcie_rstn)
    );


  altpcietb_bfm_log_common bfm_log_common
    (
      .dummy_out (bfm_log_common_dummy_out)
    );


  altpcietb_bfm_req_intf_common bfm_req_intf_common
    (
      .dummy_out (bfm_req_intf_common_dummy_out)
    );


  altpcietb_bfm_shmem_common bfm_shmem_common
    (
      .dummy_out (bfm_shmem_common_dummy_out)
    );


  altpcietb_pipe_phy lane0
    (
      .A_lane_conn (connected_bits[0]),
      .A_phystatus (phystatus0_ext),
      .A_powerdown (powerdown0_ext),
      .A_rate (rate_ext),
      .A_rxdata (rxdata0_ext),
      .A_rxdatak (rxdatak0_ext),
      .A_rxelecidle (rxelecidle0_ext),
      .A_rxpolarity (rxpolarity0_ext),
      .A_rxstatus (rxstatus0_ext),
      .A_rxvalid (rxvalid0_ext),
      .A_txcompl (txcompl0_ext),
      .A_txdata (txdata0_ext),
      .A_txdatak (txdatak0_ext),
      .A_txdetectrx (txdetectrx0_ext),
      .A_txelecidle (txelecidle0_ext),
      .B_lane_conn (1'b1),
      .B_phystatus (rp_phystatus0_ext),
      .B_powerdown (rp_powerdown0_ext),
      .B_rate (rp_rate),
      .B_rxdata (rp_rxdata0_ext),
      .B_rxdatak (rp_rxdatak0_ext),
      .B_rxelecidle (rp_rxelecidle0_ext),
      .B_rxpolarity (rp_rxpolarity0_ext),
      .B_rxstatus (rp_rxstatus0_ext),
      .B_rxvalid (rp_rxvalid0_ext),
      .B_txcompl (rp_txcompl0_ext),
      .B_txdata (rp_txdata0_ext),
      .B_txdatak (rp_txdatak0_ext),
      .B_txdetectrx (rp_txdetectrx0_ext),
      .B_txelecidle (rp_txelecidle0_ext),
      .pclk_a (ep_clk_out),
      .pclk_b (rp_pclk),
      .pipe_mode (pipe_mode),
      .resetn (pcie_rstn)
    );

  defparam lane0.APIPE_WIDTH = 8,
           lane0.BPIPE_WIDTH = 8,
           lane0.LANE_NUM = 0;

  altpcietb_pipe_phy lane1
    (
      .A_lane_conn (1'b0),
      .A_phystatus (open_phystatus1_ext),
      .A_powerdown (gnd_powerdown1_ext),
      .A_rate (rate_ext),
      .A_rxdata (open_rxdata1_ext),
      .A_rxdatak (open_rxdatak1_ext),
      .A_rxelecidle (open_rxelecidle1_ext),
      .A_rxpolarity (gnd_rxpolarity1_ext),
      .A_rxstatus (open_rxstatus1_ext),
      .A_rxvalid (open_rxvalid1_ext),
      .A_txcompl (gnd_txcompl1_ext),
      .A_txdata (gnd_txdata1_ext),
      .A_txdatak (gnd_txdatak1_ext),
      .A_txdetectrx (gnd_txdetectrx1_ext),
      .A_txelecidle (gnd_txelecidle1_ext),
      .B_lane_conn (1'b1),
      .B_phystatus (rp_phystatus1_ext),
      .B_powerdown (rp_powerdown1_ext),
      .B_rate (rp_rate),
      .B_rxdata (rp_rxdata1_ext),
      .B_rxdatak (rp_rxdatak1_ext),
      .B_rxelecidle (rp_rxelecidle1_ext),
      .B_rxpolarity (rp_rxpolarity1_ext),
      .B_rxstatus (rp_rxstatus1_ext),
      .B_rxvalid (rp_rxvalid1_ext),
      .B_txcompl (rp_txcompl1_ext),
      .B_txdata (rp_txdata1_ext),
      .B_txdatak (rp_txdatak1_ext),
      .B_txdetectrx (rp_txdetectrx1_ext),
      .B_txelecidle (rp_txelecidle1_ext),
      .pclk_a (ep_clk_out),
      .pclk_b (rp_pclk),
      .pipe_mode (pipe_mode),
      .resetn (pcie_rstn)
    );

  defparam lane1.APIPE_WIDTH = 8,
           lane1.BPIPE_WIDTH = 8,
           lane1.LANE_NUM = 1;

  altpcietb_pipe_phy lane2
    (
      .A_lane_conn (1'b0),
      .A_phystatus (open_phystatus2_ext),
      .A_powerdown (gnd_powerdown2_ext),
      .A_rate (rate_ext),
      .A_rxdata (open_rxdata2_ext),
      .A_rxdatak (open_rxdatak2_ext),
      .A_rxelecidle (open_rxelecidle2_ext),
      .A_rxpolarity (gnd_rxpolarity2_ext),
      .A_rxstatus (open_rxstatus2_ext),
      .A_rxvalid (open_rxvalid2_ext),
      .A_txcompl (gnd_txcompl2_ext),
      .A_txdata (gnd_txdata2_ext),
      .A_txdatak (gnd_txdatak2_ext),
      .A_txdetectrx (gnd_txdetectrx2_ext),
      .A_txelecidle (gnd_txelecidle2_ext),
      .B_lane_conn (1'b1),
      .B_phystatus (rp_phystatus2_ext),
      .B_powerdown (rp_powerdown2_ext),
      .B_rate (rp_rate),
      .B_rxdata (rp_rxdata2_ext),
      .B_rxdatak (rp_rxdatak2_ext),
      .B_rxelecidle (rp_rxelecidle2_ext),
      .B_rxpolarity (rp_rxpolarity2_ext),
      .B_rxstatus (rp_rxstatus2_ext),
      .B_rxvalid (rp_rxvalid2_ext),
      .B_txcompl (rp_txcompl2_ext),
      .B_txdata (rp_txdata2_ext),
      .B_txdatak (rp_txdatak2_ext),
      .B_txdetectrx (rp_txdetectrx2_ext),
      .B_txelecidle (rp_txelecidle2_ext),
      .pclk_a (ep_clk_out),
      .pclk_b (rp_pclk),
      .pipe_mode (pipe_mode),
      .resetn (pcie_rstn)
    );

  defparam lane2.APIPE_WIDTH = 8,
           lane2.BPIPE_WIDTH = 8,
           lane2.LANE_NUM = 2;

  altpcietb_pipe_phy lane3
    (
      .A_lane_conn (1'b0),
      .A_phystatus (open_phystatus3_ext),
      .A_powerdown (gnd_powerdown3_ext),
      .A_rate (rate_ext),
      .A_rxdata (open_rxdata3_ext),
      .A_rxdatak (open_rxdatak3_ext),
      .A_rxelecidle (open_rxelecidle3_ext),
      .A_rxpolarity (gnd_rxpolarity3_ext),
      .A_rxstatus (open_rxstatus3_ext),
      .A_rxvalid (open_rxvalid3_ext),
      .A_txcompl (gnd_txcompl3_ext),
      .A_txdata (gnd_txdata3_ext),
      .A_txdatak (gnd_txdatak3_ext),
      .A_txdetectrx (gnd_txdetectrx3_ext),
      .A_txelecidle (gnd_txelecidle3_ext),
      .B_lane_conn (1'b1),
      .B_phystatus (rp_phystatus3_ext),
      .B_powerdown (rp_powerdown3_ext),
      .B_rate (rp_rate),
      .B_rxdata (rp_rxdata3_ext),
      .B_rxdatak (rp_rxdatak3_ext),
      .B_rxelecidle (rp_rxelecidle3_ext),
      .B_rxpolarity (rp_rxpolarity3_ext),
      .B_rxstatus (rp_rxstatus3_ext),
      .B_rxvalid (rp_rxvalid3_ext),
      .B_txcompl (rp_txcompl3_ext),
      .B_txdata (rp_txdata3_ext),
      .B_txdatak (rp_txdatak3_ext),
      .B_txdetectrx (rp_txdetectrx3_ext),
      .B_txelecidle (rp_txelecidle3_ext),
      .pclk_a (ep_clk_out),
      .pclk_b (rp_pclk),
      .pipe_mode (pipe_mode),
      .resetn (pcie_rstn)
    );

  defparam lane3.APIPE_WIDTH = 8,
           lane3.BPIPE_WIDTH = 8,
           lane3.LANE_NUM = 3;

  altpcietb_pipe_phy lane4
    (
      .A_lane_conn (1'b0),
      .A_phystatus (open_phystatus4_ext),
      .A_powerdown (gnd_powerdown4_ext),
      .A_rate (rate_ext),
      .A_rxdata (open_rxdata4_ext),
      .A_rxdatak (open_rxdatak4_ext),
      .A_rxelecidle (open_rxelecidle4_ext),
      .A_rxpolarity (gnd_rxpolarity4_ext),
      .A_rxstatus (open_rxstatus4_ext),
      .A_rxvalid (open_rxvalid4_ext),
      .A_txcompl (gnd_txcompl4_ext),
      .A_txdata (gnd_txdata4_ext),
      .A_txdatak (gnd_txdatak4_ext),
      .A_txdetectrx (gnd_txdetectrx4_ext),
      .A_txelecidle (gnd_txelecidle4_ext),
      .B_lane_conn (1'b1),
      .B_phystatus (rp_phystatus4_ext),
      .B_powerdown (rp_powerdown4_ext),
      .B_rate (rp_rate),
      .B_rxdata (rp_rxdata4_ext),
      .B_rxdatak (rp_rxdatak4_ext),
      .B_rxelecidle (rp_rxelecidle4_ext),
      .B_rxpolarity (rp_rxpolarity4_ext),
      .B_rxstatus (rp_rxstatus4_ext),
      .B_rxvalid (rp_rxvalid4_ext),
      .B_txcompl (rp_txcompl4_ext),
      .B_txdata (rp_txdata4_ext),
      .B_txdatak (rp_txdatak4_ext),
      .B_txdetectrx (rp_txdetectrx4_ext),
      .B_txelecidle (rp_txelecidle4_ext),
      .pclk_a (ep_clk_out),
      .pclk_b (rp_pclk),
      .pipe_mode (pipe_mode),
      .resetn (pcie_rstn)
    );

  defparam lane4.APIPE_WIDTH = 8,
           lane4.BPIPE_WIDTH = 8,
           lane4.LANE_NUM = 4;

  altpcietb_pipe_phy lane5
    (
      .A_lane_conn (1'b0),
      .A_phystatus (open_phystatus5_ext),
      .A_powerdown (gnd_powerdown5_ext),
      .A_rate (rate_ext),
      .A_rxdata (open_rxdata5_ext),
      .A_rxdatak (open_rxdatak5_ext),
      .A_rxelecidle (open_rxelecidle5_ext),
      .A_rxpolarity (gnd_rxpolarity5_ext),
      .A_rxstatus (open_rxstatus5_ext),
      .A_rxvalid (open_rxvalid5_ext),
      .A_txcompl (gnd_txcompl5_ext),
      .A_txdata (gnd_txdata5_ext),
      .A_txdatak (gnd_txdatak5_ext),
      .A_txdetectrx (gnd_txdetectrx5_ext),
      .A_txelecidle (gnd_txelecidle5_ext),
      .B_lane_conn (1'b1),
      .B_phystatus (rp_phystatus5_ext),
      .B_powerdown (rp_powerdown5_ext),
      .B_rate (rp_rate),
      .B_rxdata (rp_rxdata5_ext),
      .B_rxdatak (rp_rxdatak5_ext),
      .B_rxelecidle (rp_rxelecidle5_ext),
      .B_rxpolarity (rp_rxpolarity5_ext),
      .B_rxstatus (rp_rxstatus5_ext),
      .B_rxvalid (rp_rxvalid5_ext),
      .B_txcompl (rp_txcompl5_ext),
      .B_txdata (rp_txdata5_ext),
      .B_txdatak (rp_txdatak5_ext),
      .B_txdetectrx (rp_txdetectrx5_ext),
      .B_txelecidle (rp_txelecidle5_ext),
      .pclk_a (ep_clk_out),
      .pclk_b (rp_pclk),
      .pipe_mode (pipe_mode),
      .resetn (pcie_rstn)
    );

  defparam lane5.APIPE_WIDTH = 8,
           lane5.BPIPE_WIDTH = 8,
           lane5.LANE_NUM = 5;

  altpcietb_pipe_phy lane6
    (
      .A_lane_conn (1'b0),
      .A_phystatus (open_phystatus6_ext),
      .A_powerdown (gnd_powerdown6_ext),
      .A_rate (rate_ext),
      .A_rxdata (open_rxdata6_ext),
      .A_rxdatak (open_rxdatak6_ext),
      .A_rxelecidle (open_rxelecidle6_ext),
      .A_rxpolarity (gnd_rxpolarity6_ext),
      .A_rxstatus (open_rxstatus6_ext),
      .A_rxvalid (open_rxvalid6_ext),
      .A_txcompl (gnd_txcompl6_ext),
      .A_txdata (gnd_txdata6_ext),
      .A_txdatak (gnd_txdatak6_ext),
      .A_txdetectrx (gnd_txdetectrx6_ext),
      .A_txelecidle (gnd_txelecidle6_ext),
      .B_lane_conn (1'b1),
      .B_phystatus (rp_phystatus6_ext),
      .B_powerdown (rp_powerdown6_ext),
      .B_rate (rp_rate),
      .B_rxdata (rp_rxdata6_ext),
      .B_rxdatak (rp_rxdatak6_ext),
      .B_rxelecidle (rp_rxelecidle6_ext),
      .B_rxpolarity (rp_rxpolarity6_ext),
      .B_rxstatus (rp_rxstatus6_ext),
      .B_rxvalid (rp_rxvalid6_ext),
      .B_txcompl (rp_txcompl6_ext),
      .B_txdata (rp_txdata6_ext),
      .B_txdatak (rp_txdatak6_ext),
      .B_txdetectrx (rp_txdetectrx6_ext),
      .B_txelecidle (rp_txelecidle6_ext),
      .pclk_a (ep_clk_out),
      .pclk_b (rp_pclk),
      .pipe_mode (pipe_mode),
      .resetn (pcie_rstn)
    );

  defparam lane6.APIPE_WIDTH = 8,
           lane6.BPIPE_WIDTH = 8,
           lane6.LANE_NUM = 6;

  altpcietb_pipe_phy lane7
    (
      .A_lane_conn (1'b0),
      .A_phystatus (open_phystatus7_ext),
      .A_powerdown (gnd_powerdown7_ext),
      .A_rate (rate_ext),
      .A_rxdata (open_rxdata7_ext),
      .A_rxdatak (open_rxdatak7_ext),
      .A_rxelecidle (open_rxelecidle7_ext),
      .A_rxpolarity (gnd_rxpolarity7_ext),
      .A_rxstatus (open_rxstatus7_ext),
      .A_rxvalid (open_rxvalid7_ext),
      .A_txcompl (gnd_txcompl7_ext),
      .A_txdata (gnd_txdata7_ext),
      .A_txdatak (gnd_txdatak7_ext),
      .A_txdetectrx (gnd_txdetectrx7_ext),
      .A_txelecidle (gnd_txelecidle7_ext),
      .B_lane_conn (1'b1),
      .B_phystatus (rp_phystatus7_ext),
      .B_powerdown (rp_powerdown7_ext),
      .B_rate (rp_rate),
      .B_rxdata (rp_rxdata7_ext),
      .B_rxdatak (rp_rxdatak7_ext),
      .B_rxelecidle (rp_rxelecidle7_ext),
      .B_rxpolarity (rp_rxpolarity7_ext),
      .B_rxstatus (rp_rxstatus7_ext),
      .B_rxvalid (rp_rxvalid7_ext),
      .B_txcompl (rp_txcompl7_ext),
      .B_txdata (rp_txdata7_ext),
      .B_txdatak (rp_txdatak7_ext),
      .B_txdetectrx (rp_txdetectrx7_ext),
      .B_txelecidle (rp_txelecidle7_ext),
      .pclk_a (ep_clk_out),
      .pclk_b (rp_pclk),
      .pipe_mode (pipe_mode),
      .resetn (pcie_rstn)
    );

  defparam lane7.APIPE_WIDTH = 8,
           lane7.BPIPE_WIDTH = 8,
           lane7.LANE_NUM = 7;

  altpcietb_rst_clk rst_clk_gen
    (
      .ep_core_clk_out (ep_core_clk_out),
      .pcie_rstn (pcie_rstn),
      .ref_clk_out (refclk),
      .ref_clk_sel_code (ref_clk_sel_code),
      .rp_rstn (rp_rstn)
    );



endmodule

