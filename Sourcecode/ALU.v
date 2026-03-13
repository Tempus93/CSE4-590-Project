`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Justin Downer
// 
// Create Date: 03/13/2026 04:10:32 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    //In/Outs of ALU for 16 bit Bus DataRead/ALUResult
    input [15:0] ReadData1,
    input [15:0] ReadData2,
    output Zero,
    output [15:0] ALUResult,
    input [3:0] ALUControl
    ); 
    reg [3:0] temp;
    parameter  =(
        ADD = 4'b0000
        ADD = 4'b0000
        ADD = 4'b0000
        ADD = 4'b0000

    );
endmodule
