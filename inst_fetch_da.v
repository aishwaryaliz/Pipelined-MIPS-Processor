`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2024 08:47:07
// Design Name: 
// Module Name: inst_fetch_da
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


module inst_fetch_da(
    input clk,
    input reset,
    input PCSrc,
    input pc_write,
    input [31:0] branch_address,
    output [31:0] Instruction_Code
    );
    
reg [31:0] PC;
initial PC = 0;

inst_mem_da mem(.PC(PC), .reset(reset), .Instruction_Code(Instruction_Code)); //modue name - mem, inside bracket - current mode

always @(posedge clk, negedge reset)
begin

if (reset==0)
PC <= 0;

else
begin
    if (pc_write==1)
    begin

    if (PCSrc==0)
    PC <= PC + 4;
    else
    PC <= branch_address;
    
    end

end

end
    
endmodule

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

