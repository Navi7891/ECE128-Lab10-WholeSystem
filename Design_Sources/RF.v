`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/13/2026
// Design Name: lab 10
// Module Name: RF
// Project Name: lab 10
// Target Devices:
// Tool Versions:
// Description: Two 4-bit registers with two independently selected outputs.
//
// Dependencies: Decoder1to2, RegisterNbit, Mux2to1Nbit
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module RF(A, B, SA, SB, D, DA, W, rst, clk);
    output [3:0] A;
    output [3:0] B;
    input SA;
    input SB;
    input [3:0] D;
    input DA;
    input W;
    input rst;
    input clk;

    wire [1:0] load_enable;
    wire [3:0] R00, R01;

    Decoder1to2 decoder(load_enable, DA, W);
    RegisterNbit reg00(D, R00, load_enable[0], rst, clk);
    RegisterNbit reg01(D, R01, load_enable[1], rst, clk);
    Mux2to1Nbit muxA(A, R00, R01, SA);
    Mux2to1Nbit muxB(B, R00, R01, SB);
endmodule
