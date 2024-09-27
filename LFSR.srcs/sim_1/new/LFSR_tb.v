`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2024 20:36:07
// Design Name: 
// Module Name: LFSR_tb
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

// Description: Simple Testbench for LFSR.  Set NUM_BITS to different
// values to verify operation of LFSR
module LFSR_TB ();

  parameter NUM_BITS = 4;
  
  reg r_Clk = 1'b0;
  
  wire [NUM_BITS-1:0] w_LFSR_Data;
  wire w_LFSR_Done;
  
  LFSR #(.NUM_BITS(NUM_BITS)) LFSR_inst
         (.i_Clk(r_Clk),
          .i_Enable(1'b1),
          .i_Seed_DV(1'b0),
          .i_Seed_Data({NUM_BITS{1'b0}}), // Replication
          .o_LFSR_Data(w_LFSR_Data),
          .o_LFSR_Done(w_LFSR_Done)
          );
 
  always @(*)
    #10 r_Clk <= ~r_Clk; 
  
endmodule // LFSR_TB

