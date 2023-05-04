`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Ripple Carry Adder

/* Ripple Carry Adder - a combinational logic circuit that adds together two 
n-bit binary numbers to produce an n-bit binary sum output, along with a 
carry-out signal. To accomplish this, the circuit requires n-full-adders 
for adding two n-bit binary numbers.

The name "Ripple Carry Adder" comes from its sequential carry generation 
process. In this process, each full adder generates a carry-out signal 
that serves as carry-in for its adjacent most significant full adder, 
causing a rippling effect throughout the circuit.

It's worth noting that this particular implementation of the Ripple Carry Adder 
is set up as a 4-bit adder with a carry-in signal. However, by adjusting the 
value of the "width" parameter in the m_003_ripple_carry_adder sv file, 
the number of bits per input can be modified. To simplify the instantiation 
of each full adder in the circuit, I have utilized the "generate" construct 
in the System Verilog code.

Finally, it's important to mention that the Ripple Carry Adder won't work if 
the "width" parameter is set to 1 or 0, although this is unlikely to be an issue 
since there's usually no need for a 1-bit or 0-bit Ripple Carry Adder!*/

//////////////////////////////////////////////////////////////////////////////////

module m003_ripple_carry_adder#(parameter width = 4)(
    input logic [width-1:0] a_i,
    input logic [width-1:0] b_i,
    input logic cin_i,
    output logic [width-1:0] sum_o,
    output logic cout_o
    );

wire [width-2:0] c_w;

full_adder inst_full_adder_0(a_i[0],b_i[0],cin_i,sum_o[0],c_w[0]);

genvar i;
generate
    for(i = 1; i < width-1; i=i+1)
        begin
            full_adder inst_full_adder(a_i[i],b_i[i],c_w[i-1],sum_o[i],c_w[i]);
        end    
endgenerate            

full_adder inst_full_adder_final(a_i[width-1],b_i[width-1],c_w[width-2],sum_o[width-1],cout_o);
    
endmodule