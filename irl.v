module irl(clk, reset, load_ir, bus, ir_out);
    input wire clk, reset, load_ir;
    input wire[15:0] bus;

    output reg[15:0] ir_out;

    always @(posedge clk) begin
        if(reset)
            if(load_ir)
                ir_out <= bus;
            else
                ir_out <= ir_out;
        else
            ir_out <= 0;
    end
endmodule
