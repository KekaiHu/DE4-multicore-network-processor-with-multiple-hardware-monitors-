
/****************************************************************************
          MUL/DIV unit

Operation table

   op
   0    MULTU
   1    MULT
****************************************************************************/
module mul (clk, resetn,
            opA, opB, 
            op,                 //is_signed
            hi, lo);
parameter WIDTH=32;

input clk;
input resetn;

input [WIDTH-1:0] opA;
input [WIDTH-1:0] opB;
input op;

output [WIDTH-1:0] hi;
output [WIDTH-1:0] lo;

wire is_signed;
assign is_signed=op;

wire dum,dum2;
    lpm_mult	lpm_mult_component (
	    .sclr	(~resetn),
	    .ce		(1'b1),
	    .clk	(clk),
	    .a		({is_signed&opA[WIDTH-1],opA}),
	    .b		({is_signed&opB[WIDTH-1],opB}),
	    .p		({dum2,dum,hi,lo})
    );
/*
    lpm_mult	lpm_mult_component (
        .dataa ({is_signed&opA[WIDTH-1],opA}),
        .datab ({is_signed&opB[WIDTH-1],opB}),
        .clock(clk),
        .aclr(~resetn),
        .clken(1'b1),
        .result ({dum2,dum,hi,lo})
        // synopsys translate_off
        ,
        .sum (1'b0)
        // synopsys translate_on
    );
    defparam
        lpm_mult_component.lpm_widtha = WIDTH+1,
        lpm_mult_component.lpm_widthb = WIDTH+1,
        lpm_mult_component.lpm_widthp = 2*WIDTH+2,
        lpm_mult_component.lpm_widths = 1,
        lpm_mult_component.lpm_pipeline = 1,
        lpm_mult_component.lpm_type = "LPM_MULT",
        lpm_mult_component.lpm_representation = "SIGNED",
        lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=6";
*/
endmodule
