`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mohamed Ammar
// 
// Create Date:    20:26:20 09/05/2020 
// Design Name: 
// Module Name:    summation 
// Project Name: Summation formula
// Target Devices: 
// Tool versions: 
// Description: An implementation for the summation formula (sigma i from i = 1 to N) 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: according to N the sum width will vary here we assume that N is  4bit wide so sum will be 7 bit 
//
//////////////////////////////////////////////////////////////////////////////////
module summation( clock,reset,N,sum);
input clock,reset;
input [3:0] N ;        
output [6:0] sum;

reg [6:0] sum;   reg [3:0] Nprev;
reg [2:0] count; reg	[1:0] state, next_state;

   // control lines
reg [1:0] Smux , Cmux ;

   //status lines
wire equal , one ;                                   

   //states
parameter [1:0] s0 = 2'b00 ,                       
s1 = 2'b01 , s2 = 2'b10 , s3 = 2'b11;   

  //data path
always@ (posedge clock)     //mux and register for sum accumlator
case (Smux)
2'h1 : sum <= N;
2'h2 : sum <= sum + count ;
endcase

always@(posedge clock)    //mux and register for counter (count down)
case (Cmux)
2'h1 : count <= N-1;
2'h2 : count <= count - 1;
endcase

assign one = (count == 1 ) ;   // a one flag so as to go back to intial state s0 when met 

   //controller
always@(posedge clock)
Nprev <= N ; 
assign equal = ( Nprev == N ) ;  // an equal flag  to intiate  

always@(posedge clock)
if (reset) state <= s0;        //when reset go to intial state s0 = 00 otherwise go to next state
else   state <= next_state;

always@(*)
casex (state)
s0: begin 
Smux = 0 ; Cmux = 0;
if (equal) next_state = s1;
else next_state = s0;
end 

s1: begin
Smux = 1 ; Cmux = 1;
next_state = s2;
end

s2: begin 
Smux = 2 ; Cmux = 2;
if (one) next_state = s0;
else next_state = s2;
end

default: begin
next_state = s0; Smux =2'hx ; Cmux = 2'hx;
end
endcase
endmodule
