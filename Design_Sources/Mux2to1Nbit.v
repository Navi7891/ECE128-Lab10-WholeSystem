`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/13/2026
// Design Name: lab 10
// Module Name: Mux2to1Nbit
// Project Name: lab 10
// Target Devices:
// Tool Versions:
// Description: Selects one of two 4-bit register outputs.
//
// Dependencies: 
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module Mux2to1Nbit(o, i1, i2, s);
    input [3:0] i1, i2;
    input s;
    output reg [3:0] o;

    always @(s or i1 or i2) begin
        case(s)
            1'b0: o = i1;
            1'b1: o = i2;
            default: o = 4'b0;
        endcase
    end
endmodule
