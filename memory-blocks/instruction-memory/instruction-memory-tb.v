`timescale 1ns / 1ps

module instruction_memory_tb();
reg [31:0] a;
wire [31:0] rd;

imem uut(
	.a(a), 
	.rd(rd));

initial begin 
$monitor("a = %0d rd = %0h", a, rd);
a = 32'd0;
#10;
a = 32'd4;
#10;
a = 32'd8;
#10;
a = 32'd12;
#10;
$finish();
end

endmodule
