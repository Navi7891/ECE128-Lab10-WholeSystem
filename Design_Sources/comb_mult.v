`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/13/2026
// Design Name: lab 10
// Module Name: comb_mult
// Project Name: lab 10
// Target Devices:
// Tool Versions:
// Description: 4-bit combinational array multiplier made from partial products.
//
// Dependencies: 
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module comb_mult(a, b, p);
    input [3:0] a, b;
    wire [3:0] m0;
    wire [4:0] m1;
    wire [5:0] m2;
    wire [6:0] m3;
    wire [7:0] s1, s2, s3;
    output [7:0] p;

    // Four rows of partial products from Lecture 7.
    assign m0 = {a[3]&b[0], a[2]&b[0], a[1]&b[0], a[0]&b[0]};
    assign m1 = {a[3]&b[1], a[2]&b[1], a[1]&b[1], a[0]&b[1], 1'b0};
    assign m2 = {a[3]&b[2], a[2]&b[2], a[1]&b[2], a[0]&b[2], 2'b00};
    assign m3 = {a[3]&b[3], a[2]&b[3], a[1]&b[3], a[0]&b[3], 3'b000};

    assign s1 = m0 + m1;
    assign s2 = s1 + m2;
    assign s3 = s2 + m3;
    assign p = s3;
endmodule
