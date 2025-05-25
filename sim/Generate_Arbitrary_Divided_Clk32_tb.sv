`timescale 1ns / 1ps
module Generate_Arbitrary_Divided_Clk32_tb;


    /*
        input inclk;
        input Reset;
        output outclk;
        output outclk_Not;
        input[31:0] div_clk_count;
     */
    reg inclk,outclk,outclk_Not,Reset;
    reg [31:0] div_clk_count;

    

    Generate_Arbitrary_Divided_Clk32 DUT(.inclk(inclk), .outclk(outclk), 
        .outclk_Not(outclk_Not), .div_clk_count(div_clk_count), .Reset(Reset));

    // Apply inclk pulse and see output
    task test1;
        $display("Apply inclk pulse and see output");

        Reset = 0;
        inclk = 1; #5;

        $display("inclk = %b ; Reset = %b ; outclk = %b ; outclk_Not = %b",
                inclk, Reset, outclk, outclk_Not);

        inclk = 0; #5;

    endtask

    // Call tasks/tests in this initial block
    initial begin
        test1; 
    end

endmodule