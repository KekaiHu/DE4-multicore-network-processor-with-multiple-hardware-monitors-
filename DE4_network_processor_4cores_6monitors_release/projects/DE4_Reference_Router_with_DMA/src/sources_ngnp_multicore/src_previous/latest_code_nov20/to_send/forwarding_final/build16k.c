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
BYTE ramslot0[64][64];
BYTE ramslot1[64][64];
BYTE ramslot2[64][64];
BYTE ramslot3[64][64];
BYTE ramslot4[64][64];
BYTE ramslot5[64][64];
BYTE ramslot6[64][64];
BYTE ramslot7[64][64];

main(int argc, char **argv)
{
       BYTE    opcode[4];
       int     fd;
       int     addr = 0;
       ssize_t s;

       int ram0r = 0;
       int ram0c = 63;
       int ram1r = 0;
       int ram1c = 63;
       int ram2r = 0;
       int ram2c = 63;
       int ram3r = 0;
       int ram3c = 63;
       int ram4r = 0;
       int ram4c = 63;
       int ram5r = 0;
       int ram5c = 63;
       int ram6r = 0;
       int ram6c = 63;
       int ram7r = 0;
       int ram7c = 63;
       int i,j;
       for(i = 0; i < 64; i++){
	       for(j = 0; j < 64; j++){
		       ramslot0[i][j] = 0;
		       ramslot1[i][j] = 0;
		       ramslot2[i][j] = 0;
		       ramslot3[i][j] = 0;
		       ramslot4[i][j] = 0;
		       ramslot5[i][j] = 0;
		       ramslot6[i][j] = 0;
		       ramslot7[i][j] = 0;
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

	       ramslot0[ram0r][ram0c] = opcode[3]&0x0F;
	       ramslot1[ram1r][ram1c] = (opcode[3]&0xF0) >> 4;
	       ramslot2[ram2r][ram2c] = opcode[2]&0x0F;
	       ramslot3[ram3r][ram3c] = (opcode[2]&0xF0) >> 4;
	       ramslot4[ram4r][ram4c] = opcode[1]&0x0F;
	       ramslot5[ram5r][ram5c] = (opcode[1]&0xF0) >> 4;
	       ramslot6[ram6r][ram6c] = opcode[0]&0x0F;
	       ramslot7[ram7r][ram7c] = (opcode[0]&0xF0) >> 4;
	       ram0c--;
	       ram1c--;
	       ram2c--;
	       ram3c--;
	       ram4c--;
	       ram5c--;
	       ram6c--;
	       ram7c--;
	       if(ram0c == -1){
	     	ram0r++;
	       	ram1r++;
	       	ram2r++;
	       	ram3r++;
	       	ram4r++;
	       	ram5r++;
	       	ram6r++;
	       	ram7r++;
	       	ram0c = 63;
	       	ram1c = 63;
	       	ram2c = 63;
	       	ram3c = 63;
	       	ram4c = 63;
	       	ram5c = 63;
	       	ram6c = 63;
	       	ram7c = 63;
	       }
       }
	printf("//\n");
	printf("// Designed by Qiang Wu\n");
	printf("//	16K bytes, 32bit interface\n");
	printf("\n");
	printf("`timescale 1ns/1ps\n");
	printf("\n");
	printf("\n");
	printf("module localram\(clk, addr, data_in, data_out, we, en, reset);\n");
	printf("input clk;\n");
	printf("input [13:2] addr;\n");
	printf("input [31:0] data_in;\n");
	printf("output [31:0] data_out;\n");
	printf("input [3:0] we;\n");
	printf("input en;\n");
	printf("input reset;\n");
	printf("\n");


	printf("\n");
	printf("RAMB16_S4 localram0\(\n");
	printf("	.DO     \(data_out[3:0]),\n");
	printf("	.ADDR   \(addr[13:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[3:0]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[0])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram0.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 64; j++){
		       printf("%.1X", ramslot0[i][j]);
	       }
       		printf(";\n");
       }
       printf("\n");


	printf("\n");
	printf("RAMB16_S4 localram1\(\n");
	printf("	.DO     \(data_out[7:4]),\n");
	printf("	.ADDR   \(addr[13:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[7:4]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[0])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram1.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 64; j++){
		       printf("%.1X", ramslot1[i][j]);
	       }
       		printf(";\n");
       }
       printf("\n");


	printf("\n");
	printf("RAMB16_S4 localram2\(\n");
	printf("	.DO     \(data_out[11:8]),\n");
	printf("	.ADDR   \(addr[13:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[11:8]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[1])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram2.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 64; j++){
		       printf("%.1X", ramslot2[i][j]);
	       }
       		printf(";\n");
       }
       printf("\n");


	printf("\n");
	printf("RAMB16_S4 localram3\(\n");
	printf("	.DO     \(data_out[15:12]),\n");
	printf("	.ADDR   \(addr[13:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[15:12]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[1])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram3.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 64; j++){
		       printf("%.1X", ramslot3[i][j]);
	       }
       		printf(";\n");
       }
       printf("\n");


	printf("\n");
	printf("RAMB16_S4 localram4\(\n");
	printf("	.DO     \(data_out[19:16]),\n");
	printf("	.ADDR   \(addr[13:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[19:16]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[2])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram4.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 64; j++){
		       printf("%.1X", ramslot4[i][j]);
	       }
       		printf(";\n");
       }
       printf("\n");


	printf("\n");
	printf("RAMB16_S4 localram5\(\n");
	printf("	.DO     \(data_out[23:20]),\n");
	printf("	.ADDR   \(addr[13:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[23:20]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[2])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram5.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 64; j++){
		       printf("%.1X", ramslot5[i][j]);
	       }
       		printf(";\n");
       }
       printf("\n");


	printf("\n");
	printf("RAMB16_S4 localram6\(\n");
	printf("	.DO     \(data_out[27:24]),\n");
	printf("	.ADDR   \(addr[13:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[27:24]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[3])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram6.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 64; j++){
		       printf("%.1X", ramslot6[i][j]);
	       }
       		printf(";\n");
       }
       printf("\n");


	printf("\n");
	printf("RAMB16_S4 localram7\(\n");
	printf("	.DO     \(data_out[31:28]),\n");
	printf("	.ADDR   \(addr[13:2]),\n");
	printf("	.CLK    \(clk),\n");
	printf("	.DI     \(data_in[31:28]),\n");
	printf("	.EN     \(en),\n");
	printf("	.SSR    \(reset),\n");
	printf("	.WE     \(we[3])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram7.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 64; j++){
		       printf("%.1X", ramslot7[i][j]);
	       }
       		printf(";\n");
       }
       printf("\n");


       printf("\n");
       printf("\n");
       printf("endmodule");
       close(fd);
       return 0;
}

