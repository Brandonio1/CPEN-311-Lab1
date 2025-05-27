/**
 * Takes in a clock frequency of inclk and outputs a new clock frequency
 * of inclk/(2*N) at outclk
 *
 * 2*N - Number of clock frequency divisions
 * @param N - Number of times clock frequency is divided in half; 0 < N < (2^32 - 1)/2
 * @param inclk - Input clock frequency
 * @param reset - Synchronous reset for circuit
 * @param outclk - Output clock frequency; outclk = inclk/(2*N)
 */
module Clk_Freq_Divider (inclk,reset,outclk);
    parameter N = 1; 

    input inclk;
    input reset;
    output outclk;

    logic next_clk;
    logic count_compare;
    logic next_clk_inv;
    logic [31:0] count_to = N-1; // 32 bit counter

    assign next_clk = outclk;
    
    // Once counter counts to N-1 (which is N counts since it is a binary counter), on the next
    // rising edge of inclk, it resets itself
    Binary_Counter #(.N(32)) clk_period_counter (
        .clk(inclk), 
        .rst(count_compare), 
        .count_to(count_to), 
        .out(count_compare)
    );

    // At the same time the counter resets itself, this FF outputs the inverted value of the frequency
    // divided clock
    vTFFER #(.n(1)) next_clk_TFF  (
        .clk(inclk),
        .en(count_compare),
        .rst(reset),
        .toggle(1'b1),
        .in(next_clk),
        .out(outclk)
    );
    
endmodule