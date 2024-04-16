`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2024 11:07:11
// Design Name: 
// Module Name: forw_unit_da
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


module forw_unit_da(
    input [4:0] ex_mem_rd,
    input [4:0] mem_wb_rd,
    input [4:0] id_ex_rs,
    input [4:0] id_ex_rt,
    input ex_mem_regWrite,
    input mem_wb_regWrite,
    output reg [1:0] forward_rs,
    output reg [1:0] forward_rt
    );
    //register 0 is the $zero register

assign condition_1_a = ( (ex_mem_regWrite==1) && (ex_mem_rd!=0) && (ex_mem_rd==id_ex_rs) );
assign condition_1_b = ( (ex_mem_regWrite==1) && (ex_mem_rd!=0) && (ex_mem_rd==id_ex_rt) );
assign condition_2_a = ( (mem_wb_regWrite==1) && (mem_wb_rd!=0) && (mem_wb_rd==id_ex_rs) && ~(condition_1_a) );
assign condition_2_b = ( (mem_wb_regWrite==1) && (mem_wb_rd!=0) && (mem_wb_rd==id_ex_rt) && ~(condition_1_b) );


    
always @ (*)
begin
   
    if (condition_1_a)
    begin
        forward_rs = 01;
    end
    
    if (condition_1_b)
    begin
        forward_rt = 01;
    end
    
    if (condition_2_a)
    begin
        forward_rs = 10;
    end
    
    if (condition_2_b)
    begin
        forward_rt = 10;
    end
    
    else 
    begin
        forward_rs = 00;
        forward_rt = 00;
    end
    
end
    
endmodule
