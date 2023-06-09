`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// BCD to 7-Seg

/*BCD to 7-Segment Decoder

BCD to 7-segment decoder. This is a combinational circuit that takes a 4-bit binary 
coded decimal (BCD) input and generates the corresponding 7-segment display output.

The 7-segment display is a common output device used in digital circuits to display 
numbers. It consists of seven individual LEDs arranged so decimal numbers, text and 
symbols can be displayed. By selectively turning on the appropriate segments, it can 
display any decimal digit from 0 to 9.

This implementation makes use of SystemVerilog's case statement to map the binary 
input values to display decimal numbers. Any input values above decimal 9, are displayed
 as a hyphen '-'.  This BCD to 7-seg converter is designed for a common anode 7-segment 
 display.*/

//////////////////////////////////////////////////////////////////////////////////

module m_006_bcd_to_7seg(
    input logic[3:0] bcd_i,
    output logic ca_o,
    output logic cb_o,
    output logic cc_o,
    output logic cd_o,
    output logic ce_o,
    output logic cf_o,
    output logic cg_o
);

logic [6:0] segments;

assign {cg_o,cf_o,ce_o,cd_o,cc_o,cb_o,ca_o} = segments;

always @(*) begin
    case (bcd_i)
        4'b0000: segments = 7'b1000000; // 0
        4'b0001: segments = 7'b1111001; // 1
        4'b0010: segments = 7'b0100100; // 2
        4'b0011: segments = 7'b0110000; // 3
        4'b0100: segments = 7'b0011001; // 4
        4'b0101: segments = 7'b0010010; // 5
        4'b0110: segments = 7'b0000010; // 6
        4'b0111: segments = 7'b1111000; // 7
        4'b1000: segments = 7'b0000000; // 8
        4'b1001: segments = 7'b0011000; // 9
        default: segments = 7'b0111111; // display unique symbol for all values outside of binary 0000 to 1001
    endcase
end

endmodule