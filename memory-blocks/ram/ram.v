`timescale 1ns / 1ps

module ram #(parameter N = 6, M = 64)(
	input clk,
	input we,
	input [N-1:0] adr,
	input [M-1:0] din,
	output [M-1:0] dout
);

reg [M-1:0] mem [2**N-1:0];

always @(posedge clk) begin 
	mem[adr] <= din;
end

assign dout = mem[adr];

endmodule
