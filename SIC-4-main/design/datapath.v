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

// This is the only file that needs to be structural verilog

module datapath(
    input clk,                  // CLK
//    output [7:0] pc_addr,
//    output [7:0] instruction,   // Instruction
//    output [7:0] reg0,          // Register 0
//    output [7:0] reg1,          // Register 1
//    output [7:0] reg2,          // Register 2
//    output [7:0] reg3,          // Register 3
    output [7:0] rs,
    output [7:0] rt
    );
    
    wire [7:0] reg0;          // Register 0
    wire [7:0] reg1;          // Register 1
    wire [7:0] reg2;          // Register 2
    wire [7:0] reg3;          // Register 3
    
    // Instruction
    wire [7:0] pc_addr;
    wire [7:0] instruction;
    
    // Parts of an instruction
    wire [1:0] op;
    wire [1:0] rtd_addr;
    wire [1:0] rs_addr;
    wire [1:0] fun_imm;

    // Control wires
    wire regWrite;
    wire memWrite;
    wire useImmediate;
    wire useLoad;
    wire [1:0] aluop;

    // Output of register file
//    wire [7:0] rs;
//    wire [7:0] rt;

    // Output of zero extend
    wire [7:0] imm_extended;

    // Output of muxes
    wire [7:0] rt_or_imm;
    wire [7:0] alu_or_load;

    // Output of ALU
    wire [7:0] alu_out;
    
    // Output of Load mem
    wire [7:0] data_mem_out;

    // Getting an instruction
    pc pc(.clk(clk), .pc(pc_addr));
    instr_memory instr_memory(.addr(pc_addr), .data(instruction));
    decoder decoder(.instr(instruction), .op(op), .rtd(rtd_addr), .rs(rs_addr), .fun_imm(fun_imm));

    // Generate control values for muxes and alu
    control_unit control_unit(
                .op(op),
                .funct(fun_imm),
                .regWrite(regWrite),
                .memWrite(memWrite),
                .useImmediate(useImmediate),
                .useLoad(useLoad),
                .aluop(aluop)
    );

    // Register file
    regfile regfile(
                .r_read1(rs_addr),
                .r_read2(rtd_addr),
                .r_write(rtd_addr),
                .r_write_data(alu_or_load),
                .write(regWrite),
                .r_read1_data(rs),
                .r_read2_data(rt),
                .clk(clk),
                .reg0data(reg0),
                .reg1data(reg1),
                .reg2data(reg2),
                .reg3data(reg3)
    );

    // Zero Extend the possible immediate
    signextender signextender(.in(fun_imm), .out(imm_extended));

    // Mux to select between rt or imm for alu
    mux2to1 alu_input_mux(.a(rt), .b(imm_extended), .select(useImmediate), .res(rt_or_imm));

    // ALU connection
    alu alu(.a(rs), .b(rt_or_imm), .aluop(aluop), .res(alu_out));

    // Data memory connection
    data_memory data_memory(.clk(clk), .addr(alu_out), .write_data(rt), .write_enable(memWrite), .data(data_mem_out));

    // Alu and data memory select
    mux2to1 reg_writeback_mux(.a(alu_out), .b(data_mem_out), .select(useLoad), .res(alu_or_load));

endmodule
