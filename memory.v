module memory(en, clk, data_size, r_w, load_mar, load_mdr, mio_en, bus, mdr_out, r);
    input wire clk, reset, mem_write, load_mar, load_mdr, mdr_sel, en, data_size, r_w, mio_en;
    input wire[15:0] bus;

    output reg r;
    output wire[15:0] mdr_out;

    reg[15:0] mdr, mar;
    reg[7:0] mem[0:2**16-1];

    reg[7:0] mem0dbg;
    reg[7:0] mem1dbg;
    reg[7:0] mem2dbg;
    reg[7:0] mem3dbg;
    reg[7:0] mem4dbg;
    reg[7:0] mem5dbg;
    reg[7:0] mem6dbg;

    assign mdr_out = en ? mdr : 16'hzzzz;

    initial begin
        $readmemh("prog.hex", mem);
        #5 mem0dbg <= mem[0];
        mem1dbg <= mem[1];
        mem2dbg <= mem[2];
        mem3dbg <= mem[3];
        mem4dbg <= mem[4];
        mem5dbg <= mem[5];
        mem6dbg <= mem[6];
    end

    always @(posedge clk) begin
        if(load_mdr) begin
            mdr <= {mem[mar], mem[mar + 1]};
        end

        if(load_mar)
            mar <= bus;

        if(r_w) begin
            r <= 1'b1;
            if(data_size)
                mem[mar] <= mdr[7:0];
            else
                {mem[mar], mem[mar + 1]} <= mdr;
        end
        else begin
            r <= 1'b1;
        end
    end
endmodule
