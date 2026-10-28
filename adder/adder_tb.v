`timescale 1ns /1 ps

module adder_tb;
reg [31:0] a, b;
wire [31:0] y;

adder uut(
	.a(a), 
	.b(b), 
	.y(y));

initial begin 
$monitor("a = %0d b = %0d y = %0d", a, b, y);
a = 5; b = 3;
#10;
a = 101; b = 53;
#10;
$finish();
end

endmodule
