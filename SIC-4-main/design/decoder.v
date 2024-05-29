`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 01:50:39 PM
// Design Name: 
// Module Name: Decoder
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


module decoder(
    input [7:0] instr,
    output [1:0] fun_imm,
    output [1:0] rs,
    output [1:0] rtd,
    output [1:0] op
    );

    assign op = instr[7:6];
    assign rtd = instr[5:4];
    assign rs = instr[3:2];
    assign fun_imm = instr[1:0];

endmodule
