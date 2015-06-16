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
	printf("module localram\(clk, reset, addra, data_ina, data_outa, wea, ena, addrb, data_inb, data_outb, web, enb);\n");
	printf("input clk;\n");
	printf("input [12:2] addra;\n");
	printf("input [12:2] addrb;\n");
	printf("input [31:0] data_ina;\n");
	printf("input [31:0] data_inb;\n");
	printf("output [31:0] data_outa;\n");
	printf("output [31:0] data_outb;\n");
	printf("input [3:0] wea;\n");
	printf("input [3:0] web;\n");
	printf("input ena;\n");
	printf("input enb;\n");
	printf("input reset;\n");
	printf("\n");
	printf("wire dip;\n");
	printf("\n");

	printf("\n");
	printf("RAMB16_S9_S9 localram0\(\n");
	printf("	.DOA    \(data_outa[7:0]),\n");
	printf("	.DOB    \(data_outb[7:0]),\n");
	printf("	.DOPA   \(),\n");
	printf("	.DOPB   \(),\n");
	printf("	.ADDRA  \(addra[12:2]),\n");
	printf("	.ADDRB  \(addrb[12:2]),\n");
	printf("	.CLKA   \(clk),\n");
	printf("	.CLKB   \(clk),\n");
	printf("	.DIA    \(data_ina[7:0]),\n");
	printf("	.DIB    \(data_inb[7:0]),\n");
	printf("	.DIPA   \(dip),\n");
	printf("	.DIPB   \(dip),\n");
	printf("	.ENA    \(ena),\n");
	printf("	.ENB    \(enb),\n");
	printf("	.SSRA   \(reset),\n");
	printf("	.SSRB   \(reset),\n");
	printf("	.WEA    \(wea[0]),\n");
	printf("	.WEB    \(web[0])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram0.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 32; j++){
		       printf("%.2X", ramslot0[i][j]);
	       }
       		printf(";\n");
       }
	printf("\n");
	printf("RAMB16_S9_S9 localram1\(\n");
	printf("	.DOA    \(data_outa[15:8]),\n");
	printf("	.DOB    \(data_outb[15:8]),\n");
	printf("	.DOPA   \(),\n");
	printf("	.DOPB   \(),\n");
	printf("	.ADDRA  \(addra[12:2]),\n");
	printf("	.ADDRB  \(addrb[12:2]),\n");
	printf("	.CLKA   \(clk),\n");
	printf("	.CLKB   \(clk),\n");
	printf("	.DIA    \(data_ina[15:8]),\n");
	printf("	.DIB    \(data_inb[15:8]),\n");
	printf("	.DIPA   \(dip),\n");
	printf("	.DIPB   \(dip),\n");
	printf("	.ENA    \(ena),\n");
	printf("	.ENB    \(enb),\n");
	printf("	.SSRA   \(reset),\n");
	printf("	.SSRB   \(reset),\n");
	printf("	.WEA    \(wea[1]),\n");
	printf("	.WEB    \(web[1])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram1.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 32; j++){
		       printf("%.2X", ramslot1[i][j]);
	       }
       		printf(";\n");
       }
	printf("\n");
	printf("RAMB16_S9_S9 localram2\(\n");
	printf("	.DOA    \(data_outa[23:16]),\n");
	printf("	.DOB    \(data_outb[23:16]),\n");
	printf("	.DOPA   \(),\n");
	printf("	.DOPB   \(),\n");
	printf("	.ADDRA  \(addra[12:2]),\n");
	printf("	.ADDRB  \(addrb[12:2]),\n");
	printf("	.CLKA   \(clk),\n");
	printf("	.CLKB   \(clk),\n");
	printf("	.DIA    \(data_ina[23:16]),\n");
	printf("	.DIB    \(data_inb[23:16]),\n");
	printf("	.DIPA   \(dip),\n");
	printf("	.DIPB   \(dip),\n");
	printf("	.ENA    \(ena),\n");
	printf("	.ENB    \(enb),\n");
	printf("	.SSRA   \(reset),\n");
	printf("	.SSRB   \(reset),\n");
	printf("	.WEA    \(wea[2]),\n");
	printf("	.WEB    \(web[2])\n");
	printf(");\n");
       for(i = 0; i < 64; i++){
	       printf("defparam localram2.INIT_%.2X = 256'h",i);
	       for(j = 0; j < 32; j++){
		       printf("%.2X", ramslot2[i][j]);
	       }
       		printf(";\n");
       }
	printf("\n");
	printf("RAMB16_S9_S9 localram3\(\n");
	printf("	.DOA    \(data_outa[31:24]),\n");
	printf("	.DOB    \(data_outb[31:24]),\n");
	printf("	.DOPA   \(),\n");
	printf("	.DOPB   \(),\n");
	printf("	.ADDRA  \(addra[12:2]),\n");
	printf("	.ADDRB  \(addrb[12:2]),\n");
	printf("	.CLKA   \(clk),\n");
	printf("	.CLKB   \(clk),\n");
	printf("	.DIA    \(data_ina[31:24]),\n");
	printf("	.DIB    \(data_inb[31:24]),\n");
	printf("	.DIPA   \(dip),\n");
	printf("	.DIPB   \(dip),\n");
	printf("	.ENA    \(ena),\n");
	printf("	.ENB    \(enb),\n");
	printf("	.SSRA   \(reset),\n");
	printf("	.SSRB   \(reset),\n");
	printf("	.WEA    \(wea[3]),\n");
	printf("	.WEB    \(web[3])\n");
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

