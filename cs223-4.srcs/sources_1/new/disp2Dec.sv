`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 04:28:17
// Design Name: 
// Module Name: disp2Dec
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


module disp2Dec
(
input logic clock,
input logic [3:0] digit0 ,
input logic [3:0] digit1 ,
input logic [3:0] digit2 ,
input logic [3:0] digit3 ,
output reg [3:0] anodes ,
output logic [6:0]seg 
);
logic [1:0]index ;
logic [1:0]counter ; 
logic [19:0]refresh ;
always @(posedge clock) 
begin
if (counter > 1)
counter <= 2'b00 ;
else 
counter <= counter + 1 ;
end
always @(posedge clock)
refresh = refresh + 1 ;

assign index = refresh[19:18] ;
logic [3:0]led ;
always @(*)
begin 
    case(index)
    0 : begin anodes = 4'b1110 ; led = digit0 ; end
    1 : begin anodes = 4'b1101 ; led = digit1 ; end
    2 : begin anodes = 4'b1011 ; led = digit2 ; end
    3 : begin anodes = 4'b0111 ; led = digit3 ; end
    endcase 
end
always @(*)
begin 
    case(led)
    0 : seg = 7'b0000001;
    1 : seg = 7'b1001111;
    2 : seg = 7'b0010010;
    3 : seg = 7'b0000110;
    4 : seg = 7'b1001100;
    5 : seg = 7'b0100100;
    6 : seg = 7'b0100000;
    7 : seg = 7'b0001111;
    8 : seg = 7'b0000000;
    9 : seg = 7'b0000100;
    default : seg = 7'b1111110; 
    endcase
end
/*assign anodes = 4'b1100 ;
dispDec first(z , {1'b1, 1'b1 , 1'b1 , 1'b0} ,c) ;
dispDec second(x , {1'b1, 1'b1 , 1'b0 , 1'b1} , c) ;*/

endmodule
