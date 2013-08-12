module pcl(en, clk, reset, bus, ea, pc_sel, load_pc, pc_ungated, pc_out);
    input wire en;
    input wire clk;
    input wire reset;
    input wire load_pc;
    input wire[1:0] pc_sel;
    input wire[15:0] bus, ea;

    output wire[15:0] pc_out;
    output wire[15:0] pc_ungated;

    reg[15:0] pc_reg;
    wire[15:0] pc_inc;

    assign pc_inc = pc_reg + 2;
    assign pc_out = en ? pc_reg : 16'hzzzz;
    assign pc_ungated = pc_reg;

    always @(posedge clk) begin
        if(reset) begin
            if(load_pc)
                case(pc_sel)
                    0: pc_reg <= pc_inc;
                    1: pc_reg <= ea;
                    2: pc_reg <= bus;
                    3: pc_reg <= 16'hxxxx;
                endcase
            else
                pc_reg <= pc_reg;
        end
        else begin
            pc_reg <= 16'h0200;
        end
    end
    
endmodule
