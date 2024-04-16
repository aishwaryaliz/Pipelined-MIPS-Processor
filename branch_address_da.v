`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 16:36:04
// Design Name: 
// Module Name: branch_address_da
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


module branch_address_da(
    input [20:0] address_field,
    input [31:0] branch_register_data,
    input Branch,
    output if_flush,
    output id_flush,
    output [31:0] branch_address,
    output PCSrc
    );
    
    assign PCSrc = ((branch_register_data == 32'b0) & Branch);
    assign branch_address = { 9'b0 ,( address_field << 2)};
    assign if_flush = ~PCSrc; //0 if branch taken
    assign id_flush = ~PCSrc;
    
endmodule
