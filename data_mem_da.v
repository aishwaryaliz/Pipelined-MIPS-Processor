`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 10:11:33
// Design Name: 
// Module Name: data_mem_da
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


module data_mem_da(
    input [31:0] data_address,
    input [31:0] write_data,
    output reg [31:0] read_data,
    input MemRead,
    input MemWrite,
    input reset
    );
    
    reg [7:0] DMEM [31:0]; //32 byte sized memory locations that can store 8 32-bit data
    

always @(reset)
begin

if (reset ==0)
begin 
DMEM[0] = 20; DMEM[1] = 21; DMEM[2] = 22; DMEM[3] = 23;
DMEM[4] = 24; DMEM[5] = 25; DMEM[6] = 26; DMEM[7] = 27; 
DMEM[8] = 28; DMEM[9] = 29; DMEM[10] = 30; DMEM[11] = 31;
DMEM[12] = 32; DMEM[13] = 33; DMEM[14] = 34; DMEM[15] = 35;
DMEM[16] = 36; DMEM[17] = 37; DMEM[18] = 38; DMEM[19] = 39;
DMEM[20] = 40; DMEM[21] = 41; DMEM[22] = 42; DMEM[23] = 43;
DMEM[24] = 44; DMEM[25] = 45; DMEM[26] = 46; DMEM[27] = 47;
DMEM[28] = 48; DMEM[29] = 49; DMEM[30] = 50; DMEM[31] = 51;
end

else
begin
DMEM[0] = 20; DMEM[1] = 21; DMEM[2] = 22; DMEM[3] = 23;
DMEM[4] = 24; DMEM[5] = 25; DMEM[6] = 26; DMEM[7] = 27; 
DMEM[8] = 28; DMEM[9] = 29; DMEM[10] = 30; DMEM[11] = 31;
DMEM[12] = 32; DMEM[13] = 33; DMEM[14] = 34; DMEM[15] = 35;
DMEM[16] = 36; DMEM[17] = 37; DMEM[18] = 38; DMEM[19] = 39;
DMEM[20] = 40; DMEM[21] = 41; DMEM[22] = 42; DMEM[23] = 43;
DMEM[24] = 44; DMEM[25] = 45; DMEM[26] = 46; DMEM[27] = 47;
DMEM[28] = 48; DMEM[29] = 49; DMEM[30] = 50; DMEM[31] = 51;
end

end

always @ (posedge MemRead or posedge MemWrite)
begin

if (MemRead == 1)
begin
read_data = {DMEM [data_address], DMEM[data_address + 1], DMEM[data_address + 2], DMEM[data_address + 3]};
end

if (MemWrite == 1)
begin
DMEM [data_address] = write_data [31:24];
DMEM [data_address + 1] = write_data [23:16];
DMEM [data_address + 2] = write_data [15:8];
DMEM [data_address + 3] = write_data [7:0];
end

end
    
endmodule
