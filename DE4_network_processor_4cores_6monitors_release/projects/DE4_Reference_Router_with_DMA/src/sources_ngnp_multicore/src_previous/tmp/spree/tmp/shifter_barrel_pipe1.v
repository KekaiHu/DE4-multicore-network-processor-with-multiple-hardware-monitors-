/****************************************************************************
          Shifter unit

Opcode Table:

sign_ext dir 
 0        0    |  ShiftLeft
 0        1    |  ShiftRightLogic
 1        1    |  ShiftRightArith
          
****************************************************************************/
module shifter(
            clk, resetn,
            opB, sa, 
            op, 
            result);
parameter WIDTH=32;

input clk;
input resetn;

input [WIDTH-1:0] opB;
input [4:0] sa;                             // Shift Amount
input [2-1:0] op;

output [WIDTH-1:0] result;


wire sign_ext;
wire shift_direction;
assign sign_ext=op[1];
assign shift_direction=op[0];

wire dum,dum_,dum2;
wire [WIDTH-1:0] partial_result_,partial_result;


lpm_clshift shifter_inst1(
    .data({sign_ext&opB[WIDTH-1],opB}),
    .distance({sa[4:3],3'b0}),
    .direction(shift_direction),
    .result({dum,partial_result}));
defparam 
    shifter_inst1.lpm_width = WIDTH+1,
    shifter_inst1.lpm_widthdist = 5,
    shifter_inst1.lpm_shifttype="ARITHMETIC";

register partial_reg({dum,partial_result},clk,resetn,1'b1,{dum_,partial_result_});
  defparam partial_reg.WIDTH=33;

wire [2:0] sa_2;
wire shift_direction_2;

register secondstage({shift_direction,sa[2:0]},clk,resetn,1'b1,{shift_direction_2, sa_2});
  defparam secondstage.WIDTH=4;

lpm_clshift shifter_inst2(
    .data({dum_,partial_result_}),
    .distance(sa_2[2:0]),
    .direction(shift_direction_2),
    .result({dum2,result}));
defparam 
    shifter_inst2.lpm_width = WIDTH+1,
    shifter_inst2.lpm_widthdist = 3,
    shifter_inst2.lpm_shifttype="ARITHMETIC";

endmodule

