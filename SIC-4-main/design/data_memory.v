`timescale 1ns / 1ps

module data_memory(
    input clk,
    input [7:0] addr,
    input [7:0] write_data,
    input write_enable,
    output [7:0] data
    );

    //internal variable to store the data being read from the file
    reg [7:0] RAM[0:255];

    initial
      begin
        $readmemh("data_mem.dat",RAM); // initial memory
      end

    assign data = RAM[addr];
    always @ (posedge clk) begin
        if (write_enable)
            RAM[addr] = write_data;
    end
endmodule