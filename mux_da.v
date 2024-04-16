`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2024 14:18:54
// Design Name: 
// Module Name: mux_da
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


module mux_da(
    input [31:0] in1,
    input [31:0] in2,
    input control,
    output [31:0] out
    );
    
assign out = control ? in2 : in1;

endmodule

module mux_da_41(
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    input [31:0] in4,
    input [1:0] control,
    output [31:0] out
    );
    
    assign out = control[1] ? (control[0]? in4:in3) : (control[0]? in2: in1);
    
endmodule