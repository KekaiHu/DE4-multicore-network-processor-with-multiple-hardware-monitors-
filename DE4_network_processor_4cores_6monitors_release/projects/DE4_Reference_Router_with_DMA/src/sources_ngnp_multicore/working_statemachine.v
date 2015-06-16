module state_machine(
input clk,
input [3:0] four_bit_hash,
input new_inst_signal,
input reset,
output packet_drop_signal
);


reg [10:0] state_reg,next_state;
reg packet_drop_signal_register,packet_drop_signal_out;
	//`define 1000 = 1000;

	always @(posedge clk) begin	
		if (reset) begin
			state_reg <= 999; // initialize state reg to idle
			packet_drop_signal_out = 0;
		end
		else begin
			if(new_inst_signal)begin
				state_reg <= next_state;	
				packet_drop_signal_out = packet_drop_signal_register;
			end
		end
	end 

	always@(*)begin

case(state_reg) 
999:begin if(four_bit_hash == 3) begin next_state = 0; end else begin next_state = 1000; end end
0: begin if(four_bit_hash == 0) begin next_state = 1; end else begin next_state = 1000; end end 
1: begin if(four_bit_hash == 7) begin next_state = 2; end else begin next_state = 1000; end end 
2: begin if(four_bit_hash == 11) begin next_state = 3; end else begin next_state = 1000; end end 
3: begin if(four_bit_hash == 5) begin next_state = 4; end else begin next_state = 1000; end end 
4: begin if(four_bit_hash == 7) begin next_state = 5; end else begin next_state = 1000; end end 
5: begin if(four_bit_hash == 6) begin next_state = 6; end else begin next_state = 1000; end end 
6: begin if(four_bit_hash == 10) begin next_state = 7; end else begin next_state = 1000; end end 
7: begin if(four_bit_hash == 8) begin next_state = 8; end else begin next_state = 1000; end end 
8: begin if(four_bit_hash == 5) begin next_state = 9; end else begin next_state = 1000; end end 
9: begin if(four_bit_hash == 5) begin next_state = 10; end else begin next_state = 1000; end end 
10: begin if(four_bit_hash == 8) begin next_state = 11; end else begin next_state = 1000; end end // 0034
11: begin if(four_bit_hash == 0) begin next_state = 12; end else begin next_state = 1000; end end 
12: begin if(four_bit_hash == 5) begin next_state = 13; end else begin next_state = 1000; end end 
13: begin if(four_bit_hash == 5) begin next_state = 14; end else begin next_state = 1000; end end 
14: begin if(four_bit_hash == 5) begin next_state = 15; end else begin next_state = 1000; end end 
15: begin if(four_bit_hash == 6) begin next_state = 16; end else begin next_state = 1000; end end 
16: begin if(four_bit_hash == 0) begin next_state = 17; end else begin next_state = 1000; end end 
17: begin if(four_bit_hash == 5) begin next_state = 18; end else begin next_state = 1000; end end 
18: begin if(four_bit_hash == 15) begin next_state = 19; end else begin next_state = 1000; end end 
19: begin if(four_bit_hash == 10) begin next_state = 22; end else begin next_state = 1000; end end // 16c
//20: begin if(four_bit_hash == 10) begin next_state = 22; end else begin next_state = 1000; end end 
//21: begin if(four_bit_hash == 10) begin next_state = 22; end else begin next_state = 1000; end end 
22: begin if(four_bit_hash == 9) begin next_state = 23; end else begin next_state = 1000; end end 
23: begin if(four_bit_hash == 3) begin next_state = 24; end else begin next_state = 1000; end end 
24: begin if(four_bit_hash == 0) begin next_state = 25; end else begin next_state = 1000; end end 
25: begin if(four_bit_hash == 9) begin next_state = 26; end else begin next_state = 1000; end end 
26: begin if(four_bit_hash == 7) begin next_state = 27; end else begin next_state = 1000; end end 
27: begin if(four_bit_hash == 6) begin next_state = 29; end else begin next_state = 1000; end end 
//28: begin if(four_bit_hash == 12) begin next_state = 29; end else begin next_state = 1000; end end 
29: begin if(four_bit_hash == 5) begin next_state = 30; end else begin next_state = 1000; end end 
30: begin if(four_bit_hash == 0) begin next_state = 31; end else begin next_state = 1000; end end 
31: begin if(four_bit_hash == 8) begin next_state = 32; end else begin next_state = 1000; end end 
32: begin if(four_bit_hash == 7) begin next_state = 33; end else begin next_state = 1000; end end // 1a0
33: begin if(four_bit_hash == 3) begin next_state = 34; end else begin next_state = 1000; end end 
34: begin if(four_bit_hash == 4) begin next_state = 35; end else begin next_state = 1000; end end 
35: begin if(four_bit_hash == 11) begin next_state = 100; end else begin next_state = 1000; end end 
100: begin if(four_bit_hash == 11) begin next_state = 36; end else begin next_state = 1000; end end 
36: begin if(four_bit_hash == 0) begin next_state = 37; end else begin next_state = 1000; end end 
37: begin if(four_bit_hash == 11) begin next_state = 38; end else begin next_state = 1000; end end 
38: begin if(four_bit_hash == 0) begin next_state = 39; end else begin next_state = 1000; end end 
39: begin if(four_bit_hash == 9) begin next_state = 40; end else begin next_state = 1000; end end 
40: begin if(four_bit_hash == 6) begin next_state = 41; end else begin next_state = 1000; end end 
41: begin if(four_bit_hash == 0) begin next_state = 42; end else begin next_state = 1000; end end 
42: begin if(four_bit_hash == 5) begin next_state = 43; end else begin next_state = 1000; end end 
43: begin if(four_bit_hash == 0) begin next_state = 44; end else begin next_state = 1000; end end 
44: begin if(four_bit_hash == 8) begin next_state = 45; end else begin next_state = 1000; end end 
45: begin if(four_bit_hash == 7) begin next_state = 46; end else begin next_state = 1000; end end 
46: begin if(four_bit_hash == 3) begin next_state = 47; end else begin next_state = 1000; end end 
47: begin if(four_bit_hash == 12) begin next_state = 48; end else begin next_state = 1000; end end 
48: begin if(four_bit_hash == 4) begin next_state = 49; end else begin next_state = 1000; end end 
49: begin if(four_bit_hash == 10) begin next_state = 50; end else begin next_state = 1000; end end 
50: begin if(four_bit_hash == 9) begin next_state = 51; end else begin next_state = 1000; end end 
51: begin if(four_bit_hash == 0) begin next_state = 52; end else begin next_state = 1000; end end 
52: begin if(four_bit_hash == 4) begin next_state = 53; end else begin next_state = 1000; end end 
53: begin if(four_bit_hash == 0) begin next_state = 54; end else begin next_state = 1000; end end 
54: begin if(four_bit_hash == 13) begin next_state = 55; end else begin next_state = 1000; end end 
55: begin if(four_bit_hash == 8) begin next_state = 56; end else begin next_state = 1000; end end 
56: begin if(four_bit_hash == 9) begin next_state = 57; end else begin next_state = 1000; end end 
57: begin if(four_bit_hash == 0) begin next_state = 58; end else begin next_state = 1000; end end 
58: begin if(four_bit_hash == 7) begin next_state = 200; end else begin next_state = 1000; end end 
200: begin if(four_bit_hash == 7) begin next_state = 59; end else begin next_state = 1000; end end 
59: begin if(four_bit_hash == 4) begin next_state = 60; end else begin next_state = 1000; end end 
60: begin if(four_bit_hash == 7) begin next_state = 300; end else begin next_state = 1000; end end 
300: begin if(four_bit_hash == 7) begin next_state = 61; end else begin next_state = 1000; end end 
61: begin if(four_bit_hash == 0) begin next_state = 62; end else begin next_state = 1000; end end 
62: begin if(four_bit_hash == 3) begin next_state = 63; end else begin next_state = 1000; end end 
63: begin if(four_bit_hash == 0) begin next_state = 64; end else begin next_state = 1000; end end 
64: begin if(four_bit_hash == 9) begin next_state = 65; end else begin next_state = 1000; end end  // the end

/*
0: begin if(four_bit_hash == 0) begin next_state = 1; end else begin next_state = 1000; end end 
1: begin if(four_bit_hash == 4) begin next_state = 2; end else begin next_state = 1000; end end 
2: begin if(four_bit_hash == 0) begin next_state = 3; end else begin next_state = 1000; end end 
3: begin if(four_bit_hash == 12) begin next_state = 4; end else begin next_state = 1000; end end 
4: begin if(four_bit_hash == 8) begin next_state = 5; end else begin next_state = 1000; end end 
5: begin if(four_bit_hash == 3) begin next_state = 6; end else begin next_state = 1000; end end 
6: begin if(four_bit_hash == 12) begin next_state = 7; end else begin next_state = 1000; end end 
7: begin if(four_bit_hash == 4) begin next_state = 8; end else begin next_state = 1000; end end 
8: begin if(four_bit_hash == 3) begin next_state = 9; end else begin next_state = 1000; end end 
9: begin if(four_bit_hash == 13) begin next_state = 10; end else begin next_state = 1000; end end 
10: begin if(four_bit_hash == 9) begin next_state = 11; end else begin next_state = 1000; end end 
11: begin if(four_bit_hash == 14) begin next_state = 12; end else begin next_state = 1000; end end 
12: begin if(four_bit_hash == 2) begin next_state = 13; end else begin next_state = 1000; end end 
13: begin if(four_bit_hash == 5) begin next_state = 14; end else begin next_state = 1000; end end 
14: begin if(four_bit_hash == 6) begin next_state = 15; end else begin next_state = 1000; end end 
15: begin if(four_bit_hash == 0) begin next_state = 16; end else begin next_state = 1000; end end 
16: begin if(four_bit_hash == 10) begin next_state = 17; end else begin next_state = 1000; end end 
17: begin if(four_bit_hash == 10) begin next_state = 18; end else begin next_state = 1000; end end 
18: begin if(four_bit_hash == 0) begin next_state = 19; end else begin next_state = 1000; end end 
19: begin if(four_bit_hash == 13) begin next_state = 20; end else begin next_state = 1000; end end 
20: begin if(four_bit_hash == 8) begin next_state = 21; end else begin next_state = 1000; end end 
21: begin if(four_bit_hash == 4) begin next_state = 22; end else begin next_state = 1000; end end 
22: begin if(four_bit_hash == 9) begin next_state = 23; end else begin next_state = 1000; end end 
23: begin if(four_bit_hash == 7) begin next_state = 24; end else begin next_state = 1000; end end 
24: begin if(four_bit_hash == 12) begin next_state = 25; end else begin next_state = 1000; end end 
25: begin if(four_bit_hash == 1) begin next_state = 26; end else begin next_state = 1000; end end 
26: begin if(four_bit_hash == 6) begin next_state = 27; end else begin next_state = 1000; end end 
27: begin if(four_bit_hash == 12) begin next_state = 28; end else begin next_state = 1000; end end 
28: begin if(four_bit_hash == 1) begin next_state = 29; end else begin next_state = 1000; end end 
29: begin if(four_bit_hash == 6) begin next_state = 30; end else begin next_state = 1000; end end 
30: begin if(four_bit_hash == 11) begin next_state = 31; end else begin next_state = 1000; end end 
31: begin if(four_bit_hash == 1) begin next_state = 32; end else begin next_state = 1000; end end 
32: begin if(four_bit_hash == 6) begin next_state = 33; end else begin next_state = 1000; end end 
33: begin if(four_bit_hash == 13) begin next_state = 34; end else begin next_state = 1000; end end 
34: begin if(four_bit_hash == 0) begin next_state = 35; end else begin next_state = 1000; end end 
35: begin if(four_bit_hash == 6) begin next_state = 36; end else begin next_state = 1000; end end 
36: begin if(four_bit_hash == 12) begin next_state = 37; end else begin next_state = 1000; end end 
37: begin if(four_bit_hash == 1) begin next_state = 38; end else begin next_state = 1000; end end 
38: begin if(four_bit_hash == 6) begin next_state = 39; end else begin next_state = 1000; end end 
39: begin if(four_bit_hash == 12) begin next_state = 40; end else begin next_state = 1000; end end 
40: begin if(four_bit_hash == 1) begin next_state = 41; end else begin next_state = 1000; end end 
41: begin if(four_bit_hash == 6) begin next_state = 42; end else begin next_state = 1000; end end 
42: begin if(four_bit_hash == 11) begin next_state = 43; end else begin next_state = 1000; end end 
43: begin if(four_bit_hash == 1) begin next_state = 44; end else begin next_state = 1000; end end 
44: begin if(four_bit_hash == 6) begin next_state = 45; end else begin next_state = 1000; end end 
45: begin if(four_bit_hash == 11) begin next_state = 46; end else begin next_state = 1000; end end 
46: begin if(four_bit_hash == 5) begin next_state = 47; end else begin next_state = 1000; end end 
47: begin if(four_bit_hash == 2) begin next_state = 48; end else begin next_state = 1000; end end 
48: begin if(four_bit_hash == 0) begin next_state = 49; end else begin next_state = 1000; end end 
49: begin if(four_bit_hash == 2) begin next_state = 50; end else begin next_state = 1000; end end 
50: begin if(four_bit_hash == 7) begin next_state = 51; end else begin next_state = 1000; end end 
51: begin if(four_bit_hash == 5) begin next_state = 52; end else begin next_state = 1000; end end 
52: begin if(four_bit_hash == 10) begin next_state = 53; end else begin next_state = 1000; end end 
53: begin if(four_bit_hash == 15) begin next_state = 54; end else begin next_state = 1000; end end 
54: begin if(four_bit_hash == 4) begin next_state = 55; end else begin next_state = 1000; end end 
55: begin if(four_bit_hash == 10) begin next_state = 56; end else begin next_state = 1000; end end 
56: begin if(four_bit_hash == 15) begin next_state = 57; end else begin next_state = 1000; end end 
57: begin if(four_bit_hash == 4) begin next_state = 58; end else begin next_state = 1000; end end 
58: begin if(four_bit_hash == 9) begin next_state = 59; end else begin next_state = 1000; end end 
59: begin if(four_bit_hash == 15) begin next_state = 60; end else begin next_state = 1000; end end 
60: begin if(four_bit_hash == 4) begin next_state = 61; end else begin next_state = 1000; end end 
61: begin if(four_bit_hash == 11) begin next_state = 62; end else begin next_state = 1000; end end 
62: begin if(four_bit_hash == 14) begin next_state = 63; end else begin next_state = 1000; end end 
63: begin if(four_bit_hash == 4) begin next_state = 64; end else begin next_state = 1000; end end 
64: begin if(four_bit_hash == 10) begin next_state = 65; end else begin next_state = 1000; end end 
65: begin if(four_bit_hash == 15) begin next_state = 66; end else begin next_state = 1000; end end 
66: begin if(four_bit_hash == 4) begin next_state = 67; end else begin next_state = 1000; end end 
67: begin if(four_bit_hash == 10) begin next_state = 68; end else begin next_state = 1000; end end 
68: begin if(four_bit_hash == 15) begin next_state = 69; end else begin next_state = 1000; end end 
69: begin if(four_bit_hash == 4) begin next_state = 70; end else begin next_state = 1000; end end 
70: begin if(four_bit_hash == 9) begin next_state = 71; end else begin next_state = 1000; end end 
71: begin if(four_bit_hash == 15) begin next_state = 72; end else begin next_state = 1000; end end 
72: begin if(four_bit_hash == 4) begin next_state = 73; end else begin next_state = 1000; end end 
73: begin if(four_bit_hash == 9) begin next_state = 74; end else begin next_state = 1000; end end 
74: begin if(four_bit_hash == 3) begin next_state = 75; end else begin next_state = 1000; end end 
75: begin if(four_bit_hash == 8) begin next_state = 76; end else begin next_state = 1000; end end 
76: begin if(four_bit_hash == 3) begin next_state = 77; end else begin next_state = 1000; end end 
77: begin if(four_bit_hash == 7) begin next_state = 78; end else begin next_state = 1000; end end 
78: begin if(four_bit_hash == 1) begin next_state = 79; end else begin next_state = 1000; end end 
79: begin if(four_bit_hash == 13) begin next_state = 80; end else begin next_state = 1000; end end 
80: begin if(four_bit_hash == 6) begin next_state = 81; end else begin next_state = 1000; end end 
81: begin if(four_bit_hash == 6) begin next_state = 82; end else begin next_state = 1000; end end 
82: begin if(four_bit_hash == 15) begin next_state = 83; end else begin next_state = 1000; end end 
83: begin if(four_bit_hash == 8) begin next_state = 84; end else begin next_state = 1000; end end 
84: begin if(four_bit_hash == 4) begin next_state = 85; end else begin next_state = 1000; end end 
85: begin if(four_bit_hash == 9) begin next_state = 86; end else begin next_state = 1000; end end 
86: begin if(four_bit_hash == 9) begin next_state = 87; end else begin next_state = 1000; end end 
87: begin if(four_bit_hash == 0) begin next_state = 88; end else begin next_state = 1000; end end 
88: begin if(four_bit_hash == 3) begin next_state = 89; end else begin next_state = 1000; end end 
89: begin if(four_bit_hash == 9) begin next_state = 90; end else begin next_state = 1000; end end 
90: begin if(four_bit_hash == 15) begin next_state = 91; end else begin next_state = 1000; end end 
91: begin if(four_bit_hash == 4) begin next_state = 92; end else begin next_state = 1000; end end 
92: begin if(four_bit_hash == 9) begin next_state = 93; end else begin next_state = 1000; end end 
93: begin if(four_bit_hash == 6) begin next_state = 94; end else begin next_state = 1000; end end 
94: begin if(four_bit_hash == 10) begin next_state = 95; end else begin next_state = 1000; end end 
95: begin if(four_bit_hash == 7) begin next_state = 96; end else begin next_state = 1000; end end 
96: begin if(four_bit_hash == 3) begin next_state = 97; end else begin next_state = 1000; end end 
97: begin if(four_bit_hash == 14) begin next_state = 98; end else begin next_state = 1000; end end 
98: begin if(four_bit_hash == 2) begin next_state = 99; end else begin next_state = 1000; end end 
99: begin if(four_bit_hash == 2) begin next_state = 100; end else begin next_state = 1000; end end 
100: begin if(four_bit_hash == 10) begin next_state = 101; end else begin next_state = 1000; end end 
101: begin if(four_bit_hash == 0) begin next_state = 102; end else begin next_state = 1000; end end 
102: begin if(four_bit_hash == 3) begin next_state = 103; end else begin next_state = 1000; end end 
103: begin if(four_bit_hash == 1) begin next_state = 104; end else begin next_state = 1000; end end 
104: begin if(four_bit_hash == 0) begin next_state = 105; end else begin next_state = 1000; end end 
105: begin if(four_bit_hash == 9) begin next_state = 106; end else begin next_state = 1000; end end 
106: begin if(four_bit_hash == 12) begin next_state = 107; end else begin next_state = 1000; end end 
107: begin if(four_bit_hash == 11) begin next_state = 108; end else begin next_state = 1000; end end 
108: begin if(four_bit_hash == 0) begin next_state = 109; end else begin next_state = 1000; end end 
109: begin if(four_bit_hash == 8) begin next_state = 110; end else begin next_state = 1000; end end 
110: begin if(four_bit_hash == 0) begin next_state = 111; end else begin next_state = 1000; end end 
111: begin if(four_bit_hash == 9) begin next_state = 112; end else begin next_state = 1000; end end 
112: begin if(four_bit_hash == 2) begin next_state = 113; end else begin next_state = 1000; end end 
113: begin if(four_bit_hash == 10) begin next_state = 114; end else begin next_state = 1000; end end 
114: begin if(four_bit_hash == 10) begin next_state = 115; end else begin next_state = 1000; end end 
115: begin if(four_bit_hash == 0) begin next_state = 116; end else begin next_state = 1000; end end 
116: begin if(four_bit_hash == 3) begin next_state = 117; end else begin next_state = 1000; end end 
117: begin if(four_bit_hash == 1) begin next_state = 118; end else begin next_state = 1000; end end 
118: begin if(four_bit_hash == 0) begin next_state = 119; end else begin next_state = 1000; end end 
119: begin if(four_bit_hash == 7) begin next_state = 120; end else begin next_state = 1000; end end 
120: begin if(four_bit_hash == 7) begin next_state = 121; end else begin next_state = 1000; end end 
121: begin if(four_bit_hash == 11) begin next_state = 122; end else begin next_state = 1000; end end 
122: begin if(four_bit_hash == 9) begin next_state = 123; end else begin next_state = 1000; end end 
123: begin if(four_bit_hash == 0) begin next_state = 124; end else begin next_state = 1000; end end 
124: begin if(four_bit_hash == 1) begin next_state = 125; end else begin next_state = 1000; end end 
125: begin if(four_bit_hash == 0) begin next_state = 126; end else begin next_state = 1000; end end 
126: begin if(four_bit_hash == 2) begin next_state = 127; end else begin next_state = 1000; end end 
127: begin if(four_bit_hash == 3) begin next_state = 128; end else begin next_state = 1000; end end 
128: begin if(four_bit_hash == 10) begin next_state = 129; end else begin next_state = 1000; end end 
129: begin if(four_bit_hash == 0) begin next_state = 130; end else begin next_state = 1000; end end 
130: begin if(four_bit_hash == 3) begin next_state = 131; end else begin next_state = 1000; end end 
131: begin if(four_bit_hash == 1) begin next_state = 132; end else begin next_state = 1000; end end 
132: begin if(four_bit_hash == 0) begin next_state = 133; end else begin next_state = 1000; end end 
133: begin if(four_bit_hash == 5) begin next_state = 134; end else begin next_state = 1000; end end 
134: begin if(four_bit_hash == 5) begin next_state = 135; end else begin next_state = 1000; end end 
135: begin if(four_bit_hash == 2) begin next_state = 136; end else begin next_state = 1000; end end 
136: begin if(four_bit_hash == 7) begin next_state = 137; end else begin next_state = 1000; end end 
137: begin if(four_bit_hash == 10) begin next_state = 138; end else begin next_state = 1000; end end 
138: begin if(four_bit_hash == 0) begin next_state = 139; end else begin next_state = 1000; end end 
139: begin if(four_bit_hash == 3) begin next_state = 140; end else begin next_state = 1000; end end 
140: begin if(four_bit_hash == 1) begin next_state = 141; end else begin next_state = 1000; end end 
141: begin if(four_bit_hash == 0) begin next_state = 142; end else begin next_state = 1000; end end 
142: begin if(four_bit_hash == 9) begin next_state = 143; end else begin next_state = 1000; end end 
143: begin if(four_bit_hash == 4) begin next_state = 144; end else begin next_state = 1000; end end 
144: begin if(four_bit_hash == 3) begin next_state = 145; end else begin next_state = 1000; end end 
145: begin if(four_bit_hash == 0) begin next_state = 146; end else begin next_state = 1000; end end 
146: begin if(four_bit_hash == 7) begin next_state = 147; end else begin next_state = 1000; end end 
147: begin if(four_bit_hash == 9) begin next_state = 148; end else begin next_state = 1000; end end 
148: begin if(four_bit_hash == 8) begin next_state = 149; end else begin next_state = 1000; end end 
149: begin if(four_bit_hash == 2) begin next_state = 150; end else begin next_state = 1000; end end 
150: begin if(four_bit_hash == 0) begin next_state = 151; end else begin next_state = 1000; end end 
151: begin if(four_bit_hash == 12) begin next_state = 152; end else begin next_state = 1000; end end 
152: begin if(four_bit_hash == 0) begin next_state = 153; end else begin next_state = 1000; end end 
153: begin if(four_bit_hash == 11) begin next_state = 154; end else begin next_state = 1000; end end 
154: begin if(four_bit_hash == 9) begin next_state = 155; end else begin next_state = 1000; end end 
155: begin if(four_bit_hash == 15) begin next_state = 156; end else begin next_state = 1000; end end 
156: begin if(four_bit_hash == 14) begin next_state = 157; end else begin next_state = 1000; end end 
157: begin if(four_bit_hash == 0) begin next_state = 158; end else begin next_state = 1000; end end 
158: begin if(four_bit_hash == 14) begin next_state = 159; end else begin next_state = 1000; end end 
159: begin if(four_bit_hash == 6) begin next_state = 160; end else begin next_state = 1000; end end 
160: begin if(four_bit_hash == 1) begin next_state = 161; end else begin next_state = 1000; end end 
161: begin if(four_bit_hash == 0) begin next_state = 162; end else begin next_state = 1000; end end 
162: begin if(four_bit_hash == 9) begin next_state = 163; end else begin next_state = 1000; end end 
163: begin if(four_bit_hash == 3) begin next_state = 164; end else begin next_state = 1000; end end 
164: begin if(four_bit_hash == 14) begin next_state = 165; end else begin next_state = 1000; end end 
165: begin if(four_bit_hash == 0) begin next_state = 166; end else begin next_state = 1000; end end 
166: begin if(four_bit_hash == 14) begin next_state = 167; end else begin next_state = 1000; end end 
167: begin if(four_bit_hash == 1) begin next_state = 168; end else begin next_state = 1000; end end 
168: begin if(four_bit_hash == 13) begin next_state = 169; end else begin next_state = 1000; end end 
169: begin if(four_bit_hash == 6) begin next_state = 170; end else begin next_state = 1000; end end 
170: begin if(four_bit_hash == 2) begin next_state = 171; end else begin next_state = 1000; end end 
171: begin if(four_bit_hash == 12) begin next_state = 172; end else begin next_state = 1000; end end 
172: begin if(four_bit_hash == 0) begin next_state = 173; end else begin next_state = 1000; end end 
173: begin if(four_bit_hash == 14) begin next_state = 174; end else begin next_state = 1000; end end 
174: begin if(four_bit_hash == 10) begin next_state = 175; end else begin next_state = 1000; end end 
175: begin if(four_bit_hash == 0) begin next_state = 176; end else begin next_state = 1000; end end 
176: begin if(four_bit_hash == 7) begin next_state = 177; end else begin next_state = 1000; end end 
177: begin if(four_bit_hash == 15) begin next_state = 178; end else begin next_state = 1000; end end 
178: begin if(four_bit_hash == 6) begin next_state = 179; end else begin next_state = 1000; end end 
179: begin if(four_bit_hash == 2) begin next_state = 180; end else begin next_state = 1000; end end 
180: begin if(four_bit_hash == 12) begin next_state = 181; end else begin next_state = 1000; end end 
181: begin if(four_bit_hash == 0) begin next_state = 182; end else begin next_state = 1000; end end 
182: begin if(four_bit_hash == 14) begin next_state = 183; end else begin next_state = 1000; end end 
183: begin if(four_bit_hash == 10) begin next_state = 184; end else begin next_state = 1000; end end 
184: begin if(four_bit_hash == 0) begin next_state = 185; end else begin next_state = 1000; end end 
185: begin if(four_bit_hash == 7) begin next_state = 186; end else begin next_state = 1000; end end 
186: begin if(four_bit_hash == 3) begin next_state = 187; end else begin next_state = 1000; end end 
187: begin if(four_bit_hash == 14) begin next_state = 188; end else begin next_state = 1000; end end 
188: begin if(four_bit_hash == 0) begin next_state = 189; end else begin next_state = 1000; end end 
189: begin if(four_bit_hash == 15) begin next_state = 190; end else begin next_state = 1000; end end 
190: begin if(four_bit_hash == 1) begin next_state = 191; end else begin next_state = 1000; end end 
191: begin if(four_bit_hash == 0) begin next_state = 192; end else begin next_state = 1000; end end 
192: begin if(four_bit_hash == 4) begin next_state = 193; end else begin next_state = 1000; end end 
193: begin if(four_bit_hash == 0) begin next_state = 194; end else begin next_state = 1000; end end 
194: begin if(four_bit_hash == 9) begin next_state = 195; end else begin next_state = 1000; end end 
195: begin if(four_bit_hash == 13) begin next_state = 196; end else begin next_state = 1000; end end 
196: begin if(four_bit_hash == 13) begin next_state = 197; end else begin next_state = 1000; end end 
197: begin if(four_bit_hash == 0) begin next_state = 198; end else begin next_state = 1000; end end 
198: begin if(four_bit_hash == 7) begin next_state = 199; end else begin next_state = 1000; end end 
199: begin if(four_bit_hash == 15) begin next_state = 200; end else begin next_state = 1000; end end 
200: begin if(four_bit_hash == 2) begin next_state = 201; end else begin next_state = 1000; end end 
201: begin if(four_bit_hash == 10) begin next_state = 202; end else begin next_state = 1000; end end 
202: begin if(four_bit_hash == 0) begin next_state = 203; end else begin next_state = 1000; end end 
203: begin if(four_bit_hash == 1) begin next_state = 204; end else begin next_state = 1000; end end 
204: begin if(four_bit_hash == 0) begin next_state = 205; end else begin next_state = 1000; end end 
205: begin if(four_bit_hash == 13) begin next_state = 206; end else begin next_state = 1000; end end 
206: begin if(four_bit_hash == 0) begin next_state = 207; end else begin next_state = 1000; end end 
207: begin if(four_bit_hash == 0) begin next_state = 208; end else begin next_state = 1000; end end 
208: begin if(four_bit_hash == 1) begin next_state = 209; end else begin next_state = 1000; end end 
209: begin if(four_bit_hash == 3) begin next_state = 210; end else begin next_state = 1000; end end 
210: begin if(four_bit_hash == 15) begin next_state = 211; end else begin next_state = 1000; end end 
211: begin if(four_bit_hash == 0) begin next_state = 212; end else begin next_state = 1000; end end 
212: begin if(four_bit_hash == 14) begin next_state = 213; end else begin next_state = 1000; end end 
213: begin if(four_bit_hash == 7) begin next_state = 214; end else begin next_state = 1000; end end 
214: begin if(four_bit_hash == 0) begin next_state = 215; end else begin next_state = 1000; end end 
215: begin if(four_bit_hash == 6) begin next_state = 216; end else begin next_state = 1000; end end 
216: begin if(four_bit_hash == 0) begin next_state = 217; end else begin next_state = 1000; end end 
217: begin if(four_bit_hash == 13) begin next_state = 218; end else begin next_state = 1000; end end 
218: begin if(four_bit_hash == 8) begin next_state = 219; end else begin next_state = 1000; end end 
219: begin if(four_bit_hash == 6) begin next_state = 220; end else begin next_state = 1000; end end 
220: begin if(four_bit_hash == 0) begin next_state = 221; end else begin next_state = 1000; end end 
221: begin if(four_bit_hash == 11) begin next_state = 222; end else begin next_state = 1000; end end 
222: begin if(four_bit_hash == 6) begin next_state = 223; end else begin next_state = 1000; end end 
223: begin if(four_bit_hash == 0) begin next_state = 224; end else begin next_state = 1000; end end 
224: begin if(four_bit_hash == 9) begin next_state = 225; end else begin next_state = 1000; end end 
225: begin if(four_bit_hash == 0) begin next_state = 226; end else begin next_state = 1000; end end 
226: begin if(four_bit_hash == 13) begin next_state = 227; end else begin next_state = 1000; end end 
227: begin if(four_bit_hash == 0) begin next_state = 228; end else begin next_state = 1000; end end 
228: begin if(four_bit_hash == 14) begin next_state = 229; end else begin next_state = 1000; end end 
229: begin if(four_bit_hash == 11) begin next_state = 230; end else begin next_state = 1000; end end 
230: begin if(four_bit_hash == 0) begin next_state = 231; end else begin next_state = 1000; end end 
231: begin if(four_bit_hash == 6) begin next_state = 232; end else begin next_state = 1000; end end 
232: begin if(four_bit_hash == 0) begin next_state = 233; end else begin next_state = 1000; end end 
233: begin if(four_bit_hash == 2) begin next_state = 234; end else begin next_state = 1000; end end 
234: begin if(four_bit_hash == 10) begin next_state = 235; end else begin next_state = 1000; end end 
235: begin if(four_bit_hash == 0) begin next_state = 236; end else begin next_state = 1000; end end 
236: begin if(four_bit_hash == 1) begin next_state = 237; end else begin next_state = 1000; end end 
237: begin if(four_bit_hash == 0) begin next_state = 238; end else begin next_state = 1000; end end 
238: begin if(four_bit_hash == 5) begin next_state = 239; end else begin next_state = 1000; end end 
239: begin if(four_bit_hash == 0) begin next_state = 240; end else begin next_state = 1000; end end 
240: begin if(four_bit_hash == 1) begin next_state = 241; end else begin next_state = 1000; end end 
241: begin if(four_bit_hash == 3) begin next_state = 242; end else begin next_state = 1000; end end 
242: begin if(four_bit_hash == 15) begin next_state = 243; end else begin next_state = 1000; end end 
243: begin if(four_bit_hash == 0) begin next_state = 244; end else begin next_state = 1000; end end 
244: begin if(four_bit_hash == 14) begin next_state = 245; end else begin next_state = 1000; end end 
245: begin if(four_bit_hash == 9) begin next_state = 246; end else begin next_state = 1000; end end 
246: begin if(four_bit_hash == 0) begin next_state = 247; end else begin next_state = 1000; end end 
247: begin if(four_bit_hash == 8) begin next_state = 248; end else begin next_state = 1000; end end 
248: begin if(four_bit_hash == 11) begin next_state = 249; end else begin next_state = 1000; end end 
249: begin if(four_bit_hash == 2) begin next_state = 250; end else begin next_state = 1000; end end 
250: begin if(four_bit_hash == 10) begin next_state = 251; end else begin next_state = 1000; end end 
251: begin if(four_bit_hash == 10) begin next_state = 252; end else begin next_state = 1000; end end 
252: begin if(four_bit_hash == 0) begin next_state = 253; end else begin next_state = 1000; end end 
253: begin if(four_bit_hash == 3) begin next_state = 254; end else begin next_state = 1000; end end 
254: begin if(four_bit_hash == 2) begin next_state = 255; end else begin next_state = 1000; end end 
255: begin if(four_bit_hash == 13) begin next_state = 256; end else begin next_state = 1000; end end 
256: begin if(four_bit_hash == 11) begin next_state = 257; end else begin next_state = 1000; end end 
257: begin if(four_bit_hash == 15) begin next_state = 258; end else begin next_state = 1000; end end 
258: begin if(four_bit_hash == 3) begin next_state = 259; end else begin next_state = 1000; end end 
259: begin if(four_bit_hash == 9) begin next_state = 260; end else begin next_state = 1000; end end 
260: begin if(four_bit_hash == 0) begin next_state = 261; end else begin next_state = 1000; end end 
261: begin if(four_bit_hash == 13) begin next_state = 262; end else begin next_state = 1000; end end 
262: begin if(four_bit_hash == 1) begin next_state = 263; end else begin next_state = 1000; end end 
263: begin if(four_bit_hash == 0) begin next_state = 264; end else begin next_state = 1000; end end 
264: begin if(four_bit_hash == 0) begin next_state = 265; end else begin next_state = 1000; end end 
265: begin if(four_bit_hash == 3) begin next_state = 266; end else begin next_state = 1000; end end 
266: begin if(four_bit_hash == 2) begin next_state = 267; end else begin next_state = 1000; end end 
267: begin if(four_bit_hash == 11) begin next_state = 268; end else begin next_state = 1000; end end 
268: begin if(four_bit_hash == 1) begin next_state = 269; end else begin next_state = 1000; end end 
269: begin if(four_bit_hash == 0) begin next_state = 270; end else begin next_state = 1000; end end 
270: begin if(four_bit_hash == 14) begin next_state = 271; end else begin next_state = 1000; end end 
271: begin if(four_bit_hash == 5) begin next_state = 272; end else begin next_state = 1000; end end 
272: begin if(four_bit_hash == 2) begin next_state = 273; end else begin next_state = 1000; end end 
273: begin if(four_bit_hash == 15) begin next_state = 274; end else begin next_state = 1000; end end 
274: begin if(four_bit_hash == 10) begin next_state = 275; end else begin next_state = 1000; end end 
275: begin if(four_bit_hash == 0) begin next_state = 276; end else begin next_state = 1000; end end 
276: begin if(four_bit_hash == 3) begin next_state = 277; end else begin next_state = 1000; end end 
277: begin if(four_bit_hash == 1) begin next_state = 278; end else begin next_state = 1000; end end 
278: begin if(four_bit_hash == 0) begin next_state = 279; end else begin next_state = 1000; end end 
279: begin if(four_bit_hash == 9) begin next_state = 280; end else begin next_state = 1000; end end 
280: begin if(four_bit_hash == 7) begin next_state = 281; end else begin next_state = 1000; end end 
281: begin if(four_bit_hash == 6) begin next_state = 282; end else begin next_state = 1000; end end 
282: begin if(four_bit_hash == 4) begin next_state = 283; end else begin next_state = 1000; end end 
283: begin if(four_bit_hash == 6) begin next_state = 284; end else begin next_state = 1000; end end 
284: begin if(four_bit_hash == 0) begin next_state = 285; end else begin next_state = 1000; end end 
285: begin if(four_bit_hash == 0) begin next_state = 286; end else begin next_state = 1000; end end 
286: begin if(four_bit_hash == 5) begin next_state = 287; end else begin next_state = 1000; end end 
287: begin if(four_bit_hash == 0) begin next_state = 288; end else begin next_state = 1000; end end 
288: begin if(four_bit_hash == 14) begin next_state = 289; end else begin next_state = 1000; end end 
289: begin if(four_bit_hash == 7) begin next_state = 290; end else begin next_state = 1000; end end 
290: begin if(four_bit_hash == 4) begin next_state = 291; end else begin next_state = 1000; end end 
291: begin if(four_bit_hash == 0) begin next_state = 292; end else begin next_state = 1000; end end 
292: begin if(four_bit_hash == 5) begin next_state = 293; end else begin next_state = 1000; end end 
293: begin if(four_bit_hash == 0) begin next_state = 294; end else begin next_state = 1000; end end 
294: begin if(four_bit_hash == 13) begin next_state = 295; end else begin next_state = 1000; end end 
295: begin if(four_bit_hash == 7) begin next_state = 296; end else begin next_state = 1000; end end 
296: begin if(four_bit_hash == 2) begin next_state = 297; end else begin next_state = 1000; end end 
297: begin if(four_bit_hash == 15) begin next_state = 298; end else begin next_state = 1000; end end 
298: begin if(four_bit_hash == 10) begin next_state = 299; end else begin next_state = 1000; end end 
299: begin if(four_bit_hash == 0) begin next_state = 300; end else begin next_state = 1000; end end 
300: begin if(four_bit_hash == 3) begin next_state = 301; end else begin next_state = 1000; end end 
301: begin if(four_bit_hash == 1) begin next_state = 302; end else begin next_state = 1000; end end 
302: begin if(four_bit_hash == 0) begin next_state = 303; end else begin next_state = 1000; end end 
303: begin if(four_bit_hash == 5) begin next_state = 304; end else begin next_state = 1000; end end 
304: begin if(four_bit_hash == 3) begin next_state = 305; end else begin next_state = 1000; end end 
305: begin if(four_bit_hash == 5) begin next_state = 306; end else begin next_state = 1000; end end 
306: begin if(four_bit_hash == 0) begin next_state = 307; end else begin next_state = 1000; end end 
307: begin if(four_bit_hash == 15) begin next_state = 308; end else begin next_state = 1000; end end 
308: begin if(four_bit_hash == 1) begin next_state = 309; end else begin next_state = 1000; end end 
309: begin if(four_bit_hash == 0) begin next_state = 310; end else begin next_state = 1000; end end 
310: begin if(four_bit_hash == 0) begin next_state = 311; end else begin next_state = 1000; end end 
311: begin if(four_bit_hash == 3) begin next_state = 312; end else begin next_state = 1000; end end 
312: begin if(four_bit_hash == 2) begin next_state = 313; end else begin next_state = 1000; end end 
313: begin if(four_bit_hash == 0) begin next_state = 314; end else begin next_state = 1000; end end 
314: begin if(four_bit_hash == 1) begin next_state = 315; end else begin next_state = 1000; end end 
315: begin if(four_bit_hash == 0) begin next_state = 316; end else begin next_state = 1000; end end 
316: begin if(four_bit_hash == 14) begin next_state = 317; end else begin next_state = 1000; end end 
317: begin if(four_bit_hash == 9) begin next_state = 318; end else begin next_state = 1000; end end 
318: begin if(four_bit_hash == 1) begin next_state = 319; end else begin next_state = 1000; end end 
319: begin if(four_bit_hash == 13) begin next_state = 320; end else begin next_state = 1000; end end 
320: begin if(four_bit_hash == 0) begin next_state = 321; end else begin next_state = 1000; end end 
321: begin if(four_bit_hash == 14) begin next_state = 322; end else begin next_state = 1000; end end 
322: begin if(four_bit_hash == 4) begin next_state = 323; end else begin next_state = 1000; end end 
323: begin if(four_bit_hash == 9) begin next_state = 324; end else begin next_state = 1000; end end 
324: begin if(four_bit_hash == 14) begin next_state = 325; end else begin next_state = 1000; end end 
325: begin if(four_bit_hash == 12) begin next_state = 326; end else begin next_state = 1000; end end 
326: begin if(four_bit_hash == 0) begin next_state = 327; end else begin next_state = 1000; end end 
*/
1000: begin packet_drop_signal_register  = 1'b1; end
default: begin next_state = 0;end
endcase
end

assign packet_drop_signal =packet_drop_signal_out;
endmodule