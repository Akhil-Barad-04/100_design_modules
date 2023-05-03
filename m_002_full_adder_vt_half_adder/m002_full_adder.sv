`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Full adder using Half adder
/* This full-adder is a combinational logic circuit that performs 
binary addition of three 1-bit binary inputs - two operands and 
a carry bit - with the output being a sum and carry bit.

    This implementation of the full-adder will make use of two 
half-adders in series to produce the sum out signal, as well 
as an OR-gate to produce the carry out signal.*/
//////////////////////////////////////////////////////////////////////////////////

module m002_full_adder(
    input logic a_i,
    input logic b_i,
    input logic cin_i,
    output logic sum_o,
    output logic cout_o
    );
    
    wire ha_sum_w;
    wire ha_c_zero_w;
    wire ha_c_one_w;    
    m1_half_adder half_adder_0(a_i,b_i,ha_sum_w,ha_c_zero_w);
    m1_half_adder half_adder_1(cin_i, ha_sum_w, sum_o, ha_c_one_w);
    
    assign cout_o = ha_c_zero_w | ha_c_one_w;
    
endmodule