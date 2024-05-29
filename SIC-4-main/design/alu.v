`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 01:50:39 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input [7:0] a,
    input [7:0] b,
    input [1:0] aluop,
    output reg [7:0] res
    );

    always @ (a, b, aluop) begin
        case (aluop)
            2'b00: res = a + b;
            2'b01: res = a - b;
            2'b10: res = b << a;
            2'b11: res = a & b;
            default: res = 'bxxxxxxxx;
        endcase
    end
endmodule
