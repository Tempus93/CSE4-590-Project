`timescale 1ns / 1ps
// Engineer: Vishal Kishore Kumar
// Module: Register File
// 16 registers, each 16 bits wide

module RegisterFile(
    input clk,
    input [3:0] read_reg1,
    input [3:0] read_reg2,
    input [3:0] write_reg,
    input [15:0] write_data,
    input reg_write,
    output [15:0] read_data1,
    output [15:0] read_data2
);
    integer i;
    reg [15:0] registers [0:15];
    
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
                registers[i] = 16'h0000;
        end
  
        registers[1] = 16'h0005; 
        registers[2] = 16'h0002;
 
    end

    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];

    always @(posedge clk) begin
        if (reg_write)
            registers[write_reg] <= write_data;
    end
endmodule
