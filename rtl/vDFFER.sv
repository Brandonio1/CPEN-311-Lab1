/* 
 * Edge Sensitive D Flip-Flop with Synchronous Enable and Synchronous Reset
 * Copies input to output on rising edge of clock
 *
 * Note: If want to use FF without synchronous enable, set: en = 1
 */
module vDFFER(clk, en, rst, in, out);
    parameter n = 1; // width
    input clk, en, rst;
    input [n-1:0] in;
    output [n-1:0] out;
    reg [n-1:0] out;

    always_ff @(posedge clk) begin
        if (rst) begin
            out <= 0;
        end 
        else if (en) begin
            out <= in;
        end
    end
endmodule