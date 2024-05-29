module pc(clk, pc);
    input clk;
    output reg [7:0] pc;

    initial begin
        pc <= 8'b11111111;
    end

    always @(posedge clk) begin
        pc <= pc + 1;
    end
endmodule
