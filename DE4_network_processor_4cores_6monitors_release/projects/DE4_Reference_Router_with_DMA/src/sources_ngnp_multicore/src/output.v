case(4_bit_hash) 
1: begin if(4_bit_hash == 7) next_state = 4; else if (4_bit_hash == 4) next_state = 2; else next_state = packet_drop;  end 
3: begin if(4_bit_hash == 5) next_state = 21; else if (4_bit_hash == 7) next_state = 4; else next_state = packet_drop;  end 
15: begin if(4_bit_hash == 5 && pc == 12) next_state = 12; else if (4_bit_hash == 5 && pc == 16) next_state = 16; else next_state = packet_drop;  end 
19: begin if(4_bit_hash == 6) next_state = 89; else if (4_bit_hash == 3) next_state = 20; else next_state = packet_drop;  end 
21: begin if(4_bit_hash == 3) next_state = 20; else if (4_bit_hash == 9) next_state = 22; else next_state = packet_drop;  end 
49: begin if(4_bit_hash == 8 && pc == 81) next_state = 81; else if (4_bit_hash == 8 && pc == 50) next_state = 50; else next_state = packet_drop;  end 
111: begin if(4_bit_hash == 14) next_state = 318; else if (4_bit_hash == 9) next_state = 112; else next_state = packet_drop;  end 
126: begin if(4_bit_hash == 14) next_state = 318; else if (4_bit_hash == 7) next_state = 127; else next_state = packet_drop;  end 
162: begin if(4_bit_hash == 10) next_state = 220; else if (4_bit_hash == 14) next_state = 163; else next_state = packet_drop;  end 
194: begin if(4_bit_hash == 10) next_state = 216; else if (4_bit_hash == 6) next_state = 195; else next_state = packet_drop;  end 
215: begin if(4_bit_hash == 14) next_state = 225; else if (4_bit_hash == 10) next_state = 216; else next_state = packet_drop;  end 
224: begin if(4_bit_hash == 14 && pc == 163) next_state = 163; else if (4_bit_hash == 14 && pc == 225) next_state = 225; else next_state = packet_drop;  end 
233: begin if(4_bit_hash == 10) next_state = 246; else if (4_bit_hash == 7) next_state = 234; else next_state = packet_drop;  end 
286: begin if(4_bit_hash == 9 && pc == 293) next_state = 293; else if (4_bit_hash == 9 && pc == 287) next_state = 287; else next_state = packet_drop;  end 
292: begin if(4_bit_hash == 7) next_state = 297; else if (4_bit_hash == 9) next_state = 293; else next_state = packet_drop;  end 
327: begin if(4_bit_hash == 14) next_state = 95; else if (4_bit_hash == 0) next_state = 328; else next_state = packet_drop;  end 
endcase