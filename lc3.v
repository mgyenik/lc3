module lc3b(reset, clk);
    input wire clk;
    input wire reset;

    wire[8:0] control_feedback;
    wire[15:0] bus;
    wire[34:0] co;

    control ctl (reset, clk, control_feedback, co);
    datapath dp (reset, clk, co[25:0], bus);
endmodule
