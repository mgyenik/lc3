module regfile(clk, ir_slice, sr1_mux, dr_mux, bus, sr1_out, sr2_out, load_reg);
    input wire clk;
    input wire dr_mux;
    input wire sr1_mux;
    input wire load_reg;
    input wire[11:0] ir_slice;
    input wire[15:0] bus;

    output reg[15:0] sr1_out;
    output reg[15:0] sr2_out;

    wire[2:0] dr_sel;
    wire[2:0] sr1_sel;
    wire[2:0] sr2_sel;

    reg[15:0] register_file [0:7];
    reg[15:0] r0;
    reg[15:0] r1;
    reg[15:0] r2;
    reg[15:0] r3;
    reg[15:0] r4;
    reg[15:0] r5;
    reg[15:0] r6;
    reg[15:0] r7;

    assign dr_sel = dr_mux ? 3'b111 : ir_slice[11:9];
    assign sr1_sel = sr1_mux ? ir_slice[8:6] : ir_slice[11:9];
    assign sr2_sel = ir_slice[2:0];

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
            register_file[dr_sel] = bus;
        r0 = register_file[0];
        r1 = register_file[1];
        r2 = register_file[2];
        r3 = register_file[3];
        r4 = register_file[4];
        r5 = register_file[5];
        r6 = register_file[6];
        r7 = register_file[7];
    end
endmodule
