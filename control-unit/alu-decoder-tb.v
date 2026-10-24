`timescale 1ns / 1ps

module alu_decoder_tb;
reg [1:0] ALUOp;
reg [2:0] funct3;
reg op, funct7;
wire [2:0] ALUControl;

alu_decoder uut(
	.ALUOp(ALUOp), 
	.funct3(funct3), 
	.op(op), 
	.funct7(funct7), 
	.ALUControl(ALUControl));

initial begin 
$monitor("ALUOp = %b funct3 = %b op = %b funct7 = %b ALUControl = %b", ALUOp, funct3, op, funct7, ALUControl);
ALUOp = 2'b00; funct3 = 3'bxxx; op = 1'bx; funct7 = 1'bx;
#10;
ALUOp = 2'b01; funct3 = 3'bxxx; op = 1'bx; funct7 = 1'bx;
#10;
ALUOp = 2'b10; funct3 = 3'b000; op = 1'b1; funct7 = 1'b0;
#10;
ALUOp = 2'b10; funct3 = 3'b000; op = 1'b0; funct7 = 1'bx;
#10;
ALUOp = 2'b10; funct3 = 3'b000; op = 1'b1; funct7 = 1'b1;
#10;
ALUOp = 2'b10; funct3 = 3'b010; op = 1'bx; funct7 = 1'bx;
#10;
ALUOp = 2'b10; funct3 = 3'b110; op = 1'bx; funct7 = 1'bx;
#10;
ALUOp = 2'b10; funct3 = 3'b111; op = 1'bx; funct7 = 1'bx;
#10;
ALUOp = 2'bxx; funct3 = 3'bxxx; op = 1'bx; funct7 = 1'bx;
#10;
$finish();
end

endmodule
