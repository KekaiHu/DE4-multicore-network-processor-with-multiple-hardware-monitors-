## Generated SDC file "DE4_Reference_Router.sdc"

## Copyright (C) 1991-2010 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 9.1 Build 350 03/24/2010 Service Pack 2 SJ Full Version"

## DATE    "Tue May 25 10:29:49 2010"

##
## DEVICE  "EP4SGX230KF40C2"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {OSC_50_BANK2} -period 20.000 -waveform { 0.000 10.000 } [get_ports {OSC_50_BANK2}]
create_clock -name {OSC_50_BANK3} -period 20.000 -waveform { 0.000 10.000 } [get_ports {OSC_50_BANK3}]
derive_pll_clocks
create_clock -name {OSC_50_BANK4} -period 20.000 -waveform { 0.000 10.000 } [get_ports {OSC_50_BANK4}]
create_clock -name {OSC_50_BANK5} -period 20.000 -waveform { 0.000 10.000 } [get_ports {OSC_50_BANK5}]
create_clock -name {OSC_50_BANK6} -period 20.000 -waveform { 0.000 10.000 } [get_ports {OSC_50_BANK6}]
create_clock -name {OSC_50_BANK7} -period 20.000 -waveform { 0.000 10.000 } [get_ports {OSC_50_BANK7}]
derive_pll_clocks
create_clock -name {PCIE_REFCLK_P} -period 10.000 -waveform {0.000 5.000} [get_ports {PCIE_REFCLK_p}]
create_clock -name {GCLKIN} -period 10.000 -waveform {0.000 5.000} [get_ports {GCLKIN}]
derive_pll_clocks


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -exclusive -group [get_clocks {SOPC_INST|the_tse_mac|altera_tse_mac_pcs_pma_inst|the_altera_tse_pma_lvds_rx|altlvds_rx_component|auto_generated|pll|clk[0]}] 
set_clock_groups -exclusive -group [get_clocks {SOPC_INST|the_tse_mac|altera_tse_mac_pcs_pma_inst|the_altera_tse_pma_lvds_rx|altlvds_rx_component|auto_generated|pll|clk[1]}] 
set_clock_groups -exclusive -group [get_clocks {SOPC_INST|the_tse_mac|altera_tse_mac_pcs_pma_inst|the_altera_tse_pma_lvds_rx|altlvds_rx_component|auto_generated|rx[0]|clk0}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path  -from  [get_clocks {SOPC_INST|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]}]  -to  [get_clocks {pll_125_ins|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path -from [get_clocks {OSC_50_BANK3}] -to [get_clocks {pll_125_ins|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path -from [get_clocks {OSC_50_BANK3}] -to [get_clocks {SOPC_INST|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[0]}]
set_false_path -from [get_clocks {SOPC_INST|the_pcie_compiler_0|wrapper|altpcie_hip_pipen1b_inst|stratix_iv.stratixiv_hssi_pcie_hip|coreclkout}] -to [get_clocks {SOPC_INST|the_pll|the_pll|altpll_component|auto_generated|pll1|clk[1]}]
set_false_path -from [get_clocks {reconfig_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -to [get_clocks {alt_cal_edge_detect_clk}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|jupdate}] -to [get_registers {*|alt_jtag_atlantic:*|jupdate1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rdata[*]}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_req}] 
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_write}] -to [get_registers {*|alt_jtag_atlantic:*|read_write1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rvalid}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|td_shift[0]*}]
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|write_stalled*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|user_saw_rvalid}] -to [get_registers {*|alt_jtag_atlantic:*|rvalid0*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|wdata[*]}] -to [get_registers *]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_ena*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_pause*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_valid}] 
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -from [get_keepers {altera_reserved_tck}] -to [get_keepers {pzdyqx:nabboc|pzdyqx_impl:pzdyqx_impl_inst|FNUJ6967}]
set_false_path -from [get_keepers {DE4_SOPC:SOPC_INST|pcie_compiler_0:the_pcie_compiler_0|pcie_compiler_0_core:wrapper|altpcie_hip_pipen1b:altpcie_hip_pipen1b_inst|altpciexpav_tlbp_app:tl_bypass_hip_sopc.tlbp_app|altpciexpav_rx:rx|altpciexpav_fifo:pndgtxrd_fifo|rdptr_g_rd[3]}] -to [get_keepers {DE4_SOPC:SOPC_INST|pcie_compiler_0:the_pcie_compiler_0|pcie_compiler_0_core:wrapper|altpcie_hip_pipen1b:altpcie_hip_pipen1b_inst|altpciexpav_tlbp_app:tl_bypass_hip_sopc.tlbp_app|altpciexpav_rx:rx|altpciexpav_fifo:pndgtxrd_fifo|rdptr_g_wr1[3]}]
set_false_path -from [get_keepers {altgx_reconfig:altgx_reconfig_inst|altgx_reconfig_alt2gxb_reconfig_v3p:altgx_reconfig_alt2gxb_reconfig_v3p_component|alt_cal:calibration|state.DPRIO_WRITE}] -to [get_keepers {altgx_reconfig:altgx_reconfig_inst|altgx_reconfig_alt2gxb_reconfig_v3p:altgx_reconfig_alt2gxb_reconfig_v3p_component|alt_cal:calibration|alt_cal_edge_detect:pd90_det|ff2}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_hd9:dffpipe19|dffe20a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_fd9:dffpipe15|dffe16a*}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_ed9:dffpipe15|dffe16a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_dd9:dffpipe12|dffe13a*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*cpu:the_cpu|cpu_nios2_oci:the_cpu_nios2_oci|cpu_jtag_debug_module_wrapper:the_cpu_jtag_debug_module_wrapper|cpu_jtag_debug_module_sysclk:the_cpu_jtag_debug_module_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*cpu:the_cpu|cpu_nios2_oci:the_cpu_nios2_oci|cpu_nios2_oci_debug:the_cpu_nios2_oci_debug|monitor_go}]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_writedata_d1*|*}] -to [get_registers *]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_nativeaddress_d1*|*}] -to [get_registers *]
set_false_path -from [get_pins -nocase -compatibility_mode {*the*clock*|slave_readdata_p1*}] -to [get_registers *]
set_false_path -from [get_keepers -nocase {*the*clock*|slave_readdata_p1*}] -to [get_registers *]
set_false_path -from [get_keepers {DE4_SOPC:SOPC_INST|tse_mac:the_tse_mac|altera_tse_mac_pcs_pma:altera_tse_mac_pcs_pma_inst|altera_tse_mac_pcs_pma_ena:altera_tse_mac_pcs_pma_ena_inst|altera_tse_top_1000_base_x:top_1000_base_x_inst|altera_tse_pcs_control:U_REG|altera_tse_pcs_host_control:U_CTRL|state.STM_TYPE_TX_READ}] -to [get_keepers {DE4_SOPC:SOPC_INST|tse_mac:the_tse_mac|altera_tse_mac_pcs_pma:altera_tse_mac_pcs_pma_inst|altera_tse_mac_pcs_pma_ena:altera_tse_mac_pcs_pma_ena_inst|altera_tse_top_1000_base_x:top_1000_base_x_inst|altera_tse_pcs_control:U_REG|altera_tse_pcs_host_control:U_CTRL|tx_rd_ack0}]
set_false_path -from [get_keepers {DE4_SOPC:SOPC_INST|tse_mac:the_tse_mac|altera_tse_mac_pcs_pma:altera_tse_mac_pcs_pma_inst|altera_tse_mac_pcs_pma_ena:altera_tse_mac_pcs_pma_ena_inst|altera_tse_top_gen_host:top_gen_host_inst|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|pause_quant_reg[15]}] -to [get_keepers {DE4_SOPC:SOPC_INST|tse_mac:the_tse_mac|altera_tse_mac_pcs_pma:altera_tse_mac_pcs_pma_inst|altera_tse_mac_pcs_pma_ena:altera_tse_mac_pcs_pma_ena_inst|altera_tse_top_gen_host:top_gen_host_inst|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|gen_pause_muxc[7]}]
set_false_path -from [get_keepers {DE4_SOPC:SOPC_INST|tse_mac:the_tse_mac|altera_tse_mac_pcs_pma:altera_tse_mac_pcs_pma_inst|altera_tse_mac_pcs_pma_ena:altera_tse_mac_pcs_pma_ena_inst|altera_tse_top_gen_host:top_gen_host_inst|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|pause_quant_reg[0]}] -to [get_keepers {DE4_SOPC:SOPC_INST|tse_mac:the_tse_mac|altera_tse_mac_pcs_pma:altera_tse_mac_pcs_pma_inst|altera_tse_mac_pcs_pma_ena:altera_tse_mac_pcs_pma_ena_inst|altera_tse_top_gen_host:top_gen_host_inst|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|gen_pause_muxc[0]}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_altsyncram_dpm_fifo:U_RTSM|altsyncram*}] -to [get_registers *] 5
set_multicycle_path -setup -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] -to [get_registers *] 5
set_multicycle_path -setup -end -from [get_registers *] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] 5
set_multicycle_path -hold -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_altsyncram_dpm_fifo:U_RTSM|altsyncram*}] -to [get_registers *] 5
set_multicycle_path -hold -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] -to [get_registers *] 5
set_multicycle_path -hold -end -from [get_registers *] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] 5


#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|dout_reg_sft*}] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*}] 7.000
set_max_delay -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|eop_sft*}] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*}] 7.000
set_max_delay -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|sop_reg*}] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*}] 7.000


#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

