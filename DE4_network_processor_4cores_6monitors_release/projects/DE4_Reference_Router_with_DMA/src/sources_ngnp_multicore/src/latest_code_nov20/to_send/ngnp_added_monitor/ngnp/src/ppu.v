//
// Designed by Qiang Wu
//
`timescale 1ns/1ps

module ppu(
	input			clk,
	input			core_sp_clk,
	input			reset,
	output	[239:0]		TRIG_IS,
	output	[239:0]		TRIG_OS,

	// for input switch 
	input		[63:0]	in_data0,
	input		[23:0]	in_pkt_route0,
	input			in_wr0,
	input			in_req0,
	output			in_ack0,
	input			in_bypass0,

	input		[63:0]	in_data1,
	input		[23:0]	in_pkt_route1,
	input			in_wr1,
	input			in_req1,
	output			in_ack1,
	input			in_bypass1,

	input		[63:0]	in_data2,
	input		[23:0]	in_pkt_route2,
	input			in_wr2,
	input			in_req2,
	output			in_ack2,
	input			in_bypass2,

	input		[63:0]	in_data3,
	input		[23:0]	in_pkt_route3,
	input			in_wr3,
	input			in_req3,
	output			in_ack3,
	input			in_bypass3,

	// for output switch
	output		[63:0]	out_data0,
	output		[23:0]	out_pkt_route0,
	output			out_wr0,
	output			out_req0,
	input			out_ack0,
	output			out_bop0,
	output			out_eop0,
	input			out_rdy0,
	output			out_bypass0,

	output		[63:0]	out_data1,
	output		[23:0]	out_pkt_route1,
	output			out_wr1,
	output			out_req1,
	input			out_ack1,
	output			out_bop1,
	output			out_eop1,
	input			out_rdy1,
	output			out_bypass1,

	output		[63:0]	out_data2,
	output		[23:0]	out_pkt_route2,
	output			out_wr2,
	output			out_req2,
	input			out_ack2,
	output			out_bop2,
	output			out_eop2,
	input			out_rdy2,
	output			out_bypass2,

	output		[63:0]	out_data3,
	output		[23:0]	out_pkt_route3,
	output			out_wr3,
	output			out_req3,
	input			out_ack3,
	output			out_bop3,
	output			out_eop3,
	input			out_rdy3,
	output			out_bypass3,

     //for monitor
        output [31:0]	        pp_mem_addr,
        input                   pkt_drop
	
);


wire	[63:0]	pb_in_data0;
wire	[23:0]	pb_in_pkt_route0;
wire		pb_in_wr0;
wire		pb_in_req0;
wire		pb_in_ack0;
wire		pb_in_empty0;

wire	[63:0]	pb_in_data1;
wire	[23:0]	pb_in_pkt_route1;
wire		pb_in_wr1;
wire		pb_in_req1;
wire		pb_in_ack1;
wire		pb_in_empty1;

wire	[63:0]	pb_in_data2;
wire	[23:0]	pb_in_pkt_route2;
wire		pb_in_wr2;
wire		pb_in_req2;
wire		pb_in_ack2;
wire		pb_in_empty2;

wire	[63:0]	pb_in_data3;
wire	[23:0]	pb_in_pkt_route3;
wire		pb_in_wr3;
wire		pb_in_req3;
wire		pb_in_ack3;
wire		pb_in_empty3;

wire	[63:0]	pb_in_data4;
wire	[23:0]	pb_in_pkt_route4;
wire		pb_in_wr4;
wire		pb_in_req4;
wire		pb_in_ack4;
wire		pb_in_empty4;

wire	[63:0]	pb_in_data5;
wire	[23:0]	pb_in_pkt_route5;
wire		pb_in_wr5;
wire		pb_in_req5;
wire		pb_in_ack5;
wire		pb_in_empty5;

wire	[63:0]	pb_in_data6;
wire	[23:0]	pb_in_pkt_route6;
wire		pb_in_wr6;
wire		pb_in_req6;
wire		pb_in_ack6;
wire		pb_in_empty6;

wire	[63:0]	pb_in_data7;
wire	[23:0]	pb_in_pkt_route7;
wire		pb_in_wr7;
wire		pb_in_req7;
wire		pb_in_ack7;
wire		pb_in_empty7;

wire	[63:0]	pb_out_data0;
wire	[23:0]	pb_out_pkt_route0;
wire		pb_out_wr0;
wire		pb_out_req0;
wire		pb_out_ack0;
wire	[1:0]	pb_out_neighbor0;
wire		pb_out_bop0;
wire		pb_out_eop0;
wire		pb_out_rdy0;
wire		pb_out_bypass0;

wire	[63:0]	pb_out_data1;
wire	[23:0]	pb_out_pkt_route1;
wire		pb_out_wr1;
wire		pb_out_req1;
wire		pb_out_ack1;
wire	[1:0]	pb_out_neighbor1;
wire		pb_out_bop1;
wire		pb_out_eop1;
wire		pb_out_rdy1;
wire		pb_out_bypass1;

wire	[63:0]	pb_out_data2;
wire	[23:0]	pb_out_pkt_route2;
wire		pb_out_wr2;
wire		pb_out_req2;
wire		pb_out_ack2;
wire	[1:0]	pb_out_neighbor2;
wire		pb_out_bop2;
wire		pb_out_eop2;
wire		pb_out_rdy2;
wire		pb_out_bypass2;

wire	[63:0]	pb_out_data3;
wire	[23:0]	pb_out_pkt_route3;
wire		pb_out_wr3;
wire		pb_out_req3;
wire		pb_out_ack3;
wire	[1:0]	pb_out_neighbor3;
wire		pb_out_bop3;
wire		pb_out_eop3;
wire		pb_out_rdy3;
wire		pb_out_bypass3;

wire	[63:0]	pb_out_data4;
wire	[23:0]	pb_out_pkt_route4;
wire		pb_out_wr4;
wire		pb_out_req4;
wire		pb_out_ack4;
wire	[1:0]	pb_out_neighbor4;
wire		pb_out_bop4;
wire		pb_out_eop4;
wire		pb_out_rdy4;
wire		pb_out_bypass4;

wire	[63:0]	pb_out_data5;
wire	[23:0]	pb_out_pkt_route5;
wire		pb_out_wr5;
wire		pb_out_req5;
wire		pb_out_ack5;
wire	[1:0]	pb_out_neighbor5;
wire		pb_out_bop5;
wire		pb_out_eop5;
wire		pb_out_rdy5;
wire		pb_out_bypass5;

wire	[63:0]	pb_out_data6;
wire	[23:0]	pb_out_pkt_route6;
wire		pb_out_wr6;
wire		pb_out_req6;
wire		pb_out_ack6;
wire	[1:0]	pb_out_neighbor6;
wire		pb_out_bop6;
wire		pb_out_eop6;
wire		pb_out_rdy6;
wire		pb_out_bypass6;

wire	[63:0]	pb_out_data7;
wire	[23:0]	pb_out_pkt_route7;
wire		pb_out_wr7;
wire		pb_out_req7;
wire		pb_out_ack7;
wire	[1:0]	pb_out_neighbor7;
wire		pb_out_bop7;
wire		pb_out_eop7;
wire		pb_out_rdy7;
wire		pb_out_bypass7;

wire	[10:2]	pm_addr0;
wire	[31:0]	pm_data_in0;
wire	[31:0]	pm_data_out0;
wire		pm_we0;
wire		pm_req0;
wire		pm_done0;
wire		pm_done_repeat0;
wire		pm_wr_pkt_len0;
wire	[7:0]	pm_pkt_len0;

wire	[10:2]	pm_addr1;
wire	[31:0]	pm_data_in1;
wire	[31:0]	pm_data_out1;
wire		pm_we1;
wire		pm_req1;
wire		pm_done1;
wire		pm_done_repeat1;
wire		pm_wr_pkt_len1;
wire	[7:0]	pm_pkt_len1;

wire	[10:2]	pm_addr2;
wire	[31:0]	pm_data_in2;
wire	[31:0]	pm_data_out2;
wire		pm_we2;
wire		pm_req2;
wire		pm_done2;
wire		pm_done_repeat2;
wire		pm_wr_pkt_len2;
wire	[7:0]	pm_pkt_len2;

wire	[10:2]	pm_addr3;
wire	[31:0]	pm_data_in3;
wire	[31:0]	pm_data_out3;
wire		pm_we3;
wire		pm_req3;
wire		pm_done3;
wire		pm_done_repeat3;
wire		pm_wr_pkt_len3;
wire	[7:0]	pm_pkt_len3;

wire	[10:2]	pm_addr;
wire	[31:0]	pm_data_in;
wire	[31:0]	pm_data_out;
wire	[3:0]	pm_req;
wire		pm_we;
wire		pm_done;
wire		pm_done_repeat;
wire		pm_wr_pkt_len;
wire	[7:0]	pm_pkt_len;

assign pm_req[0] = pm_req0;
assign pm_req[1] = pm_req1;
assign pm_req[2] = pm_req2;
assign pm_req[3] = pm_req3;

wire	[13:2]	lr_addr;
wire	[31:0]	lr_data_in;
wire	[31:0]	lr_data_out;
wire	[3:0]	lr_bs;

wire	[31:0]	sp_data_in;
wire	[31:0]	sp_data_out;
wire	[31:0]	sp_mem_addr;
wire	[3:0]	sp_bs;
wire		sp_we;
reg		sp_ack;
reg		sp_pkt_done;
reg		sp_pkt_done_repeat;

wire            local_reset;

//monitor
assign local_reset = (pkt_drop|reset);


wire [239:0] TRIG1;
wire [239:0] TRIG2;
wire [239:0] TRIG3;
wire [239:0] TRIG4;
wire [239:0] TRIG5;
wire [239:0] TRIG6;
wire [239:0] TRIG7;
wire [239:0] TRIG8;
assign TRIG_IS = TRIG1;
assign TRIG_OS = TRIG2;

//wire [239:0] TRIG9;
//wire [239:0] TRIG10;
in_switch in_switch(
	.clk			(clk),
	.reset			(reset),
	.TRIG0	 (TRIG1),

	.in_data0		(in_data0),
	.in_pkt_route0		(in_pkt_route0),
	.in_wr0			(in_wr0),
	.in_req0		(in_req0),
	.in_ack0		(in_ack0),
	.in_bypass0		(in_bypass0),

	.in_data1		(in_data1),
	.in_pkt_route1		(in_pkt_route1),
	.in_wr1			(in_wr1),
	.in_req1		(in_req1),
	.in_ack1		(in_ack1),
	.in_bypass1		(in_bypass1),

	.in_data2		(in_data2),
	.in_pkt_route2		(in_pkt_route2),
	.in_wr2			(in_wr2),
	.in_req2		(in_req2),
	.in_ack2		(in_ack2),
	.in_bypass2		(in_bypass2),

	.in_data3		(in_data3),
	.in_pkt_route3		(in_pkt_route3),
	.in_wr3			(in_wr3),
	.in_req3		(in_req3),
	.in_ack3		(in_ack3),
	.in_bypass3		(in_bypass3),

	.pb_in_data0		(pb_in_data0),
	.pb_in_pkt_route0	(pb_in_pkt_route0),
	.pb_in_wr0		(pb_in_wr0),
	.pb_in_req0		(pb_in_req0),
	.pb_in_ack0		(pb_in_ack0),
	.pb_in_empty0		(pb_in_empty0),

	.pb_in_data1		(pb_in_data1),
	.pb_in_pkt_route1	(pb_in_pkt_route1),
	.pb_in_wr1		(pb_in_wr1),
	.pb_in_req1		(pb_in_req1),
	.pb_in_ack1		(pb_in_ack1),
	.pb_in_empty1		(pb_in_empty1),

	.pb_in_data2		(pb_in_data2),
	.pb_in_pkt_route2	(pb_in_pkt_route2),
	.pb_in_wr2		(pb_in_wr2),
	.pb_in_req2		(pb_in_req2),
	.pb_in_ack2		(pb_in_ack2),
	.pb_in_empty2		(pb_in_empty2),

	.pb_in_data3		(pb_in_data3),
	.pb_in_pkt_route3	(pb_in_pkt_route3),
	.pb_in_wr3		(pb_in_wr3),
	.pb_in_req3		(pb_in_req3),
	.pb_in_ack3		(pb_in_ack3),
	.pb_in_empty3		(pb_in_empty3),

	.pb_in_data4		(pb_in_data4),
	.pb_in_pkt_route4	(pb_in_pkt_route4),
	.pb_in_wr4		(pb_in_wr4),
	.pb_in_req4		(pb_in_req4),
	.pb_in_ack4		(pb_in_ack4),
	.pb_in_empty4		(pb_in_empty4),

	.pb_in_data5		(pb_in_data5),
	.pb_in_pkt_route5	(pb_in_pkt_route5),
	.pb_in_wr5		(pb_in_wr5),
	.pb_in_req5		(pb_in_req5),
	.pb_in_ack5		(pb_in_ack5),
	.pb_in_empty5		(pb_in_empty5)

//	.pb_in_data6		(pb_in_data6),
//	.pb_in_pkt_route6	(pb_in_pkt_route6),
//	.pb_in_wr6		(pb_in_wr6),
//	.pb_in_req6		(pb_in_req6),
//	.pb_in_ack6		(pb_in_ack6),
//	.pb_in_empty6		(pb_in_empty6)

//	.pb_in_data7		(pb_in_data7),
//	.pb_in_pkt_route7	(pb_in_pkt_route7),
//	.pb_in_wr7		(pb_in_wr7),
//	.pb_in_req7		(pb_in_req7),
//	.pb_in_ack7		(pb_in_ack7),
//	.pb_in_empty7		(pb_in_empty7)
);

out_switch out_switch(
	.clk			(clk),
	.reset			(reset),
	.TRIG0	 (TRIG2),

	.pb_out_data0		(pb_out_data0),
	.pb_out_pkt_route0	(pb_out_pkt_route0),
	.pb_out_wr0		(pb_out_wr0),
	.pb_out_req0		(pb_out_req0),
	.pb_out_ack0		(pb_out_ack0),
	.pb_out_neighbor0	(pb_out_neighbor0),
	.pb_out_bop0		(pb_out_bop0),
	.pb_out_eop0		(pb_out_eop0),
	.pb_out_rdy0		(pb_out_rdy0),
	.pb_out_bypass0		(pb_out_bypass0),

	.pb_out_data1		(pb_out_data1),
	.pb_out_pkt_route1	(pb_out_pkt_route1),
	.pb_out_wr1		(pb_out_wr1),
	.pb_out_req1		(pb_out_req1),
	.pb_out_ack1		(pb_out_ack1),
	.pb_out_neighbor1	(pb_out_neighbor1),
	.pb_out_bop1		(pb_out_bop1),
	.pb_out_eop1		(pb_out_eop1),
	.pb_out_rdy1		(pb_out_rdy1),
	.pb_out_bypass1		(pb_out_bypass1),

	.pb_out_data2		(pb_out_data2),
	.pb_out_pkt_route2	(pb_out_pkt_route2),
	.pb_out_wr2		(pb_out_wr2),
	.pb_out_req2		(pb_out_req2),
	.pb_out_ack2		(pb_out_ack2),
	.pb_out_neighbor2	(pb_out_neighbor2),
	.pb_out_bop2		(pb_out_bop2),
	.pb_out_eop2		(pb_out_eop2),
	.pb_out_rdy2		(pb_out_rdy2),
	.pb_out_bypass2		(pb_out_bypass2),

	.pb_out_data3		(pb_out_data3),
	.pb_out_pkt_route3	(pb_out_pkt_route3),
	.pb_out_wr3		(pb_out_wr3),
	.pb_out_req3		(pb_out_req3),
	.pb_out_ack3		(pb_out_ack3),
	.pb_out_neighbor3	(pb_out_neighbor3),
	.pb_out_bop3		(pb_out_bop3),
	.pb_out_eop3		(pb_out_eop3),
	.pb_out_rdy3		(pb_out_rdy3),
	.pb_out_bypass3		(pb_out_bypass3),

	.pb_out_data4		(pb_out_data4),
	.pb_out_pkt_route4	(pb_out_pkt_route4),
	.pb_out_wr4		(pb_out_wr4),
	.pb_out_req4		(pb_out_req4),
	.pb_out_ack4		(pb_out_ack4),
	.pb_out_neighbor4	(pb_out_neighbor4),
	.pb_out_bop4		(pb_out_bop4),
	.pb_out_eop4		(pb_out_eop4),
	.pb_out_rdy4		(pb_out_rdy4),
	.pb_out_bypass4		(pb_out_bypass4),

	.pb_out_data5		(pb_out_data5),
	.pb_out_pkt_route5	(pb_out_pkt_route5),
	.pb_out_wr5		(pb_out_wr5),
	.pb_out_req5		(pb_out_req5),
	.pb_out_ack5		(pb_out_ack5),
	.pb_out_neighbor5	(pb_out_neighbor5),
	.pb_out_bop5		(pb_out_bop5),
	.pb_out_eop5		(pb_out_eop5),
	.pb_out_rdy5		(pb_out_rdy5),
	.pb_out_bypass5		(pb_out_bypass5),

//	.pb_out_data6		(pb_out_data6),
//	.pb_out_pkt_route6	(pb_out_pkt_route6),
//	.pb_out_wr6		(pb_out_wr6),
//	.pb_out_req6		(pb_out_req6),
//	.pb_out_ack6		(pb_out_ack6),
//	.pb_out_neighbor6	(pb_out_neighbor6),
//	.pb_out_bop6		(pb_out_bop6),
//	.pb_out_eop6		(pb_out_eop6),
//	.pb_out_rdy6		(pb_out_rdy6),
//	.pb_out_bypass6		(pb_out_bypass6),

//	.pb_out_data7		(pb_out_data7),
//	.pb_out_pkt_route7	(pb_out_pkt_route7),
//	.pb_out_wr7		(pb_out_wr7),
//	.pb_out_req7		(pb_out_req7),
//	.pb_out_ack7		(pb_out_ack7),
//	.pb_out_neighbor7	(pb_out_neighbor7),
//	.pb_out_bop7		(pb_out_bop7),
//	.pb_out_eop7		(pb_out_eop7),
//	.pb_out_rdy7		(pb_out_rdy7),
//	.pb_out_bypass7		(pb_out_bypass7),

	.out_data0		(out_data0),
	.out_pkt_route0		(out_pkt_route0),
	.out_wr0		(out_wr0),
	.out_req0		(out_req0),
	.out_ack0		(out_ack0),
	.out_bop0		(out_bop0),
	.out_eop0		(out_eop0),
	.out_rdy0		(out_rdy0),
	.out_bypass0		(out_bypass0),

	.out_data1		(out_data1),
	.out_pkt_route1		(out_pkt_route1),
	.out_wr1		(out_wr1),
	.out_req1		(out_req1),
	.out_ack1		(out_ack1),
	.out_bop1		(out_bop1),
	.out_eop1		(out_eop1),
	.out_rdy1		(out_rdy1),
	.out_bypass1		(out_bypass1),

	.out_data2		(out_data2),
	.out_pkt_route2		(out_pkt_route2),
	.out_wr2		(out_wr2),
	.out_req2		(out_req2),
	.out_ack2		(out_ack2),
	.out_bop2		(out_bop2),
	.out_eop2		(out_eop2),
	.out_rdy2		(out_rdy2),
	.out_bypass2		(out_bypass2),

	.out_data3		(out_data3),
	.out_pkt_route3		(out_pkt_route3),
	.out_wr3		(out_wr3),
	.out_req3		(out_req3),
	.out_ack3		(out_ack3),
	.out_bop3		(out_bop3),
	.out_eop3		(out_eop3),
	.out_rdy3		(out_rdy3),
	.out_bypass3		(out_bypass3)
);

packet_buffer pb0(
	.clk		(clk),
	.reset		(reset),
	.TRIG0	 (),

	.in_data	(pb_in_data0),
	.in_pkt_route	(pb_in_pkt_route0),
	.in_wr		(pb_in_wr0),
	.in_req		(pb_in_req0),
	.in_ack		(pb_in_ack0),
	.in_empty	(pb_in_empty0),

	.out_data	(pb_out_data0),
	.out_pkt_route	(pb_out_pkt_route0),
	.out_wr		(pb_out_wr0),
	.out_req	(pb_out_req0),
	.out_ack	(pb_out_ack0),
	.out_neighbor	(pb_out_neighbor0),
	.out_bop	(pb_out_bop0),
	.out_eop	(pb_out_eop0),
	.out_rdy	(pb_out_rdy0),
	.out_bypass	(pb_out_bypass0),

	.proc_addr	(pm_addr0),
	.proc_data_in	(pm_data_in0),
	.proc_data_out	(pm_data_out0),
	.proc_we	(pm_we0),
	.proc_req	(pm_req0),
	.proc_done	(pm_done0),
	.proc_done_repeat(pm_done_repeat0),
	.proc_wr_pkt_len(pm_wr_pkt_len0),
	.proc_pkt_len	(pm_pkt_len0)
);

packet_buffer pb1(
	.clk		(clk),
	.reset		(reset),
	.TRIG0	 (),

	.in_data	(pb_in_data1),
	.in_pkt_route	(pb_in_pkt_route1),
	.in_wr		(pb_in_wr1),
	.in_req		(pb_in_req1),
	.in_ack		(pb_in_ack1),
	.in_empty	(pb_in_empty1),

	.out_data	(pb_out_data1),
	.out_pkt_route	(pb_out_pkt_route1),
	.out_wr		(pb_out_wr1),
	.out_req	(pb_out_req1),
	.out_ack	(pb_out_ack1),
	.out_neighbor	(pb_out_neighbor1),
	.out_bop	(pb_out_bop1),
	.out_eop	(pb_out_eop1),
	.out_rdy	(pb_out_rdy1),
	.out_bypass	(pb_out_bypass1),

	.proc_addr	(pm_addr1),
	.proc_data_in	(pm_data_in1),
	.proc_data_out	(pm_data_out1),
	.proc_we	(pm_we1),
	.proc_req	(pm_req1),
	.proc_done	(pm_done1),
	.proc_done_repeat(pm_done_repeat1),
	.proc_wr_pkt_len(pm_wr_pkt_len1),
	.proc_pkt_len	(pm_pkt_len1)
);

packet_buffer pb2(
	.clk		(clk),
	.reset		(reset),
	.TRIG0	 (),

	.in_data	(pb_in_data2),
	.in_pkt_route	(pb_in_pkt_route2),
	.in_wr		(pb_in_wr2),
	.in_req		(pb_in_req2),
	.in_ack		(pb_in_ack2),
	.in_empty	(pb_in_empty2),

	.out_data	(pb_out_data2),
	.out_pkt_route	(pb_out_pkt_route2),
	.out_wr		(pb_out_wr2),
	.out_req	(pb_out_req2),
	.out_ack	(pb_out_ack2),
	.out_neighbor	(pb_out_neighbor2),
	.out_bop	(pb_out_bop2),
	.out_eop	(pb_out_eop2),
	.out_rdy	(pb_out_rdy2),
	.out_bypass	(pb_out_bypass2),

	.proc_addr	(pm_addr2),
	.proc_data_in	(pm_data_in2),
	.proc_data_out	(pm_data_out2),
	.proc_we	(pm_we2),
	.proc_req	(pm_req2),
	.proc_done	(pm_done2),
	.proc_done_repeat(pm_done_repeat2),
	.proc_wr_pkt_len(pm_wr_pkt_len2),
	.proc_pkt_len	(pm_pkt_len2)
);

packet_buffer pb3(
	.clk		(clk),
	.reset		(reset),
	.TRIG0	 (),

	.in_data	(pb_in_data3),
	.in_pkt_route	(pb_in_pkt_route3),
	.in_wr		(pb_in_wr3),
	.in_req		(pb_in_req3),
	.in_ack		(pb_in_ack3),
	.in_empty	(pb_in_empty3),

	.out_data	(pb_out_data3),
	.out_pkt_route	(pb_out_pkt_route3),
	.out_wr		(pb_out_wr3),
	.out_req	(pb_out_req3),
	.out_ack	(pb_out_ack3),
	.out_neighbor	(pb_out_neighbor3),
	.out_bop	(pb_out_bop3),
	.out_eop	(pb_out_eop3),
	.out_rdy	(pb_out_rdy3),
	.out_bypass	(pb_out_bypass3),

	.proc_addr	(pm_addr3),
	.proc_data_in	(pm_data_in3),
	.proc_data_out	(pm_data_out3),
	.proc_we	(pm_we3),
	.proc_req	(pm_req3),
	.proc_done	(pm_done3),
	.proc_done_repeat(pm_done_repeat3),
	.proc_wr_pkt_len(pm_wr_pkt_len3),
	.proc_pkt_len	(pm_pkt_len3)
);

packet_buffer_bypass pb4(
	.clk		(clk),
	.reset		(reset),
	.TRIG0	 (),

	.in_data	(pb_in_data4),
	.in_pkt_route	(pb_in_pkt_route4),
	.in_wr		(pb_in_wr4),
	.in_req		(pb_in_req4),
	.in_ack		(pb_in_ack4),
	.in_empty	(pb_in_empty4),

	.out_data	(pb_out_data4),
	.out_pkt_route	(pb_out_pkt_route4),
	.out_wr		(pb_out_wr4),
	.out_req	(pb_out_req4),
	.out_ack	(pb_out_ack4),
	.out_neighbor	(pb_out_neighbor4),
	.out_bop	(pb_out_bop4),
	.out_eop	(pb_out_eop4),
	.out_rdy	(pb_out_rdy4),
	.out_bypass	(pb_out_bypass4)
);

packet_buffer_bypass pb5(
	.clk		(clk),
	.reset		(reset),
	.TRIG0	 (),

	.in_data	(pb_in_data5),
	.in_pkt_route	(pb_in_pkt_route5),
	.in_wr		(pb_in_wr5),
	.in_req		(pb_in_req5),
	.in_ack		(pb_in_ack5),
	.in_empty	(pb_in_empty5),

	.out_data	(pb_out_data5),
	.out_pkt_route	(pb_out_pkt_route5),
	.out_wr		(pb_out_wr5),
	.out_req	(pb_out_req5),
	.out_ack	(pb_out_ack5),
	.out_neighbor	(pb_out_neighbor5),
	.out_bop	(pb_out_bop5),
	.out_eop	(pb_out_eop5),
	.out_rdy	(pb_out_rdy5),
	.out_bypass	(pb_out_bypass5)
);
/*
packet_buffer_bypass pb6(
	.clk		(clk),
	.reset		(reset),
	.TRIG0	 (),

	.in_data	(pb_in_data6),
	.in_pkt_route	(pb_in_pkt_route6),
	.in_wr		(pb_in_wr6),
	.in_req		(pb_in_req6),
	.in_ack		(pb_in_ack6),
	.in_empty	(pb_in_empty6),

	.out_data	(pb_out_data6),
	.out_pkt_route	(pb_out_pkt_route6),
	.out_wr		(pb_out_wr6),
	.out_req	(pb_out_req6),
	.out_ack	(pb_out_ack6),
	.out_neighbor	(pb_out_neighbor6),
	.out_bop	(pb_out_bop6),
	.out_eop	(pb_out_eop6),
	.out_rdy	(pb_out_rdy6),
	.out_bypass	(pb_out_bypass6)
);

packet_buffer_bypass pb7(
	.clk		(clk),
	.reset		(reset),
	.TRIG0	 (),

	.in_data	(pb_in_data7),
	.in_pkt_route	(pb_in_pkt_route7),
	.in_wr		(pb_in_wr7),
	.in_req		(pb_in_req7),
	.in_ack		(pb_in_ack7),
	.in_empty	(pb_in_empty7),

	.out_data	(pb_out_data7),
	.out_pkt_route	(pb_out_pkt_route7),
	.out_wr		(pb_out_wr7),
	.out_req	(pb_out_req7),
	.out_ack	(pb_out_ack7),
	.out_neighbor	(pb_out_neighbor7),
	.out_bop	(pb_out_bop7),
	.out_eop	(pb_out_eop7),
	.out_rdy	(pb_out_rdy7),
	.out_bypass	(pb_out_bypass7)
);
*/

localram lr(
	.clk		(clk), 
	.addr		(lr_addr[13:2]), 
	.data_in	(lr_data_in), 
	.data_out	(lr_data_out), 
	.we		(lr_bs), 
	.en		(1'b1), 
	.reset		(reset)
);


reg	[1:0]	curr_pb;
reg	[1:0]	curr_pb_next;
wire	[1:0]	curr_pb_plus_1;
assign curr_pb_plus_1 = (curr_pb == 2'b11) ? 0 : curr_pb + 1'b1;

reg sp_state;
reg sp_state_next;

always @(posedge clk)
begin
	if(reset) begin
		curr_pb <= 0;
		sp_state <= 0;
	end else begin
		curr_pb <= curr_pb_next;
		sp_state <= sp_state_next;
	end
end

parameter	SP_IDLE	= 1'b0,
		SP_PROC	= 1'b1;

always @(*) begin
	sp_ack = 0;
	sp_state_next = sp_state;
	curr_pb_next = curr_pb;
	case(sp_state)
		SP_IDLE: begin
			if(pm_req[curr_pb]) begin
				sp_state_next = SP_PROC;
			end else begin
				curr_pb_next = curr_pb_plus_1;
			end
		end
		SP_PROC: begin
			sp_ack = 1;
			if(sp_pkt_done) begin
				sp_state_next = SP_IDLE;
			end
		end
	endcase
end

assign pm_addr0 = (curr_pb == 2'b00) ? pm_addr : 0 ;
assign pm_addr1 = (curr_pb == 2'b01) ? pm_addr : 0 ;
assign pm_addr2 = (curr_pb == 2'b10) ? pm_addr : 0 ;
assign pm_addr3 = (curr_pb == 2'b11) ? pm_addr : 0 ;

assign pm_data_in0 = (curr_pb == 2'b00) ? pm_data_in : 0;
assign pm_data_in1 = (curr_pb == 2'b01) ? pm_data_in : 0;
assign pm_data_in2 = (curr_pb == 2'b10) ? pm_data_in : 0;
assign pm_data_in3 = (curr_pb == 2'b11) ? pm_data_in : 0;

assign pm_data_out = (curr_pb == 2'b00) ? pm_data_out0 :
			(curr_pb == 2'b01) ? pm_data_out1 :
			(curr_pb == 2'b10) ? pm_data_out2 :
			(curr_pb == 2'b11) ? pm_data_out3 : 0 ;

assign pm_we0 = (curr_pb == 2'b00) ? pm_we : 0 ;
assign pm_we1 = (curr_pb == 2'b01) ? pm_we : 0 ;
assign pm_we2 = (curr_pb == 2'b10) ? pm_we : 0 ;
assign pm_we3 = (curr_pb == 2'b11) ? pm_we : 0 ;

assign pm_done0 = (curr_pb == 2'b00) ? pm_done : 0 ;
assign pm_done1 = (curr_pb == 2'b01) ? pm_done : 0 ;
assign pm_done2 = (curr_pb == 2'b10) ? pm_done : 0 ;
assign pm_done3 = (curr_pb == 2'b11) ? pm_done : 0 ;

assign pm_done_repeat0 = (curr_pb == 2'b00) ? pm_done_repeat : 0 ;
assign pm_done_repeat1 = (curr_pb == 2'b01) ? pm_done_repeat : 0 ;
assign pm_done_repeat2 = (curr_pb == 2'b10) ? pm_done_repeat : 0 ;
assign pm_done_repeat3 = (curr_pb == 2'b11) ? pm_done_repeat : 0 ;

assign pm_wr_pkt_len0 = (curr_pb == 2'b00) ? pm_wr_pkt_len : 0 ;
assign pm_wr_pkt_len1 = (curr_pb == 2'b01) ? pm_wr_pkt_len : 0 ;
assign pm_wr_pkt_len2 = (curr_pb == 2'b10) ? pm_wr_pkt_len : 0 ;
assign pm_wr_pkt_len3 = (curr_pb == 2'b11) ? pm_wr_pkt_len : 0 ;

assign pm_pkt_len0 = (curr_pb == 2'b00) ? sp_data_out[7:0] : 0;
assign pm_pkt_len1 = (curr_pb == 2'b01) ? sp_data_out[7:0] : 0;
assign pm_pkt_len2 = (curr_pb == 2'b10) ? sp_data_out[7:0] : 0;
assign pm_pkt_len3 = (curr_pb == 2'b11) ? sp_data_out[7:0] : 0;

// memory selection
// 	0x00000000 - 0x00000800 localram
// 	0x10000000 - 0x10000000 packetmem
// 	0x20000000 - 0x20000000 packet_done
// 	0x30000000 - 0x30000000 packet_len
// 	0x40000000 - 0x40000000 packet_done_repeat

assign lr_addr = (sp_mem_addr[30:28] == 3'b000) ? sp_mem_addr[13:2] : 0 ;
assign lr_data_in = (sp_mem_addr[30:28] == 3'b000) ? sp_data_out : 0 ;
assign lr_bs = (sp_mem_addr[30:28] == 3'b000) ? {4{sp_we}} : 0 ;

assign pm_addr = (sp_mem_addr[30:28] == 3'b001) ? sp_mem_addr[12:2] : 0 ;
assign pm_data_in = (sp_mem_addr[30:28] == 3'b001) ? sp_data_out : 0 ;
assign pm_we = (sp_mem_addr[30:28] == 3'b001) ? sp_we : 0 ;
assign pm_done = sp_pkt_done;
assign pm_done_repeat = sp_pkt_done_repeat;
assign pm_wr_pkt_len = (sp_mem_addr[30:28] == 3'b011) ? 1 : 0 ;

assign sp_data_in = (sp_mem_addr[30:28] == 3'b000) ? lr_data_out :
			(sp_mem_addr[30:28] == 3'b001) ? pm_data_out : 0 ;

always @(posedge core_sp_clk) begin
	if(sp_mem_addr[30:28] == 3'b010) begin
		sp_pkt_done <= 1;
	end else begin
		sp_pkt_done <= 0;
	end
end
always @(posedge core_sp_clk) begin
	if(sp_mem_addr[30:28] == 3'b100) begin
		sp_pkt_done_repeat <= 1;
	end else begin
		sp_pkt_done_repeat <= 0;
	end
end
yf32_core service_processor(
	.CLK_I		(core_sp_clk),
	.RST_I		(reset),
	.ADR_O		(sp_mem_addr),
	.DAT_I		(sp_data_in),
	.DAT_O		(sp_data_out),
	.WE_O		(sp_we),
	.SEL_O		(sp_bs),
	.STB_O		(),
	.ACK_I		(sp_ack),
	.CYC_O		(),
	.INT_I		(1'b0)
);



wire [35:0] CONTROL0;
wire [239:0] TRIG0;
/*
chipscope_icon_v1_03_a cs_icon (
        .CONTROL0(CONTROL0)
);

chipscope_ila_v1_02_a cs_ila (
        .CONTROL(CONTROL0),
        .CLK(clk),
        .TRIG0(TRIG0),
        .TRIG1(TRIG1),
        .TRIG2(TRIG2),
        .TRIG3(TRIG3),
        .TRIG4(TRIG4),
        .TRIG5(TRIG5),
        .TRIG6(TRIG6),
        .TRIG7(TRIG7),
        .TRIG8(TRIG8)
//        .TRIG9(TRIG9),
  //      .TRIG10(TRIG10)
);
*/
assign TRIG0[0] = in_wr0;
assign TRIG0[1] = in_req0;
assign TRIG0[2] = in_ack0;
assign TRIG0[3] = in_wr1;
assign TRIG0[4] = in_req1;
assign TRIG0[5] = in_ack1;
assign TRIG0[6] = in_wr2;
assign TRIG0[7] = in_req2;
assign TRIG0[8] = in_ack2;
assign TRIG0[9] = in_wr3;
assign TRIG0[10] = in_req3;
assign TRIG0[11] = in_ack3;

assign TRIG0[21] = out_wr0;
assign TRIG0[22] = out_req0;
assign TRIG0[23] = out_ack0;
assign TRIG0[24] = out_bop0;
assign TRIG0[25] = out_eop0;
assign TRIG0[26] = out_rdy0;
assign TRIG0[27] = out_wr1;
assign TRIG0[28] = out_req1;
assign TRIG0[29] = out_ack1;
assign TRIG0[30] = out_bop1;
assign TRIG0[31] = out_eop1;
assign TRIG0[32] = out_rdy1;
assign TRIG0[33] = out_wr2;
assign TRIG0[34] = out_req2;
assign TRIG0[35] = out_ack2;
assign TRIG0[36] = out_bop2;
assign TRIG0[37] = out_eop2;
assign TRIG0[38] = out_rdy2;
assign TRIG0[39] = out_wr3;
assign TRIG0[40] = out_req3;
assign TRIG0[41] = out_ack3;
assign TRIG0[42] = out_bop3;
assign TRIG0[43] = out_eop3;
assign TRIG0[44] = out_rdy3;

assign TRIG0[50] = pb_in_wr0;
assign TRIG0[51] = pb_in_req0;
assign TRIG0[52] = pb_in_ack0;
assign TRIG0[53] = pb_in_empty0;
assign TRIG0[54] = pb_in_wr1;
assign TRIG0[55] = pb_in_req1;
assign TRIG0[56] = pb_in_ack1;
assign TRIG0[57] = pb_in_empty1;
assign TRIG0[58] = pb_in_wr2;
assign TRIG0[59] = pb_in_req2;
assign TRIG0[60] = pb_in_ack2;
assign TRIG0[61] = pb_in_empty2;
assign TRIG0[62] = pb_in_wr3;
assign TRIG0[63] = pb_in_req3;
assign TRIG0[64] = pb_in_ack3;
assign TRIG0[65] = pb_in_empty3;

assign TRIG0[70] = pb_out_wr0;
assign TRIG0[71] = pb_out_req0;
assign TRIG0[72] = pb_out_ack0;
assign TRIG0[74:73] = pb_out_neighbor0;
assign TRIG0[75] = pb_out_bop0;
assign TRIG0[76] = pb_out_eop0;
assign TRIG0[77] = pb_out_rdy0;
assign TRIG0[80] = pb_out_wr1;
assign TRIG0[81] = pb_out_req1;
assign TRIG0[82] = pb_out_ack1;
assign TRIG0[84:83] = pb_out_neighbor1;
assign TRIG0[85] = pb_out_bop1;
assign TRIG0[86] = pb_out_eop1;
assign TRIG0[87] = pb_out_rdy1;
assign TRIG0[90] = pb_out_wr2;
assign TRIG0[91] = pb_out_req2;
assign TRIG0[92] = pb_out_ack2;
assign TRIG0[94:93] = pb_out_neighbor2;
assign TRIG0[95] = pb_out_bop2;
assign TRIG0[96] = pb_out_eop2;
assign TRIG0[97] = pb_out_rdy2;
assign TRIG0[100] = pb_out_wr3;
assign TRIG0[101] = pb_out_req3;
assign TRIG0[102] = pb_out_ack3;
assign TRIG0[104:103] = pb_out_neighbor3;
assign TRIG0[105] = pb_out_bop3;
assign TRIG0[106] = pb_out_eop3;
assign TRIG0[107] = pb_out_rdy3;

assign TRIG0[111:110] = sp_state;
assign TRIG0[113:112] = curr_pb;

assign TRIG7[31:0] = pm_data_in0;
assign TRIG7[63:32] = pm_data_out0;
assign TRIG7[131:100] = pm_data_in1;
assign TRIG7[163:132] = pm_data_out1;
assign TRIG8[31:0] = pm_data_in2;
assign TRIG8[63:32] = pm_data_out2;
assign TRIG8[131:100] = pm_data_in3;
assign TRIG8[163:132] = pm_data_out3;

endmodule
