`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2024 15:09:30
// Design Name: 
// Module Name: control
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


module control_da(
    input [31:0] Instruction_Code,
    output RegDst,
    output RegWrite,
    output ALUSrc,
    output [1:0] ALUop,
    output MemRead,
    output MemWrite,
    output MemtoReg,
    output Branch
    );
    
    assign RegDst = ~Instruction_Code[31];
    assign RegWrite = ~(Instruction_Code[31] ^ Instruction_Code[29] ^ Instruction_Code[27]);
    assign ALUSrc = Instruction_Code [31];
    assign ALUop = { Instruction_Code [31], Instruction_Code [29]^Instruction_Code [27] }; 
    //ALUop : R (00), LW (11), SW (10), JZ (01)
    assign MemRead = Instruction_Code[31] ^ Instruction_Code[29];
    assign MemWrite = Instruction_Code[31] ^ Instruction_Code[29] ^ Instruction_Code[26];
    assign MemtoReg = Instruction_Code [31];
    assign Branch = Instruction_Code[31] ^ Instruction_Code[27];
        
    endmodule