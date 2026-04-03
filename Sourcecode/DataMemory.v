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
    reg [7:0] memory [0:63];
    integer i;

    // --- Added Initialization ---
    initial begin
        for (i = 0; i < 64; i = i + 1) begin
            memory[i] = 8'h00;
        end
        // Optional: Seed a value to test "Load Word" (LW)
        // This puts 0xABCD at Address 0 and 1
        memory[0] = 8'hAB; 
        memory[1] = 8'hCD;
    end

    
    always @(posedge clk) begin
        if (mem_read)
            read_data <= {memory[address], memory[address+1]};
        else
            read_data <= 16'h0000; // Default value prevents latches
    end
    
    always @(posedge clk) begin
        if (mem_write) begin
            memory[address]   <= write_data[15:8];
            memory[address+1] <= write_data[7:0];
        end
    end
endmodule
