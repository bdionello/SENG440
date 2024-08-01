/* SENG 440 - Digital Filters Final Project */

// Compile in the terminal using the following command:
// gcc -static -O3 -mfpu=neon filter.c -o filter.exe

#include <stdio.h>
#include <arm_neon.h>

short int X[128]; // Previous Inputs Array (stores up to 128, 16-bit signed integers)
short int Y[128]; // Previous Outputs Array (stores up to 128, 16-bit signed integers)

// This Function defines the large step input for x[n] and initial conditions on y[n]
inline void filter_init(short int *X, short int *Y){
    register int i; // loop counter

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
    // Input Coefficients (See Calculations in Report)
    const short int B0 = 0x76B0;
    const short int B1 = 0x76B0;
    const short int B2 = 0x76B0;
    int tmp_B0, tmp_B1, tmp_B2;  // to store terms in the difference equation for each iteration n

    // Output Coefficients (See Calculations in Report)
    const short int A1 = 0x74A7;
    const short int A2 = 0x94D7; // note this constant is a negative value (sign 2's complement)
    int tmp_A1, tmp_A2;          // to store terms in the difference equation for each iteration n

    // Initialize input and output value arrays
    filter_init(X, Y);

    // Display initial values of the output array (scaled decimal, scaled hex, unscaled decimal)
    printf("Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\n", Y[0], Y[0], ((float)Y[0]) / 16384);
    printf("Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\n", Y[1], Y[1], ((float)Y[1]) / 16384);

    // NEON Intrinsics Variables
    int16x4_t x_curr, x_prev1, x_prev2, y_prev1, y_prev2;
    int32x4_t b0, b1, b2, a1, a2, tmp_B, tmp_A, sum;

    // Load coefficients into NEON registers
    b0 = vdupq_n_s32(B0);
    b1 = vdupq_n_s32(B1);
    b2 = vdupq_n_s32(B2);
    a1 = vdupq_n_s32(A1);
    a2 = vdupq_n_s32(A2);

    // Compute the scaled output Y[n] for all n beyond initial conditions (from 2 to 99)
    register int i;

    for (i = 2; i < 100; i += 4) { // Unroll loop by processing 4 elements at a time
        // Load current and previous inputs and outputs into NEON registers
        x_curr = vld1_s16(&X[i]);
        x_prev1 = vld1_s16(&X[i - 1]);
        x_prev2 = vld1_s16(&X[i - 2]);
        y_prev1 = vld1_s16(&Y[i - 1]);
        y_prev2 = vld1_s16(&Y[i - 2]);

        // Perform multiplication and scaling for inputs
        tmp_B = vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 23), b0, x_curr), 24);
        tmp_B = vaddq_s32(tmp_B, vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 22), b1, x_prev1), 23));
        tmp_B = vaddq_s32(tmp_B, vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 23), b2, x_prev2), 24));

        // Perform multiplication and scaling for outputs
        tmp_A = vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 13), a1, y_prev1), 14);
        tmp_A = vaddq_s32(tmp_A, vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 14), a2, y_prev2), 15));

        // Compute the scaled output (result of the scaled difference equation)
        sum = vaddq_s32(tmp_B, tmp_A);
        int16x4_t result = vmovn_s32(sum); // Narrow to 16-bit result

        // Store the result
        vst1_s16(&Y[i], result);

        // Display output for each iteration
        for (int j = 0; j < 4; j++) {
            printf("Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i + j, Y[i + j], Y[i + j], i + j, ((float)Y[i + j]) / 16384);
        }
    }
}
