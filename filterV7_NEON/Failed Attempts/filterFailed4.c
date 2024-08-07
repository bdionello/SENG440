#include <stdio.h>
#include <arm_neon.h>

short int X[128]; // Previous Inputs Array (stores up to 128, 16-bit signed integers)
short int Y[128]; // Previous Outputs Array (stores up to 128, 16-bit signed integers)

// This Function defines the large step input for x[n] and initial conditions on y[n]
static inline void filter_init(short int *X, short int *Y){
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

int main(void){
    // Input Coefficients (See Calculations in Report)
    const int16x4_t B0 = vdup_n_s16(0x76B0);
    const int16x4_t B1 = vdup_n_s16(0x76B0);
    const int16x4_t B2 = vdup_n_s16(0x76B0);

    // Output Coefficients (See Calculations in Report)
    const int16x4_t A1 = vdup_n_s16(0x74A7);
    const int16x4_t A2 = vdup_n_s16(0x94D7);

    // Initialize input and output value arrays
    filter_init(X, Y);

    // Display initial values of the output array (scaled decimal, scaled hex, unscaled decimal)
    printf("Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\n", Y[0], Y[0], ((float)Y[0]) / 16384);
    printf("Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\n", Y[1], Y[1], ((float)Y[1]) / 16384);

    // NEON Intrinsics Variables
    int16x4_t x_curr, x_prev1, x_prev2, y_prev1, y_prev2;
    int32x4_t tmp_B0, tmp_B1, tmp_B2, tmp_A1, tmp_A2, sum;

    // Compute the scaled output Y[n] for all n beyond initial conditions (from 2 to 99)
    for (int i = 2; i < 100; i += 4) { // Unroll loop by processing 4 elements at a time
        // Load current and previous inputs and outputs into NEON registers
        x_curr = vld1_s16(&X[i]);
        x_prev1 = vld1_s16(&X[i - 1]);
        x_prev2 = vld1_s16(&X[i - 2]);
        y_prev1 = vld1_s16(&Y[i - 1]);
        y_prev2 = vld1_s16(&Y[i - 2]);

        // Perform multiplication and scaling for inputs
        tmp_B0 = vmlal_s16(vdupq_n_s32(0), B0, x_curr);
        tmp_B1 = vmlal_s16(vdupq_n_s32(0), B1, x_prev1);
        tmp_B2 = vmlal_s16(vdupq_n_s32(0), B2, x_prev2);
        
        tmp_B0 = vshrq_n_s32(tmp_B0, 24);
        tmp_B1 = vshrq_n_s32(tmp_B1, 23);
        tmp_B2 = vshrq_n_s32(tmp_B2, 24);

        // Perform multiplication and scaling for outputs
        tmp_A1 = vmlal_s16(vdupq_n_s32(0), A1, y_prev1);
        tmp_A2 = vmlal_s16(vdupq_n_s32(0), A2, y_prev2);
        
        tmp_A1 = vshrq_n_s32(tmp_A1, 14);
        tmp_A2 = vshrq_n_s32(tmp_A2, 15);

        // Compute the scaled output (result of the scaled difference equation)
        sum = vaddq_s32(vaddq_s32(tmp_B0, tmp_B1), vaddq_s32(tmp_B2, vaddq_s32(tmp_A1, tmp_A2)));
        int16x4_t result = vmovn_s32(sum); // Narrow to 16-bit result

        // Store the result
        vst1_s16(&Y[i], result);

        // Display output for each iteration
        for (int j = 0; j < 4 && i + j < 100; j++) {
            printf("Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i + j, Y[i + j], Y[i + j], i + j, ((float)Y[i + j]) / 16384);
        }
    }

    return 0;
}
