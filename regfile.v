module regfile(clk, dr_sel, sr1_sel, sr2_sel, dr_in, sr1_out, sr2_out, load_reg);
    input wire clk, load_reg;
    input wire[2:0] dr_sel, sr1_sel, sr2_sel;
    input wire[15:0] dr_in;

    output reg[15:0] sr1_out, sr2_out;

    reg[15:0] register_file [0:7];

    initial begin
        register_file[0] <= 16'b0;
        register_file[1] <= 16'b0;
        register_file[2] <= 16'b0;
        register_file[3] <= 16'b0;
        register_file[4] <= 16'b0;
        register_file[5] <= 16'b0;
        register_file[6] <= 16'b0;
        register_file[7] <= 16'b0;
    end

    always @(sr1_sel)
        sr1_out <= register_file[sr1_sel];

    always @(sr2_sel)
        sr2_out <= register_file[sr2_sel];

    always @(posedge clk) begin
        if(load_reg)
            register_file[dr_sel] <= dr_in;
    end
endmodule
