`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// simple up counter

/* 4-bit Synchronous Up Counter with Asynchronous Active Low Reset

A 4-bit up counter is a digital circuit that counts from 0 to 15 in binary, 
incrementing by 1 on each clock cycle. An asynchronous active low reset means 
that a reset signal can be applied to the circuit at any time, regardless of 
the state of the clock signal, and that the reset is activated when the reset 
signal is low.*/

//////////////////////////////////////////////////////////////////////////////////

module m_005_up_counter#(parameter width = 4)(
    input logic clk_i, 
    input logic n_rst_i, 
    output logic [width-1:0] cnt_o
);

always_ff@(posedge clk_i, negedge n_rst_i)
    begin
        if(~n_rst_i)
            begin 
                cnt_o <= 0;
            end
        else
            begin
                cnt_o <= cnt_o + 1;
            end
    end

endmodule