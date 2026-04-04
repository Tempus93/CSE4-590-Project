`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Justin Downer
// 
// Create Date: 03/23/2026 06:31:19 PM
// Design Name: 
// Module Name: 4bitMux
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


module fourbitMux(
    input [3:0] input0,
    input [3:0] input1,
    input sel,
    output [3:0] result
);

assign result = sel ? input1 : input0;
    
endmodule
