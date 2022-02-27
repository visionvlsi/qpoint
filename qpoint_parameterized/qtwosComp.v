`timescale 1ns / 1ps
module qtwosComp(
    input [N-2:0] a,
    output [2*N-1:0] b
    );
	reg [2*N-1:0] data;
	reg [2*N-1:0] flip;
	reg [2*N-1:0] out;
	
	//Parameterized values
	parameter Q = 15;
	parameter N = 32;
	
	assign b = out;
	
	always @(a)
	begin
		data <= a;		
	end
	
	always @(data)
	begin
		flip <= ~a;
	end
	
	always @(flip)
	begin
		out <= flip + 1;
	end

endmodule
