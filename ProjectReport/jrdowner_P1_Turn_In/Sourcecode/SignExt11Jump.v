`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Justin Downer
// 
// Create Date: 03/15/2026 06:59:25 PM
// Design Name: 
// Module Name: SignExt11Jump
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


module SignExt11Jump(
    input [11:0] imm_value,
    output [15:0] result
    );
    
    assign result[11:0] = imm_value;
    assign result[15:12] = {4{imm_value[11]}};
    
endmodule
