`timescale 1ns / 1ps

module alu_decoder(
	input op, //op 5 bit
	input [1:0] ALUOp,
	input [2:0] funct3,
	input funct7, //funct7 5 bit
	output reg [2:0] ALUControl
	);

	wire [6:0] in;
	assign in = {ALUOp, funct3, op, funct7};

	always @(*) begin 
		casez(in)
			7'b00?????:
			begin 
				ALUControl = 3'b000; //add (lw, sw)
			end		
			
			7'b01?????:
			begin 
				ALUControl = 3'b001; //substract (beq)
			end
		
			7'b1000010:
			begin 
				ALUControl = 3'b000; //add (add)
			end

			7'b100000?:
			begin 
				ALUControl = 3'b000; //add (addi)
			end
			
			7'b1000011:
			begin 
				ALUControl = 3'b001; //substract (sub)
			end

			7'b10010??:
			begin 
				ALUControl = 3'b101; //set less than (slt)
			end

			7'b10110??:
			begin 
				ALUControl = 3'b011; //or (or)
			end

			7'b10111??:
			begin 
				ALUControl = 3'b010; //and (and)
			end
			
			default: ALUControl = 3'b???;	
		endcase
	end

endmodule
