`timescale 1ns / 1ps

module mux2x1_tb;
reg [31:0] i0, i1;
reg s;
wire [31:0] y;


mux2x1 uut(
	.i0(i0), 
	.i1(i1), 
	.s(s), 
	.y(y));

initial begin 
$monitor("i0 = %0d i1 = %0d s = %b y = %0d", i0, i1, s, y);
i0 = 32'd61; i1 = 32'd44; s = 1'b0;
#10;
i0 = 32'd61; i1 = 32'd44; s = 1'b1;
#10;
$finish();
end

endmodule
