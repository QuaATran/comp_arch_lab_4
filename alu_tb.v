module alu_tb ();

 reg	[2:0]  S;
 reg	[31:0] in1, in2;
 wire [31:0] out;
 wire CO; 
 
 alu aludut (.out(out), .in1(in1), .in2(in2), .S(S), .CO(CO));
 
 initial begin
 
 in1 = 32'd2;
 in2 = 32'd2;
 
 #10
 S = 4'd0;
 // add the inputs
 // expected out: 4
 
 #10
 in1 = 32'd1;
 // and the new inputs
 // expected out: 3
 
 #10
 S = 32'd1;
 // xor the inputs
 // expected out: 3
 
 #10
 in2 = 32'd0;
 //xor the new inputs
 //expected out: 1
 
 #10
 in2 = 32'd1;
 // xor the new inputs
 // expected output: 0
 
 #10 
 S = 4'd2;
 // and the inputs
 // expected out: 1
 
 #10
 in1 = 32'd2;
 // and the new inputs
 // expected out: 0
 
 #10
 in2 = 32'd2;
 // and the new inputs
 //expected out: 2
 
 #10
 S = 4'd3;
 // or the inputs
 // expected out: 2
 
 #10
 in1 = 32'd4;
 // or the new inputs
 // expected out: 6
 
 #10
 S = 4'd4;
 //nor the output
 
 #10
 S = 4'd5;
 // right shift first input
 
 #10
 S = 4'd6;
 // left shift first input
 
 #10
 in1 = 32'b11111111111111111111111111111111;
 in2 = 32'b11111111111111111111111111111111;
 // check for carryout bit
 
 
 #50 $stop;
 
 end

endmodule 