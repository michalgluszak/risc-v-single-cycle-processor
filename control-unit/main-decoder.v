`timescale 1ns / 1ps

module main_decoder(
	input [6:0] op,
	output reg RegWrite,
	output reg [1:0] ImmSrc,
	output reg ALUSrc,
	output reg MemWrite,	
	output reg ResultSrc,	
	output reg Branch,
	output reg [1:0] ALUOp
	);

	always @ (*) begin 
		case(op)
			7'b0000011:
			begin 
				RegWrite = 1'b1;
				ImmSrc = 2'b00;
				ALUSrc = 1'b1;
				MemWrite = 1'b0;
				ResultSrc = 1'b1;
				Branch = 1'b0;
				ALUOp = 2'b00;
			end
			
			7'b0100011:
			begin 
				RegWrite = 1'b0;
				ImmSrc = 2'b01;
				ALUSrc = 1'b1;
				MemWrite = 1'b1;
				ResultSrc = 1'bx;
				Branch = 1'b0;
				ALUOp = 2'b00;
			end
			
			7'b0110011:
			begin 
				RegWrite = 1'b1;
				ImmSrc = 2'bxx;
				ALUSrc = 1'b0;
				MemWrite = 1'b0;
				ResultSrc = 1'b0;
				Branch = 1'b0;
				ALUOp = 2'b10;
			end
		
			7'b1100011:
			begin 
				RegWrite = 1'b0;
				ImmSrc = 2'b10;
				ALUSrc = 1'b0;
				MemWrite = 1'b0;
				ResultSrc = 1'bx;
				Branch = 1'b1;
				ALUOp = 2'b01;
			end

			default:
			begin
				RegWrite = 1'bx;
				ImmSrc = 2'bxx;
				ALUSrc = 1'bx;
				MemWrite = 1'bx;
				ResultSrc = 1'bx;
				Branch = 1'bx;
				ALUOp = 2'bxx;
			end
				
		endcase
	end

endmodule
