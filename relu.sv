// SYNTHESIZABLE MULTIPLIER FOR N BIT SIGNED MAGNITUDE WITH F BITS OF FRACTION
// CREATED BY MEHDI SAFAEE, WINTER 2018-2019
`include "config.svh"
module relu 
//##############################################################################################
//##############################################################################################
// PARAMETERs-----------------------------------------------------------------------------------
	#(
	parameter Size = 3
	)
// INPUT AND OUTPUTS----------------------------------------------------------------------------
	(
	 input logic		[`N-1:0]	a[0:Size-1],
	 output	logic		[`N-1:0]	c[0:Size-1]
	 );
// VARIABLES -----------------------------------------------------------------------------------
    genvar i;
    generate
		for (i=0; i<Size; i=i+1) begin : loop_on_columns
				assign c[i] = a[i] & {`N{~a[i][`N-1]}};
		end
    endgenerate
// MODULES INSTANTIATIONS-----------------------------------------------------------------------
// INITIALIZATIONS------------------------------------------------------------------------------	
// MAIN-----------------------------------------------------------------------------------------
//##############################################################################################
//##############################################################################################
endmodule