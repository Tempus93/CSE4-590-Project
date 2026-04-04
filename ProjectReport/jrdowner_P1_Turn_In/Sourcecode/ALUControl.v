`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2026 04:43:37 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(
    input [3:0] Instruction,
    input [1:0] ALUOp,
    output reg [3:0] ALUControl
    );
    
    always @(*) begin
    case(ALUOp)
        2'b00: ALUControl = 3'b000; // Force Add (LW, SW, ADDI)
        2'b01: ALUControl = 3'b001; // Force Sub (BEQ, BNE)
        2'b10: begin               // R-type mode: Check Function Code
            case(Instruction)
                4'b0000: ALUControl = 3'b000; // add
                4'b0001: ALUControl = 3'b001; // sub
                4'b0010: ALUControl= 3'b010; // sll
                4'b0011: ALUControl= 3'b011; // and
                default: ALUControl= 3'b000;
            endcase
        end
        default: ALUControl = 3'b000;
    endcase
end
endmodule
