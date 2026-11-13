`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh
// Engineer: Mahir Ashab Enan, Navjot Bains
//
// Create Date: 11/13/2026
// Design Name: lab 10
// Module Name: cu
// Project Name: lab 10
// Target Devices:
// Tool Versions:
// Description: Six-state control unit for ROM read, multiply, RAM write and read.
//
// Dependencies: 
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module cu(clk, reset, adr1, adr2, w_rf, adr, DA, SA, SB, st_out, w_ram);
    input clk, reset;
    input [2:0] adr1;
    input [2:0] adr2;
    output reg w_rf;
    output reg [2:0] adr;
    output reg DA, SA, SB;
    output reg [2:0] st_out;
    output reg w_ram;

    parameter S0_idle = 0, S1_send_adr1 = 1,
              S2_send_adr2 = 2, S3_multiply = 3,
              S4_write_ram = 4, S5_read_ram = 5;
    reg [2:0] PS, NS;

    always @(posedge clk or posedge reset) begin
        if(reset)
            PS <= S0_idle;
        else
            PS <= NS;
    end

    always @(*) begin
        NS = S0_idle;
        w_rf = 1'b0;
        w_ram = 1'b0;
        adr = 3'b000;
        DA = 1'b0;
        SA = 1'b0;
        SB = 1'b1;
        st_out = PS;

        case(PS)
            S0_idle: begin
                NS = S1_send_adr1;
            end
            S1_send_adr1: begin
                adr = adr1;
                DA = 1'b0;
                w_rf = 1'b1;
                NS = S2_send_adr2;
            end
            S2_send_adr2: begin
                adr = adr2;
                DA = 1'b1;
                w_rf = 1'b1;
                NS = S3_multiply;
            end
            S3_multiply: begin
                NS = S4_write_ram;
            end
            S4_write_ram: begin
                w_ram = 1'b1;
                NS = S5_read_ram;
            end
            S5_read_ram: begin
                NS = S0_idle;
            end
            default: begin
                NS = S0_idle;
            end
        endcase
    end
endmodule
