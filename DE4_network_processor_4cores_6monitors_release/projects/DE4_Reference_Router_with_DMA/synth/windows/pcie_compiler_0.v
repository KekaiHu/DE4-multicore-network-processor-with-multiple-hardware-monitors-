// megafunction wizard: %IP Compiler for PCI Express v11.1%
// GENERATION: XML
// ============================================================
// Megafunction Name(s):
// ============================================================

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

//$Revision: #1 
//Phy type: Stratix IV GX Hard IP 
//Number of Lanes: 1
//Ref Clk Freq: 100Mhz
//Number of VCs: 1
module pcie_compiler_0 (
                         // inputs:
                          AvlClk_i,
                          CraAddress_i,
                          CraByteEnable_i,
                          CraChipSelect_i,
                          CraRead,
                          CraWrite,
                          CraWriteData_i,
                          RxmIrqNum_i,
                          RxmIrq_i,
                          RxmReadDataValid_i,
                          RxmReadData_i,
                          RxmWaitRequest_i,
                          TxsAddress_i,
                          TxsBurstCount_i,
                          TxsByteEnable_i,
                          TxsChipSelect_i,
                          TxsRead_i,
                          TxsWriteData_i,
                          TxsWrite_i,
                          busy_altgxb_reconfig,
                          cal_blk_clk,
                          fixedclk_serdes,
                          gxb_powerdown,
                          pcie_rstn,
                          phystatus_ext,
                          pipe_mode,
                          pll_powerdown,
                          reconfig_clk,
                          reconfig_togxb,
                          refclk,
                          reset_n,
                          rx_in0,
                          rxdata0_ext,
                          rxdatak0_ext,
                          rxelecidle0_ext,
                          rxstatus0_ext,
                          rxvalid0_ext,
                          test_in,

                         // outputs:
                          CraIrq_o,
                          CraReadData_o,
                          CraWaitRequest_o,
                          RxmAddress_o,
                          RxmBurstCount_o,
                          RxmByteEnable_o,
                          RxmRead_o,
                          RxmResetRequest_o,
                          RxmWriteData_o,
                          RxmWrite_o,
                          TxsReadDataValid_o,
                          TxsReadData_o,
                          TxsWaitRequest_o,
                          clk125_out,
                          clk250_out,
                          clk500_out,
                          lane_act,
                          ltssm,
                          powerdown_ext,
                          rate_ext,
                          rc_pll_locked,
                          rc_rx_digitalreset,
                          reconfig_fromgxb,
                          reset_status,
                          rxpolarity0_ext,
                          suc_spd_neg,
                          test_out,
                          tl_cfg_add,
                          tl_cfg_ctl,
                          tl_cfg_ctl_wr,
                          tl_cfg_sts,
                          tl_cfg_sts_wr,
                          tx_out0,
                          txcompl0_ext,
                          txdata0_ext,
                          txdatak0_ext,
                          txdetectrx_ext,
                          txelecidle0_ext
                       )
;

  output           CraIrq_o;
  output  [ 31: 0] CraReadData_o;
  output           CraWaitRequest_o;
  output  [ 31: 0] RxmAddress_o;
  output  [  9: 0] RxmBurstCount_o;
  output  [  7: 0] RxmByteEnable_o;
  output           RxmRead_o;
  output           RxmResetRequest_o;
  output  [ 63: 0] RxmWriteData_o;
  output           RxmWrite_o;
  output           TxsReadDataValid_o;
  output  [ 63: 0] TxsReadData_o;
  output           TxsWaitRequest_o;
  output           clk125_out;
  output           clk250_out;
  output           clk500_out;
  output  [  3: 0] lane_act;
  output  [  4: 0] ltssm;
  output  [  1: 0] powerdown_ext;
  output           rate_ext;
  output           rc_pll_locked;
  output           rc_rx_digitalreset;
  output  [ 16: 0] reconfig_fromgxb;
  output           reset_status;
  output           rxpolarity0_ext;
  output           suc_spd_neg;
  output  [  8: 0] test_out;
  output  [  3: 0] tl_cfg_add;
  output  [ 31: 0] tl_cfg_ctl;
  output           tl_cfg_ctl_wr;
  output  [ 52: 0] tl_cfg_sts;
  output           tl_cfg_sts_wr;
  output           tx_out0;
  output           txcompl0_ext;
  output  [  7: 0] txdata0_ext;
  output           txdatak0_ext;
  output           txdetectrx_ext;
  output           txelecidle0_ext;
  input            AvlClk_i;
  input   [ 11: 0] CraAddress_i;
  input   [  3: 0] CraByteEnable_i;
  input            CraChipSelect_i;
  input            CraRead;
  input            CraWrite;
  input   [ 31: 0] CraWriteData_i;
  input   [  5: 0] RxmIrqNum_i;
  input            RxmIrq_i;
  input            RxmReadDataValid_i;
  input   [ 63: 0] RxmReadData_i;
  input            RxmWaitRequest_i;
  input   [ 21: 0] TxsAddress_i;
  input   [  9: 0] TxsBurstCount_i;
  input   [  7: 0] TxsByteEnable_i;
  input            TxsChipSelect_i;
  input            TxsRead_i;
  input   [ 63: 0] TxsWriteData_i;
  input            TxsWrite_i;
  input            busy_altgxb_reconfig;
  input            cal_blk_clk;
  input            fixedclk_serdes;
  input            gxb_powerdown;
  input            pcie_rstn;
  input            phystatus_ext;
  input            pipe_mode;
  input            pll_powerdown;
  input            reconfig_clk;
  input   [  3: 0] reconfig_togxb;
  input            refclk;
  input            reset_n;
  input            rx_in0;
  input   [  7: 0] rxdata0_ext;
  input            rxdatak0_ext;
  input            rxelecidle0_ext;
  input   [  2: 0] rxstatus0_ext;
  input            rxvalid0_ext;
  input   [ 39: 0] test_in;

  wire             CraIrq_o;
  wire    [ 31: 0] CraReadData_o;
  wire             CraWaitRequest_o;
  wire    [ 31: 0] RxmAddress_o;
  wire    [  9: 0] RxmBurstCount_o;
  wire    [  7: 0] RxmByteEnable_int;
  wire    [  7: 0] RxmByteEnable_o;
  wire    [ 63: 0] RxmReadData_int;
  wire             RxmRead_o;
  reg              RxmResetRequest_o;
  wire    [ 63: 0] RxmWriteData_int;
  wire    [ 63: 0] RxmWriteData_o;
  wire             RxmWrite_o;
  wire             TxsReadDataValid_o;
  wire    [ 63: 0] TxsReadData_o;
  wire             TxsWaitRequest_o;
  wire             app_clk;
  wire             clk125_out;
  wire             clk250_out;
  wire             clk500_out;
  wire             core_clk_in;
  wire             core_clk_out;
  reg              crst;
  wire             detect_mask_rxdrst;
  wire             dlup_exit;
  wire    [ 23: 0] eidle_infer_sel;
  wire             fifo_err;
  wire             gnd_app_int_sts;
  wire    [  4: 0] gnd_app_msi_num;
  wire             gnd_app_msi_req;
  wire    [  2: 0] gnd_app_msi_tc;
  wire    [  6: 0] gnd_cpl_err;
  wire             gnd_cpl_pending;
  wire    [  4: 0] gnd_pex_msi_num;
  wire             gnd_pme_to_cr;
  wire             gnd_rx_st_mask0;
  wire             gnd_rx_st_ready0;
  wire    [ 63: 0] gnd_tx_st_data0;
  wire             gnd_tx_st_eop0;
  wire             gnd_tx_st_err0;
  wire             gnd_tx_st_sop0;
  wire             gnd_tx_st_valid0;
  wire             gxb_powerdown_int;
  wire    [  1: 0] hip_extraclkout;
  wire             hotrst_exit;
  wire             l2_exit;
  wire    [  3: 0] lane_act;
  wire    [  4: 0] ltssm;
  wire             npor;
  reg              npor_r /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102"  */;
  reg              npor_rr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102"  */;
  wire             open_app_int_ack;
  wire             open_app_msi_ack;
  wire             open_gxb_powerdown;
  wire             open_pme_to_sr;
  wire             open_rc_rx_analogreset;
  wire             open_rc_tx_digitalreset;
  wire             open_rx_fifo_empty0;
  wire             open_rx_fifo_full0;
  wire    [  7: 0] open_rx_st_bardec0;
  wire    [  7: 0] open_rx_st_be0;
  wire    [ 63: 0] open_rx_st_data0;
  wire             open_rx_st_eop0;
  wire             open_rx_st_err0;
  wire             open_rx_st_sop0;
  wire             open_rx_st_valid0;
  wire             open_tx_fifo_empty0;
  wire             open_tx_fifo_full0;
  wire    [  3: 0] open_tx_fifo_rdptr0;
  wire    [  3: 0] open_tx_fifo_wrptr0;
  wire             open_tx_st_ready0;
  wire             pclk_central;
  wire             pclk_central_serdes;
  wire             pclk_ch0;
  wire             pclk_ch0_serdes;
  wire             pclk_in;
  wire             phystatus;
  wire             phystatus_pcs;
  wire             pipe_mode_int;
  wire             pld_clk;
  wire             pll_fixed_clk;
  wire             pll_fixed_clk_serdes;
  wire             pll_locked;
  wire             pll_powerdown_int;
  wire    [  1: 0] powerdown;
  wire    [  1: 0] powerdown0_ext;
  wire    [  1: 0] powerdown0_int;
  wire    [  1: 0] powerdown_ext;
  wire             rate_ext;
  wire             rate_int;
  wire             rateswitch;
  wire             rateswitchbaseclock;
  wire             rc_areset;
  wire             rc_inclk_eq_125mhz;
  wire             rc_pll_locked;
  wire             rc_rx_analogreset;
  wire             rc_rx_digitalreset;
  wire             rc_rx_pll_locked_one;
  wire             rc_tx_digitalreset;
  wire    [ 16: 0] reconfig_fromgxb;
  reg              reset_n_r /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R105"  */;
  reg              reset_n_rr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R105"  */;
  wire             reset_status;
  reg     [ 10: 0] rsnt_cntn;
  wire             rx_cruclk;
  wire             rx_digitalreset_serdes;
  wire             rx_freqlocked;
  wire    [  7: 0] rx_freqlocked_byte;
  wire             rx_in;
  wire             rx_pll_locked;
  wire    [  7: 0] rx_pll_locked_byte;
  wire             rx_signaldetect;
  wire    [  7: 0] rx_signaldetect_byte;
  wire    [  7: 0] rxdata;
  wire    [  7: 0] rxdata_pcs;
  wire             rxdatak;
  wire             rxdatak_pcs;
  wire             rxelecidle;
  wire             rxelecidle_pcs;
  wire             rxpolarity;
  wire             rxpolarity0_ext;
  wire             rxpolarity0_int;
  wire    [  2: 0] rxstatus;
  wire    [  2: 0] rxstatus_pcs;
  wire             rxvalid;
  wire             rxvalid_pcs;
  reg              srst;
  wire             suc_spd_neg;
  wire    [  8: 0] test_out;
  wire    [ 63: 0] test_out_int;
  wire    [  3: 0] tl_cfg_add;
  wire    [ 31: 0] tl_cfg_ctl;
  wire             tl_cfg_ctl_wr;
  wire    [ 52: 0] tl_cfg_sts;
  wire             tl_cfg_sts_wr;
  wire    [  7: 0] tx_deemph;
  wire    [ 23: 0] tx_margin;
  wire             tx_out;
  wire             tx_out0;
  wire             txcompl;
  wire             txcompl0_ext;
  wire             txcompl0_int;
  wire    [  7: 0] txdata;
  wire    [  7: 0] txdata0_ext;
  wire    [  7: 0] txdata0_int;
  wire             txdatak;
  wire             txdatak0_ext;
  wire             txdatak0_int;
  wire             txdetectrx;
  wire             txdetectrx0_ext;
  wire             txdetectrx0_int;
  wire             txdetectrx_ext;
  wire             txelecidle;
  wire             txelecidle0_ext;
  wire             txelecidle0_int;
  wire             use_c4gx_serdes;
  assign clk125_out = core_clk_out;
  assign pld_clk = core_clk_out;
  assign test_out = {lane_act,ltssm};
  assign app_clk = core_clk_out;
  assign txdetectrx_ext = txdetectrx0_ext;
  assign powerdown_ext = powerdown0_ext;
  assign rxdata[7 : 0] = pipe_mode_int ? rxdata0_ext : rxdata_pcs[7 : 0];
  assign phystatus = pipe_mode_int ? phystatus_ext : phystatus_pcs;
  assign rxelecidle = pipe_mode_int ? rxelecidle0_ext : rxelecidle_pcs;
  assign rxvalid = pipe_mode_int ? rxvalid0_ext : rxvalid_pcs;
  assign txdata[7 : 0] = txdata0_int;
  assign rxdatak = pipe_mode_int ? rxdatak0_ext : rxdatak_pcs;
  assign rxstatus[2 : 0] = pipe_mode_int ? rxstatus0_ext : rxstatus_pcs[2 : 0];
  assign powerdown[1 : 0] = powerdown0_int;
  assign rxpolarity = rxpolarity0_int;
  assign txcompl = txcompl0_int;
  assign txdatak = txdatak0_int;
  assign txdetectrx = txdetectrx0_int;
  assign txelecidle = txelecidle0_int;
  assign txdata0_ext = pipe_mode_int ? txdata0_int : 0;
  assign txdatak0_ext = pipe_mode_int ? txdatak0_int : 0;
  assign txdetectrx0_ext = pipe_mode_int ? txdetectrx0_int : 0;
  assign txelecidle0_ext = pipe_mode_int ? txelecidle0_int : 0;
  assign txcompl0_ext = pipe_mode_int ? txcompl0_int : 0;
  assign rxpolarity0_ext = pipe_mode_int ? rxpolarity0_int : 0;
  assign powerdown0_ext = pipe_mode_int ? powerdown0_int : 0;
  assign RxmWriteData_o = RxmWriteData_int;
  assign RxmReadData_int = RxmReadData_i;
  assign RxmByteEnable_o = RxmByteEnable_int;
  assign gnd_cpl_pending = 0;
  assign gnd_cpl_err = 0;
  assign gnd_pme_to_cr = 0;
  assign gnd_app_int_sts = 0;
  assign gnd_app_msi_req = 0;
  assign gnd_app_msi_tc = 0;
  assign gnd_app_msi_num = 0;
  assign gnd_pex_msi_num = 0;
  assign npor = pcie_rstn;
  //reset Synchronizer to PCIe clock
  always @(posedge pld_clk or negedge npor)
    begin
      if (npor == 0)
        begin
          npor_r <= 0;
          npor_rr <= 0;
        end
      else 
        begin
          npor_r <= 1;
          npor_rr <= npor_r;
        end
    end


  //generate system reset request
  always @(posedge pld_clk)
    begin
      if (reset_n_rr == 1'b0)
          RxmResetRequest_o <= 0;
      else if ((npor_rr == 1'b0) | (l2_exit == 1'b0) | (hotrst_exit == 1'b0) | (dlup_exit == 1'b0) | (ltssm == 5'h10))
          RxmResetRequest_o <= 1;
    end


  //reset Synchronizer to PCIe clock
  always @(posedge pld_clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          reset_n_r <= 0;
          reset_n_rr <= 0;
        end
      else 
        begin
          reset_n_r <= 1;
          reset_n_rr <= reset_n_r;
        end
    end


  //reset counter
  always @(posedge pld_clk or negedge reset_n_rr)
    begin
      if (reset_n_rr == 0)
          rsnt_cntn <= 0;
      else if (rsnt_cntn != 4'hf)
          rsnt_cntn <= rsnt_cntn + 1;
    end


  //sync and config reset
  always @(posedge pld_clk or negedge reset_n_rr)
    begin
      if (reset_n_rr == 0)
        begin
          srst <= 1;
          crst <= 1;
        end
      else if (rsnt_cntn == 4'hf)
        begin
          srst <= 0;
          crst <= 0;
        end
    end


  assign rx_in = rx_in0;
  assign tx_out0 = tx_out;
  assign rc_inclk_eq_125mhz = 1;
  assign pclk_central_serdes = 0;
  assign pll_fixed_clk_serdes = rateswitchbaseclock;
  assign rc_pll_locked = (pipe_mode_int == 1'b1) ? 1'b1 : &pll_locked;
  assign gxb_powerdown_int = (pipe_mode_int == 1'b1) ? 1'b1 : gxb_powerdown;
  assign pll_powerdown_int = (pipe_mode_int == 1'b1) ? 1'b1 : pll_powerdown;
  assign rx_cruclk = {1{refclk}};
  assign rc_areset = pipe_mode_int | ~npor | busy_altgxb_reconfig;
  assign pclk_central = (pipe_mode_int == 1'b1) ? pclk_in : pclk_central_serdes;
  assign pclk_ch0 = (pipe_mode_int == 1'b1) ? pclk_in : pclk_ch0_serdes;
  assign rateswitch = {1{rate_int}};
  assign rate_ext = pipe_mode_int ? rate_int : 0;
  assign pll_fixed_clk = (pipe_mode_int == 1'b1) ? clk250_out : pll_fixed_clk_serdes;
  assign pclk_in = (rate_ext == 1'b1) ? clk500_out : clk250_out;
  assign rc_rx_pll_locked_one = &(rx_pll_locked | rx_freqlocked);
  assign use_c4gx_serdes = 1'b0;
  assign fifo_err = 1'b0;
  assign rx_freqlocked_byte[0] = rx_freqlocked;
  assign rx_freqlocked_byte[7 : 1] = 7'h7F;
  assign rx_pll_locked_byte[0] = rx_pll_locked;
  assign rx_pll_locked_byte[7 : 1] = 7'h7F;
  assign rx_signaldetect_byte[0] = rx_signaldetect;
  assign rx_signaldetect_byte[7 : 1] = 7'h0;
  assign detect_mask_rxdrst = 1'b0;
  assign core_clk_in = 1'b0;
  assign gnd_rx_st_ready0 = 1'b0;
  assign gnd_rx_st_mask0 = 1'b0;
  assign gnd_tx_st_sop0 = 1'b0;
  assign gnd_tx_st_eop0 = 1'b0;
  assign gnd_tx_st_err0 = 1'b0;
  assign gnd_tx_st_valid0 = 1'b0;
  assign gnd_tx_st_data0 = 1'b0;
  pcie_compiler_0_serdes serdes
    (
      .cal_blk_clk (cal_blk_clk),
      .fixedclk (fixedclk_serdes),
      .gxb_powerdown (gxb_powerdown_int),
      .hip_tx_clkout (pclk_ch0_serdes),
      .pipe8b10binvpolarity (rxpolarity),
      .pipedatavalid (rxvalid_pcs),
      .pipeelecidle (rxelecidle_pcs),
      .pipephydonestatus (phystatus_pcs),
      .pipestatus (rxstatus_pcs),
      .pll_inclk (refclk),
      .pll_locked (pll_locked),
      .pll_powerdown (pll_powerdown_int),
      .powerdn (powerdown),
      .rateswitch (rateswitch),
      .rateswitchbaseclock (rateswitchbaseclock),
      .reconfig_clk (reconfig_clk),
      .reconfig_fromgxb (reconfig_fromgxb),
      .reconfig_togxb (reconfig_togxb),
      .rx_analogreset (rc_rx_analogreset),
      .rx_cruclk (rx_cruclk),
      .rx_ctrldetect (rxdatak_pcs),
      .rx_datain (rx_in),
      .rx_dataout (rxdata_pcs),
      .rx_digitalreset (rx_digitalreset_serdes),
      .rx_elecidleinfersel (eidle_infer_sel[2 : 0]),
      .rx_freqlocked (rx_freqlocked),
      .rx_pll_locked (rx_pll_locked),
      .rx_signaldetect (rx_signaldetect),
      .tx_ctrlenable (txdatak),
      .tx_datain (txdata),
      .tx_dataout (tx_out),
      .tx_detectrxloop (txdetectrx),
      .tx_digitalreset (rc_tx_digitalreset),
      .tx_forcedispcompliance (txcompl),
      .tx_forceelecidle (txelecidle),
      .tx_pipedeemph (tx_deemph[0]),
      .tx_pipemargin (tx_margin[2 : 0])
    );


  altpcie_rs_serdes rs_serdes
    (
      .busy_altgxb_reconfig (busy_altgxb_reconfig),
      .detect_mask_rxdrst (detect_mask_rxdrst),
      .fifo_err (fifo_err),
      .ltssm (ltssm),
      .npor (npor),
      .pld_clk (pld_clk),
      .pll_locked (rc_pll_locked),
      .rc_inclk_eq_125mhz (rc_inclk_eq_125mhz),
      .rx_freqlocked (rx_freqlocked_byte),
      .rx_pll_locked (rx_pll_locked_byte),
      .rx_signaldetect (rx_signaldetect_byte),
      .rxanalogreset (rc_rx_analogreset),
      .rxdigitalreset (rx_digitalreset_serdes),
      .test_in (test_in),
      .txdigitalreset (rc_tx_digitalreset),
      .use_c4gx_serdes (use_c4gx_serdes)
    );


  pcie_compiler_0_core wrapper
    (
      .AvlClk_i (AvlClk_i),
      .CraAddress_i (CraAddress_i),
      .CraByteEnable_i (CraByteEnable_i),
      .CraChipSelect_i (CraChipSelect_i),
      .CraIrq_o (CraIrq_o),
      .CraRead (CraRead),
      .CraReadData_o (CraReadData_o),
      .CraWaitRequest_o (CraWaitRequest_o),
      .CraWrite (CraWrite),
      .CraWriteData_i (CraWriteData_i),
      .Rstn_i (reset_n),
      .RxmAddress_o (RxmAddress_o),
      .RxmBurstCount_o (RxmBurstCount_o),
      .RxmByteEnable_o (RxmByteEnable_int),
      .RxmIrqNum_i (RxmIrqNum_i),
      .RxmIrq_i (RxmIrq_i),
      .RxmReadDataValid_i (RxmReadDataValid_i),
      .RxmReadData_i (RxmReadData_int),
      .RxmRead_o (RxmRead_o),
      .RxmWaitRequest_i (RxmWaitRequest_i),
      .RxmWriteData_o (RxmWriteData_int),
      .RxmWrite_o (RxmWrite_o),
      .TxsAddress_i (TxsAddress_i),
      .TxsBurstCount_i (TxsBurstCount_i),
      .TxsByteEnable_i (TxsByteEnable_i),
      .TxsChipSelect_i (TxsChipSelect_i),
      .TxsReadDataValid_o (TxsReadDataValid_o),
      .TxsReadData_o (TxsReadData_o),
      .TxsRead_i (TxsRead_i),
      .TxsWaitRequest_o (TxsWaitRequest_o),
      .TxsWriteData_i (TxsWriteData_i),
      .TxsWrite_i (TxsWrite_i),
      .aer_msi_num (5'b00000),
      .app_int_ack (open_app_int_ack),
      .app_int_sts (gnd_app_int_sts),
      .app_msi_ack (open_app_msi_ack),
      .app_msi_num (gnd_app_msi_num),
      .app_msi_req (gnd_app_msi_req),
      .app_msi_tc (gnd_app_msi_tc),
      .core_clk_in (core_clk_in),
      .core_clk_out (core_clk_out),
      .cpl_err (gnd_cpl_err),
      .cpl_pending (gnd_cpl_pending),
      .crst (crst),
      .dl_ltssm (ltssm),
      .dlup_exit (dlup_exit),
      .eidle_infer_sel (eidle_infer_sel),
      .hip_extraclkout (hip_extraclkout),
      .hotrst_exit (hotrst_exit),
      .hpg_ctrler (5'b00000),
      .l2_exit (l2_exit),
      .lane_act (lane_act),
      .lmi_addr (12'h000),
      .lmi_din (32'h00000000),
      .lmi_rden (1'b0),
      .lmi_wren (1'b0),
      .npor (npor),
      .pclk_central (pclk_central),
      .pclk_ch0 (pclk_ch0),
      .pex_msi_num (gnd_pex_msi_num),
      .phystatus0_ext (phystatus),
      .pld_clk (pld_clk),
      .pll_fixed_clk (pll_fixed_clk),
      .pm_auxpwr (1'b0),
      .pm_data (10'b0000000000),
      .pm_event (1'b0),
      .pme_to_cr (gnd_pme_to_cr),
      .pme_to_sr (open_pme_to_sr),
      .powerdown0_ext (powerdown0_int),
      .rate_ext (rate_int),
      .rc_areset (rc_areset),
      .rc_gxb_powerdown (open_gxb_powerdown),
      .rc_inclk_eq_125mhz (rc_inclk_eq_125mhz),
      .rc_pll_locked (rc_pll_locked),
      .rc_rx_analogreset (open_rc_rx_analogreset),
      .rc_rx_digitalreset (rc_rx_digitalreset),
      .rc_rx_pll_locked_one (rc_rx_pll_locked_one),
      .rc_tx_digitalreset (open_rc_tx_digitalreset),
      .reset_status (reset_status),
      .rx_fifo_empty0 (open_rx_fifo_empty0),
      .rx_fifo_full0 (open_rx_fifo_full0),
      .rx_st_bardec0 (open_rx_st_bardec0),
      .rx_st_be0 (open_rx_st_be0),
      .rx_st_data0 (open_rx_st_data0),
      .rx_st_eop0 (open_rx_st_eop0),
      .rx_st_err0 (open_rx_st_err0),
      .rx_st_mask0 (gnd_rx_st_mask0),
      .rx_st_ready0 (gnd_rx_st_ready0),
      .rx_st_sop0 (open_rx_st_sop0),
      .rx_st_valid0 (open_rx_st_valid0),
      .rxdata0_ext (rxdata[7 : 0]),
      .rxdatak0_ext (rxdatak),
      .rxelecidle0_ext (rxelecidle),
      .rxpolarity0_ext (rxpolarity0_int),
      .rxstatus0_ext (rxstatus[2 : 0]),
      .rxvalid0_ext (rxvalid),
      .srst (srst),
      .suc_spd_neg (suc_spd_neg),
      .test_in (test_in),
      .test_out (test_out_int),
      .tl_cfg_add (tl_cfg_add),
      .tl_cfg_ctl (tl_cfg_ctl),
      .tl_cfg_ctl_wr (tl_cfg_ctl_wr),
      .tl_cfg_sts (tl_cfg_sts),
      .tl_cfg_sts_wr (tl_cfg_sts_wr),
      .tx_deemph (tx_deemph),
      .tx_fifo_empty0 (open_tx_fifo_empty0),
      .tx_fifo_full0 (open_tx_fifo_full0),
      .tx_fifo_rdptr0 (open_tx_fifo_rdptr0),
      .tx_fifo_wrptr0 (open_tx_fifo_wrptr0),
      .tx_margin (tx_margin),
      .tx_st_data0 (gnd_tx_st_data0),
      .tx_st_data0_p1 (64'h0),
      .tx_st_eop0 (gnd_tx_st_eop0),
      .tx_st_eop0_p1 (1'b0),
      .tx_st_err0 (gnd_tx_st_err0),
      .tx_st_ready0 (open_tx_st_ready0),
      .tx_st_sop0 (gnd_tx_st_sop0),
      .tx_st_sop0_p1 (1'b0),
      .tx_st_valid0 (gnd_tx_st_valid0),
      .txcompl0_ext (txcompl0_int),
      .txdata0_ext (txdata0_int),
      .txdatak0_ext (txdatak0_int),
      .txdetectrx0_ext (txdetectrx0_int),
      .txelecidle0_ext (txelecidle0_int)
    );



//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign pipe_mode_int = pipe_mode;
  altpcie_pll_100_250 refclk_to_250mhz
    (
      .areset (1'b0),
      .c0 (clk250_out),
      .inclk0 (refclk)
    );


  altpcie_pll_125_250 pll_250mhz_to_500mhz
    (
      .areset (1'b0),
      .c0 (clk500_out),
      .inclk0 (clk250_out)
    );



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  assign pipe_mode_int = 0;
//synthesis read_comments_as_HDL off

endmodule


// =========================================================
// IP Compiler for PCI Express Wizard Data
// ===============================
// DO NOT EDIT FOLLOWING DATA
// @Altera, IP Toolbench@
// Warning: If you modify this section, IP Compiler for PCI Express Wizard may not be able to reproduce your chosen configuration.
// 
// Retrieval info: <?xml version="1.0"?>
// Retrieval info: <MEGACORE title="IP Compiler for PCI Express"  version="11.1"  build="173"  iptb_version="1.3.0 Build 173"  format_version="120" >
// Retrieval info:  <NETLIST_SECTION class="altera.ipbu.flowbase.netlist.model.MVCModel"  active_core="altpcie_hip_pipen1b" >
// Retrieval info:   <STATIC_SECTION>
// Retrieval info:    <PRIVATES>
// Retrieval info:     <NAMESPACE name = "parameterization">
// Retrieval info:      <PRIVATE name = "p_pcie_phy" value="Stratix IV GX"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_port_type" value="Native Endpoint"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_tag_supported" value="32"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_msi_message_requested" value="4"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_low_priority_virtual_channels" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_retry_fifo_depth" value="64"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nfts_common_clock" value="255"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nfts_separate_clock" value="255"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_exp_rom_bar_used" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_link_common_clock" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_advanced_error_reporting" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_ecrc_check" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_ecrc_generation" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_power_indicator" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_attention_indicator" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_attention_button" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_msi_message_64bits_address_capable" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_auto_configure_retry_buffer" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_implement_data_register" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_device_init_required" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_L1_aspm" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rate_match_fifo" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_fast_recovery" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "SOPCSystemName" value="DE4_SOPC"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR0AvalonAddress" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR0Size" value="28"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR1AvalonAddress" value="536870912"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR1Size" value="28"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR2AvalonAddress" value="2147483648"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR2Size" value="19"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR3AvalonAddress" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR3Size" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR4AvalonAddress" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR4Size" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR5AvalonAddress" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "actualBAR5Size" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "altgx_generated" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "clockSource" value="pll"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "contextState" value="SOPCContext"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "deviceFamily" value="Stratix IV"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "ordering_code" value="IP-PCIE/4"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hardwired_address_map" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_00" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_00_type" value="Memory64Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_01" value="0x0000000001000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_01_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_02" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_02_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_03" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_03_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_04" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_04_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_05" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_05_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_06" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_06_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_07" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_07_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_08" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_08_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_09" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_09_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_10" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_10_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_11" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_11_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_12" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_12_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_13" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_13_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_14" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_14_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_15" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_hw_pci_address_15_type" value="Memory32Bit"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_pane_count" value="2"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_avalon_pane_size" value="24"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_enable_pcie_hip_dprio" value="N/A"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_64bit_bar" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_64bit_bus" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_66mhz" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_allow_param_readback" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_altera_arbiter" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_arbited_devices" value="2"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_arbiter" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_0_auto_avalon_address" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_0_auto_sized" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_0_avalon_address" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_0_hardwired" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_0_pci_address" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_0_prefetchable" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_1_auto_avalon_address" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_1_auto_sized" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_1_avalon_address" value="536870912"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_1_hardwired" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_1_pci_address" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_1_prefetchable" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_2_auto_avalon_address" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_2_auto_sized" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_2_avalon_address" value="2147483648"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_2_hardwired" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_2_pci_address" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_2_prefetchable" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_3_auto_avalon_address" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_3_auto_sized" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_3_avalon_address" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_3_hardwired" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_3_pci_address" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_3_prefetchable" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_4_auto_avalon_address" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_4_auto_sized" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_4_avalon_address" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_4_hardwired" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_4_pci_address" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_4_prefetchable" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_5_auto_avalon_address" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_5_auto_sized" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_5_avalon_address" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_5_hardwired" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_5_pci_address" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bar_5_prefetchable" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_bus_access_address_width" value="22"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_global_reset" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_host_bridge" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_impl_cra_av_slave_port" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_master" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_master_bursts" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_master_concurrent_reads" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_master_data_width" value="64"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_maximum_burst_size" value="128"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_maximum_burst_size_a2p" value="128"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_maximum_pending_read_transactions_a2p" value="8"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_non_pref_av_master_port" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_not_target_only_port" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_pref_av_master_port" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_reqn_gntn_pins" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_single_clock" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_target_bursts" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_target_concurrent_reads" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pci_user_specified_bars" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_L1_exit_latency_common_clock" value="&gt;64 us"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_L1_exit_latency_separate_clock" value="&gt;64 us"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_advanced_error_int_num" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_alt2gxb" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_altgx_keyParameters_used" value="{p_pcie_enable_hip=1, p_pcie_number_of_lanes=x1, p_pcie_phy=Stratix IV GX, p_pcie_rate=Gen1 (2.5 Gbps), p_pcie_txrx_clock=100 MHz}"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_app_signal_interface" value="AvalonMM"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_avalon_mm_lite" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_size_bar_0" value="256 MBytes - 28 bits"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_size_bar_1" value="256 MBytes - 28 bits"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_size_bar_2" value="512 KBytes - 19 bits"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_size_bar_3" value="N/A"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_size_bar_4" value="N/A"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_size_bar_5" value="N/A"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_type_bar_0" value="32-bit Non-Prefetchable Memory"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_type_bar_1" value="32-bit Non-Prefetchable Memory"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_type_bar_2" value="32-bit Non-Prefetchable Memory"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_type_bar_3" value="Disable this and all higher BARs"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_type_bar_4" value="Disable this and all higher BARs"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_type_bar_5" value="Disable this and all higher BARs"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_used_bar_0" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_used_bar_1" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_used_bar_2" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_used_bar_3" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_used_bar_4" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_bar_used_bar_5" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_channel_number" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_chk_io" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_class_code" value="0xFF0000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_data_credit_vc0" value="256"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_data_credit_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_data_credit_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_data_credit_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_data_used_space_vc0" value="4096"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_data_used_space_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_data_used_space_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_data_used_space_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_header_credit_vc0" value="48"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_header_credit_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_header_credit_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_header_credit_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_header_used_space_vc0" value="768"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_header_used_space_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_header_used_space_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_header_used_space_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_completion_timeout" value="NONE"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_custom_phy_x8" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_custom_rx_buffer_xml" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_device_id" value="0xE001"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_disable_L0s" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_dll_active_report_support" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_eie_b4_nfts_count" value="4"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_completion_timeout_disable" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_function_msix_support" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_hip" value="1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_hip_core_clk" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_pcie_gen2_x8_es" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_pcie_gen2_x8_s5gx" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_root_port_endpoint_mode" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_simple_dma" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_slot_capability" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_enable_tl_bypass_mode" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_endpoint_L0s_acceptable_latency" value="&lt;64 ns"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_endpoint_L1_acceptable_latency" value="&lt;1 us"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_exp_rom_bar_size" value="N/A"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_gen2_nfts_diff_clock" value="255"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_gen2_nfts_same_clock" value="255"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_initiator_performance_preset" value="High"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_internal_clock" value="125 MHz"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_io_base_and_limit_register" value="IODisable"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_lanerev" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_link_port_number" value="0x01"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_max_payload_size" value="256 Bytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_mem_base_and_limit_register" value="MemDisable"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_msix_pba_bir" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_msix_pba_offset" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_msix_table_bir" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_msix_table_offset" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_msix_table_size" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_data_credit_vc0" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_data_credit_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_data_credit_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_data_credit_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_data_used_space_vc0" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_data_used_space_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_data_used_space_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_data_used_space_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_header_credit_vc0" value="20"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_header_credit_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_header_credit_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_header_credit_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_header_used_space_vc0" value="320"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_header_used_space_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_header_used_space_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_nonposted_header_used_space_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_number_of_lanes" value="x1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_phy_interface" value="Serial"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_pme_pending" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_pme_reg_id" value="0x0000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_data_credit_vc0" value="91"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_data_credit_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_data_credit_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_data_credit_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_data_used_space_vc0" value="1456"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_data_used_space_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_data_used_space_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_data_used_space_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_header_credit_vc0" value="17"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_header_credit_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_header_credit_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_header_credit_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_header_used_space_vc0" value="272"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_header_used_space_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_header_used_space_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_posted_header_used_space_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rate" value="Gen1 (2.5 Gbps)"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_retry_buffer_size" value="2 KBytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_revision_id" value="0x01"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rx_buffer_preset" value="Default"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rx_buffer_size_string_vc0" value="6912 Bytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rx_buffer_size_string_vc1" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rx_buffer_size_string_vc2" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rx_buffer_size_string_vc3" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rx_buffer_size_vc0" value="6912"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rx_buffer_size_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rx_buffer_size_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_rx_buffer_size_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_slot_capabilities" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_special_phy_gl" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_special_phy_px" value="1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_subsystem_device_id" value="0x2801"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_subsystem_vendor_id" value="0x1172"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_surprise_down_error_support" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_target_performance_preset" value="High"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_test_out_width" value="9 bits"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_threshold_for_L0s_entry" value="8192 ns"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_total_header_credit_vc0" value="85"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_total_header_credit_vc1" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_total_header_credit_vc2" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_total_header_credit_vc3" value="0"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_txrx_clock" value="100 MHz"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_underSOPCBuilder" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_use_crc_forwarding" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_use_parity" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_variation_name" value="pcie_compiler_0_core"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_vendor_id" value="0x1172"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_version" value="1.1"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "p_pcie_virutal_channels" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "pref_nonp_independent" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "translationTableSizeInfo" value="The bridge reserves a contiguous Avalon address range to access
// Retrieval info: PCIe devices. This Avalon address range is segmented into one or
// Retrieval info: more equal-sized pages that are individually mapped to PCIe
// Retrieval info: addresses. Select the number and size of the address pages."  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress0" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress1" value="0x01000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress10" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress11" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress12" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress13" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress14" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress15" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress2" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress3" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress4" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress5" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress6" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress7" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress8" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWAddress9" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress0" value="0x0000000000000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress1" value="0x01000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress10" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress11" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress12" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress13" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress14" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress15" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress2" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress3" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress4" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress5" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress6" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress7" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress8" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonHWPCIAddress9" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiAvalonTranslationTable" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar0PCIAddress" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar0Prefetchable" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar1PCIAddress" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar1Prefetchable" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar2PCIAddress" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar2Prefetchable" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar3PCIAddress" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar3Prefetchable" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar4PCIAddress" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar4Prefetchable" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar5PCIAddress" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiBar5Prefetchable" value="true"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiCRAInfoPanel" value="dynamicTable"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiExpROMType" value="Select to Enable"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiFixedTable" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCIBar0Type" value="32-bit Non-Prefetchable Memory"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCIBar1Type" value="32-bit Non-Prefetchable Memory"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCIBar2Type" value="32-bit Non-Prefetchable Memory"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCIBar3Type" value="Disable this and all higher BARs"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCIBar4Type" value="Disable this and all higher BARs"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCIBar5Type" value="Disable this and all higher BARs"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCIBarTable" value="false"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCIBusArbiter" value="external"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCIDeviceMode" value="masterTarget"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCIMasterPerformance" value="burstSinglePending"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPCITargetPerformance" value="burstSinglePending"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPaneCount" value="2"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "uiPaneSize" value="24"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "ui_pcie_msix_pba_bir" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "ui_pcie_msix_table_bir" value="0"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen_enable">
// Retrieval info:      <PRIVATE name = "language" value="VERILOG"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "enabled" value="0"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "greybox">
// Retrieval info:      <PRIVATE name = "gb_enabled" value="0"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "filename" value="pcie_compiler_0_syn.v"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "testbench">
// Retrieval info:      <PRIVATE name = "plugin_worker" value="1"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen">
// Retrieval info:      <PRIVATE name = "filename" value="pcie_compiler_0_core.v"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "serializer"/>
// Retrieval info:    </PRIVATES>
// Retrieval info:    <FILES/>
// Retrieval info:    <PORTS/>
// Retrieval info:    <LIBRARIES/>
// Retrieval info:   </STATIC_SECTION>
// Retrieval info:  </NETLIST_SECTION>
// Retrieval info: </MEGACORE>
// =========================================================
