`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sajjad Ali 
// 
// Create Date: 03/15/2026 07:32:21 PM
// Design Name: 
// Module Name: PCAdder
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


module PCAdder(

    input  [15:0] pc_in,
    input  [15:0] imm_shifted,
    output [15:0] pc_next,
    output [15:0] pc_branch
    );
    
    assign pc_next   = pc_in + 16'd2;
    assign pc_branch = pc_next + imm_shifted;

endmodule
