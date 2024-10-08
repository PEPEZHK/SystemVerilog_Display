`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 03:54:45
// Design Name: 
// Module Name: dispDec
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


module dispDec
(
input logic [3:0]w ,
output reg [3:0] anode ,
output logic [6:0]seg
);
/*-assign a = w[1]&w[3] | ~w[1]&~w[3] | w[0] | w[2] ;
assign b = ~w[1] | w[2]&w[3] | ~w[2]&~w[3] ;
assign c = w[1] | ~w[2] | w[3] ;
assign d = w[0] | ~w[1]&~w[3] | w[2]&~w[3] | ~w[1]&w[2] | w[1]&~w[2]&w[3] ;
assign e = ~w[1]&~w[3] | w[2]&~w[3] ;
assign f = w[1]&~w[2] | w[1]&~w[3] | w[0] | ~w[2]&~w[3] ;
assign g = w[0] | w[1]&~w[2] | ~w[1]&w[2] | w[2]&~w[3] ;*/
always @(w)
    begin
        case (w) //case statement
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
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : seg = 7'b1111110; 
        endcase
    end
endmodule
