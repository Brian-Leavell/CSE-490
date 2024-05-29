`timescale 1ns / 1ps

module instr_memory(
    input [7:0] addr,
    output [7:0] data
    );

    //internal variable to store the data being read from the file
    reg [7:0] RAM[0:255];

    initial begin
        $readmemb("instr_mem.dat",RAM); // initial instruction memory
    end

    assign data = RAM[addr];
endmodule