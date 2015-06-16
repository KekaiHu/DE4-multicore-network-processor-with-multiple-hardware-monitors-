//
// Designed by Qiang Wu
//	16K bytes, 32bit interface

`timescale 1ns/1ps


module lr_old(clk, raddr,waddr, data_in, data_out, we, reset);
input clk;
input [13:2] raddr;
input [13:2] waddr;
input [31:0] data_in;
output [31:0] data_out;
input [3:0] we;
input reset;


RAMB16_S4_2_altera localram0(
	//.aclr (reset),
	.rdaddress (raddr[13:2]),
	.wraddress (waddr[13:2]),
	.clock (clk),
	.data (data_in[3:0]),
	.wren (we[0]),
	.q (data_out[3:0])
);

defparam localram0.init_file = "cm_new_aipv4_00.mif";
//defparam localram0.init_file = "lm_cm_00.mif";
//defparam localram0.init_file = "cm_final_00.mif";	


RAMB16_S4_2_altera localram1(
	//.aclr (reset),
	.rdaddress (raddr[13:2]),
	.wraddress (waddr[13:2]),
	.clock (clk),
	.data (data_in[7:4]),
	.wren (we[0]),
	.q (data_out[7:4])
);


//defparam localram1.init_file = "lm_cm_01.mif";
defparam localram1.init_file = "cm_new_aipv4_01.mif";
//defparam localram1.init_file = "cm_final_01.mif";	


RAMB16_S4_2_altera localram2(
	//.aclr (reset),
	.rdaddress (raddr[13:2]),
	.wraddress (waddr[13:2]),
	.clock (clk),
	.data (data_in[11:8]),
	.wren (we[1]),
	.q (data_out[11:8])
);

//defparam localram2.init_file = "lm_cm_02.mif";
defparam localram2.init_file = "cm_new_aipv4_02.mif";
//defparam localram2.init_file = "cm_final_02.mif";	


RAMB16_S4_2_altera localram3(
	//.aclr (reset),
	.rdaddress (raddr[13:2]),
	.wraddress (waddr[13:2]),
	.clock (clk),
	.data (data_in[15:12]),
	.wren (we[1]),
	.q (data_out[15:12])
);

//defparam localram3.init_file = "lm_cm_03.mif";
defparam localram3.init_file = "cm_new_aipv4_03.mif";
//defparam localram3.init_file = "cm_final_03.mif";	

RAMB16_S4_2_altera localram4(
	//.aclr (reset),
	.rdaddress (raddr[13:2]),
	.wraddress (waddr[13:2]),
	.clock (clk),
	.data (data_in[19:16]),
	.wren (we[2]),
	.q (data_out[19:16])
);

//defparam localram4.init_file = "lm_cm_04.mif";
defparam localram4.init_file = "cm_new_aipv4_04.mif";
//defparam localram4.init_file = "cm_final_04.mif";	

RAMB16_S4_2_altera localram5(
	//.aclr (reset),
	.rdaddress (raddr[13:2]),
	.wraddress (waddr[13:2]),
	.clock (clk),
	.data (data_in[23:20]),
	.wren (we[2]),
	.q (data_out[23:20])
);

//defparam localram5.init_file = "lm_cm_05.mif";
defparam localram5.init_file = "cm_new_aipv4_05.mif";
//defparam localram5.init_file = "cm_final_05.mif";	

RAMB16_S4_2_altera localram6(
//	.aclr (reset),
	.rdaddress (raddr[13:2]),
	.wraddress (waddr[13:2]),
	.clock (clk),
	.data (data_in[27:24]),
	.wren (we[3]),
	.q (data_out[27:24])
);

//defparam localram6.init_file = "lm_cm_06.mif";
defparam localram6.init_file = "cm_new_aipv4_06.mif";
//defparam localram6.init_file = "cm_final_06.mif";	

RAMB16_S4_2_altera localram7(
//	.aclr (reset),
	.rdaddress (raddr[13:2]),
	.wraddress (waddr[13:2]),
	.clock (clk),
	.data (data_in[31:28]),
	.wren (we[3]),
	.q (data_out[31:28])
);


//defparam localram7.init_file = "lm_cm_07.mif";
defparam localram7.init_file = "cm_new_aipv4_07.mif";
//defparam localram7.init_file = "cm_final_07.mif";	

endmodule
