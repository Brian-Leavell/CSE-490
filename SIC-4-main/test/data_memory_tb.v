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

module data_memory_tb;

    // Used to get value from inst_mem
    reg CLK;
    reg [7:0] ADDR;
    reg [7:0] WRITE_DATA;
    reg WRITE_EN;

    wire [7:0] DATA;
    
    //give initial value for what input to test first
    initial begin
        CLK  = 1'b0;
        ADDR = 8'b00000000;
        WRITE_DATA = 8'b00000000;
        WRITE_EN = 1'b0;
    end

    data_memory dut(
        .clk(CLK),
        .addr(ADDR),
        .write_data(WRITE_DATA),
        .write_enable(WRITE_EN),
        .data(DATA)
        );
        
    always begin
        #1 CLK=1; // Flip clk
        #1 CLK=0;
    end

    always begin
        #2
        ADDR = 'h55;
        WRITE_DATA = 'hDE;
        WRITE_EN = 1;
        #2
        ADDR = 'h55;
        WRITE_DATA = 'h25;
        WRITE_EN = 0;
        #2
        ADDR = 'h02;
        WRITE_DATA = 'h00;
        WRITE_EN = 0;
        #2
        ADDR = 'h02;
        WRITE_DATA = 'h1F;
        WRITE_EN = 1;
        #2
        ADDR = 'h02;
        WRITE_DATA = 'h1F;
        WRITE_EN = 0;
    end
        
    //waveform generation code
    initial begin
        $dumpfile("data_memory.vcd");
        $dumpvars;
    end
    
    //create the instructions for the simulator to output observations to the log
    initial begin
        $display("Clock\t Addr\t DataIN\t \t Write_EN    |\t DATA\t");
        $monitor("%b\t %h\t %h\t %b   |\t %h\t",
            CLK,
            ADDR,
            WRITE_DATA,
            WRITE_EN,
            DATA
            );
    end

    initial #(24) $finish; //how many time units to run
endmodule

