`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 00:14:46
// Design Name: 
// Module Name: flop_tb
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


module flop_tb();
reg r , c , d ;
wire q ;
flop test(c , r , d , q);
initial begin
$monitor("%b %b %b %b" , r , c , d , q);
r = 0; c = 1 ; d = 1 ; 
#1
r = 0; c = 0 ; d = 0 ; 
#1
r = 0; c = 1 ; d = 0 ; 
#1
r = 0; c = 1 ; d = 1 ; 
#1
r = 1; c = 1 ; d = 0 ; 
#1
r = 0; c = 1 ; d = 0 ; 
#1
r = 1; c = 1 ; d = 1 ; 
end
endmodule
