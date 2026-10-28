`timescale 1ns / 1ps

module ALU_tb;
reg [31:0] SrcA, SrcB;
reg [2:0] ALUControl;
wire zero;
wire [31:0] ALUResult;

ALU uut(
	.SrcA(SrcA), 
	.SrcB(SrcB), 
	.ALUControl(ALUControl), 
	.zero(zero), 
	.ALUResult(ALUResult));

initial begin 
$monitor("ALUControl = %b SrcA = %0d SrcB = %0d ALUResult = %0d zero = %b ", ALUControl, SrcA, SrcB, ALUResult, zero);
SrcA = 32'd5; SrcB = 32'd3; ALUControl = 3'b000;
#10;
$finish();
end


endmodule
