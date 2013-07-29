module regfile(clk, dr_sel, sr1_sel, sr2_sel, dr_in, sr1_out, sr2_out, load_reg);
    input wire clk, load_reg;
    input wire[2:0] dr_sel, sr1_sel, sr2_sel;
    input wire[15:0] dr_in;

    output reg[15:0] sr1_out, sr2_out;

    reg[15:0] register_file [0:7];

    always @(posedge clk) begin
        sr1_out <= register_file[sr1_sel];
        sr2_out <= register_file[sr2_sel];

        if(load_reg)
            register_file[dr_sel] <= dr_in;
    end
endmodule
