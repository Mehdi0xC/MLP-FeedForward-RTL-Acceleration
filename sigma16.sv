// SYNTHESIZABLE ADDER FOR N BIT SIGNED MAGNITUDE WITH F BITS OF FRACTION
// CREATED BY MEHDI SAFAEE, WINTER 2018-2019
`include "config.svh"
module sigma16
//##############################################################################################
//##############################################################################################
// PARAMETERs-----------------------------------------------------------------------------------
// INPUT AND OUTPUTS----------------------------------------------------------------------------
    (
    input logic [`N-1:0] a[0:15][1],
    output logic [`N-1:0] c
    );
// MODULES INSTANTIATIONS-----------------------------------------------------------------------
    logic [`N-1:0] temp [0:1];
    logic [`N-1:0] result;

	sigma8 sigma8_0 
    (
		.a(a[0:7]), 
		.c(temp[0])
	);
    sigma8 sigma8_1
    (
		.a(a[8:15]), 
		.c(temp[1])
	);
	adder adder0
    (
		.a(temp[0]), 
		.b(temp[1]), 
		.c(result)
	);
// VARIABLES -----------------------------------------------------------------------------------
    assign c = result;
// INITIALIZATIONS------------------------------------------------------------------------------
// MAIN-----------------------------------------------------------------------------------------
//##############################################################################################
//##############################################################################################
endmodule