`timescale 1ns / 1ps

module main_decoder_tb;
reg [6:0] Op;
wire RegWrite, ALUSrc, MemWrite, ResultSrc, Branch;
wire [1:0] ImmSrc, ALUOp;

main_decoder uut(.Op(Op), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .MemWrite(MemWrite), .ResultSrc(ResultSrc), .Branch(Branch), .ImmSrc(ImmSrc), .ALUOp(ALUOp));

initial begin 
$monitor("Op = %b RegWrite = %b ImmSrc = %b ALUSrc = %b MemWrite = %b ResultSrc = %b Branch = %b ALUOp = %b", Op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);
Op = 7'b0000011;
#10;
Op = 7'b0100011;
#10;
Op = 7'b0110011;
#10;
Op = 7'b1100011;
#10;
Op = 7'b1111111;
#10;
$finish();
end

endmodule
