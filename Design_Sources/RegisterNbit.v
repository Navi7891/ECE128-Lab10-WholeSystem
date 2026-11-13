`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/13/2026
// Design Name: lab 10
// Module Name: RegisterNbit
// Project Name: lab 10
// Target Devices:
// Tool Versions:
// Description: 4-bit register with load enable and asynchronous reset.
//
// Dependencies: 
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module RegisterNbit(D, Q, L, R, clock);
    parameter N = 4;
    output reg [N-1:0] Q;
    input [N-1:0] D;
    input L;
    input R;
    input clock;

    always @(posedge clock or posedge R) begin
        if(R)
            Q <= 0;
        else if(L)
            Q <= D;
        else
            Q <= Q;
    end
endmodule
