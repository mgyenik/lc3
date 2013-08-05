module datapath(reset, clk, control_signals, bus);

    input wire reset;
    input wire clk;
    input wire[25:0] control_signals;

    output wire[15:0] bus;

    wire load_mar;
    wire load_mdr;
    wire load_ir;
    wire load_ben;
    wire load_reg;
    wire load_cc;
    wire load_pc;
    wire gate_pc;
    wire gate_mdr;
    wire gate_alu;
    wire gate_marmux;
    wire gate_shf;
    wire dr_mux;
    wire sr1_mux;
    wire addr1_mux;
    wire mar_mux;
    wire mio_en;
    wire r_w;
    wire data_size;
    wire lshf1;
    wire[1:0] pc_mux;
    wire[1:0] aluk;
    wire[1:0] addr2_mux;
    wire[15:0] sr1_out;
    wire[15:0] sr2_out;
    wire[15:0] ea_out;
    wire[15:0] pc_out;

    reg[15:0] ir;

    assign {load_mar, load_mdr, load_ir, load_ben, load_reg, load_cc, load_pc,
            gate_pc, gate_mdr, gate_alu, gate_marmux, gate_shf,
            pc_mux, dr_mux, sr1_mux, addr1_mux, addr2_mux, mar_mux,
            aluk, mio_en, r_w, data_size, lshf1} = control_signals;

    always @(posedge clk)
        if(load_ir) ir <= bus;

    eab eab_inst (ir[10:0], sr1_out, pc_out, lshf1, addr1_mux, addr2_mux, ea_out);
    pcl pcl_inst (gate_pc, clk, reset, bus, ea_out, pc_mux, load_pc, pc_out, bus);
    marmux marmux_inst (gate_marmux, ir[7:0], ea_out, mar_mux, bus);
    alu alu_inst (gate_alu, aluk, ir[5:0], sr1_out, sr2_out, bus);
    regfile regs (clk, ir[11:0], sr1_mux, dr_mux, bus, sr1_out, sr2_out, load_reg);
    shf shf_inst(gate_shf, sr1_out, ir[5:0], bus);
    memory mem (gate_mdr, clk, data_size, r_w, load_mar, load_mdr, mio_en, bus, bus);

endmodule
