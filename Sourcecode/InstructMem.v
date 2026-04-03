`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Justin Downer
// 
// Create Date: 03/14/2026 04:10:32 PM
// Design Name: 
// Module Name: InstructMem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module InstructMem (
    input clk,
    input [15:0] Address,
    output [15:0] Instruction
);
reg [7:0] memory [0:63];
initial begin
    $readmemh("vbit.mem", memory);
end


assign Instruction = {memory[Address], memory[Address+1]}; 
  
endmodule