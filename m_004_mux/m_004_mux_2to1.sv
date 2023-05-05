`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 2:1 Multiplexer 

/*2:1 multiplexer. This is a combinational circuit that selects one of two 
inputs (A and B) based on a control signal, producing an output Y. It's a 
commonly used building block in digital circuits*/

//////////////////////////////////////////////////////////////////////////////////


module m_004_mux_2to1(
    input logic [7:0] a_i,
    input logic [7:0] b_i,
    input logic sel_i,
    output logic [7:0] y_o
    );
    
assign y_o = sel_i ? b_i : a_i;    

  
endmodule