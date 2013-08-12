module control(reset, clk, control_out, IR, R, N, Z, P);
    input wire reset;
    input wire clk;
    input wire[15:0] IR;
    input wire R;
    input wire N;
    input wire Z;
    input wire P;

    output reg[25:0] control_out;

    wire load_ben;

    reg ben;
    reg[5:0] state;
    reg[25:0] control_sig[0:63];

    assign load_ben = control_out[22];

    initial begin
        $readmemb("microcode.bin", control_sig);
    end

    always @(state) begin
        control_out <= control_sig[state];
    end

    always @(posedge clk)
        if(load_ben)
            ben <= (IR[11] && N) || (IR[10] && Z) || (IR[9] && P);

    always @(posedge clk) begin
        if(reset) begin
            case(state)
                0: begin
                    if(ben)
                        state <= 22;
                    else
                        state <= 18;
                end
                1: begin
                    state <= 18;
                end
                2: begin
                    state <= 29;
                end
                3: begin
                    state <= 24;
                end
                4: begin
                    if(IR[11])
                        state <= 21;
                    else
                        state <= 20;
                end
                5: begin
                    state <= 18;
                end
                6: begin
                    state <= 25;
                end
                7: begin
                    state <= 23;
                end
                8: begin
                    state <= 18; /* XXX RTI */
                end
                9: begin
                    state <= 18;
                end
                10: begin
                    state <= 18; /* XXX ILL */
                end
                11: begin
                    state <= 18; /* XXX ILL */
                end
                12: begin
                    state <= 18;
                end
                13: begin
                    state <= 18;
                end
                14: begin
                    state <= 18;
                end
                15: begin
                    state <= 28;
                end
                16: begin
                    if(R)
                        state <= 18;
                    else
                        state <= 16;
                end
                17: begin
                    if(R)
                        state <= 18;
                    else
                        state <= 16;
                end
                18: begin
                    state <= 33;
                end
                19: begin
                    state <= 33;
                end
                20: begin
                    state <= 18;
                end
                21: begin
                    state <= 18;
                end
                22: begin
                    state <= 18;
                end
                23: begin
                    state <= 16;
                end
                24: begin
                    state <= 17;
                end
                25: begin
                    if(R)
                        state <= 27;
                    else
                        state <= 25;
                end
                26: begin
                    state <= 18; /* ??? */
                end
                27: begin
                    state <= 18;
                end
                28: begin
                    if(R)
                        state <= 30;
                    else
                        state <= 28;
                end
                29: begin
                    if(R)
                        state <= 31;
                    else
                        state <= 29;
                end
                30: begin
                    state <= 18;
                end
                31: begin
                    state <= 18;
                end
                32: begin
                    state <= {2'b0, IR[15:12]};
                end
                33: begin
                    if(R)
                        state <= 35;
                    else
                        state <= 33;
                end
                34: begin   
                    state <= 18; /* ??? */
                end
                35: begin
                    state <= 32;
                end
                default:
                    state <= 18;
            endcase
        end
        else begin
            state <= 18;
        end
    end
endmodule
