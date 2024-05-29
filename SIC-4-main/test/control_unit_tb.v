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

module control_unit_tb;

    // Used to get value from inst_mem
    reg [1:0] OPCODE;
    reg [1:0] FUNCT;

    wire regWrite;
    wire memWrite;
    wire useImmediate;
    wire useLoad;
    wire [1:0] aluopcode;
    
    //give initial value for what input to test first
    initial begin
        OPCODE  = 2'b00;
        FUNCT  = 2'b00;
    end

    control_unit dut(
        .op(OPCODE),
        .funct(FUNCT),
        .regWrite(regWrite),
        .memWrite(memWrite),
        .useImmediate(useImmediate),
        .useLoad(useLoad),
        .aluop(aluopcode)
        );
        
    always begin
        #1 FUNCT = (FUNCT + 1) % 4;
    end

    always begin
        #4 OPCODE = (OPCODE + 1) % 4;
    end
        
    //waveform generation code
    initial begin
        $dumpfile("control_unit.vcd");
        $dumpvars;
    end

    initial #16 $finish; //how many time units to run
endmodule

