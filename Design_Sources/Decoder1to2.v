`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/13/2026
// Design Name: lab 10
// Module Name: Decoder1to2
// Project Name: lab 10
// Target Devices:
// Tool Versions:
// Description: One-to-two decoder used by the register file.
//
// Dependencies: 
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module Decoder1to2(m, S, en);
    input S;
    input en;
    output [1:0] m;

    assign m[0] = ~S & en;
    assign m[1] = S & en;
endmodule
