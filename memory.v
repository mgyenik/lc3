module memory(en, clk, data_size, r_w, load_mar, load_mdr, mio_en, bus, mdr_out);
    input wire clk, reset, mem_write, load_mar, load_mdr, mdr_sel, en, data_size, r_w, mio_en;
    input wire[15:0] bus;

    output wire[15:0] mdr_out;

    reg[15:0] mdr, mar;
    reg[7:0] mem[0:2**16-1];

    assign mdr_out = en ? mdr : 16'hzzzz;

    always @(posedge clk) begin
        if(load_mdr) begin
            mdr <= bus;
        end

        if(load_mar)
            mar <= bus;

        if(r_w) begin
            if(data_size)
                    mem[mar] <= mdr[7:0];
            else
                {mem[mar], mem[mar + 1]} <= mdr;
        end
    end
endmodule
