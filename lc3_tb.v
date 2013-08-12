module lc3_tb;
    reg clk;
    reg rst;

    lc3b DUT(rst, clk);

    always #5 clk = ~clk;

    initial begin
        $dumpvars(0, DUT);
        clk <= 0;
        rst <= 0;
        #10 rst <= 1;
        #1000 $finish();
    end
endmodule
