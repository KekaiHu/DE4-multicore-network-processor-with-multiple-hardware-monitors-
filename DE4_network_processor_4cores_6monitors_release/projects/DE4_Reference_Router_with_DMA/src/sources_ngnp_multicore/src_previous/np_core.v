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
      parameter IO_QUEUE_STAGE_NUM = 255,
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
wire [15:0] fc_out_pkt_route0;
wire fc_out_wr0;
wire fc_out_req0;
wire fc_out_ack0;

wire [63:0] pg_out_data3;
wire [15:0] pg_out_pkt_route3;
wire pg_out_wr3;
wire pg_out_req3;
wire pg_out_ack3;
wire pg_out_bop3;
wire pg_out_eop3;
wire pg_out_rdy3;


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

flow_classification fc(
.out_data0	(fc_out_data0),
.out_pkt_route0	(fc_out_pkt_route0),
.out_wr0	(fc_out_wr0),
.out_req0	(fc_out_req0),
.out_ack0	(fc_out_ack0),

.out_data1	(),
.out_pkt_route1	(),
.out_wr1	(),
.out_req1	(),
.out_ack1	(),

.in_data	(in_data),
.in_ctrl	(in_ctrl),
.in_wr		(in_wr),
.in_rdy		(in_rdy),

.clk		(clk),
.reset		(reset)
);

ppu ppu(
.clk		(clk),
.core_sp_clk	(core_sp_clk),
.reset		(reset),

.in_data0	(),
.in_pkt_route0	(),
.in_wr0		(),
.in_req0	(),
.in_ack0	(),

.in_data1	(fc_out_data0),
.in_pkt_route1	(fc_out_pkt_route0),
.in_wr1		(fc_out_wr0),
.in_req1	(fc_out_req0),
.in_ack1	(fc_out_ack0),

.in_data2	(),
.in_pkt_route2	(),
.in_wr2		(),
.in_req2	(),
.in_ack2	(),

.in_data3	(),
.in_pkt_route3	(),
.in_wr3		(),
.in_req3	(),
.in_ack3	(),

.out_data0	(),
.out_pkt_route0	(),
.out_wr0	(),
.out_req0	(),
.out_ack0	(),
.out_bop0	(),
.out_eop0	(),

.out_data1	(),
.out_pkt_route1	(),
.out_wr1	(),
.out_req1	(),
.out_ack1	(),
.out_bop1	(),
.out_eop1	(),

.out_data2	(),
.out_pkt_route2	(),
.out_wr2	(),
.out_req2	(),
.out_ack2	(),
.out_bop2	(),
.out_eop2	(),

.out_data3	(pg_out_data3),
.out_pkt_route3	(pg_out_pkt_route3),
.out_wr3	(pg_out_wr3),
.out_req3	(pg_out_req3),
.out_ack3	(pg_out_ack3),
.out_bop3	(pg_out_bop3),
.out_eop3	(pg_out_eop3),
.out_rdy3	(pg_out_rdy3),

//for monitor
// for security monitoring -- hari
//.instruction_sec_mon	(instruction_sec_mon),
//.prog_counter_sec_mon	(prog_counter_sec_mon),
.pp_mem_addr   (ppu_mem_addr),
.pkt_drop     (packet_drop)
	
);



out_arbiter oa(
.out_data	(out_data),
.out_ctrl	(out_ctrl),
.out_wr		(out_wr),
.out_rdy	(out_rdy),

.in_data0	(pg_out_data3),
.in_wr0		(pg_out_wr3),
.in_req0	(pg_out_req3),
.in_ack0	(pg_out_ack3),
.in_bop0	(pg_out_bop3),
.in_eop0	(pg_out_eop3),
.in_outrdy0	(pg_out_rdy3),

.in_data1	(),
.in_wr1		(),
.in_req1	(),
.in_ack1	(),
.in_bop1	(),
.in_eop1	(),

.clk		(clk),
.reset		(reset)
);

endmodule
