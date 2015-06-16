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
      parameter CPU_QUEUE_NUM = 0)

   (// --- data path interface
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

wire [3:0] four_bit_hash_output0,four_bit_hash_output0_cm,four_bit_hash_output0_ipv4;
wire [31:0] pc_input_hash_wire0,pc_input_hash_wire0_cm,pc_input_hash_wire0_ipv4;
wire new_inst_signal0,new_inst_signal0_cm,new_inst_signal0_ipv4;
wire [3:0] four_bit_hash_output1,four_bit_hash_output1_cm,four_bit_hash_output1_ipv4;
wire [31:0] pc_input_hash_wire1,pc_input_hash_wire1_cm,pc_input_hash_wire1_ipv4;
wire new_inst_signal1,new_inst_signal1_cm,new_inst_signal1_ipv4;
wire [3:0] four_bit_hash_output2,four_bit_hash_output2_cm,four_bit_hash_output2_ipv4;
wire [31:0] pc_input_hash_wire2,pc_input_hash_wire2_cm,pc_input_hash_wire2_ipv4;
wire new_inst_signal2,new_inst_signal2_cm,new_inst_signal2_ipv4;
wire [3:0] four_bit_hash_output3,four_bit_hash_output3_cm,four_bit_hash_output3_ipv4;
wire [31:0] pc_input_hash_wire3,pc_input_hash_wire3_cm,pc_input_hash_wire3_ipv4;
wire new_inst_signal3,new_inst_signal3_cm,new_inst_signal3_ipv4;
wire packet_drop_signal0_ipv4;
wire packet_drop_signal1_ipv4;
wire packet_drop_signal2_ipv4;
wire packet_drop_signal3_ipv4;

wire packet_drop_signal0_cm;
wire packet_drop_signal1_cm;
wire packet_drop_signal2_cm;
wire packet_drop_signal3_cm;

wire fc_out_protocol0;
wire fc_out_protocol1;
wire fc_out_protocol2;
wire fc_out_protocol3;

/*
wire [35:0] CONTROL0;
wire [239:0] TRIG0;

chipscope_icon_v1_03_a cs_icon (
	.CONTROL0(CONTROL0)
);

chipscope_ila_v1_02_a cs_ila (
	.CONTROL(CONTROL0),
	.CLK(clk),
	.TRIG0(TRIG0)
);

assign TRIG0[63:0] = fc_out_data0;
assign TRIG0[79:64] = fc_out_pkt_route0;
assign TRIG0[80] = fc_out_wr0;
assign TRIG0[81] = fc_out_req0;
assign TRIG0[82] = fc_out_ack0;
assign TRIG0[163:100] = pg_out_data3;
assign TRIG0[179:164] = pg_out_pkt_route3;
assign TRIG0[180] = pg_out_wr3;
assign TRIG0[181] = pg_out_req3;
assign TRIG0[182] = pg_out_ack3;
assign TRIG0[183] = pg_out_bop3;
assign TRIG0[184] = pg_out_eop3;
assign TRIG0[185] = pg_out_rdy3;
*/
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

flow_classification fc(

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

.clk		(clk),
.reset		(reset)
);

/*
ppu ppu0(
.clk		(clk),
.core_sp_clk	(core_sp_clk),
.reset		(reset),
.TRIG_IS	(TRIG_IS0),
.TRIG_OS	(TRIG_OS0),

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

.out_data3	(pg_out_data2),
.out_pkt_route3	(pg_out_pkt_route2),
.out_wr3	(pg_out_wr2),
.out_req3	(pg_out_req2),
.out_ack3	(pg_out_ack2),
.out_bop3	(pg_out_bop2),
.out_eop3	(pg_out_eop2),
.out_rdy3	(pg_out_rdy2),
.out_bypass3	(pg_out_bypass2),
//for monitor
.pp_mem_addr   (ppu_mem_addr),
.pkt_drop     (packet_drop)


);
*/

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
.four_bit_hash_output(four_bit_hash_output0),
.pc_input_hash_wire(pc_input_hash_wire0),
.new_inst_signal(new_inst_signal0),

.cam_we(cam_we),
.cam_wr_addr(cam_wr_addr),
.cam_din(cam_din),
.cam_wr_ack(cam_wr_ack)
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



/*
ppu ppu1(
.clk		(clk),
.core_sp_clk	(core_sp_clk),
.reset		(reset1),

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

.in_data2	(data01),
.in_pkt_route2	(pkt_route01),
.in_wr2		(wr01),
.in_req2	(req01),
.in_ack2	(ack01),
.in_bypass2	(bypass01),
.in_protocol1(fc_out_protocol1),

.in_data3	(data31),
.in_pkt_route3	(pkt_route31),
.in_wr3		(wr31),
.in_req3	(req31),
.in_ack3	(ack31),
.in_bypass3	(bypass31),

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

.out_data2	(data10),
.out_pkt_route2	(pkt_route10),
.out_wr2	(wr10),
.out_req2	(req10),
.out_ack2	(ack10),
.out_bop2	(),
.out_eop2	(),
.out_rdy2	(1'b1),
.out_bypass2	(bypass10),

.out_data3	(pg_out_data1),
.out_pkt_route3	(pg_out_pkt_route1),
.out_wr3	(pg_out_wr1),
.out_req3	(pg_out_req1),
.out_ack3	(pg_out_ack1),
.out_bop3	(pg_out_bop1),
.out_eop3	(pg_out_eop1),
.out_rdy3	(pg_out_rdy1),
.out_bypass3	(),
.four_bit_hash_output(four_bit_hash_output1),
.pc_input_hash_wire(pc_input_hash_wire1),
.new_inst_signal(new_inst_signal1)
	
);

ppu ppu2(
.clk		(clk),
.core_sp_clk	(core_sp_clk),
.reset		(reset2),
.TRIG_IS	(TRIG_IS2),

.in_data0	(data32),
.in_pkt_route0	(pkt_route32),
.in_wr0		(wr32),
.in_req0	(req32),
.in_ack0	(ack32),
.in_bypass0	(bypass32),

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

.out_data0	(data23),
.out_pkt_route0	(pkt_route23),
.out_wr0	(wr23),
.out_req0	(req23),
.out_ack0	(ack23),
.out_bop0	(),
.out_eop0	(),
.out_rdy0	(1'b1),
.out_bypass0	(bypass23),

.out_data1	(data20),
.out_pkt_route1	(pkt_route20),
.out_wr1	(wr20),
.out_req1	(req20),
.out_ack1	(ack20),
.out_bop1	(),
.out_eop1	(),
.out_rdy1	(1'b1),
.out_bypass1	(bypass20),

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
.four_bit_hash_output(four_bit_hash_output2),
.pc_input_hash_wire(pc_input_hash_wire2),
.new_inst_signal(new_inst_signal2)
	
);

ppu ppu3(
.clk		(clk),
.core_sp_clk	(core_sp_clk),
.reset		(reset3),

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

.in_data2	(data23),
.in_pkt_route2	(pkt_route23),
.in_wr2		(wr23),
.in_req2	(req23),
.in_ack2	(ack23),
.in_bypass2	(bypass23),

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

.out_data1	(data31),
.out_pkt_route1	(pkt_route31),
.out_wr1	(wr31),
.out_req1	(req31),
.out_ack1	(ack31),
.out_bop1	(),
.out_eop1	(),
.out_rdy1	(1'b1),
.out_bypass1	(bypass31),

.out_data2	(data32),
.out_pkt_route2	(pkt_route32),
.out_wr2	(wr32),
.out_req2	(req32),
.out_ack2	(ack32),
.out_bop2	(),
.out_eop2	(),
.out_rdy2	(1'b1),
.out_bypass2	(bypass32),

.out_data3	(pg_out_data3),
.out_pkt_route3	(pg_out_pkt_route3),
.out_wr3	(pg_out_wr3),
.out_req3	(pg_out_req3),
.out_ack3	(pg_out_ack3),
.out_bop3	(pg_out_bop3),
.out_eop3	(pg_out_eop3),
.out_rdy3	(pg_out_rdy3),
.out_bypass3	(),
.four_bit_hash_output(four_bit_hash_output3),
.pc_input_hash_wire(pc_input_hash_wire3),
.new_inst_signal(new_inst_signal3)
	
);
*/

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

/*
statemachine_shared shared_CM(
.clk(clk),
.statemac_clk(statemac_clk),
.four_bit_hash0(four_bit_hash_output0_cm),
.four_bit_hash1(four_bit_hash_output1_cm),
.four_bit_hash2(four_bit_hash_output2_cm),
.four_bit_hash3(four_bit_hash_output3_cm),
.pcin_0(pc_input_hash_wire0_cm),
.pcin_1(pc_input_hash_wire1_cm),
.pcin_2(pc_input_hash_wire2_cm),
.pcin_3(pc_input_hash_wire3_cm),
.new_inst_signal0(new_inst_signal0_cm),
.new_inst_signal1(new_inst_signal1_cm),
.new_inst_signal2(new_inst_signal2_cm),
.new_inst_signal3(new_inst_signal3_cm),
.reset(reset),
.packet_drop_signal0(packet_drop_signal0_cm),
.packet_drop_signal1(packet_drop_signal1_cm),
.packet_drop_signal2(packet_drop_signal2_cm),
.packet_drop_signal3(packet_drop_signal3_cm)
);

statemachine_shared_IPV4 shared_IPV4(
.clk(clk),
.statemac_clk(statemac_clk),
.four_bit_hash0(four_bit_hash_output0_ipv4),
.four_bit_hash1(four_bit_hash_output1_ipv4),
.four_bit_hash2(four_bit_hash_output2_ipv4),
.four_bit_hash3(four_bit_hash_output3_ipv4),
.pcin_0(pc_input_hash_wire0_ipv4),
.pcin_1(pc_input_hash_wire1_ipv4),
.pcin_2(pc_input_hash_wire2_ipv4),
.pcin_3(pc_input_hash_wire3_ipv4),
.new_inst_signal0(new_inst_signal0_ipv4),
.new_inst_signal1(new_inst_signal1_ipv4),
.new_inst_signal2(new_inst_signal2_ipv4),
.new_inst_signal3(new_inst_signal3_ipv4),
.reset(reset),
.packet_drop_signal0(packet_drop_signal0_ipv4),
.packet_drop_signal1(packet_drop_signal1_ipv4),
.packet_drop_signal2(packet_drop_signal2_ipv4),
.packet_drop_signal3(packet_drop_signal3_ipv4)
);
*/
assign four_bit_hash_output0_ipv4 = (!fc_out_protocol0) ? four_bit_hash_output0 : 0;
assign four_bit_hash_output1_ipv4 = (!fc_out_protocol1) ? four_bit_hash_output1 : 0;
assign four_bit_hash_output2_ipv4 = (!fc_out_protocol2) ? four_bit_hash_output2 : 0;
assign four_bit_hash_output3_ipv4 = (!fc_out_protocol3) ? four_bit_hash_output3 : 0;

assign pc_input_hash_wire0_ipv4 = (!fc_out_protocol0) ? pc_input_hash_wire0 : 0;
assign pc_input_hash_wire1_ipv4 = (!fc_out_protocol1) ? pc_input_hash_wire1 : 0;
assign pc_input_hash_wire2_ipv4 = (!fc_out_protocol2) ? pc_input_hash_wire2 : 0;
assign pc_input_hash_wire3_ipv4 = (!fc_out_protocol3) ? pc_input_hash_wire3 : 0;

assign new_inst_signal0_ipv4 = (!fc_out_protocol0) ? new_inst_signal0 : 0;
assign new_inst_signal1_ipv4 = (!fc_out_protocol1) ? new_inst_signal1 : 0;
assign new_inst_signal2_ipv4 = (!fc_out_protocol2) ? new_inst_signal2 : 0;
assign new_inst_signal3_ipv4 = (!fc_out_protocol3) ? new_inst_signal3 : 0;

//======================================================================

//=======================================================================
assign four_bit_hash_output0_cm = (fc_out_protocol0) ? four_bit_hash_output0 : 0;
assign four_bit_hash_output1_cm = (fc_out_protocol1) ? four_bit_hash_output1 : 0;
assign four_bit_hash_output2_cm = (fc_out_protocol2) ? four_bit_hash_output2 : 0;
assign four_bit_hash_output3_cm = (fc_out_protocol3) ? four_bit_hash_output3 : 0;

assign pc_input_hash_wire0_cm = (fc_out_protocol0) ? pc_input_hash_wire0 : 0;
assign pc_input_hash_wire1_cm = (fc_out_protocol1) ? pc_input_hash_wire1 : 0;
assign pc_input_hash_wire2_cm = (fc_out_protocol2) ? pc_input_hash_wire2 : 0;
assign pc_input_hash_wire3_cm = (fc_out_protocol3) ? pc_input_hash_wire3 : 0;

assign new_inst_signal0_cm = (fc_out_protocol0) ? new_inst_signal0 : 0;
assign new_inst_signal1_cm = (fc_out_protocol1) ? new_inst_signal1 : 0;
assign new_inst_signal2_cm = (fc_out_protocol2) ? new_inst_signal2 : 0;
assign new_inst_signal3_cm = (fc_out_protocol3) ? new_inst_signal3 : 0;

assign packet_drop_core_zero = (fc_out_protocol0) ? packet_drop_signal0_cm : packet_drop_signal0_ipv4;
assign packet_drop_core_one = (fc_out_protocol1) ? packet_drop_signal1_cm : packet_drop_signal1_ipv4;
assign packet_drop_core_two = (fc_out_protocol2) ? packet_drop_signal2_cm : packet_drop_signal2_ipv4;
assign packet_drop_core_three = (fc_out_protocol3) ? packet_drop_signal3_cm : packet_drop_signal3_ipv4;

assign reset0 = reset | packet_drop_core_zero;
assign reset1 = reset | packet_drop_core_one;
assign reset2 = reset | packet_drop_core_two;
assign reset3 = reset | packet_drop_core_three;


wire [35:0] CONTROL0;
wire [239:0] TRIG0;
/*
chipscope_icon_v1_03_a cs_icon (
	.CONTROL0(CONTROL0)
);

chipscope_ila_single cs_ila (
	.CONTROL(CONTROL0),
	.CLK(clk),
	.TRIG0(TRIG0)
);

assign TRIG0[7:0] = fc_out_data0[7:0];
assign TRIG0[10:8] = fc_out_pkt_route0[2:0];
assign TRIG0[11] = fc_out_wr0;
assign TRIG0[12] = fc_out_req0;
assign TRIG0[13] = fc_out_ack0;
assign TRIG0[14] = fc_out_bypass0;

assign TRIG0[27:20] = fc_out_data1[7:0];
assign TRIG0[30:28] = fc_out_pkt_route1[2:0];
assign TRIG0[31] = fc_out_wr1;
assign TRIG0[32] = fc_out_req1;
assign TRIG0[33] = fc_out_ack1;
assign TRIG0[34] = fc_out_bypass1;

assign TRIG0[47:40] = pg_out_data2[7:0];
assign TRIG0[50:48] = pg_out_pkt_route2[2:0];
assign TRIG0[51] = pg_out_wr2;
assign TRIG0[52] = pg_out_req2;
assign TRIG0[53] = pg_out_ack2;
assign TRIG0[54] = pg_out_bop2;
assign TRIG0[55] = pg_out_eop2;
assign TRIG0[56] = pg_out_rdy2;
assign TRIG0[57] = pg_out_bypass2;

assign TRIG0[67:60] = pg_out_data3[7:0];
assign TRIG0[70:68] = pg_out_pkt_route3[2:0];
assign TRIG0[71] = pg_out_wr3;
assign TRIG0[72] = pg_out_req3;
assign TRIG0[73] = pg_out_ack3;
assign TRIG0[74] = pg_out_bop3;
assign TRIG0[75] = pg_out_eop3;
assign TRIG0[76] = pg_out_rdy3;


assign TRIG0[87:80] = data01[7:0];
assign TRIG0[90:88] = pkt_route01[2:0];
assign TRIG0[91] = wr01;
assign TRIG0[92] = req01;
assign TRIG0[93] = ack01;
assign TRIG0[94] = bypass01;

assign TRIG0[107:100] = data10[7:0];
assign TRIG0[110:108] = pkt_route10[2:0];
assign TRIG0[111] = wr10;
assign TRIG0[112] = req10;
assign TRIG0[113] = ack10;
assign TRIG0[114] = bypass10;
*/
/*
assign TRIG0[91:80] = TRIG_IS0[41:30];
assign TRIG0[94:92] = TRIG_IS0[28:26];


assign TRIG0[97:95] = TRIG_IS0[25:23];
assign TRIG0[100] = TRIG_IS0[0];
assign TRIG0[101] = TRIG_IS0[1];
assign TRIG0[104:102] = TRIG_IS0[4:2];
assign TRIG0[106:105] = TRIG_IS0[6:5];
assign TRIG0[107] = TRIG_IS0[10];
assign TRIG0[108] = TRIG_IS0[11];
assign TRIG0[111:109] = TRIG_IS0[14:12];
assign TRIG0[113:112] = TRIG_IS0[16:15];
assign TRIG0[114] = TRIG_IS0[17];
assign TRIG0[115] = TRIG_IS0[18];
assign TRIG0[116] = TRIG_IS0[19];
assign TRIG0[117] = TRIG_IS0[20];
assign TRIG0[118] = TRIG_IS0[21];
assign TRIG0[119] = TRIG_IS0[22];
*/
/*
assign TRIG0[127:120] = data02[7:0];
assign TRIG0[130:128] = pkt_route02[2:0];
assign TRIG0[131] = wr02;
assign TRIG0[132] = req02;
assign TRIG0[133] = ack02;
assign TRIG0[134] = bypass02;

assign TRIG0[147:140] = data20[7:0];
assign TRIG0[150:148] = pkt_route20[2:0];
assign TRIG0[151] = wr20;
assign TRIG0[152] = req20;
assign TRIG0[153] = ack20;
assign TRIG0[154] = bypass20;

//assign TRIG0[234:160] = TRIG_OS0[74:0];

assign TRIG0[167:160] = data13[7:0];
assign TRIG0[170:168] = pkt_route13[2:0];
assign TRIG0[171] = wr13;
assign TRIG0[172] = req13;
assign TRIG0[173] = ack13;
assign TRIG0[174] = bypass13;

assign TRIG0[187:180] = data31[7:0];
assign TRIG0[190:188] = pkt_route31[2:0];
assign TRIG0[191] = wr31;
assign TRIG0[192] = req31;
assign TRIG0[193] = ack31;
assign TRIG0[194] = bypass31;

assign TRIG0[207:200] = data23[7:0];
assign TRIG0[210:208] = pkt_route23[2:0];
assign TRIG0[211] = wr23;
assign TRIG0[212] = req23;
assign TRIG0[213] = ack23;
assign TRIG0[214] = bypass23;

assign TRIG0[227:220] = data32[7:0];
assign TRIG0[230:228] = pkt_route32[2:0];
assign TRIG0[231] = wr32;
assign TRIG0[232] = req32;
assign TRIG0[233] = ack32;
assign TRIG0[234] = bypass32;

assign TRIG0[235] = in_wr;
assign TRIG0[236] = in_rdy;
assign TRIG0[237] = out_wr;
assign TRIG0[238] = out_rdy;
*/
endmodule
