`timescale 1ns /1 ps

module ram_tb;

localparam N = 6, M = 64;
reg clk = 1'b1;
reg we;
reg [N-1:0] adr;
reg [M-1:0] din;
wire [M-1:0] dout;

always #5 clk = ~clk;

ram #(.N(N), .M(M)) uut(
	.clk(clk), 
	.we(we), 
	.adr(adr), 
	.din(din), 
	.dout(dout));

initial begin 
$monitor("we = %b adr = %0d din = %0d dout = %0d", we, adr, din, dout);
we = 1'b1; adr = 32'd31; din = 32'd35;
#10;
we = 1'b0; adr = 32'd31; din = 32'd35;
#10;
$finish();
end

endmodule
