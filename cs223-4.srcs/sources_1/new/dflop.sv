`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2024 19:11:02
// Design Name: 
// Module Name: dflop
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
/*module srlatch
(
 input logic r , s ,
 output logic q , qup
);
 nor i1(r , qup , q) ;
 nor i2(q , s , qup) ;
endmodule

module dlatch
(
 input logic clk , d,
 output logic q , qup
);
 reg r , s ; 
 and i1(clk , ~d , r) ;
 and i2(clk , d  , s) ;
 srlatch i3(r , s , q , qup) ;
endmodule

module dflop
(
 input logic clk , d,
 output logic q , qup
);
wire qq ;
dlatch i1(~clk , d , qq , qup) ;
dlatch i2(clk , qq , q , qup) ;
endmodule
module flop(input logic clk, reset ,
            input logic d,
            output logic q);
always_ff @(posedge clk)
    if (reset) q <= 1'b0 ;
    else       q <= d ;
endmodule*/

module multireg(input logic clk, reset , shift_in,
                input logic [3:0]d,
                input logic [1:0]s,
                output logic [3:0]q);
logic [3:0] qq;
always_ff @(posedge clk)
    if (reset) qq <= 4'b0 ;
    else if(s[1] == 1'b0 & s[0] == 1'b1) qq <= d ;
    else if(s[1] == 1'b1 & s[1] == 1'b0) 
        begin
        qq = qq << 1 ; 
        qq[0] <= shift_in ;
        end
    else if(s[1] == 1'b1 & s[0] == 1'b1) 
        begin
        qq = qq >> 1 ; 
        qq[3] <= shift_in ;
        end
    else       qq <= qq;
assign q = qq;
endmodule

