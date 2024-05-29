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


module mux2to1(
    input [7:0] a,
    input [7:0] b,
    input select,
    output reg [7:0] res
    );

    always @ (a, b, select)
        begin
            case (select)
                1'b0: res <= a;
                1'b1: res <= b;
                default: res <= 'bxxxxxxxx;
            endcase
        end
endmodule
