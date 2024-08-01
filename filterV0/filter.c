/* SENG 440 - Digital Filters Final Project */

// Compile in the terminal using the following command:
// gcc filter.c -o filter.exe

# include <stdio.h>

// Note: short int -> 16 bits
// Note:       int -> 32 bits

short int X[128]; // Previous Inputs Array (stores up to 128, 16-bit signed integers)
short int Y[128]; // Previous Outputs Array (stores up to 128, 16-bit signed integers)

void filter_init(short int *X, short int *Y){

    register int i; // loop counter

    /* Define Initial Conditions for Input and Output *
     * - This provides a consistent starting point helping
     *   to avoid undefined behaviour that could occur if
     *   the arrays X and Y contained random garbage */
    // FILTER INPUT DEFINITION: Large Step Function from -1 to 1, scaled by 2^15
    X[0] = (short int)0x8001; //-32767
    X[1] = (short int)0x8001; //-32767
    for (i=2; i<100; i++)
        X[i] = (short int)0x7FFF; //+32767

    // FILTER OUTPUT INITIAL CONDITIONS
    Y[0] = (short int)0x8001; //-32767
    Y[1] = (short int)0x8001; //-32767
}

void main(void){

    /* The order of a filter indicates the maximum of the number of previous input/output samples in the difference equation
     * A second order filter uses two previous input/output samples, thus we have:
     * 2 output coefficients and 2 input coefficients + 1 for the current input */
    // Input Coefficients
    const short int B0 = 0x10C8; //<-- TO BE CHANGED
    const short int B1 = 0x2190; //<-- TO BE CHANGED
    const short int B2 = 0x10C8; //<-- TO BE CHANGED
    int tmp_B0, tmp_B1, tmp_B2;  // to store terms in the difference equation for each iteration n

    // Output Coefficients
    const short int A1 = 0x5FB7; //<-- TO BE CHANGED
    const short int A2 = 0xDD28; //<-- TO BE CHANGED // Note this constant is a negative value (sign 2's complement)
    int tmp_A1, tmp_A2;          // to store terms in the difference equation for each iteration n

    // Iniitalize input and output value arrays
    filter_init(X, Y);

    // Display initial values of the output array (scaled decimal, scaled hex, unscaled decimal)
    printf( "Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\n", Y[0], Y[0], ((float)Y[0])/32768 ); // Scale Factor = 2^15 = 32768 <- might want to try changing this to 2^14?
    printf( "Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\n", Y[1], Y[1], ((float)Y[1])/32768 ); // Scale Factor = 2^15 = 32768 <- might want to try changing this to 2^14?
    
    // Compute the scaled output Y[n] for all n beyond initial conditions (from 2 to 99)
    register int i;
    for (i=2; i<100; i++) {
        
        // Multiply Current and Previous Two Scaled Inputs by Input Coefficients then divide by scalefactor and round
        tmp_B0 = ((int)B0 * (int)X[i  ] + (1 << 14)) >> 15; // Scale Factor = 2^15
        tmp_B1 = ((int)B1 * (int)X[i-1] + (1 << 14)) >> 15; // Scale Factor = 2^15
        tmp_B2 = ((int)B2 * (int)X[i-2] + (1 << 14)) >> 15; // Scale Factor = 2^15

        // Multiply Previous Two Scaled Ouptuts by Ouptut Coefficients then divide by scalefactor and round
        tmp_A1 = ((int)A1 * (int)Y[i-1] + (1 << 14)) >> 15; // Scale Factor = 2^15 = 32768 <- might want to try changing this to 2^14?
        tmp_A2 = ((int)A2 * (int)Y[i-2] + (1 << 14)) >> 15; // Scale Factor = 2^15 = 32768 <- might want to try changing this to 2^14?
    
        // Compute the scaled output (result of the scaled difference equation)
        Y[i] = (short int)(tmp_B0 + tmp_B1 + tmp_B2 + tmp_A1 + tmp_A2); // Recall: y[n] = Y[n] / SF

        // Display output for each iteration
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i, Y[i], Y[i], i, ((float)Y[i])/32768 );

    }

} /* main */