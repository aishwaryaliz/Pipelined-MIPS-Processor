`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2024 08:51:18
// Design Name: 
// Module Name: inst_mem_da
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


module inst_mem_da(
    input [31:0] PC,
    input reset,
    output [31:0] Instruction_Code
    );
    
    reg [7:0] Mem [31:0]; //32 byte sized memory locations
   
assign Instruction_Code = { Mem [PC], Mem [PC+1], Mem [PC+2], Mem [PC+3]};

always @(reset)
begin

if (reset ==0)
begin 
Mem[0] = 8'b10001100; Mem[1] = 8'b00000001; Mem[2] = 8'b00000000; Mem[3] = 8'b00000000;
Mem[4] = 8'b00000000; Mem[5] = 8'b00100000; Mem[6] = 8'b00010000; Mem[7] = 8'b00100000; 
Mem[8] = 8'b00000000; Mem[9] = 8'b01000001; Mem[10] = 8'b00010000; Mem[11] = 8'b00100010;
Mem[12] = 8'b00001000; Mem[13] = 8'b01000000; Mem[14] = 8'b00000000; Mem[15] = 8'b01010000;
Mem[16] = 8'b00000000; Mem[17] = 8'b01000001; Mem[18] = 8'b00011000; Mem[19] = 8'b00100000;
Mem[20] = 8'b00000000; Mem[21] = 8'b01000001; Mem[22] = 8'b00100000; Mem[23] = 8'b00100000;
Mem[24] = 8'b10101100; Mem[25] = 8'b00100100; Mem[26] = 8'b00000000; Mem[27] = 8'b00000000;
end

//For reset = 1, initialised with given instructions
else
begin
Mem[0] = 8'b10001100; Mem[1] = 8'b00000001; Mem[2] = 8'b00000000; Mem[3] = 8'b00000000; //lw r1, 0(r0) 8C010000
Mem[4] = 8'b00000000; Mem[5] = 8'b00100000; Mem[6] = 8'b00010000; Mem[7] = 8'b00100000; //add r2,r1,r0 00201020
Mem[8] = 8'b00000000; Mem[9] = 8'b01000001; Mem[10] = 8'b00010000; Mem[11] = 8'b00100010; //sub r2,r2,r1 
Mem[12] = 8'b00001000; Mem[13] = 8'b01000000; Mem[14] = 8'b00000000; Mem[15] = 8'b00000101; //jz r2 L - address =right of 20 (10100) by 2 bits= 101
Mem[16] = 8'b00000000; Mem[17] = 8'b01000001; Mem[18] = 8'b00011000; Mem[19] = 8'b00100000; //add r3,r2,r1
Mem[20] = 8'b00000000; Mem[21] = 8'b01000001; Mem[22] = 8'b00100000; Mem[23] = 8'b00100000; //L: add r4,r2,r1
Mem[24] = 8'b1010_1100; Mem[25] = 8'b1010_0001; Mem[26] = 8'b0000_0000; Mem[27] = 8'b0000_0000; //sw r5, 0(r1) should store 14151617H in DMEM[5]
end

end

endmodule
