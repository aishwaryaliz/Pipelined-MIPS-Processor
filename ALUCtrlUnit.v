`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 17:15:36
// Design Name: 
// Module Name: ALUCtrlUnit
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


module ALUCtrlUnit(
    input [1:0]ALUop,
    input [5:0]function_field,
    output ALUcontrol
    );
    
    assign ALUcontrol = ( function_field[1]& ~(ALUop[1]) ) | (ALUop[0] & ~(ALUop[1]));
    
    
endmodule
