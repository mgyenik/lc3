0$
1$load_reg:1:1 load_cc:1:1 gate_alu:1:1 sr1_mux:1:1
2$load_mar:1:1 gate_marmux:1:1 sr1_mux:1:1 addr1_mux:1:1 addr2_mux:2:1
3$load_mar:1:1 gate_marmux:1:1 sr1_mux:1:1 addr1_mux:1:1 addr2_mux:2:1
4$
5$load_reg:1:1 load_cc:1:1 gate_alu:1:1 aluk:2:1
6$load_mar:1:1 gate_marmux:1:1 sr1_mux:1:1 addr1_mux:1:1 addr2_mux:2:1 lshf1:1:1
7$load_mar:1:1 gate_marmux:1:1 sr1_mux:1:1 addr1_mux:1:1 addr2_mux:2:1 lshf1:1:1
8$
9$load_reg:1:1 load_cc:1:1 gate_alu:1:1 sr1_mux:1:1 aluk:2:2
10$
11$
12$load_pc:1:1 pc_mux:2:1
13$load_reg:1:1 load_cc:1:1 gate_shf:1:1 sr1_mux:1:1
14$load_reg:1:1 load_cc:1:1 gate_marmux:1:1 addr2_mux:2:2 lshf1:1:1
15$load_mar:1:1 gate_marmux:1:1 mar_mux:1:1
16$r_w:1:1
17$r_w:1:1 data_size:1:1
18$load_mar:1:1 load_pc:1:1 gate_marmux:1:1
19$load_mar:1:1 load_pc:1:1 gate_marmux:1:1
20$load_reg:1:1 load_pc:1:1 gate_pc:1:1 pc_mux:2:1 dr_mux:1:1 sr1_mux:1:1 addr1_mux:1:1
21$load_reg:1:1 load_pc:1:1 gate_pc:1:1 pc_mux:2:1 dr_mux:1:1 addr2_mux:2:3 lshf1:1:1
22$load_pc:1:1 pc_mux:2:1 addr2_mux:2:3 lshf1:1:1
23$load_mdr:1:1 gate_marmux:1:1 addr1_mux:1:1
24$load_mdr:1:1 gate_marmux:1:1 addr1_mux:1:1
25$load_mdr:1:1
26$
27$load_reg:1:1 load_cc:1:1 gate_mdr:1:1
28$load_mdr:1:1 load_reg:1:1 gate_pc:1:1 dr_mux:1:1
29$load_mdr:1:1
30$load_pc:1:1 gate_mdr:1:1 pc_mux:2:2
31$load_reg:1:1 load_cc:1:1 gate_mdr:1:1
32$load_ben:1:1
33$load_mdr:1:1
34$load_ir:1:1 gate_mdr:1:1
35$load_ir:1:1 gate_mdr:1:1
36$pc_mux:2:1
