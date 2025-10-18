`timescale 1ns / 1ps
module alu_tb;

  reg [3:0] a, b, opcode;
  wire [3:0] x, y;

  alu alu_dut (.a(a), .b(b), .opcode(opcode), .x(x), .y(y));

  initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, alu_tb);
    $monitor("time=%0t | a=%b b=%b opcode=%b | x=%b y=%b", $time, a, b, opcode, x, y);

    a=4'b0011; b=4'b0001; opcode=4'b0000; #10;
    a=4'b0100; b=4'b0010; opcode=4'b0001; #10;
    a=4'b1010; b=4'b0011; opcode=4'b0010; #10;
    a=4'b1111; b=4'b0101; opcode=4'b0011; #10;

    #10 $finish;
  end
endmodule