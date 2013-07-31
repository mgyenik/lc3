module eab(ir_slice, r, pc, addr1_sel, addr2_sel, ea_out);
    input wire addr1_sel;
    input wire[1:0] addr2_sel;
    input wire[10:0] ir_slice;
    input wire[15:0] r, pc;

    output wire[15:0] ea_out;

    wire [15:0] mux1net, mux2net;
    wire [15:0] ir6_ext, ir9_ext, ir11_ext;
    reg [15:0] mux1reg, mux2reg;

    assign mux1net = mux1reg;
    assign mux2net = mux2reg;
    assign ea_out = mux1net + mux2net;

    assign ir6_ext  = { {10{ir_slice[5]}},  ir_slice[5:0]};
    assign ir9_ext  = { { 7{ir_slice[8]}},  ir_slice[8:0]};
    assign ir11_ext = { { 5{ir_slice[10]}}, ir_slice[10:0]};

    always @(r or pc or addr1_sel) begin
        if(addr1_sel)
            mux1reg <= r;
        else
            mux1reg <= pc;
    end

    always @(ir6_ext or ir9_ext or ir11_ext or addr2_sel) begin
        case(addr2_sel)
            0: mux2reg <= 16'b0;
            1: mux2reg <= ir6_ext << 1;
            2: mux2reg <= ir9_ext << 1;
            3: mux2reg <= ir11_ext << 1;
        endcase
    end
endmodule
