`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/13/2026
// Design Name: lab 10
// Module Name: Multiplier_top_tb
// Project Name: lab 10
// Target Devices:
// Tool Versions:
// Description: Testbench for multiple ROM address pairs and RAM addresses.
//
// Dependencies: Multiplier_top and its submodules
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module Multiplier_top_tb;
    reg clk, reset;
    reg [2:0] addr1_ROM, addr2_ROM, addr_RAM;
    wire [7:0] result;

    Multiplier_top uut(clk, reset, addr1_ROM, addr2_ROM, addr_RAM, result);

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        reset = 1;
        addr1_ROM = 3'd1; // ROM[1] = 12
        addr2_ROM = 3'd2; // ROM[2] = 6
        addr_RAM = 3'd0;

        #12 reset = 0;
        #60;
        $display("Case 1: ROM[1] x ROM[2] = %d (expected 72)", result);

        addr1_ROM = 3'd3; // ROM[3] = 7
        addr2_ROM = 3'd4; // ROM[4] = 8
        addr_RAM = 3'd1;
        #60;
        $display("Case 2: ROM[3] x ROM[4] = %d (expected 56)", result);

        addr1_ROM = 3'd6; // ROM[6] = 13
        addr2_ROM = 3'd7; // ROM[7] = 14
        addr_RAM = 3'd2;
        #60;
        $display("Case 3: ROM[6] x ROM[7] = %d (expected 182)", result);

        $finish;
    end
endmodule
