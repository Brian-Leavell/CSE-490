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

module instr_memory_tb;

    reg [7:0] ADDR;

    wire [7:0] DATA;
    
    //give initial value for what input to test first
    initial begin
        ADDR = 8'b00000000;
    end

    instr_memory dut(
        .addr(ADDR),
        .data(DATA)
        );

    always begin
        #1
        ADDR = ADDR + 1;
    end
        
    //waveform generation code
    initial begin
        $dumpfile("instr_memory.vcd");
        $dumpvars;
    end

    initial #(12) $finish; //how many time units to run
endmodule

