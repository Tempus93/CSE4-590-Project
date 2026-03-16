`timescale 1ns / 1ps
// Engineer: Vishal Kishore Kumar
// Module: Data Memory
// 64 byte-addressable locations, big-endian

module DataMemory(
    input clk,
    input [15:0] address,
    input [15:0] write_data,
    input mem_write,
    input mem_read,
    output reg [15:0] read_data
);
    reg [7:0] memory [63:0];

    always @(*) begin
        if (mem_read)
            read_data = {memory[address], memory[address+1]};
    end

    always @(posedge clk) begin
        if (mem_write) begin
            memory[address]   <= write_data[15:8];
            memory[address+1] <= write_data[7:0];
        end
    end
endmodule
