
`timescale 10ns/100ps

module regfile_tb;
   //set up the variables that will be used to connect into the module being tested
  //it is a reg type so it updates only when told to
  reg [1:0] r_read1_tb, r_read2_tb, r_write_tb; 
  reg [7:0] r_write_data_tb;
  reg write_tb, clk_tb;
  //the result of the module being tested connects to a wire, so it can update as it needs to 
  wire [7:0] r_read1_data_tb, r_read2_data_tb;
  wire [7:0] reg0data_tb, reg1data_tb, reg2data_tb, reg3data_tb;
  
  initial //give initial value for what input to test first
    begin
      r_read1_tb=2'b00; r_read2_tb=2'b00; r_write_tb=2'b00;
      r_write_data_tb=8'b00;
      write_tb=1'b0; clk_tb=1'b0;
    end
  
  regfile dut(.r_read1(r_read1_tb),.r_read2(r_read2_tb),.r_write(r_write_tb),.r_write_data(r_write_data_tb),.write(write_tb),.clk(clk_tb),.r_read1_data(r_read1_data_tb),.r_read2_data(r_read2_data_tb),.reg0data(reg0data_tb),.reg1data(reg1data_tb),.reg2data(reg2data_tb),.reg3data(reg3data_tb)); //instantiate the module being tested
           
  
  //always
  initial
    begin
      
      #1 clk_tb=1;//read initial values
      #1 clk_tb=0;
      #1 clk_tb=1;write_tb = 1; r_write_data_tb = 8'hA1;//write A1 to register 0 (initial write reg is 0)(updates immediately b/c zero delay
      
      #1 clk_tb=0;
      #1 clk_tb=1;#0.1 r_write_data_tb = 8'h55;//Write 55 back to reg 0, this time does not write on this cycle b/c delay added
      #0.9 clk_tb=0;
      #1 clk_tb=1;//new value writes now
      
      #1clk_tb=0;
      #1clk_tb=1;r_read2_tb = 1;//make rt output second reg
      
      #1clk_tb=0;
      #1clk_tb=1;r_read2_tb = 2;//make rt output third reg value
      
      #1clk_tb=0;
      #1clk_tb=1;r_read2_tb = 3;//make rt output fourth reg value
      
      #1clk_tb=0;
      #1clk_tb=1;r_read1_tb = 2;//show rs can change too; make output third reg value
      
      #1 clk_tb=0;
      #1 clk_tb=1;r_write_tb = 1;//write 55 to reg 1
      
      #1 clk_tb=0;
      #1 clk_tb=1;r_write_tb = 2;//write 55 to reg 2
      
      #1 clk_tb=0;
      #1 clk_tb=1;r_write_tb = 3;//write 55 to reg 3
      
      #1 clk_tb=0;r_write_tb = 0; r_write_data_tb = 8'hE4;//show that write works even if updated on low clock
      #1 clk_tb=1;//writes E4 to reg 0
      
      #1 clk_tb=0;
      #1 clk_tb=1;write_tb = 0;//show that when write is 0, registers will not update in the next few tests
      
      #1 clk_tb=0; r_write_tb = 1;//second reg will not change
      #1 clk_tb=1;
      
      #1 clk_tb=0; r_write_tb = 2;//third reg will not change
      #1 clk_tb=1;
      
      #1 clk_tb=0; r_write_data_tb = 8'h2D;//changing data to write will not cause write
      #1 clk_tb=1;
      
      #1 clk_tb=0; r_read1_tb = 3;//can still change which regs are outputting with
      #1 clk_tb=1; r_read2_tb = 0;
      
      
      
    end
  
  initial //waveform generation code
    begin
      $dumpfile("reg_file.vcd");
      $dumpvars;
    end
  
  initial
  begin //create the instructions for the simulator to output observations to the log
    $display("\t\tTime\tReg1\tReg1data\tReg2\tReg2data\tClock\treg0\treg1\treg2\treg3");
    $monitor($time, "\t%d\t%h\t\t%d\t%h\t\t%b\t%h\t%h\t%h\t%h",r_read1_tb,r_read1_data_tb,r_read2_tb,r_read2_data_tb,clk_tb,reg0data_tb,reg1data_tb,reg2data_tb,reg3data_tb);
  end
  
  initial #33 $finish; //how many time units to run
           
  
endmodule