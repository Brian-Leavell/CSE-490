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

`define testvalues 6

module alu_tb;

    // Used to get value from inst_mem
    reg [3:0] ADDR;

    // Two values
    wire [7:0] A;
    wire [7:0] B;
    
    // ALUOP code to select operation
    reg [1:0] ALUOP;
    
    // Result
    wire [7:0] RES;
    
    initial //give initial value for what input to test first
        begin
            ADDR  = 4'b0000;
            ALUOP = 2'b00; // add op
        end
        
    inst_mem mem(.addr(ADDR),.a(A),.b(B));

    alu dut(
        .a(A),
        .b(B),
        .aluop(ALUOP),
        .res(RES)
        );
        
    always
        begin
            #1 ADDR=(ADDR+1) % `testvalues; //cycle through all the addresses
        end

    always
        begin
            #(`testvalues) ALUOP = 2'b01; // sub  op
            #(`testvalues) ALUOP = 2'b10; // shift op
            #(`testvalues) ALUOP = 2'b11; // and op
        end
        
    initial //waveform generation code
        begin
            $dumpfile("alu_tb.vcd");
            $dumpvars;
        end
    
    initial
    begin //create the instructions for the simulator to output observations to the log
        $display("Address\t ALUop\t A\t B    |\t res\t");
        $monitor("%h\t %b\t %h\t %h   |\t %h\t",
            ADDR,
            ALUOP,
            A,
            B,
            RES
            );
    end

    initial #(`testvalues*4) $finish; //how many time units to run
endmodule

module inst_mem(addr, a, b);
    input  [3:0] addr; //address for the memory
    output [7:0] a; //first int being returned
    output [7:0] b; //second int being returned
    reg [15:0] RAM[0:(`testvalues-1)]; //internal variable to store the data being read from the file

    initial
      begin
        $readmemh("alu_testvalues.dat",RAM); // initialize memory
      end

    assign a = RAM[addr][15:8]; // grab left side as int a
    assign b = RAM[addr][7:0];  // grab right side as int b
endmodule
