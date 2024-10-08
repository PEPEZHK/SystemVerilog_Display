`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 04:31:22
// Design Name: 
// Module Name: disp2_tb
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


module disp2_tb();
reg [3:0] z0 ;
reg [3:0] z1 ;
reg [3:0] z2 ;
reg [3:0] z3 ;
logic [3:0]anodes ;
logic clock ;
wire [6:0]c ;
disp2Dec test(clock , z0 , z1 , z2 , z3 , anodes , c) ;
initial begin
  clock=0;
  assign anodes = 4'b1110 ; 
     forever #1 begin clock = ~clock; assign anodes = 4'b1101 ; end 
end 
initial begin 
$monitor ("%b %b %b %b %b %b %b " , c[6],c[5],c[4],c[3],c[2],c[1],c[0]) ;
z0 = 0 ; z1 = 1 ; z2 = 3 ; z3 = 1 ;  
#1
z0 = 1 ; z1 = 9 ; z2 = 4 ; z3 = 2 ;  
#1
z0 = 6 ; z1 = 4 ; z2 = 5 ; z3 = 10 ;  
#1
z0 = 9 ; z1 = 3 ; z2 = 6 ; z3 = 4 ;  
#1
z0 = 10 ; z1 = 11 ; z2 = 7 ; z3 = 4 ;  
#1
z0 = 12 ; z1 = 0 ; z2 = 8 ; z3 = 8 ;  
#1
z0 = 4 ; z1 = 8 ; z2 = 9 ; z3 = 5 ;   
end
endmodule
