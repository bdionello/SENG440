/* SENG 440 - Digital Filters Final Project */

// Compile in the terminal using the following command:
// gcc filter.c -o filter.exe

# include <stdio.h>

// Note: short int -> 16 bits
// Note:       int -> 32 bits

int X[64] = { 0x80018001, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
			0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
			0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
			0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
			0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
			0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
			0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
            0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
            0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
            0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
            0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
            0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
            0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF, 0x7FFF7FFF,
};
short int Y[128]; // Previous Outputs Array (stores up to 128, 16-bit signed integers)

void main(void){

    /* The order of a filter indicates the maximum of the number of previous input/output 
     * samples in the difference equation
     * A second order filter uses two previous input/output samples, thus we have:
     * 2 output coefficients and 2 input coefficients + 1 for the current input */
    // Input Coefficients (See Calculations in Report)
    const short int B0 = 0x76B0;
    const short int B1 = 0x76B0;
    const short int B2 = 0x76B0;
    int tmp_B0, tmp_B1, tmp_B2;  // to store terms in the difference equation for each iteration n

    // Output Coefficients (See Calculations in Report)
    const short int A1 = 0x74A7; //
    const short int A2 = 0x94D7; // note this constant is a negative value (sign 2's complement)
    int tmp_A1, tmp_A2;          // to store terms in the difference equation for each iteration n

    // Iniitalize output value array
    Y[0] = (short int)0xC000; //-16384 --> Normalized (Y[0] / 2^14) to y[0] = -1
    Y[1] = (short int)0xC000; //-16384 --> Normalized (Y[1] / 2^14) to y[1] = -1 

    // Display initial values of the output array (scaled decimal, scaled hex, unscaled decimal)
    printf( "Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\n", Y[0], Y[0], ((float)Y[0])/16384 ); // SFy = 2^14; used to be 2^15 = 32768
    printf( "Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\n", Y[1], Y[1], ((float)Y[1])/16384 ); // SFy = 2^14; used to be 2^15 = 32768
    
    // Compute the scaled output Y[n] for all n beyond initial conditions (from 2 to 99)
    register int i;

    for (i=2; i<100; i++) {

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
