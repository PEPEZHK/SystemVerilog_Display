`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2024 20:12:53
// Design Name: 
// Module Name: strReg
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
module slowClock(input logic clk, output logic led);
    logic clk_1sec ; 
    logic [27:0] counter;
    
    always @(posedge clk) 
    begin
            counter <= counter + 1;
            if (counter == 25_000_000) 
            begin
                counter <= 0;
                clk_1sec <= ~clk_1sec;
            end
    end
assign led = clk_1sec ;
endmodule
module flop(input logic clk, reset , a,
            output logic q);
always_ff @(posedge clk)
    if(reset)  q <= 1'b0 ;
    else       q <= a ;
endmodule
module mux
(
input logic [3:0]i,
input logic [1:0]s,
output logic y);
always_comb
if (s[1] == 1'b0 & s[0] == 1'b0) y <= i[0] ;
else if (s[1] == 1'b0 & s[0] == 1'b1) y <= i[1] ;
else if (s[1] == 1'b1 & s[0] == 1'b0) y <= i[2] ;
else y <= i[3] ;
endmodule

module strReg
(
input logic reset , shift_in , clk_1sec ,
input logic [1:0]s,
input logic [3:0]d,
output logic [3:0]q
);
wire clk ;
slowClock(clk_1sec , clk) ; 
logic q3 , q2 , q1 , q0 ;
mux first({shift_in , q[2] , d[3] , q[3] } , s , q3) ;
flop f1(clk , reset , q3 , q[3]) ;
mux second({q[3] , q[1] , d[2] , q[2] } , s , q2) ;
flop f2(clk , reset , q2 , q[2]) ;
mux third({q[2] , q[0] , d[1] , q[1] } , s , q1) ;
flop f3(clk , reset , q1 , q[1]) ;
mux fourth({q[1] , shift_in , d[0] , q[0] } , s , q0) ;
flop f4(clk , reset , q0 , q[0]) ;
//assign q = {q3 , q2 , q1 , q0} ;
/*flop f1(1'b1, reset, q3, q[3]);
flop f2(1'b1, reset, q2, q[2]);
flop f3(1'b1, reset, q1, q[1]);
flop f4(1'b1, reset, q0, q[0]);

mux first({shift_in, q[2], d[3], q[3]}, s, q3);
mux second({q3, q[1], d[2], q[2]}, s, q2);
mux third({q[2], q[0], d[1], q[1]}, s, q1);
mux fourth({q[1], shift_in, d[0], q[0]}, s, q0);*/
endmodule
