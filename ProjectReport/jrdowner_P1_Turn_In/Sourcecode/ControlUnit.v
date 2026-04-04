`timescale 1ns /  1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Justin Downer
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
(* DONT_TOUCH = "yes" *)
module ControlUnit (
    input [3:0] Instruction,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg BNE,
    output reg Jump,
    output reg [1:0] ALUOp
);

always@(*) begin
        // Default values to avoid latches
        RegWrite = 0;
        ALUSrc = 0;
        RegDst = 0;
        MemtoReg = 0;
        MemWrite = 0;
        MemRead = 0;
        Branch = 0;
        Jump = 0;
        BNE = 0;
        ALUOp = 2'b00;
        
case(Instruction)
            4'b0000: begin // R-type (add, sub, and, sll)
                RegDst = 1; RegWrite = 1; ALUSrc = 0; MemtoReg = 0; ALUOp = 2'b10;
            end
            4'b0001: begin // LW
                RegWrite = 1; ALUSrc = 1; MemtoReg = 1; MemRead = 1; ALUOp = 2'b00;
            end
            4'b0010: begin // SW
                RegWrite = 0; ALUSrc = 1; MemWrite = 1; ALUOp = 2'b00;
            end
            4'b0011: begin // ADDI
                RegWrite = 1; ALUSrc = 1; MemtoReg = 0; ALUOp = 2'b00;
            end
            4'b0100: begin // BEQ
                RegWrite = 0; ALUSrc = 0; Branch = 1; ALUOp = 2'b01;
            end
            4'b0101: begin // BNE
                RegWrite = 0; ALUSrc = 0; Branch = 1; BNE = 1; ALUOp = 2'b01;
            end
            4'b0110: begin // J
                RegWrite = 0; ALUSrc = 0; Jump = 1; ALUOp = 2'b11;
            end
            default: ; // All signals remain 0
        endcase
    end
endmodule
