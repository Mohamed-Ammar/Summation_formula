# Summation_formula
An implementation to the summation formula 
The equation is sigma i   from i = 1 to N 
We consider N  as an input and start addition N + N-1 + N-2 ...
This is done having two register with one multiplexer each 
First one is the accumlator where summ will be preserved as the Smux is one in the intial state (s1) it takes the value of N 
then it always assigned to sum + count where count start from N-1 and decrement in continous manner with the clock cycles
Second register is count where it is intiated with the N-1 value and decrement each cycle (count -1)
There is two flags an equal flag where we chack that N is equalt to the previous N so as to start ourr summation
Second flag is the one flag as when count is equal to one then we reached the end and go back to reset state (s0)
It is  FSM with three states
In the default case of the FSM we assign Smux and Cmux to don't care to avoid latching 

Warnings may appear at line 48 and 49 where the 1 is treated by verilog as 32bit and we assigned it for a 3bit register
