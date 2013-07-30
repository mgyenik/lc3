module marmux(en, ir_slice, ea, mar_sel, mar_out);
    input wire en, mar_sel;
    input wire[7:0] ir_slice;
    input wire[15:0] ea;

    output wire[15:0] mar_out;

    wire[15:0] mar_mux;
    wire[15:0] ir8_ext;

    assign ir8_ext = { {8{ir_slice[7]}}, ir_slice[7:0]};
    assign mar_mux = mar_sel ? ir8_ext : ea;
    assign mar_out = en ? mar_mux : 16'hzzzz;
endmodule
