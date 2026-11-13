`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/13/2026
// Design Name: lab 10
// Module Name: RAM
// Project Name: lab 10
// Target Devices:
// Tool Versions:
// Description: Eight 8-bit RAM words with clocked write and read.
//
// Dependencies: 
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module RAM(i_clk, i_rst, i_addr, i_write_data, i_write_en, o_read_data);

    parameter DATA_W = 8;
    parameter SIZE = 8;
    parameter ADDR_W = 3;

    input i_clk, i_rst, i_write_en;
    input [ADDR_W-1:0] i_addr;
    input [DATA_W-1:0] i_write_data;
    output reg [DATA_W-1:0] o_read_data;

    reg [DATA_W-1:0] mem[0:SIZE-1]; // 8 words, each has 8 bits
    integer i;

    always @(posedge i_clk) begin
        if(i_rst) begin
            for (i=0; i<SIZE; i=i+1) begin
                mem[i] <= 0;
            end
            o_read_data <= 0;
        end
        else begin
            if(i_write_en)
                mem[i_addr] <= i_write_data;
            else
                o_read_data <= mem[i_addr];
        end
    end
endmodule
