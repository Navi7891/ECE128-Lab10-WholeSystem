`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/13/2026
// Design Name: lab 10
// Module Name: Multiplier_top
// Project Name: lab 10
// Target Devices:
// Tool Versions:
// Description: Connects the control unit, ROM, register file, multiplier and RAM.
//
// Dependencies: cu, ROM, RF, comb_mult, RAM
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module Multiplier_top(input clk, reset,
                      input [2:0] addr1_ROM, addr2_ROM, addr_RAM,
                      output [7:0] result);

    wire [2:0] adr;
    wire [2:0] st_out;
    wire w_rf, w_ram, DA, SA, SB;
    wire [3:0] ROM_data, A, B;
    wire [7:0] product;

    cu uut0(clk, reset, addr1_ROM, addr2_ROM,
            w_rf, adr, DA, SA, SB, st_out, w_ram);
    ROM uut1(ROM_data, adr);
    RF uut2(A, B, SA, SB, ROM_data, DA, w_rf, reset, clk);
    comb_mult uut3(A, B, product);
    RAM uut4(clk, reset, addr_RAM, product, w_ram, result);

endmodule
