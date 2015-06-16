//
// Designed by Qiang Wu
//
//	2048 bytes, 64bit interface

`timescale 1ns/1ps

module packet_memory(
	clk,
	input_mode,
	addr64,
	data_in64,
	data_out64,
	byte_we8,
	addr32,
	data_in32,
	data_out32,
	byte_we4
);

input clk;
input input_mode; //1 for 64, 0 for 32
input [10:3] addr64;
input [63:0] data_in64;
output [63:0] data_out64;
input [7:0] byte_we8;
input [10:2] addr32;
input [31:0] data_in32;
output [31:0] data_out32;
input [3:0] byte_we4;

reg [31:0] data_in0;
reg [31:0] data_in1;
reg [31:0] data_in2;
reg [31:0] data_in3;
reg [31:0] data_in4;
reg [31:0] data_in5;
reg [31:0] data_in6;
reg [31:0] data_in7;
reg [63:0] data_out64;
reg [31:0] data_out32;

wire [31:0] data_out0;
wire [31:0] data_out1;
wire [31:0] data_out2;
wire [31:0] data_out3;
wire [31:0] data_out4;
wire [31:0] data_out5;
wire [31:0] data_out6;
wire [31:0] data_out7;

reg [3:0] we0;
reg [3:0] we1;
reg [3:0] we2;
reg [3:0] we3;
reg [3:0] we4;
reg [3:0] we5;
reg [3:0] we6;
reg [3:0] we7;

reg [10:2] addr;

always @(*) begin
	we0 = 0;
	we1 = 0;
	we2 = 0;
	we3 = 0;
	we4 = 0;
	we5 = 0;
	we6 = 0;
	we7 = 0;
	if(input_mode == 1) begin
		addr[10:5] = addr64[10:5];
		case (addr64[4:3])
			2'b00: begin
				data_in0 = data_in64[31:0];
				data_in1 = data_in64[63:32];
				we0 = byte_we8[3:0];
				we1 = byte_we8[7:4];
				data_out64[31:0] = data_out0;
				data_out64[63:32] = data_out1;
			end
			2'b01: begin
				data_in2 = data_in64[31:0];
				data_in3 = data_in64[63:32];
				we2 = byte_we8[3:0];
				we3 = byte_we8[7:4];
				data_out64[31:0] = data_out2;
				data_out64[63:32] = data_out3;
			end
			2'b10: begin
				data_in4 = data_in64[31:0];
				data_in5 = data_in64[63:32];
				we4 = byte_we8[3:0];
				we5 = byte_we8[7:4];
				data_out64[31:0] = data_out4;
				data_out64[63:32] = data_out5;
			end
			2'b11: begin
				data_in6 = data_in64[31:0];
				data_in7 = data_in64[63:32];
				we6 = byte_we8[3:0];
				we7 = byte_we8[7:4];
				data_out64[31:0] = data_out6;
				data_out64[63:32] = data_out7;
			end
		endcase
	end else begin
		addr[10:5] = addr32[10:5];
		case (addr32[4:2])
			3'b000: begin
				data_in0 = data_in32[31:0];
				we0 = byte_we4[3:0];
				data_out32[31:0] = data_out0;
			end
			3'b001: begin
				data_in1 = data_in32[31:0];
				we1 = byte_we4[3:0];
				data_out32[31:0] = data_out1;
			end
			3'b010: begin
				data_in2 = data_in32[31:0];
				we2 = byte_we4[3:0];
				data_out32[31:0] = data_out2;
			end
			3'b011: begin
				data_in3 = data_in32[31:0];
				we3 = byte_we4[3:0];
				data_out32[31:0] = data_out3;
			end
			3'b100: begin
				data_in4 = data_in32[31:0];
				we4 = byte_we4[3:0];
				data_out32[31:0] = data_out4;
			end
			3'b101: begin
				data_in5 = data_in32[31:0];
				we5 = byte_we4[3:0];
				data_out32[31:0] = data_out5;
			end
			3'b110: begin
				data_in6 = data_in32[31:0];
				we6 = byte_we4[3:0];
				data_out32[31:0] = data_out6;
			end
			3'b111: begin
				data_in7 = data_in32[31:0];
				we7 = byte_we4[3:0];
				data_out32[31:0] = data_out7;
			end
		endcase
	end
end

	packet_memory_block pmb0(
		.clk		(clk),
		.we		(we0),
		.addr		(addr[10:5]),
		.data_in	(data_in0),
		.data_out	(data_out0)
	);
	packet_memory_block pmb1(
		.clk		(clk),
		.we		(we1),
		.addr		(addr[10:5]),
		.data_in	(data_in1),
		.data_out	(data_out1)
	);
	packet_memory_block pmb2(
		.clk		(clk),
		.we		(we2),
		.addr		(addr[10:5]),
		.data_in	(data_in2),
		.data_out	(data_out2)
	);
	packet_memory_block pmb3(
		.clk		(clk),
		.we		(we3),
		.addr		(addr[10:5]),
		.data_in	(data_in3),
		.data_out	(data_out3)
	);
	packet_memory_block pmb4(
		.clk		(clk),
		.we		(we4),
		.addr		(addr[10:5]),
		.data_in	(data_in4),
		.data_out	(data_out4)
	);
	packet_memory_block pmb5(
		.clk		(clk),
		.we		(we5),
		.addr		(addr[10:5]),
		.data_in	(data_in5),
		.data_out	(data_out5)
	);
	packet_memory_block pmb6(
		.clk		(clk),
		.we		(we6),
		.addr		(addr[10:5]),
		.data_in	(data_in6),
		.data_out	(data_out6)
	);
	packet_memory_block pmb7(
		.clk		(clk),
		.we		(we7),
		.addr		(addr[10:5]),
		.data_in	(data_in7),
		.data_out	(data_out7)
	);

endmodule
