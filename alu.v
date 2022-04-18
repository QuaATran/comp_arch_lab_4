module alu (out, in1, in2, S, Z, C, N, V);

 input  [2:0]  S; //select bit
 input  [31:0] in1, in2; //32 bit inputs
 output Z, C, N, V;
 output [31:0] out; //output 
 reg 	  [32:0] result; //overflow bit checker; we make this 33 bit bc the 33rd bit is overflow, 32 bit will not see an overflow bit
 // tried using if in1[31] == 1 and in[31] == 1, but problem arises when there is overflow but they are 0 therefore made 33 bit to read an overflow bit
 
 assign out = result; // making output only be 32 bits
 
 //overflow bit is on if the most significant bit are 1
 assign V = result[32];
 assign Z = (out == 32'b0) ? 1 : 0;
 assign N = out[31];
 assign C = result[32];
 
  
 
 always @(*) begin
 
  case(S)
  3'd0: result = in1 + in2; //add
  3'd1: result = in1 ^ in2; //xor
  3'd2: result = in1 & in2; //and
  3'd3: result = in1 | in2; //or
  3'd4: result = ~(in1 | in2); //nor
  3'd5: result = in1 >> 1; //right shift
  3'd6: result = in1 << 1; //left shift
 
  endcase
 end

endmodule
