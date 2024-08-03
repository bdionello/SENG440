/* SENG 440 - Digital Filters Final Project */

// Compile in the terminal using the following command:
// gcc -O3 -mfpu=neon filter.c -o filter.exe

# include <stdio.h>
#include "arm_neon.h"

// Note: short int -> 16 bits
// Note:       int -> 32 bits

short int X[128]; // Previous Inputs Array (stores up to 128, 16-bit signed integers)
short int Y[128]; // Previous Outputs Array (stores up to 128, 16-bit signed integers)

// This Function defines the large step input for x[n] and initial conditions on y[n]
void filter_init(short int *X, short int *Y){

    register int i; // loop counter

    /* Define Initial Conditions for Input and Output *
     * - This provides a consistent starting point helping
     *   to avoid undefined behaviour that could occur if
     *   the arrays X and Y contained random garbage */
    // SCALED FILTER INPUT DEFINITION: Large Step Function from -1 to 1, scaled by 2^15
    X[0] = (short int)0x8001; //-32767 --> Normalized (X[0] / 2^15) to x[0] = ~ -1 (-0.99997)
    X[1] = (short int)0x8001; //-32767 --> Normalized (X[1] / 2^15) to x[1] = ~ -1 (-0.99997)
    for (i=2; i<100; i++)
        X[i] = (short int)0x7FFF; //+32767 --> Normalized to (X[i] / 2^15) x[i] = ~ +1 (+0.99997)

    // SCALED FILTER OUTPUT INITIAL CONDITIONS
    Y[0] = (short int)0xC000; //-16384 --> Normalized (Y[0] / 2^14) to y[0] = -1
    Y[1] = (short int)0xC000; //-16384 --> Normalized (Y[1] / 2^14) to y[1] = -1
}

void main(void){

    //const short int Coeffs[8] = {0x76B0, 0x76B0, 0x76B0, 0x74A7, 0x94D7}; // {B0, B1.B2, A1, A2}
    
    const short int B[4] = {0x76B0, 0x76B0, 0x76B0}; // {B0, B1, B2}
    const short int A[4] = {0x74A7, 0x94D7}; // {A1, A2}
    
    int16x4_t NEON_B;
    int16x4_t NEON_X;

    int16x4_t NEON_A;
    int16x4_t NEON_Y;

    NEON_B = vld1_s16( B ); // Load Coefficients into NEON d-register (64-bits)
    NEON_A = vld1_s16( A ); // Load Coefficients into NEON d-register (64-bits)

    // Iniitalize input and output value arrays
    filter_init(X, Y);

    // Display initial values of the output array (scaled decimal, scaled hex, unscaled decimal)
    printf( "Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\n", Y[0], Y[0], ((float)Y[0])/16384 ); // SFy = 2^14; used to be 2^15 = 32768
    printf( "Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\n", Y[1], Y[1], ((float)Y[1])/16384 ); // SFy = 2^14; used to be 2^15 = 32768
    
    // Compute the scaled output Y[n] for all n beyond initial conditions (from 2 to 99)
    register int i;
    for (i=2; i<100; i++) {

        NEON_XYvals = vld1q_s16({&X[i], &X[i-1], &X[i-2], &Y[i-1], &Y[i-2]});

        /* Note: When a 32-bit processor performs operations on 16-bit fixed-point numbers, 
         * intermediate results can still use the full 32-bit range. 
         * We must ensure that intermediate results do not exceed the range of a 32-bit signed integer [-2^31, 2^31 - 1].
         */
        
        // Multiply Current and Previous Two Scaled Inputs by Input Coefficients then divide by scalefactor and round
        tmp_B0 = ((int)B0 * (int)X[i  ] + (1 << 23)) >> 24; // Scale Factor = 2^24
        tmp_B1 = ((int)B1 * (int)X[i-1] + (1 << 22)) >> 23; // Scale Factor = 2^23
        tmp_B2 = ((int)B2 * (int)X[i-2] + (1 << 23)) >> 24; // Scale Factor = 2^24

        // Multiply Previous Two Scaled Ouptuts by Ouptut Coefficients then divide by scalefactor and round
        tmp_A1 = ((int)A1 * (int)Y[i-1] + (1 << 13)) >> 14; // Scale Factor = 2^14
        tmp_A2 = ((int)A2 * (int)Y[i-2] + (1 << 14)) >> 15; // Scale Factor = 2^15
    
        // Compute the scaled output (result of the scaled difference equation)
        Y[i] = (short int)(tmp_B0 + tmp_B1 + tmp_B2 + tmp_A1 + tmp_A2); // Recall: y[n] = Y[n] / SFy

        // Display output for each iteration
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i, Y[i], Y[i], i, ((float)Y[i])/16384 ); // SFy = 2^14; used to be 2^15 = 32768

    }

} /* main */