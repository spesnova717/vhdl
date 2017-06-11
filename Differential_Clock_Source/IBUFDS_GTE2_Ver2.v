`timescale 1ps / 1ps
module aaa # 
(

   parameter PL_LINK_CAP_MAX_LINK_WIDTH          = 8,            // 1- X1; 2 - X2; 4 - X4; 8 - X8
   parameter PL_SIM_FAST_LINK_TRAINING           = "FALSE",      // Simulation Speedup
   parameter PL_LINK_CAP_MAX_LINK_SPEED          = 2,             // 1- GEN1; 2 - GEN2; 4 - GEN3
   parameter C_DATA_WIDTH                        = 128 ,
   parameter EXT_PIPE_SIM                        = "FALSE",  // This Parameter has effect on selecting Enable External PIPE Interface in GUI.
   parameter C_ROOT_PORT                         = "FALSE",      // PCIe block is in root port mode
   parameter C_DEVICE_NUMBER                     = 0
   )
   (

    input   pin_clk_p,
    input   pin_clk_n,
    input   sys_rst_n
    //output  clk_int
    );

    wire                                    clk_int;
    wire                                    sys_rst_n_c;

  // Ref clock buffer
  IBUFDS_GTE2 refclk_ibuf (.O(clk_int), .ODIV2(), .I(pin_clk_p), .CEB(1'b0), .IB(pin_clk_n));
  // Reset buffer
  IBUF   sys_reset_n_ibuf (.O(sys_rst_n_c), .I(sys_rst_n));

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