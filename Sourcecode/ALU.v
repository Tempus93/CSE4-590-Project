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
    input [3:0] ALUControl,
    output reg zero,
    output reg [15:0] ALUResult

    );

    parameter
    //Required Instructions
    ADD = 3'b000, //merged ADD and ADDI since they share the same logic
    SUB = 3'b001,
    SLL = 3'b010,
    AND = 3'b011,
    LW = 4'b0001,
    SW = 4'b0010,
    BEQ = 4'b0100,
    BNE = 4'b0101,
    JMP = 4'b0110;

    always@(*) begin //Unit Initalization
        zero = 0;
        ALUResult = 0;
        begin
            case (ALUControl)
                3'b000: ALUResult = ReadData1 + ReadData2; // ADD (used by LW, SW, ADDI, ADD)
                3'b001: ALUResult = ReadData1 - ReadData2; // SUB (used by BEQ, BNE, SUB)
                3'b010: ALUResult = ReadData1 << ReadData2[3:0]; // SLL
                3'b011: ALUResult = ReadData1 & ReadData2; // AND
                default: ALUResult = 0;
             
            endcase
         // --- The Conditional Check ---
        if (ALUResult == 16'h0000) begin
            zero = 1;
        end else begin
            zero = 0;
        end
         
        end
    end

endmodule
