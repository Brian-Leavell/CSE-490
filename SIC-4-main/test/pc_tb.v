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

module pc_tb;

    // Used to get value from inst_mem
    reg CLK;

    wire [7:0] PC;
    
    //give initial value for what input to test first
    initial begin
        CLK  = 1'b0;
    end

    pc dut(
        .clk(CLK),
        .pc(PC)
        );
        
    always begin
        #1 CLK=1; // Flip clk
        #1 CLK=0;
    end
        
    //waveform generation code
    initial begin
        $dumpfile("pc.vcd");
        $dumpvars;
    end

    initial #32 $finish; //how many time units to run
endmodule

