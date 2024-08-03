/* SENG 440 - Digital Filters Final Project */

// Compile in the terminal using the following command:
// gcc -static -mfpu=neon test2_NEON.c -o filter_nonO3.s
// gcc -static -mfpu=neon -O3 test2_NEON.c -o filter.s

# include <stdio.h>
#include <arm_neon.h>

// Note: short int -> 16 bits
// Note:       int -> 32 bits

void print_int16x4_t(int16x4_t vec) {
    // Convert the NEON vector to a regular array
    int16_t values[4];
    vst1_s16(values, vec); // Store the vector values into the array
    
    // Print the values
    printf("Vector values: %d, %d, %d, %d\n", values[0], values[1], values[2], values[3]);
}

void print_int32x4_t(int32x4_t vec) {
    // Convert the NEON vector to a regular array
    int32_t values[4];
    vst1q_s32(values, vec); // Store the vector values into the array
    
    // Print the values
    printf("Vector values: %d, %d, %d, %d\n", values[0], values[1], values[2], values[3]);
}

short int X[128]; // Previous Inputs Array (stores up to 128, 16-bit signed integers)
short int Y[128]; // Previous Outputs Array (stores up to 128, 16-bit signed integers)

// This Function defines the large step input for x[n] and initial conditions on y[n]
static inline void filter_init(short int *X, short int *Y){

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

    /* The order of a filter indicates the maximum of the number of previous input/output 
     * samples in the difference equation
     * A second order filter uses two previous input/output samples, thus we have:
     * 2 output coefficients and 2 input coefficients + 1 for the current input */

    // Input Coefficients (See Calculations in Report)
    const int16x4_t B0 = vdup_n_s16(0x76B0); //30384
    const int16x4_t B1 = vdup_n_s16(0x76B0); //30384
    const int16x4_t B2 = vdup_n_s16(0x76B0); //30384
    int32x4_t tmp_B0_combined, tmp_B1_combined, tmp_B2_combined; //, tmp_A1, tmp_A2, sum;
    // const short int B0 = 0x76B0;
    // const short int B1 = 0x76B0;
    // const short int B2 = 0x76B0;
    // int tmp_B0, tmp_B1, tmp_B2;               
    // int tmp_B0_nxt1, tmp_B1_nxt1, tmp_B2_nxt1;
    // int tmp_B0_nxt2, tmp_B1_nxt2, tmp_B2_nxt2;
    // int tmp_B0_nxt3, tmp_B1_nxt3, tmp_B2_nxt3;

    // Output Coefficients (See Calculations in Report)
    const short int A1 = 0x74A7;  //29863
    const short int A2 = 0x94D7;  //-27433
    int tmp_A1, tmp_A2;          
    int tmp_A1_nxt1, tmp_A2_nxt1;
    int tmp_A1_nxt2, tmp_A2_nxt2;
    int tmp_A1_nxt3, tmp_A2_nxt3;

    // Iniitalize input and output value arrays
    filter_init(X, Y);

    // Display initial values of the output array (scaled decimal, scaled hex, unscaled decimal)
    printf( "Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\n", Y[0], Y[0], ((float)Y[0])/16384 ); // SFy = 2^14;
    printf( "Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\n", Y[1], Y[1], ((float)Y[1])/16384 ); // SFy = 2^14;
    
    // 16bit x 4 NEON d-registers to store input values for each iteration 
    int16x4_t x_curr, x_prev1, x_prev2;

    // Compute the scaled output Y[n] for all n beyond initial conditions (from 2 to 99)
    register int i;
    for (i=2; i<102; i+=4) {

        /* Note: When a 32-bit processor performs operations on 16-bit fixed-point numbers, 
         * intermediate results can still use the full 32-bit range. 
         */

        // Load current and previous inputs and outputs into NEON registers
        x_curr  = vld1_s16(&X[i]);      // 4 values starting from i (16-bits each)
        x_prev1 = vld1_s16(&X[i - 1]);  // 4 values starting from i-1 (16-bits each)
        x_prev2 = vld1_s16(&X[i - 2]);  // 4 values starting from i-2 (16-bits each)

        //--------DEBUG----------------//
        // printf("x_curr: ");
        // print_int16x4_t(x_curr); printf("\n");
        // printf("x_prev1: ");
        // print_int16x4_t(x_prev1); printf("\n");
        // printf("x_prev2: ");
        // print_int16x4_t(x_prev2); printf("\n");
        //--------DEBUG----------------//

        tmp_B0_combined = vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 23), B0, x_curr), 24);  //x_curr is 4 different 16-bit values, B is 4 identical 16-bit values, vdupq_n_s32(1 << 23) is 4 identical 32-bit values (result register for multiply- accumulates with rounding bits) 
        tmp_B1_combined = vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 22), B1, x_prev1), 23);
        tmp_B2_combined = vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 23), B2, x_prev2), 24);

        //--------DEBUG----------------//
        // printf("tmp_B0_combined: ");
        // print_int32x4_t(tmp_B0_combined); printf("\n");
        // printf("tmp_B1_combined: ");
        // print_int32x4_t(tmp_B1_combined); printf("\n");
        // printf("tmp_B2_combined: ");
        // print_int32x4_t(tmp_B2_combined); printf("\n");
        //--------DEBUG----------------//

        int tmp_B0[4], tmp_B1[4], tmp_B2[4];
        vst1q_s32(tmp_B0, tmp_B0_combined);
        vst1q_s32(tmp_B1, tmp_B1_combined);
        vst1q_s32(tmp_B2, tmp_B2_combined);

        //--------DEBUG----------------//
        // printf("tmp_B0: ");
        // print_int32x4_t(tmp_B0_combined); printf("\n");
        // printf("tmp_B1: ");
        // print_int32x4_t(tmp_B1_combined); printf("\n");
        // printf("tmp_B2: ");
        // print_int32x4_t(tmp_B2_combined); printf("\n");
        //--------DEBUG----------------//


        // Compute the scaled output for iteration i (result of the scaled difference equation)
        //tmp_B0      = ((int)B0 * (int)X[i  ] + (1 << 23)) >> 24;
        //tmp_B1      = ((int)B1 * (int)X[i-1] + (1 << 22)) >> 23;
        //tmp_B2      = ((int)B2 * (int)X[i-2] + (1 << 23)) >> 24;
        tmp_A2      = ((int)A2 * (int)Y[i-2] + (1 << 14)) >> 15;
        tmp_A1      = ((int)A1 * (int)Y[i-1] + (1 << 13)) >> 14;
        Y[i]        = (short int)(tmp_B0[0] + tmp_B1[0] + tmp_B2[0] + tmp_A1 + tmp_A2);
        
        // Compute the scaled output for iteration i+1 (result of the scaled difference equation)
        //tmp_B0_nxt1 = ((int)B0 * (int)X[i+1] + (1 << 23)) >> 24;
        //tmp_B1_nxt1 = ((int)B1 * (int)X[i  ] + (1 << 22)) >> 23;
        //tmp_B2_nxt1 = ((int)B2 * (int)X[i-1] + (1 << 23)) >> 24;
        tmp_A2_nxt1 = ((int)A2 * (int)Y[i-1] + (1 << 14)) >> 15;
        tmp_A1_nxt1 = ((int)A1 * (int)Y[i  ] + (1 << 13)) >> 14;
        Y[i+1]      = (short int)(tmp_B0[1] + tmp_B1[1] + tmp_B2[1] + tmp_A1_nxt1 + tmp_A2_nxt1);

        // Compute the scaled output for iteration i+2 (result of the scaled difference equation)
        //tmp_B0_nxt2 = ((int)B0 * (int)X[i+2] + (1 << 23)) >> 24;
        //tmp_B1_nxt2 = ((int)B1 * (int)X[i+1] + (1 << 22)) >> 23;
        //tmp_B2_nxt2 = ((int)B2 * (int)X[i  ] + (1 << 23)) >> 24;
        tmp_A2_nxt2 = ((int)A2 * (int)Y[i  ] + (1 << 14)) >> 15;
        tmp_A1_nxt2 = ((int)A1 * (int)Y[i+1] + (1 << 13)) >> 14;
        Y[i+2]      = (short int)(tmp_B0[2] + tmp_B1[2] + tmp_B2[2] + tmp_A1_nxt2 + tmp_A2_nxt2);
        
        // Compute the scaled output for iteration i+3 (result of the scaled difference equation)
        //tmp_B0_nxt3 = ((int)B0 * (int)X[i+3] + (1 << 23)) >> 24;
        //tmp_B1_nxt3 = ((int)B1 * (int)X[i+2] + (1 << 22)) >> 23;
        //tmp_B2_nxt3 = ((int)B2 * (int)X[i+1] + (1 << 23)) >> 24;
        tmp_A2_nxt3 = ((int)A2 * (int)Y[i+1] + (1 << 14)) >> 15;
        tmp_A1_nxt3 = ((int)A1 * (int)Y[i+2] + (1 << 13)) >> 14;
        Y[i+3]      = (short int)(tmp_B0[3] + tmp_B1[3] + tmp_B2[3] + tmp_A1_nxt3 + tmp_A2_nxt3);

        // Display output for each iteration
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i, Y[i], Y[i], i, ((float)Y[i])/16384 ); // SFy = 2^14;
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i+1, Y[i+1], Y[i+1], i+1, ((float)Y[i+1])/16384 ); // SFy = 2^14;
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i+2, Y[i+2], Y[i+2], i+2, ((float)Y[i+2])/16384 ); // SFy = 2^14;
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i+3, Y[i+3], Y[i+3], i+3, ((float)Y[i+3])/16384 ); // SFy = 2^14;

    }

} /* main */