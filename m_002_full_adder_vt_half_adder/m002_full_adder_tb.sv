`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module m002_full_adder_tb();

logic a_i;
logic b_i;
logic cin_i;
logic sum_o;
logic cout_o;

integer i;

m002_full_adder M2_FULL_ADDER(a_i,b_i,cin_i,sum_o,cout_o);

initial begin
    for(i = 0; i<8; i=i+1)
        begin
            {a_i,b_i,cin_i} = i;
            #10;    
        end
    $finish();
end

endmodule