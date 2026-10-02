`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:37:59 09/30/2026
// Design Name:   FA
// Module Name:   /home/ise/New_folder/Full_Adder/FAoutput.v
// Project Name:  Full_Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FAoutput;

	// Inputs
	reg a;
	reg b;
	reg c;

	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	FA uut (
		.sum(sum), 
		.carry(carry), 
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 0;b = 0;c = 0;#100;
		a = 0;b = 0;c = 1;#100;
		a = 0;b = 1;c = 0;#100;
		a = 0;b = 1;c = 1;#100;
		a = 1;b = 0;c = 0;#100;
		a = 1;b = 0;c = 1;#100;
		a = 1;b = 1;c = 0;#100;
		a = 1;b = 1;c = 1;#100;

	end
      
endmodule

