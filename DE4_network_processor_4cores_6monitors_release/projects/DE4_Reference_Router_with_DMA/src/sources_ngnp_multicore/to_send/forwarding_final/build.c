// zpuromgen.c
//
// Program to turn a binary file into a VHDL lookup table.
//   by Adam Pierce
//   29-Feb-2008
//
// This software is free to use by anyone for any purpose.
//

#include <unistd.h>
#include <stdio.h>

typedef unsigned char BYTE;
BYTE ramslot0[64][32];
BYTE ramslot1[64][32];
BYTE ramslot2[64][32];
BYTE ramslot3[64][32];

main(int argc, char **argv)
{
       BYTE    opcode[4];
       int     fd;
       int     addr = 0;
       ssize_t s;

       int ram0r = 0;
       int ram0c = 31;
       int ram1r = 0;
       int ram1c = 31;
       int ram2r = 0;
       int ram2c = 31;
       int ram3r = 0;
       int ram3c = 31;
       int i,j;
       for(i = 0; i < 64; i++){
	       for(j = 0; j < 32; j++){
		       ramslot0[i][j] = 0;
		       ramslot1[i][j] = 0;
		       ramslot2[i][j] = 0;
		       ramslot3[i][j] = 0;
	       }
       }
// Check the user has given us an input file.
       if(argc < 2)
       {
               printf("Usage: %s <binary_file>\n\n", argv[0]);
               return 1;
       }

// Open the input file.
       fd = open(argv[1], 0);
       if(fd == -1)
       {
               perror("File Open");
               return 2;
       }

       while(1)
       {
       // Read 32 bits.
               s = read(fd, opcode, 4);
               if(s == -1)
               {
                       perror("File read");
                       return 3;
               }

               if(s == 0)
                       break; // End of file.

	       ramslot0[ram0r][ram0c] = opcode[3];
	       ramslot1[ram1r][ram1c] = opcode[2];
	       ramslot2[ram2r][ram2c] = opcode[1];
	       ramslot3[ram3r][ram3c] = opcode[0];
	       ram0c--;
	       ram1c--;
	       ram2c--;
	       ram3c--;
	       if(ram0c == -1){
	     	ram0r++;
	       	ram1r++;
	       	ram2r++;
	       	ram3r++;
	       	ram0c = 31;
	       	ram1c = 31;
	       	ram2c = 31;
	       	ram3c = 31;
	       }
       }
	printf("//\n");
	printf("// Designed by Qiang Wu\n");
	printf("//	8192 bytes, 32bit interface\n");
	printf("\n");
	printf("`timescale 1ns/1ps\n");
	printf("\n");
	printf("\n");
	printf("module localram\(clk, addr, data_in, data_out, we, en, reset);\n");
	printf("input clk;\n");
	printf("input [12:2] addr;\n");
	printf("input [31:0] data_in;\n");
	printf("output [31:0] data_out;\n");
	printf("input [3:0] we;\n");
	printf("input en;\n");
	printf("input reset;\n");
	printf("\n");
	printf("wire [3:0] dip;\n");
	printf("\n");

	printf("\n");
	printf("RAMB16_S9 localram0\(\n");
	printf("	.DO     \(data_out[7:0]),\n");
	printf("	.DOP    \(),\n");
	printf("	.ADDR   \(addr[12:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[7:0]),\n");
	printf("	.DIP    \(dip[0]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[0])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram0.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 32; j++){
		       printf("%.2X", ramslot0[i][j]);
	       }
       		printf(";\n");
       }
	printf("\n");
	printf("RAMB16_S9 localram1\(\n");
	printf("	.DO     \(data_out[15:8]),\n");
	printf("	.DOP    \(),\n");
	printf("	.ADDR   \(addr[12:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[15:8]),\n");
	printf("	.DIP    \(dip[1]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[1])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram1.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 32; j++){
		       printf("%.2X", ramslot1[i][j]);
	       }
       		printf(";\n");
       }
	printf("\n");
	printf("RAMB16_S9 localram2\(\n");
	printf("	.DO     \(data_out[23:16]),\n");
	printf("	.DOP    \(),\n");
	printf("	.ADDR   \(addr[12:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[23:16]),\n");
	printf("	.DIP    \(dip[2]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[2])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram2.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 32; j++){
		       printf("%.2X", ramslot2[i][j]);
	       }
       		printf(";\n");
       }
	printf("\n");
	printf("RAMB16_S9 localram3\(\n");
	printf("	.DO     \(data_out[31:24]),\n");
	printf("	.DOP    \(),\n");
	printf("	.ADDR   \(addr[12:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[31:24]),\n");
	printf("	.DIP    \(dip[3]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[3])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram3.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 32; j++){
		       printf("%.2X", ramslot3[i][j]);
	       }
       		printf(";\n");
       }
       printf("\n");
       printf("endmodule");
       close(fd);
       return 0;
}

