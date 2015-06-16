//
// Designed by Qiang Wu
//
`timescale 1ns/1ps
`include "yf32_define.v"
`include "NF_2.1_defines.v"
`include "reg_defines_reference_router.v"
`include "registers.v"
	module np_core
    #(parameter DATA_WIDTH = 64,
      parameter CTRL_WIDTH=DATA_WIDTH/8,
      parameter UDP_REG_SRC_WIDTH = 2,
      parameter INPUT_ARBITER_STAGE_NUM = 2,
      parameter IO_QUEUE_STAGE_NUM = 8'hff,
      parameter NUM_OUTPUT_QUEUES = 8,
      parameter NUM_IQ_BITS = 3,
      parameter STAGE_NUM = 4,
		parameter CPU_NUM = 4,
      parameter CPU_QUEUE_NUM = 0)
		
   (
	 input                              protocol,
	 
	 // --- data path interface
    output     [DATA_WIDTH-1:0]        out_data,
    output     [CTRL_WIDTH-1:0]        out_ctrl,
    output                             out_wr,
    input                              out_rdy,

    input  [DATA_WIDTH-1:0]            in_data,
    input  [CTRL_WIDTH-1:0]            in_ctrl,
    input                              in_wr,
    output                             in_rdy, 

    // --- Register interface
    input                              reg_req_in,
    input                              reg_ack_in,
    input                              reg_rd_wr_L_in,
    input  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_in,
    input  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_in,
    input  [UDP_REG_SRC_WIDTH-1:0]     reg_src_in,

    output                             reg_req_out,
    output                             reg_ack_out,
    output                             reg_rd_wr_L_out,
    output  [`UDP_REG_ADDR_WIDTH-1:0]  reg_addr_out,
    output  [`CPCI_NF2_DATA_WIDTH-1:0] reg_data_out,
    output  [UDP_REG_SRC_WIDTH-1:0]    reg_src_out,

    // --- Misc
    input                              clk,
    input                              core_sp_clk,
	 input 										statemac_clk,
    input                              reset,
    //for monitor
	// for security monitoring
	output [31:0]                      instruction_sec_mon,
	output [31:0]					   prog_counter_sec_mon,
    output [31:0]		               ppu_mem_addr,
    input                              packet_drop
);

assign reg_req_out = reg_req_in;
assign reg_ack_out = reg_ack_in;
assign reg_rd_wr_L_out = reg_rd_wr_L_in;
assign reg_addr_out = reg_addr_in;
assign reg_data_out = reg_data_in;
assign reg_src_out = reg_src_in;

wire [63:0] fc_out_data0;
wire [23:0] fc_out_pkt_route0;
wire fc_out_wr0;
wire fc_out_req0;
wire fc_out_ack0;
wire fc_out_bypass0;

wire [63:0] fc_out_data1;
wire [23:0] fc_out_pkt_route1;
wire fc_out_wr1;
wire fc_out_req1;
wire fc_out_ack1;
wire fc_out_bypass1;

wire [63:0] fc_out_data2;
wire [23:0] fc_out_pkt_route2;
wire fc_out_wr2;
wire fc_out_req2;
wire fc_out_ack2;
wire fc_out_bypass2;

wire [63:0] fc_out_data3;
wire [23:0] fc_out_pkt_route3;
wire fc_out_wr3;
wire fc_out_req3;
wire fc_out_ack3;
wire fc_out_bypass3;

wire [63:0] pg_out_data0;
wire [23:0] pg_out_pkt_route0;
wire pg_out_wr0;
wire pg_out_req0;
wire pg_out_ack0;
wire pg_out_bop0;
wire pg_out_eop0;
wire pg_out_rdy0;
wire pg_out_bypass0;

wire [63:0] pg_out_data1;
wire [23:0] pg_out_pkt_route1;
wire pg_out_wr1;
wire pg_out_req1;
wire pg_out_ack1;
wire pg_out_bop1;
wire pg_out_eop1;
wire pg_out_rdy1;
wire pg_out_bypass1;

wire [63:0] pg_out_data2;
wire [23:0] pg_out_pkt_route2;
wire pg_out_wr2;
wire pg_out_req2;
wire pg_out_ack2;
wire pg_out_bop2;
wire pg_out_eop2;
wire pg_out_rdy2;
wire pg_out_bypass2;

wire [63:0] pg_out_data3;
wire [23:0] pg_out_pkt_route3;
wire pg_out_wr3;
wire pg_out_req3;
wire pg_out_ack3;
wire pg_out_bop3;
wire pg_out_eop3;
wire pg_out_rdy3;

wire [63:0] data01;
wire [23:0] pkt_route01;
wire wr01;
wire req01;
wire ack01;
wire bypass01;

wire [63:0] data10;
wire [23:0] pkt_route10;
wire wr10;
wire req10;
wire ack10;
wire bypass10;

wire [63:0] data02;
wire [23:0] pkt_route02;
wire wr02;
wire req02;
wire ack02;
wire bypass02;

wire [63:0] data20;
wire [23:0] pkt_route20;
wire wr20;
wire req20;
wire ack20;
wire bypass20;

wire [63:0] data13;
wire [23:0] pkt_route13;
wire wr13;
wire req13;
wire ack13;
wire bypass13;

wire [63:0] data31;
wire [23:0] pkt_route31;
wire wr31;
wire req31;
wire ack31;
wire bypass31;

wire [63:0] data23;
wire [23:0] pkt_route23;
wire wr23;
wire req23;
wire ack23;
wire bypass23;

wire [63:0] data32;
wire [23:0] pkt_route32;
wire wr32;
wire req32;
wire ack32;
wire bypass32;

wire [239:0] TRIG_IS0;
wire [239:0] TRIG_IS2;
wire [239:0] TRIG_OS0;

wire reset0;
wire reset1;
wire reset2;
wire reset3;

wire packet_drop_core_zero;
wire packet_drop_core_one;
wire packet_drop_core_two;
wire packet_drop_core_three;


wire  cam_we;
wire  [3:0]    cam_wr_addr;
wire [31:0] cam_din;
wire cam_wr_ack;
wire ppu3_sel;

flow_classification fc(
.protocol1(protocol),

.out_data0	(fc_out_data0),
.out_pkt_route0	(fc_out_pkt_route0),
.out_wr0	(fc_out_wr0),
.out_req0	(fc_out_req0),
.out_ack0	(fc_out_ack0),
.out_bypass0	(fc_out_bypass0),
.out_protocol0 (fc_out_protocol0),

.out_data1	(fc_out_data1),
.out_pkt_route1	(fc_out_pkt_route1),
.out_wr1	(fc_out_wr1),
.out_req1	(fc_out_req1),
.out_ack1	(fc_out_ack1),
.out_bypass1	(fc_out_bypass1),
.out_protocol1(fc_out_protocol1),

.out_data2	(fc_out_data2),
.out_pkt_route2	(fc_out_pkt_route2),
.out_wr2	(fc_out_wr2),
.out_req2	(fc_out_req2),
.out_ack2	(fc_out_ack2),
.out_bypass2	(fc_out_bypass2),
.out_protocol2(fc_out_protocol2),

.out_data3	(fc_out_data3),
.out_pkt_route3	(fc_out_pkt_route3),
.out_wr3	(fc_out_wr3),
.out_req3	(fc_out_req3),
.out_ack3	(fc_out_ack3),
.out_bypass3	(fc_out_bypass3),
.out_protocol3(fc_out_protocol3),

.in_data	(in_data),
.in_ctrl	(in_ctrl),
.in_wr		(in_wr),
.in_rdy		(in_rdy),

.ppu3_sel  (ppu3_sel),
.clk		(clk),
.reset		(reset)
);

wire packet_drop_signal[CPU_NUM -1 :0];
wire processor_reset_seq[CPU_NUM -1 :0];
wire sp_pkt_done[CPU_NUM -1 :0];
wire out_ack_reset[CPU_NUM -1 :0];
wire sp_interrupt_wire[CPU_NUM -1 :0];
wire [3:0]four_bit_hash_output_0, four_bit_hash_output_1, four_bit_hash_output_2, four_bit_hash_output_3;
wire new_inst_signal[CPU_NUM -1 :0];

ppu ppu0(
.clk		(clk),
.core_sp_clk	(core_sp_clk),
.reset		(reset),
.TRIG_IS	(TRIG_IS0),

.in_data0	(data10),
.in_pkt_route0	(pkt_route10),
.in_wr0		(wr10),
.in_req0	(req10),
.in_ack0	(ack10),
.in_bypass0	(bypass10),

.in_data1	(fc_out_data0),
.in_pkt_route1	(fc_out_pkt_route0),
.in_wr1		(fc_out_wr0),
.in_req1	(fc_out_req0),
.in_ack1	(fc_out_ack0),
.in_bypass1	(fc_out_bypass0),
.in_protocol1(fc_out_protocol0),

.in_data2	(),
.in_pkt_route2	(),
.in_wr2		(),
.in_req2	(),
.in_ack2	(),
.in_bypass2	(),

.in_data3	(data20),
.in_pkt_route3	(pkt_route20),
.in_wr3		(wr20),
.in_req3	(req20),
.in_ack3	(ack20),
.in_bypass3	(bypass20),

.out_data0	(data01),
.out_pkt_route0	(pkt_route01),
.out_wr0	(wr01),
.out_req0	(req01),
.out_ack0	(ack01),
.out_bop0	(),
.out_eop0	(),
.out_rdy0	(1'b1),
.out_bypass0	(bypass01),

.out_data1	(),
.out_pkt_route1	(),
.out_wr1	(),
.out_req1	(),
.out_ack1	(),
.out_bop1	(),
.out_eop1	(),
.out_rdy1	(),
.out_bypass1	(),

.out_data2	(),
.out_pkt_route2	(),
.out_wr2	(),
.out_req2	(),
.out_ack2	(),
.out_bop2	(),
.out_eop2	(),
.out_rdy2	(),
.out_bypass2	(),

.out_data3	(pg_out_data0),
.out_pkt_route3	(pg_out_pkt_route0),
.out_wr3	(pg_out_wr0),
.out_req3	(pg_out_req0),
.out_ack3	(pg_out_ack0),
.out_bop3	(pg_out_bop0),
.out_eop3	(pg_out_eop0),
.out_rdy3	(pg_out_rdy0),
.out_bypass3	(),

//Separate the monitor
//.four_bit_hash_output(four_bit_hash_output0),
//.pc_input_hash_wire(pc_input_hash_wire0),
//.new_inst_signal(new_inst_signal0),

.cam_we(cam_we),
.cam_wr_addr(cam_wr_addr),
.cam_din(cam_din),
//.cam_wr_ack(cam_wr_ack),

.out_four_bit_hash(four_bit_hash_output_0),
.out_new_inst_signal(new_inst_signal[0]),
.in_packet_drop_signal(packet_drop_signal[0]),
.out_processor_reset_seq(processor_reset_seq[0]),
.out_sp_pkt_done(sp_pkt_done[0]),
.out_sp_interrupt_wire(sp_interrupt_wire[0]),
.out_ack_reset(out_ack_reset[0])
);


CAM_monitor security_mon_0
(
.clk(clk),
.reset(reset),

.four_bit_hash(four_bit_hash_output_0),
.new_inst_signal(new_inst_signal[0]),
.packet_drop_signal(packet_drop_signal[0]),
.cam_we(cam_we),
.cam_wr_addr(cam_wr_addr),
.cam_din(cam_din),
.proc_ack(sp_interrupt_wire[0]),
.out_ack_reset(out_ack_reset[0]),
.cam_wr_ack(),
.processor_reset_seq (processor_reset_seq[0]),
.packet_done(sp_pkt_done[0])

);

CAM_monitor security_mon_1
(
.clk(clk),
.reset(reset),

.four_bit_hash(four_bit_hash_output_1),
.new_inst_signal(new_inst_signal[1]),
.packet_drop_signal(packet_drop_signal[1]),
.cam_we(cam_we),
.cam_wr_addr(cam_wr_addr),
.cam_din(cam_din),
.proc_ack(sp_interrupt_wire[1]),
.out_ack_reset(out_ack_reset[1]),
.cam_wr_ack(),
.processor_reset_seq (processor_reset_seq[1]),
.packet_done(sp_pkt_done[1])

);

wire packet_drop_signal_2_cm;
wire packet_drop_signal_2_ipv4;
wire out_ack_reset_2_cm;
wire out_ack_reset_2_ipv4;

CAM_monitor security_mon_2
(
.clk(clk),
.reset(reset),

.four_bit_hash(four_bit_hash_output_2),
.new_inst_signal(new_inst_signal[2]),
.packet_drop_signal(packet_drop_signal_2_cm),
.cam_we(cam_we),
.cam_wr_addr(cam_wr_addr),
.cam_din(cam_din),
.proc_ack(sp_interrupt_wire[2]),
.out_ack_reset(out_ack_reset_2_cm),
.cam_wr_ack(),
.processor_reset_seq (processor_reset_seq[2]),
.packet_done(sp_pkt_done[2])

);

CAM_monitor security_mon_3
(
.clk(clk),
.reset(reset),

.four_bit_hash(),
.new_inst_signal(),
.packet_drop_signal(),
.cam_we(),
.cam_wr_addr(),
.cam_din(),
.proc_ack(),
.out_ack_reset(),
.cam_wr_ack(),
.processor_reset_seq (),
.packet_done()

);


CAM_monitor_ipv4 security_mon_4
(
.clk(clk),
.reset(reset),

.four_bit_hash(four_bit_hash_output_2),
.new_inst_signal(new_inst_signal[2]),
.packet_drop_signal(packet_drop_signal_2_ipv4),
.cam_we(cam_we),
.cam_wr_addr(cam_wr_addr),
.cam_din(cam_din),
.proc_ack(sp_interrupt_wire[2]),
.out_ack_reset(out_ack_reset_2_ipv4),
.cam_wr_ack(),
.processor_reset_seq (processor_reset_seq[2]),
.packet_done(sp_pkt_done[2])

);

assign out_ack_reset[2] = (ppu3_sel) ? out_ack_reset_2_cm : out_ack_reset_2_ipv4;
assign packet_drop_signal[2] = (ppu3_sel) ? packet_drop_signal_2_cm : packet_drop_signal_2_ipv4;

CAM_monitor_ipv4 security_mon_5
(
.clk(clk),
.reset(reset),

.four_bit_hash(four_bit_hash_output_3),
.new_inst_signal(new_inst_signal[3]),
.packet_drop_signal(packet_drop_signal[3]),
.cam_we(cam_we),
.cam_wr_addr(cam_wr_addr),
.cam_din(cam_din),
.proc_ack(sp_interrupt_wire[3]),
.out_ack_reset(out_ack_reset[3]),
.cam_wr_ack(),
.processor_reset_seq (processor_reset_seq[3]),
.packet_done(sp_pkt_done[3])

);

	router_op_lut_regs_non_cntr //#( 
    //  .NUM_QUEUES (NUM_QUEUES),
     // .ARP_LUT_DEPTH_BITS (ARP_LUT_DEPTH_BITS),
     // .LPM_LUT_DEPTH_BITS (LPM_LUT_DEPTH_BITS),
      //.FILTER_DEPTH_BITS (FILTER_DEPTH_BITS),
      //.UDP_REG_SRC_WIDTH (UDP_REG_SRC_WIDTH)
  // )
	router_op_lut_regs_non_cntr (
      .reg_req_in                (reg_req_in),
      .reg_ack_in                (reg_ack_in),
      .reg_rd_wr_L_in            (reg_rd_wr_L_in),
      .reg_addr_in               (reg_addr_in),
      .reg_data_in               (reg_data_in),
      .reg_src_in                (reg_src_in),

     // .reg_req_out               (reg_req_out),
     // .reg_ack_out               (reg_ack_out),
     // .reg_rd_wr_L_out           (reg_rd_wr_L_out),
     // .reg_addr_out              (reg_addr_out),
     // .reg_data_out              (reg_data_out),
     // .reg_src_out               (reg_src_out),

      // --- interface to dest_ip_filter
      .dest_ip_filter_rd_addr    (),          // address in table to read
      .dest_ip_filter_rd_req     (),           // request a read
      .dest_ip_filter_rd_ip      (),            // ip to match in the CAM
      .dest_ip_filter_rd_ack     (),           // pulses high
      .dest_ip_filter_wr_addr    (cam_wr_addr),
      .dest_ip_filter_wr_req     (cam_we),
      .dest_ip_filter_wr_ip      (cam_din),            // data to match in the CAM
      .dest_ip_filter_wr_ack     (cam_wr_ack),

      // --- eth_parser

      .clk                       (clk),
      .reset                     (reset)
    );




ppu ppu1(
.clk		(clk),
.core_sp_clk	(core_sp_clk),
.reset		(reset),

.in_data0	(),
.in_pkt_route0	(),
.in_wr0		(),
.in_req0	(),
.in_ack0	(),
.in_bypass0	(),

.in_data1	(fc_out_data1),
.in_pkt_route1	(fc_out_pkt_route1),
.in_wr1		(fc_out_wr1),
.in_req1	(fc_out_req1),
.in_ack1	(fc_out_ack1),
.in_bypass1	(fc_out_bypass1),
.in_protocol1(fc_out_protocol1),

.in_data2	(),
.in_pkt_route2	(),
.in_wr2		(),
.in_req2	(),
.in_ack2	(),
.in_bypass2	(),

.in_data3	(),
.in_pkt_route3	(),
.in_wr3		(),
.in_req3	(),
.in_ack3	(),
.in_bypass3	(),

.out_data0	(),
.out_pkt_route0	(),
.out_wr0	(),
.out_req0	(),
.out_ack0	(),
.out_bop0	(),
.out_eop0	(),
.out_rdy0	(),
.out_bypass0	(),

.out_data1	(),
.out_pkt_route1	(),
.out_wr1	(),
.out_req1	(),
.out_ack1	(),
.out_bop1	(),
.out_eop1	(),
.out_rdy1	(),
.out_bypass1	(),

.out_data2	(),
.out_pkt_route2	(),
.out_wr2	(),
.out_req2	(),
.out_ack2	(),
.out_bop2	(),
.out_eop2	(),
.out_rdy2	(),
.out_bypass2	(),

.out_data3	(pg_out_data1),
.out_pkt_route3	(pg_out_pkt_route1),
.out_wr3	(pg_out_wr1),
.out_req3	(pg_out_req1),
.out_ack3	(pg_out_ack1),
.out_bop3	(pg_out_bop1),
.out_eop3	(pg_out_eop1),
.out_rdy3	(pg_out_rdy1),
.out_bypass3	(),

//Separate the monitor
//.four_bit_hash_output(four_bit_hash_output0),
//.pc_input_hash_wire(pc_input_hash_wire0),
//.new_inst_signal(new_inst_signal0),

.cam_we(cam_we),
.cam_wr_addr(cam_wr_addr),
.cam_din(cam_din),
//.cam_wr_ack(cam_wr_ack),

.out_four_bit_hash(four_bit_hash_output_1),
.out_new_inst_signal(new_inst_signal[1]),
.in_packet_drop_signal(packet_drop_signal[1]),
.out_processor_reset_seq(processor_reset_seq[1]),
.out_sp_pkt_done(sp_pkt_done[1]),
.out_sp_interrupt_wire(sp_interrupt_wire[1]),
.out_ack_reset(out_ack_reset[1])
);


ppu ppu2(
.clk		(clk),
.core_sp_clk	(core_sp_clk),
.reset		(reset),
.TRIG_IS	(TRIG_IS2),

.in_data0	(),
.in_pkt_route0	(),
.in_wr0		(),
.in_req0	(),
.in_ack0	(),
.in_bypass0	(),

.in_data1	(fc_out_data2),
.in_pkt_route1	(fc_out_pkt_route2),
.in_wr1		(fc_out_wr2),
.in_req1	(fc_out_req2),
.in_ack1	(fc_out_ack2),
.in_bypass1	(fc_out_bypass2),
.in_protocol1(fc_out_protocol2),

.in_data2	(),
.in_pkt_route2	(),
.in_wr2		(),
.in_req2	(),
.in_ack2	(),
.in_bypass2	(),

.in_data3	(),
.in_pkt_route3	(),
.in_wr3		(),
.in_req3	(),
.in_ack3	(),
.in_bypass3	(),

.out_data0	(),
.out_pkt_route0	(),
.out_wr0	(),
.out_req0	(),
.out_ack0	(),
.out_bop0	(),
.out_eop0	(),
.out_rdy0	(),
.out_bypass0	(),

.out_data1	(),
.out_pkt_route1	(),
.out_wr1	(),
.out_req1	(),
.out_ack1	(),
.out_bop1	(),
.out_eop1	(),
.out_rdy1	(),
.out_bypass1	(),

.out_data2	(),
.out_pkt_route2	(),
.out_wr2	(),
.out_req2	(),
.out_ack2	(),
.out_bop2	(),
.out_eop2	(),
.out_rdy2	(),
.out_bypass2	(),

.out_data3	(pg_out_data2),
.out_pkt_route3	(pg_out_pkt_route2),
.out_wr3	(pg_out_wr2),
.out_req3	(pg_out_req2),
.out_ack3	(pg_out_ack2),
.out_bop3	(pg_out_bop2),
.out_eop3	(pg_out_eop2),
.out_rdy3	(pg_out_rdy2),
.out_bypass3	(),

//Separate the monitor
//.four_bit_hash_output(four_bit_hash_output0),
//.pc_input_hash_wire(pc_input_hash_wire0),
//.new_inst_signal(new_inst_signal0),

.cam_we(cam_we),
.cam_wr_addr(cam_wr_addr),
.cam_din(cam_din),
//.cam_wr_ack(cam_wr_ack),

.out_four_bit_hash(four_bit_hash_output_2),
.out_new_inst_signal(new_inst_signal[2]),
.in_packet_drop_signal(packet_drop_signal[2]),
.out_processor_reset_seq(processor_reset_seq[2]),
.out_sp_pkt_done(sp_pkt_done[2]),
.out_sp_interrupt_wire(sp_interrupt_wire[2]),
.out_ack_reset(out_ack_reset[2])
);


ppu ppu3(
.clk		(clk),
.core_sp_clk	(core_sp_clk),
.reset		(reset),

.in_data0	(),
.in_pkt_route0	(),
.in_wr0		(),
.in_req0	(),
.in_ack0	(),
.in_bypass0	(),

.in_data1	(fc_out_data3),
.in_pkt_route1	(fc_out_pkt_route3),
.in_wr1		(fc_out_wr3),
.in_req1	(fc_out_req3),
.in_ack1	(fc_out_ack3),
.in_bypass1	(fc_out_bypass3),
.in_protocol1(fc_out_protocol3),

.in_data2	(),
.in_pkt_route2	(),
.in_wr2		(),
.in_req2	(),
.in_ack2	(),
.in_bypass2	(),

.in_data3	(),
.in_pkt_route3	(),
.in_wr3		(),
.in_req3	(),
.in_ack3	(),
.in_bypass3	(),

.out_data0	(),
.out_pkt_route0	(),
.out_wr0	(),
.out_req0	(),
.out_ack0	(),
.out_bop0	(),
.out_eop0	(),
.out_rdy0	(),
.out_bypass0	(),

.out_data1	(),
.out_pkt_route1	(),
.out_wr1	(),
.out_req1	(),
.out_ack1	(),
.out_bop1	(),
.out_eop1	(),
.out_rdy1	(),
.out_bypass1	(),

.out_data2	(),
.out_pkt_route2	(),
.out_wr2	(),
.out_req2	(),
.out_ack2	(),
.out_bop2	(),
.out_eop2	(),
.out_rdy2	(),
.out_bypass2	(),

.out_data3	(pg_out_data3),
.out_pkt_route3	(pg_out_pkt_route3),
.out_wr3	(pg_out_wr3),
.out_req3	(pg_out_req3),
.out_ack3	(pg_out_ack3),
.out_bop3	(pg_out_bop3),
.out_eop3	(pg_out_eop3),
.out_rdy3	(pg_out_rdy3),
.out_bypass3	(),

//Separate the monitor
//.four_bit_hash_output(four_bit_hash_output0),
//.pc_input_hash_wire(pc_input_hash_wire0),
//.new_inst_signal(new_inst_signal0),

.cam_we(cam_we),
.cam_wr_addr(cam_wr_addr),
.cam_din(cam_din),
//.cam_wr_ack(cam_wr_ack),

.out_four_bit_hash(four_bit_hash_output_3),
.out_new_inst_signal(new_inst_signal[3]),
.in_packet_drop_signal(packet_drop_signal[3]),
.out_processor_reset_seq(processor_reset_seq[3]),
.out_sp_pkt_done(sp_pkt_done[3]),
.out_sp_interrupt_wire(sp_interrupt_wire[3]),
.out_ack_reset(out_ack_reset[3])
);


out_arbiter oa(
.out_data	(out_data),
.out_ctrl	(out_ctrl),
.out_wr		(out_wr),
.out_rdy	(out_rdy),

.in_data0	(pg_out_data0),
.in_wr0		(pg_out_wr0),
.in_req0	(pg_out_req0),
.in_ack0	(pg_out_ack0),
.in_bop0	(pg_out_bop0),
.in_eop0	(pg_out_eop0),
.in_outrdy0	(pg_out_rdy0),

.in_data1	(pg_out_data1),
.in_wr1		(pg_out_wr1),
.in_req1	(pg_out_req1),
.in_ack1	(pg_out_ack1),
.in_bop1	(pg_out_bop1),
.in_eop1	(pg_out_eop1),
.in_outrdy1	(pg_out_rdy1),

.in_data2	(pg_out_data2),
.in_wr2		(pg_out_wr2),
.in_req2	(pg_out_req2),
.in_ack2	(pg_out_ack2),
.in_bop2	(pg_out_bop2),
.in_eop2	(pg_out_eop2),
.in_outrdy2	(pg_out_rdy2),

.in_data3	(pg_out_data3),
.in_wr3		(pg_out_wr3),
.in_req3	(pg_out_req3),
.in_ack3	(pg_out_ack3),
.in_bop3	(pg_out_bop3),
.in_eop3	(pg_out_eop3),
.in_outrdy3	(pg_out_rdy3),


.clk		(clk),
.reset		(reset)
);

wire [35:0] CONTROL0;
wire [239:0] TRIG0;

endmodule
