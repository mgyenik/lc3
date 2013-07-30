module alu(en, clk, aluk, a, b, o);
    input wire clk, en;
    input wire[1:0] aluk;
    input wire[5:0] ir_slice;
    input wire[15:0] a, b;

    output wire[15:0] o;

    wire[15:0] alu_add, alu_and, alu_not, alu_pas;
    wire[15:0] imm5_ext, b_mux;
    reg[15:0] alu_reg;

    /* We can do this the ugly way, or the wrong way... */
    assign imm5_ext = { {11{ir_slice[4]}}, ir_slice[4:0]};
    assign b_mux = ir_slice[5] ? imm5_ext : b;

    assign alu_add = a + b_mux;
    assign alu_and = a & b_mux;
    assign alu_not = ~a;
    assign alu_pas = a;

    assign alu_mux1 = aluk[0] ? alu_and : alu_add;
    assign alu_mux2 = aluk[0] ? alu_pas : alu_not;
    assign alu_mux =  aluk[1] ? alu_mux2 : alu_mux1;
    assign o = en ? alu_reg : 16'hzzzz;

    always@(alu_mux) alu_reg <= alu_mux;
endmodule
