module clock_buffer (
    input   pin_clk_p,
    input   pin_clk_n,
    output  clk_int
    );

    parameter DIFF = 0;

    generate 
        if (DIFF = 1)
            clk_buf IBUFGDS(
                .I  (pin_clk_p),
                .IB (pin_clk_n),
                .O  (clk_int)
            );
        else 
            clk_buf IBUFG(
                .I  (pin_clk_p),
                .O  (clk_int)
            );
    endgenerate
endmodule