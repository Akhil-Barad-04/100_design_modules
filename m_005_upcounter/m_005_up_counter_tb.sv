`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module m_005_up_counter_tb();

parameter width = 4;

logic clk_i;
logic n_rst_i;
logic [width-1:0] cnt_o;

m_005_up_counter M_005_UP_COUNTER(.*);

always #5 clk_i = ~clk_i;

initial 
    begin
        clk_i = 0;
        n_rst_i = 0;
        #20;
        n_rst_i = 1;
        #165;
        $finish();
    end

endmodule