// SYNTHESIZABLE ADDER FOR N BIT SIGNED MAGNITUDE WITH F BITS OF FRACTION
// CREATED BY MEHDI SAFAEE, WINTER 2018-2019
//MSB#rewards#actions#nextState#state#LSB
`include "config.svh"
module ff 
//##############################################################################################
//##############################################################################################
// PARAMETERs-----------------------------------------------------------------------------------
// INPUT AND OUTPUTS----------------------------------------------------------------------------
    (
    input logic [`nStates-1:0] x,
    input logic [`N-1:0] W1[0:`nStates-1][0:`nNeurons-1],
    input logic [`N-1:0] b1[0: `nNeurons-1],
    input logic [`N-1:0] W2[0:`nNeurons-1][0:`nActions-1],
    input logic [`N-1:0] b2[0: `nActions-1],
    output logic [`N-1:0] out [0:`nActions-1]
    );
// MODULES INSTANTIATIONS-----------------------------------------------------------------------
// VARIABLES -----------------------------------------------------------------------------------
    
    // variables as inputs for learning

    // learning weights and biases 

    logic [`N-1:0] R1[0:`nStates-1][0:`nNeurons-1];
    logic [`N-1:0] R2[0:`nNeurons-1];
    logic [`N-1:0] R3[0:`nNeurons-1];
    logic [`N-1:0] R4[0:`nNeurons-1];    
    logic [`N-1:0] R5[0:`nNeurons-1][0:`nActions-1]; 
    logic [`N-1:0] R6[0:`nActions-1]; 
    logic [`N-1:0] R7[0:`nActions-1]; 
    
    
	mask #(.R(`nStates), .C(`nNeurons)) mask0 (
		.a(x), 
		.b(W1), 
		.c(R1)
	);

     genvar i;
     generate
         for (i=0; i<`nNeurons; i=i+1) begin : sumReduce1
              
            sigma3 sigma3_instance (
                .a1(R1[0][i][`N-1:0]),
                .a2(R1[1][i][`N-1:0]),
                .a3(R1[2][i][`N-1:0]), 
                .c(R2[i][`N-1:0])
            );
         end
     endgenerate

     generate
         for (i=0; i<`nNeurons; i=i+1) begin : adder1   
            adder adder_instance (
                .a(R2[i][`N-1:0]),
                .b(b1[i][`N-1:0]),
                .c(R3[i][`N-1:0])
            );
         end
     endgenerate

    relu #(.Size(`nNeurons)) relu_instance(
        .a(R3),
        .c(R4)
    );
    
    matrixMultiplier #(.R(`nNeurons), .C(`nActions)) matmul(
    .a(R4),
    .b(W2),
    .c(R5)
    );
    
     generate
         for (i=0; i<`nActions; i=i+1) begin : sumReduce2           
            sigma8 sigma8_instance (
                .a0(R5[0][i][`N-1:0]),
                .a1(R5[1][i][`N-1:0]),
                .a2(R5[2][i][`N-1:0]), 
                .a3(R5[2][i][`N-1:0]),      
                .a4(R5[4][i][`N-1:0]),                
                .a5(R5[5][i][`N-1:0]),                
                .a6(R5[6][i][`N-1:0]),                
                .a7(R5[7][i][`N-1:0]),                                          
                .c(R6[i][`N-1:0])
            );
         end
     endgenerate
    
    generate
     for (i=0; i<`nActions; i=i+1) begin : adder2   
        adder adder_instance (
            .a(R6[i][`N-1:0]),
            .b(b2[i][`N-1:0]),
            .c(R7[i][`N-1:0])
        );
     end
 endgenerate 
    
    
    assign out = R7;



endmodule