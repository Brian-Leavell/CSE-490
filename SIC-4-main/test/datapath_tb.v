`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 03:50:35 PM
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module datapath_tb;

    // Used to get value from inst_mem
    reg CLK;
    wire [7:0] PC;
    wire [7:0] INSTRUCTION;
    wire [7:0] RS;
    wire [7:0] RT;
    
    initial //give initial value for what input to test first
        begin
            CLK  = 1'b0;
        end

    datapath dut(
        .clk(CLK),
        .rs(RS),
        .rt(RT)
        );
        
    always
        begin
            #1 CLK=(CLK+1) % 2; //cycle through all the addresses
        end
        
    initial //waveform generation code
        begin
            $dumpfile("datapath.vcd");
            $dumpvars;
        end

    initial #(2*255) $finish; //how many time units to run
endmodule
