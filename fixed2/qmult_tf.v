`timescale 1ns / 1ps

module qmult_tf;

	// Inputs
	reg  [31:0] a;
	reg  [31:0] b;

	// Outputs
	wire [31:0] c;
    reg  [31:0] creg,breg,areg;
		localparam SF = 2.0**-23.0;  // Q4.4 scaling factor is 2^-4


	// Instantiate the Unit Under Test (UUT)
	//module Params Name Signals
	qmult #(23,32) uut (a, b, c);
	

	initial begin
		// Initialize Inputs
		a[31] = 1'b1;
		a[30:23] = 8'b0000_1111;
		a[22:0] = 23'b1000_0000_0000_0000_0000_000;
		
		b[31] = 1'b1;
		b[30:23] = 8'b0000_0111;
		b[22:0] = 23'b1000_0000_0000_0000_0000_000;
		end

		initial 
		begin
        $dumpfile("mul.vcd");
        $dumpvars;
		end
		
		initial begin
		#10;
			$display("simtime=%g, sign of a=%b, sign of b=%b\n",$time, a[31],b[31]);
			$display("Integer portion of a=%b and b=%b\n",a[30:23], b[30:23]);
			$display("Fraction portion of a=%b and b=%b\n",a[22:0],b[22:0]);
			$display("a=%g,b=%g", $itor(a[30:0])*SF,$itor(b[30:0])*SF);
			$display("Sign of c=%b, Integer portion of c=%b, Fraction portion of c=%b\n",c[31],c[30:23],c[22:0]);
			$display("c=%g", $itor(c[30:0])*SF);
		end	
endmodule

