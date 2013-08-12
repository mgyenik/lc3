module lc3b(reset, clk);
    input wire clk;
    input wire reset;

    wire r;
    wire n;
    wire z;
    wire p;
    wire[15:0] bus;
    wire[15:0] ir_bus;
    wire[25:0] co;

    control ctl (reset, clk, co, ir_bus, r, n, z, p);
    datapath dp (reset, clk, co, bus, ir_bus, r, n, z, p);
endmodule
