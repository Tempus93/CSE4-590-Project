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
    reg [3:0] temp;

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
        temp = 0;
        ALUResult = 0;
        begin
            case (ALUControl)

            ADD: begin
                temp = ReadData1 + ReadData2;
                ALUResult = temp;
                if (temp == 0) begin
                    zero = 1;
                end

            end

            SUB: begin
                temp = ReadData1 - ReadData2;
                ALUResult = temp;
                if (temp == 0) begin
                    zero = 1;
                end

            end

            SLL: begin 
                temp = ReadData1 << ReadData2;
                ALUResult = temp;
                if (temp == 0) begin
                    zero = 1;
                end 
                
            end

            AND: begin
                temp = ReadData1 & ReadData2;
                ALUResult = temp;
                if (temp == 0) begin
                    zero = 1;
                end 
            end

            LW: begin
                temp = ReadData1 + ReadData2; //Calculate Address for LW
                //ReadData2 is the offset, ReadData1 is the base address
                ALUResult = temp;
                if (temp == 0) begin
                    zero = 1;
                end
                
            end

            SW: begin
                temp = ReadData1 + ReadData2; //Calculate Address for SW
                //ReadData2 is the offset, ReadData1 is the base address
                ALUResult = temp;
                if (temp == 0) begin
                    zero = 1;
                end
                
            end

            BEQ: begin
            temp = ReadData1 - ReadData2;
            if (temp == 0) begin
                    zero = 1;
                end
                
            end

            BNE: begin
            temp = ReadData1 - ReadData2;
            if (temp != 0) begin
                    zero = 1;
                end
           
            end

            JMP: begin
                //doesn't touch the ALU
            end

            endcase
        end
    end

endmodule
