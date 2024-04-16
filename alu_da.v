`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 10:51:34
// Design Name: 
// Module Name: alu_da
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


module alu_da(
    input [31:0] A,
    input [31:0] B,
    input control,
    output reg [31:0] result, //storing result in a register
    output zerof
    );
    
always @ (*)  
begin
 
case (control)
    0: result <= A+B; //add
    1: result <= A-B; //sub
    default: result <= A+B;//default in cases of incrementing base address
endcase
end

assign zerof =~(|result);
endmodule
