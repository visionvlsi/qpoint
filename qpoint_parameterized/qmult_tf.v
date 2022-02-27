`timescale 1ns / 1ps
module qmult_tf;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [31:0] c;

	// Instantiate the Unit Under Test (UUT)
	//module Params Name Signals
	qmult #(23,32) uut (a, b, c);

	initial begin
		// Initialize Inputs
		a[31] = 0;
		a[30:23] = 64;
		a[22:0] = 1048576;//1048576;//4096;
		
		b[31] = 1;
		b[30:23] = 0;
		b[22:0] = 6291456;//6291456;//24576;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

