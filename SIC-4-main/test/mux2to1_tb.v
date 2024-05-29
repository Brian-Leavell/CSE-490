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

module mux2to1_tb;

    // Used to get value from inst_mem
    reg SELECT;
    reg [7:0] A;
    reg [7:0] B;

    wire [7:0] OUT;
    
    //give initial value for what input to test first
    initial begin
        SELECT  = 1'b0;
        A = 8'b10101010;
        B = 8'b11110000;
    end

    mux2to1 dut(
        .select(SELECT),
        .a(A),
        .b(B),
        .res(OUT)
        );
        
    always begin
        #1 SELECT=1; // Flip slt
        #1 SELECT=0;
    end
        
    //waveform generation code
    initial begin
        $dumpfile("mux2to1.vcd");
        $dumpvars;
    end

    initial #4 $finish; //how many time units to run
endmodule

