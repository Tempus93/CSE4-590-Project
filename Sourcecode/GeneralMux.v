`timescale 1ns / 1ps
// Engineer: Vishal Kishore Kumar
// Module: 2-to-1 Multiplexer

module Multiplexer(
    input [15:0] input0,
    input [15:0] input1,
    input sel,
    output [15:0] result
);
    assign result = sel ? input1 : input0;
endmodule
