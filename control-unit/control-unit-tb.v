`timescale 1ns / 1ps

module control_unit_tb();
reg Zero;
reg [6:0] op;
reg [2:0] funct3;
reg funct7;
wire PCSrc;
wire Branch;
wire ResultSrc;
wire MemWrite;
wire ALUSrc;
wire [1:0] ImmSrc;
wire RegWrite;
wire [1:0] ALUOp;
wire [2:0] ALUControl;

control_unit uut(
	.Zero(Zero), 
	.op(op), 
	.funct3(funct3), 
	.funct7(funct7), 
	.PCSrc(PCSrc), 
	.Branch(Branch), 
	.ResultSrc(ResultSrc), 
	.MemWrite(MemWrite), 
	.ALUSrc(ALUSrc), 
	.ImmSrc(ImmSrc), 
	.RegWrite(RegWrite), 
	.ALUOp(ALUOp), 
	.ALUControl(ALUControl));

initial begin
$monitor(
	"op = %b RegWrite = %b ImmSrc = %b ALUSrc = %b MemWrite = %b ResultSrc = %b Branch = %b ALUOp = %b funct3 = %b op[5] = %b funct7 = %b ALUControl = %b",
	op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp, funct3, op[5], funct7, ALUControl);
Zero = 0; op = 7'b0110011; funct3 = 3'b000; funct7 = 1'b0; 
#10;
Zero = 0; op = 7'b0000011; funct3 = 3'bxxx; funct7 = 1'bx; 
$finish();
end

endmodule
