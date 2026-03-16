`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sajjad Ali 
// 
// Create Date: 03/15/2026 07:56:45 PM
// Design Name: 
// Module Name: PCRegister
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


module PCRegister(

    input             clk,
    input             reset,
    input      [15:0] pc_in,
    output reg [15:0] pc_out
    );
    
    always @(posedge clk) begin
        if (reset)
            pc_out <= 16'h0000;
        else
            pc_out <= pc_in;
    end

endmodule
