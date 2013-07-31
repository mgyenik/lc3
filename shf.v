module shf(en, r, ir_slice, shf_out);
    input wire en;
    input wire[5:0] ir_slice;
    input wire[15:0] r;

    output wire[15:0] shf_out;

    reg[15:0] shf_mux;

    assign shf_out = en ? shf_mux : 16'hzzzz;

    always @(ir_slice) begin
        case(ir_slice[5:4])
            0: shf_mux <= r << ir_slice[3:0];
            1: shf_mux <= r >> ir_slice[3:0];
            2: shf_mux <= 16'hxxxx;
            3: shf_mux <= r >>> ir_slice[3:0];
        endcase
    end
endmodule
