`timescale 1ns / 1ps

module mux2x1(
input [31:0 ]i0, i1,
input s,
output [31:0] y
);

assign y = (s==1'b0) ? i0 : i1;

endmodule
