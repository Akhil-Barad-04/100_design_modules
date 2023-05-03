`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// half-adder
// This is a combinational logic circuit that performs 
// the binary addition of two 1-bit binary digits.
//////////////////////////////////////////////////////////////////////////////////


module m1_half_adder(
    input logic a_i,
    input logic b_i,
    output logic sum_o,
    output logic cout_o
    );
    

assign sum_o = a_i ^ b_i; 
assign cout_o = a_i & b_i;

endmodule