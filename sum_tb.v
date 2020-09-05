`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Mohamed Ammar
//
// Create Date:   20:39:47 09/05/2020
// Design Name:   summation
// Module Name:   digital_design/verilog/Summation/sum_tb.v
// Project Name:  Summation
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: summation
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sum_tb;

	// Inputs
	reg clock;
	reg reset;
	reg [3:0] N;

	// Outputs
	wire [6:0] sum;

	// Instantiate the Unit Under Test (UUT)
	summation uut (
		.clock(clock), 
		.reset(reset), 
		.N(N), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		N = 0;

		// Wait 100 ns for global reset to finish
		#1 reset = 1;
      #100 reset = 0;           // start after one cycle reset = 0 at 101ns
		// Add stimulus here
		#100    N = 4'h5;
	   #10000  $finish;            //end simulation
	end  
      always #50 clock = ~clock ;  //10MHZ , 100ns cycle
endmodule
