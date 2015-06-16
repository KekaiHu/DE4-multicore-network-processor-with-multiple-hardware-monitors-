//
// Designed by Qiang Wu
//	16K bytes, 32bit interface

`timescale 1ns/1ps


module lr0(clk, addr, data_in, data_out, we, en, reset);
input clk;
input [13:2] addr;
input [31:0] data_in;
output [31:0] data_out;
input [3:0] we;
input en;
input reset;


RAMB16_S4_altera localram0(
	.aclr (reset),
	.address (addr[13:2]),
	.clken (en),
	.clock (clk),
	.data (data_in[3:0]),
	.wren (we[0]),
	.q (data_out[3:0])
);

defparam localram0.init_file = "lr_00.mif";
	

RAMB16_S4_altera localram1(
	.aclr (reset),
	.address (addr[13:2]),
	.clken (en),
	.clock (clk),
	.data (data_in[7:4]),
	.wren (we[0]),
	.q (data_out[7:4])
);

defparam localram1.init_file = "lr_11.mif";


RAMB16_S4_altera localram2(
	.aclr (reset),
	.address (addr[13:2]),
	.clken (en),
	.clock (clk),
	.data (data_in[11:8]),
	.wren (we[1]),
	.q (data_out[11:8])
);

defparam localram2.init_file = "lr_22.mif";


RAMB16_S4_altera localram3(
	.aclr (reset),
	.address (addr[13:2]),
	.clken (en),
	.clock (clk),
	.data (data_in[15:12]),
	.wren (we[1]),
	.q (data_out[15:12])
);

defparam localram3.init_file = "lr_33.mif";

RAMB16_S4_altera localram4(
	.aclr (reset),
	.address (addr[13:2]),
	.clken (en),
	.clock (clk),
	.data (data_in[19:16]),
	.wren (we[2]),
	.q (data_out[19:16])
);

defparam localram4.init_file = "lr_44.mif";

RAMB16_S4_altera localram5(
	.aclr (reset),
	.address (addr[13:2]),
	.clken (en),
	.clock (clk),
	.data (data_in[23:20]),
	.wren (we[2]),
	.q (data_out[23:20])
);

defparam localram5.init_file = "lr_55.mif";

RAMB16_S4_altera localram6(
	.aclr (reset),
	.address (addr[13:2]),
	.clken (en),
	.clock (clk),
	.data (data_in[27:24]),
	.wren (we[3]),
	.q (data_out[27:24])
);

defparam localram6.init_file = "lr_66.mif";

RAMB16_S4_altera localram7(
	.aclr (reset),
	.address (addr[13:2]),
	.clken (en),
	.clock (clk),
	.data (data_in[31:28]),
	.wren (we[3]),
	.q (data_out[31:28])
);


defparam localram7.init_file = "lr_77.mif";

endmodule
