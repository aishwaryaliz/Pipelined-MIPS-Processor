`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2024 10:14:04
// Design Name: 
// Module Name: reg_file_da
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


module reg_file_da(
    input [4:0] Read_Reg_Num_1, 
    input [4:0] Read_Reg_Num_2, 
    input [4:0] Write_Reg_Num, 
    input [31:0] Write_Data,
    output [31:0] Read_Data_1,
    output [31:0] Read_Data_2,
    input RegWrite,
    input clk,
    input reset
    );
    
    reg [31:0] registerFile [31:0];
    
    assign Read_Data_1 = registerFile [Read_Reg_Num_1];
    assign Read_Data_2 = registerFile [Read_Reg_Num_2]; 
    
    always @ (reset) //asynchronous reset
    begin
        if (reset == 0)
        begin
            registerFile [0] = 32'h0; registerFile [1] = 32'h0; registerFile [2] = 32'h0; registerFile [3] = 32'h0; 
            registerFile [4]= 32'h0; registerFile [5] =32'h5; registerFile [6] = 32'h0; registerFile [7] = 32'h0; 
            registerFile [8] = 32'h0; registerFile [9] = 32'h0; registerFile [10] = 32'h0; registerFile [11] = 32'h0; 
            registerFile [12]= 32'h0; registerFile [13] =32'h0; registerFile [14] = 32'h0; registerFile [15] = 32'h0; 
            registerFile [16] = 32'h0; registerFile [17] = 32'h0; registerFile [18] = 32'h0; registerFile [19] = 32'h0; 
            registerFile [20]= 32'h0; registerFile [21] =32'h0; registerFile [22] = 32'h0; registerFile [23] = 32'h0; 
            registerFile [24] = 32'h0; registerFile [25] = 32'h0; registerFile [26] = 32'h0; registerFile [27] = 32'h0; 
            registerFile [28]= 32'h0; registerFile [29] =32'h0; registerFile [30] = 32'h0; registerFile [31] = 32'h0; 
            
        end
        
    end
    
    always @ (*)
    begin
    if (clk)
    begin
        if (RegWrite == 1)
        begin
            registerFile [Write_Reg_Num] = Write_Data;
            registerFile [0] = 32'h0; //register 0 is the $zero register
        end       
    end
    end
    
endmodule
