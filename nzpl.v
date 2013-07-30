module nzpl(clk, reset, load_nzp, bus, n, z, p);
    input wire clk, reset, load_nzp;
    input wire[15:0] bus;

    output reg n, z, p;

    always @(posedge clk) begin
        if(reset) begin
            n <= bus < 0;
            z <= bus == 0;
            p <= bus > 0;
        end
        else begin
            n <= 1'b0;
            z <= 1'b0;
            p <= 1'b0;
        end
    end
endmodule
