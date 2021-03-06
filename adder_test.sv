// ADDING PI AND NEPER NUMBER TOGETHER, WITH 32 BIT SIGNED MAGNITUDE REPRESENTATION AND 17 BIT OF FRACTIONS
// CREATED BY MEHDI SAFAEE, WINTER 2018-2019
`include "config.svh"
module adder_test;
//##############################################################################################
//##############################################################################################
// PARAMETERs-----------------------------------------------------------------------------------
// INPUT AND OUTPUTS----------------------------------------------------------------------------
// VARIABLES -----------------------------------------------------------------------------------
	logic [31:0] a, b, c;
// MODULES INSTANTIATIONS-----------------------------------------------------------------------
	adder adder0 
    (
		.a(a), 
		.b(b), 
		.c(c)
	);
// INITIALIZATIONS------------------------------------------------------------------------------
	initial 
    begin
		a[30:0] = 0;
		a[31] = 0;
		b[31] = 1;
		b[30:0] = 0;
		#100;
    end
// MAIN-----------------------------------------------------------------------------------------
    always
    begin
        #100;
        a = 32'h0006487e;		
        b = 32'h00056fc2;
    end
//##############################################################################################
//##############################################################################################
endmodule