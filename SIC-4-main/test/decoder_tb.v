`timescale 10ns / 100ps

module decoder_tb;
  reg [7:0] instr_tb;
  wire [1:0] fun_imm_tb;
  wire [1:0] rs_tb;
  wire [1:0] rtd_tb;
  wire [1:0] op_tb;
  
  decoder test(instr_tb, fun_imm_tb, rs_tb, rtd_tb, op_tb);
  
  initial
    begin
      instr_tb = 8'b00000000;
    end
  
  initial
    begin
      #1 instr_tb = 8'b00000001;
      #1 instr_tb = 8'b11100001;
      #1 instr_tb = 8'b00100110;
      #1 instr_tb = 8'b11111111;
      #1 instr_tb = 8'b00110001;
      #1 instr_tb = 8'b01110010;
    end

  initial //waveform generation code
        begin
            $dumpfile("decoder.vcd");
            $dumpvars;
        end
  
  initial
    begin
      
      
      $display("Instr.\t\t\t\tOp\tRtd\tRs\tFun_Imm");
      $monitor("%b\t\t\t%b\t%b\t%b\t%b", instr_tb, op_tb, rtd_tb, rs_tb, fun_imm_tb);
      
      
    end
  
  initial #7 $finish; //how many time units to run
  endmodule
