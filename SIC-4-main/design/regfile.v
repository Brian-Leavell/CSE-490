// Really cool register file. Please include regfile_data.dat.

`timescale 10ns/100ps

module regfile(r_read1, r_read2, r_write, r_write_data, write, clk, r_read1_data, r_read2_data, reg0data, reg1data, reg2data, reg3data);
  input [1:0] r_read1, r_read2, r_write;
  input [7:0] r_write_data; 
  input write, clk;
  output [7:0] r_read1_data, r_read2_data;
  output [7:0] reg0data, reg1data, reg2data, reg3data;
  
  reg [7:0] myregs [0:3];
  
  initial
    begin
      $readmemh("regfile_data.dat",myregs); // initialize register values
    end
  
  assign r_read1_data = myregs[r_read1];//If reg written to is read in same cycle, the read is the OLD value.
  assign r_read2_data = myregs[r_read2];//If we want to change this, just put the write before the read
  
  assign reg0data = myregs[0];
  assign reg1data = myregs[1];
  assign reg2data = myregs[2];
  assign reg3data = myregs[3];
  
  always @ (negedge clk) begin
    if (write)
      myregs[r_write] = r_write_data;
  end
endmodule
  
  
  
