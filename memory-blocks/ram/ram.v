`timescale 1ns / 1ps

module ram #(parameter N = 6, M = 64)(
	input clk,
	input we,
	input [N-1:0] adr,
	input [M-1:0] din,
	output reg [M-1:0] dout
);

reg [M-1:0] RAM [2**N-1:0];

always @(posedge clk) begin 
	if(we) begin 
		RAM[adr] <= din;
	end else begin 
		dout <= RAM[adr];
	end
end

endmodule
