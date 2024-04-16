`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2024 11:31:15
// Design Name: 
// Module Name: stall_da
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


module stall_da(
    input id_ex_memread,
    input if_id_rs,
    input if_id_rt,
    input id_ex_rt,
    output reg pc_write,
    output reg if_write,
    output reg id_ex_clk,
    output reg control_signals
    );
    
    always @ (*)
    begin
    
    //for a hazard
    if ( (id_ex_memread == 1) & ( (id_ex_rt == if_id_rs) | (id_ex_rt == if_id_rt) ) )   
    begin
    pc_write = 0;
    if_write = 0;
    id_ex_clk = 0;
    control_signals = 0;
    end
    
    else
    begin
    //default values
    pc_write = 1;
    if_write = 1;
    id_ex_clk = 1;
    control_signals = 1;
    end
    
    end
    
endmodule
