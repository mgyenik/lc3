module control(reset, clk, control_in, control_out);
    input wire reset;
    input wire clk;
    input wire[8:0] control_in;

    output reg[34:0] control_out;

    reg[34:0] control_store[0:63];

    initial begin
        /* Control store contents */
    end

    always @(posedge clk) begin
        control_out <= control_store[control_in[5:0]];
    end
endmodule
