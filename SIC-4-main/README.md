# SIC-4

Seven Instruction (8-bit) Computer

## Verilog testing

Testing the project on a system that has iverilog (timberlake or docker container)

Once in the project, from a terminal running `make` or `make build` will build each testbench with all the design files.

To then run the tests, change directory into **tests** directory (`cd tests`) and run the testbench EX: `./alu_tb.out`

## Vivado

1. Import the design files
2. Generate bitstream
3. Upload to FPGA
