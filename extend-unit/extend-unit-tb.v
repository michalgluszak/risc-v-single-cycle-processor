`timescale 1ns / 1ps

module extend_tb;
reg [31:0] Instr;
reg [1:0] ImmSrc;
wire [31:0] ImmExt;

extend uut(.Instr(Instr), .ImmSrc(ImmSrc), .ImmExt(ImmExt));

initial begin 
$monitor("ImmSrc = %b Instr = %b ImmExt = %h", ImmSrc, Instr, ImmExt);
Instr = 32'h00A3_0293; ImmSrc = 2'b00;
#10;
Instr = 32'h0043_2283; ImmSrc = 2'b00;
#10;
Instr = 32'h0053_2423; ImmSrc = 2'b01;
#10;
Instr = 32'h0074_0123; ImmSrc = 2'b01;
#10;
Instr = 32'hFE42_0AE3; ImmSrc = 2'b10;
#10;
$finish();
end

endmodule
