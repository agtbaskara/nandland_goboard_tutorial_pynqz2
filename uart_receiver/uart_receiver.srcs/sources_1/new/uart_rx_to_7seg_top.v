`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 04:07:55 PM
// Design Name: 
// Module Name: uart_rx_to_7seg_top
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

module UART_RX_To_7_Seg_Top
  (input i_Clk,     // Main Clock
   input i_UART_RX, // UART RX Data
   output o_Segment_A,
   output o_Segment_B,
   output o_Segment_C,
   output o_Segment_D,
   output o_Segment_E,
   output o_Segment_F,
   output o_Segment_G,
   output o_Segment_Digit);
 
  wire w_RX_DV;
  wire [7:0] w_RX_Byte;
   
  wire w_Segment1_A, w_Segment2_A;
  wire w_Segment1_B, w_Segment2_B;
  wire w_Segment1_C, w_Segment2_C;
  wire w_Segment1_D, w_Segment2_D;
  wire w_Segment1_E, w_Segment2_E;
  wire w_Segment1_F, w_Segment2_F;
  wire w_Segment1_G, w_Segment2_G;

  reg r_Segment_A;
  reg r_Segment_B;
  reg r_Segment_C;
  reg r_Segment_D;
  reg r_Segment_E;
  reg r_Segment_F;
  reg r_Segment_G;
 
  // 125,000,000 / 115,200 = 1085
  UART_RX #(.CLKS_PER_BIT(1085)) UART_RX_Inst
  (.i_Clock(i_Clk),
   .i_RX_Serial(i_UART_RX),
   .o_RX_DV(w_RX_DV),
   .o_RX_Byte(w_RX_Byte));

  // Binary to 7-Segment Converter for Upper Digit
  Binary_To_7Segment SevenSeg1_Inst
  (.i_Clk(i_Clk),
   .i_Binary_Num(w_RX_Byte[7:4]),
   .o_Segment_A(w_Segment1_A),
   .o_Segment_B(w_Segment1_B),
   .o_Segment_C(w_Segment1_C),
   .o_Segment_D(w_Segment1_D),
   .o_Segment_E(w_Segment1_E),
   .o_Segment_F(w_Segment1_F),
   .o_Segment_G(w_Segment1_G));

  // Binary to 7-Segment Converter for Lower Digit
  Binary_To_7Segment SevenSeg2_Inst
  (.i_Clk(i_Clk),
   .i_Binary_Num(w_RX_Byte[3:0]),
   .o_Segment_A(w_Segment2_A),
   .o_Segment_B(w_Segment2_B),
   .o_Segment_C(w_Segment2_C),
   .o_Segment_D(w_Segment2_D),
   .o_Segment_E(w_Segment2_E),
   .o_Segment_F(w_Segment2_F),
   .o_Segment_G(w_Segment2_G));

  // 7-Segment Multiplexer with 60Hz refresh rate
  reg r_Segment_Digit;

  // Clock divider to get 60Hz from 125MHz
  // Need to toggle at 120Hz (60Hz per digit), so divide by 125MHz/(120Hz) = 1,041,666.67
  // Using 1,041,667 as integer approximation
  localparam COUNTER_MAX = 1_041_667;
  reg [$clog2(COUNTER_MAX):0] r_Counter = 0;

  always @(posedge i_Clk) begin
    // Counter for clock division
    if (r_Counter >= COUNTER_MAX - 1) begin
      r_Counter <= 0;
      // Toggle the digit select at 120Hz (60Hz per digit)
      r_Segment_Digit <= ~r_Segment_Digit;
    end else begin
      r_Counter <= r_Counter + 1;
    end
    
    // Multiplex the segments based on which digit is active
    if (r_Segment_Digit) begin
      // Display upper digit (first digit)
      r_Segment_A <= w_Segment1_A;
      r_Segment_B <= w_Segment1_B;
      r_Segment_C <= w_Segment1_C;
      r_Segment_D <= w_Segment1_D;
      r_Segment_E <= w_Segment1_E;
      r_Segment_F <= w_Segment1_F;
      r_Segment_G <= w_Segment1_G;
    end else begin
      // Display lower digit (second digit)
      r_Segment_A <= w_Segment2_A;
      r_Segment_B <= w_Segment2_B;
      r_Segment_C <= w_Segment2_C;
      r_Segment_D <= w_Segment2_D;
      r_Segment_E <= w_Segment2_E;
      r_Segment_F <= w_Segment2_F;
      r_Segment_G <= w_Segment2_G;
    end
  end

  // Assign outputs
  assign o_Segment_A = r_Segment_A;
  assign o_Segment_B = r_Segment_B;
  assign o_Segment_C = r_Segment_C;
  assign o_Segment_D = r_Segment_D;
  assign o_Segment_E = r_Segment_E;
  assign o_Segment_F = r_Segment_F;
  assign o_Segment_G = r_Segment_G;

  assign o_Segment_Digit = r_Segment_Digit;

endmodule