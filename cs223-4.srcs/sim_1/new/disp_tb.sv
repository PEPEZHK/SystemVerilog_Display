`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 04:09:26
// Design Name: 
// Module Name: disp_tb
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


module disp_tb();
reg [3:0]w ;
wire [6:0]seg ;
dispDec test(w , {1'b1 , 1'b1 , 1'b1 , 1'b0} , seg) ; 
initial begin 
$monitor("%b%b%b%b %b %b %b %b %b %b %b " , w[3] , w[2] , w[1] , w[0] , seg[6] , seg[5] , seg[4] , seg[3] , seg[2] , seg[1] , seg[0]) ;
w = 0 ;
#1 
w = 1 ; 
#1 
w = 2 ;
#1 
w = 3 ;
#1 
w = 4 ;
#1 
w = 5 ; 
#1 
w = 6 ;
#1 
w = 7 ;
#1 
w = 8 ; 
#1 
w = 9 ; 
#1 
w = 10 ;
#1 
w = 11 ;
end
endmodule
