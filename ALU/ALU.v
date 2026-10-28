`timescale 1ns / 1ps

module ALU(
input [31:0] SrcA, SrcB,
input [2:0] ALUControl,
output reg zero,
output reg [31:0] ALUResult
);

	always @(*) begin 
		casez(ALUControl)
			3'b000: //ADD
			begin 
				ALUResult = SrcA + SrcB;
				zero = 1'b0;
			end
	
			3'b001: //SUB
			begin 
				ALUResult = SrcA - SrcB;
				if(ALUResult==0) begin 
					zero = 1'b1;
				end else begin 
					zero = 1'b0;
				end			
			end	
			
			3'b010: //AND
			begin 
				ALUResult = SrcA & SrcB;
				zero = 1'b0;
			end

			3'b011: //OR
			begin 
				ALUResult = SrcA | SrcB;
				zero = 1'b0;
			end

			default:
			begin 
				ALUResult = 32'b?;
				zero = 1'b?;
			end		
		endcase
	end

endmodule
