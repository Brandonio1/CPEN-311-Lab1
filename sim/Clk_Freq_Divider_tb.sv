
module Clk_Freq_Divider_tb;
    reg inclk;
    reg reset;
    reg outclk1, outclk2, outclk3;
    reg BC_out;

    Clk_Freq_Divider #(.N(1)) CFD_DUT1 (.inclk(inclk),.reset(reset),.outclk(outclk_n_eq_1));
    Clk_Freq_Divider #(.N(2)) CFD_DUT2 (.inclk(inclk),.reset(reset),.outclk(outclk_n_eq_2));
    Clk_Freq_Divider #(.N(3)) CFD_DUT3 (.inclk(inclk),.reset(reset),.outclk(outclk_n_eq_3));
    Clk_Freq_Divider #(.N(4)) CFD_DUT4 (.inclk(inclk),.reset(reset),.outclk(outclk_n_eq_4));
    Clk_Freq_Divider #(.N(5)) CFD_DUT5 (.inclk(inclk),.reset(reset),.outclk(outclk_n_eq_5));
    Clk_Freq_Divider #(.N(6)) CFD_DUT6 (.inclk(inclk),.reset(reset),.outclk(outclk_n_eq_6));
    Clk_Freq_Divider #(.N(7)) CFD_DUT7 (.inclk(inclk),.reset(reset),.outclk(outclk_n_eq_7));

    Clk_Freq_Divider #(.N(37_936)) CFD_DUT37936 (.inclk(inclk),.reset(reset),.outclk(outclk_n_eq_37936));

    // Check clock divider
    task test1;
        begin
            for (int i = 0; i < 100000; i = i + 1) begin
                inclk = 0; #5;
                inclk = 1; #5;
            end
        end
    endtask

    initial begin
        reset = 0; inclk = 0; #5;
        reset = 1; inclk = 1; #5;
        reset = 0;
        
        test1();

        // In case there is an initial forever block
        $stop;
    end

endmodule