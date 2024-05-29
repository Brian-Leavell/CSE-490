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


module control_unit(
    input [1:0] op,
    input [1:0] funct,
    output reg regWrite,
    output reg memWrite,
    output reg useImmediate,
    output reg useLoad,
    output reg [1:0] aluop
    );

    always @ (op, funct) begin
        case (op)
            2'b00: begin // ALU functions
            regWrite <= 1;
            memWrite <= 0;
            useImmediate <= 0;
            useLoad <= 0;
            aluop <= funct;
            end

            2'b01: begin // Load word
            regWrite <= 1;
            memWrite <= 0;
            useImmediate <= 1;
            useLoad <= 1;
            aluop <= 'b00;
            end

            2'b10: begin // Save word
            regWrite <= 0;
            memWrite <= 1;
            useImmediate <= 1;
            useLoad <= 0;
            aluop <= 'b00;
            end

            2'b11: begin // Add imm
            regWrite <= 1;
            memWrite <= 0;
            useImmediate <= 1;
            useLoad <= 0;
            aluop <= 'b00;
            end

            default: begin // Default
            regWrite <= 'bx;
            memWrite <= 'bx;
            useImmediate <= 'bx;
            useLoad <= 'bx;
            aluop <= 'bxx;
            end
        endcase
    end
endmodule
