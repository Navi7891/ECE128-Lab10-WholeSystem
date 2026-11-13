# ECE 128 Lab 10 - Whole System Design

This project reads two 4-bit values from ROM, loads them into a register file, multiplies them using a combinational multiplier, and writes the 8-bit product to RAM. A finite state machine controls the steps.

## Files

- `Design_Sources/` - Verilog modules for the complete design
- `Simulation_Sources/Multiplier_top_tb.v` - Testbench for the top module
- `Constraints/Lab10.xdc` - FPGA pin assignments

## Behavioral Simulation

1. Create a new RTL project in Vivado with part `xc7a35tcpg236-2L`.
2. Add the `.v` files in `Design_Sources` as Design Sources.
3. Add `Multiplier_top_tb.v` as a Simulation Source.
4. Set `Multiplier_top` as the design top and `Multiplier_top_tb` as the simulation top.
5. Run **Behavioral Simulation** and check the waveform and simulation console.

The testbench checks these ROM address pairs:

| ROM addresses | Values | Expected product |
| --- | --- | --- |
| 1 and 2 | 12 and 6 | 72 |
| 3 and 4 | 7 and 8 | 56 |
| 6 and 7 | 13 and 14 | 182 |

## FPGA Implementation

1. Add `Constraints/Lab10.xdc` to the project's Constraints sources.
2. Run **Synthesis**, **Implementation**, and **Generate Bitstream**.
3. Connect the FPGA board and program it using the generated bitstream.
4. Use the switches for the ROM and RAM addresses, BTNU for reset, and observe `result[7:0]` on LEDs 7 through 0.

The XDC uses SW0-SW5 for the two ROM addresses, SW6-SW7 and BTNC for the RAM address, and the board clock. The physical pin assignments and board behavior should be checked on the classroom board during the demonstration.
