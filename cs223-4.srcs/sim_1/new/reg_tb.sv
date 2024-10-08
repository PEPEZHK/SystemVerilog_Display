`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2024 21:07:24
// Design Name: 
// Module Name: reg_tb
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


module reg_tb();
reg r , sh , clk;
reg [1:0] s ;
reg [3:0] d ; 
wire [3:0] q ;
strReg test (r , sh , clk , s , d , q) ;
//multireg test(1'b1 , r , sh , d , s , q) ;
initial begin 
$monitor ("%b %b %b %b%b %b%b%b%b %b%b%b%b" , r , sh , clk , s[1] , s[0] , d[3] , d[2] , d[1] , d[0] , q[3] , q[2] , q[1] , q[0]) ;
/*r = 0 ; clk = 0 ; sh = 1 ; s = 1 ; d = 4 ;
#1 
r = 0 ; clk = 1 ; sh = 1 ; s = 1 ; d = 4 ;
#1
r = 0 ; clk = 0 ; sh = 0 ; s = 3 ; d = 4 ;
#1
r = 0 ; clk = 1 ; sh = 0 ; s = 3 ; d = 4 ;
#1
r = 0 ; clk = 0 ; sh = 1 ; s = 3 ; d = 4 ;
#1
r = 0 ; clk = 1 ; sh = 1 ; s = 2 ; d = 4 ;
#1
r = 0 ; clk = 0 ; sh = 1 ; s = 2 ; d = 4 ;
#1
r = 0 ; clk = 1 ; sh = 1 ; s = 1 ; d = 6 ;
#1
r = 0 ; clk = 0 ; sh = 1 ; s = 1 ; d = 6 ;
#1
r = 0 ; clk = 1 ; sh = 1 ; s = 1 ; d = 6 ;
#1
r = 0 ; clk = 0 ; sh = 1 ; s = 1 ; d = 6 ;
#1
r = 1 ; clk = 1 ; sh = 1 ; s = 1 ; d = 4 ;
#1
r = 1 ; clk = 0 ; sh = 1 ; s = 1 ; d = 4 ;*/
r = 0 ; clk = 0 ; sh = 0 ; s = 1 ; d = 4 ;
#1
r = 0 ; clk = 1 ; sh = 1 ; s = 1 ; d = 4 ;
#1 
r = 0 ; clk = 0 ; sh = 1 ; s = 3 ; d = 4 ;
#1
r = 0 ; clk = 1 ; sh = 1 ; s = 3 ; d = 4 ;
#1
r = 0 ; clk = 0 ; sh = 1 ; s = 1 ; d = 4 ;
#1
r = 0 ; clk = 1 ; sh = 1 ; s = 3 ; d = 4 ;
#1
r = 0 ; clk = 0 ; sh = 1 ; s = 3 ; d = 4 ;
#1
r = 0 ; clk = 1 ; sh = 1 ; s = 1 ; d = 5 ;
end
endmodule
