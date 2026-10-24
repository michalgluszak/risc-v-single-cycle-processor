`timescale 1ns / 1ps

module control_unit(
	input Zero,
	input [6:0] op,
	input [2:0] funct3,
	input funct7,
	output PCSrc,
	output Branch,
	output ResultSrc,
	output MemWrite,
	output ALUSrc,
	output [1:0] ImmSrc,
	output RegWrite,
	output [1:0] ALUOp,
	output [2:0] ALUControl
	);

	assign PCSrc = Zero & Branch;

	main_decoder main_decoder_ins(
		.op(op), 
		.RegWrite(RegWrite), 
		.ImmSrc(ImmSrc), 
		.ALUSrc(ALUSrc), 
		.MemWrite(MemWrite), 
		.ResultSrc(ResultSrc), 
		.Branch(Branch), 
		.ALUOp(ALUOp));	

	alu_decoder alu_decoder_ins(
		.op(op[5]), 
		.ALUOp(ALUOp), 
		.funct3(funct3), 
		.funct7(funct7), 
		.ALUControl(ALUControl));

endmodule
