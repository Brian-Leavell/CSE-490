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

`define testvalues 4

module signextend_tb;

    // Used to get value from inst_mem
    reg CLK;
    reg [1:0] IN;

    wire [7:0] OUT;
    
    //give initial value for what input to test first
    initial begin
        CLK  = 1'b0;
        IN = 2'b00;
    end

    signextender dut(
        .in(IN),
        .out(OUT)
        );
        
    always begin
        #1 CLK=1; // Flip clk
        #1 CLK=0;
    end

    always begin
        #2 IN = 2'b01;
        #2 IN = 2'b10;
        #2 IN = 2'b11;
        #2 IN = 2'b00;
    end
        
    //waveform generation code
    initial begin
        $dumpfile("sign_extend.vcd");
        $dumpvars;
    end
    
    //create the instructions for the simulator to output observations to the log
    initial begin
        $display("Clock\t In    |\t res\t");
        $monitor("%b\t %h   |\t %h\t",
            CLK,
            IN,
            OUT
            );
    end

    initial #(`testvalues*4) $finish; //how many time units to run
endmodule

