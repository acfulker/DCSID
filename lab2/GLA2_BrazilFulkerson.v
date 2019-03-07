module GLA2_BrazilFulkerson(CLOCK_50,
                         VGA_CLK,
                         VGA_VS,
                         VGA_HS,
						 VGA_BLANK_n,
                         VGA_B,
                         VGA_G,
                         VGA_R);
input CLOCK_50;
output VGA_CLK;
output VGA_VS;
output VGA_HS;
output VGA_BLANK_n;
output wire [7:0] VGA_B;
output wire [7:0] VGA_G;  
output wire [7:0] VGA_R;                        


wire VGA_BLANK_n,VGA_HS,VGA_VS, VGA_CLK;

////////////////////////////////////////////
//Declare wire to hold the signal

wire [15:0] ValSignal;


///////////////////////////////////////////
// signal_generator instance

Signal_generator Sig_gen(
								 .CLOCK_50(CLOCK_50),
	                      .signal(ValSignal)
);

/////////////////////////////////////////////
//oscilloscope instance
							
oscilloscope Osc_ins(
							.CLOCK_50(CLOCK_50),
							.signal(ValSignal),
							.oVGA_CLK(VGA_CLK),
							.oVS(VGA_VS),
							.oHS(VGA_HS),
							.oBLANK_n(VGA_BLANK_n),
							.b_data(VGA_B),
							.g_data(VGA_G),
							.r_data(VGA_R)
                		  );
							
endmodule