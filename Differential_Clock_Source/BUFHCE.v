module aaa (
    input   pin_clk_p,
    input   pin_clk_n,
    output  clk_int
    );


BUFHCE #(
.CE_TYPE("SYNC"), // "SYNC" (glitchless switching) or "ASYNC" (immediate switch)
.INIT_OUT(0) // Initial output value (0-1)
)
BUFHCE_inst (
.O(clk_int), // 1-bit output: Clock output
.CE(pin_clk_n), // 1-bit input: Active high enable
.I(pin_clk_p) // 1-bit input: Clock input
);

endmodule