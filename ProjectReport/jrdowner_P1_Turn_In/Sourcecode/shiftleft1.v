`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Justin Downer
// 
// Create Date: 03/18/2026 12:28:11 AM
// Design Name: 
// Module Name: ShiftLeft1
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


module ShiftLeft1(
    input [15:0] s_in,
    output [15:0] result
    );
    
    assign result = s_in << 1;
endmodule
