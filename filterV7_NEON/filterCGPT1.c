#include <stdio.h>
#include <arm_neon.h>

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
    vst1_s32(values, vec); // Store the vector values into the array
    
    // Print the values
    printf("Vector values: %d, %d, %d, %d\n", values[0], values[1], values[2], values[3]);
}

// Initalize Input ad Output Arrays
short int X[128] = {0x8001, 0x8001, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
                    0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF,
};
short int Y[128]; // Previous Outputs Array (stores up to 128, 16-bit signed integers)

int main(void) {

    // Initial Conditions
    Y[0] = (short int)0xC000; // -16384 --> Normalized (Y[0] / 2^14) to y[0] = -1
    Y[1] = (short int)0xC000; // -16384 --> Normalized (Y[1] / 2^14) to y[1] = -1

    // Display initial values of the output array (scaled decimal, scaled hex, unscaled decimal)
    printf("Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\n", Y[0], Y[0], ((float)Y[0]) / 16384);
    printf("Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\n", Y[1], Y[1], ((float)Y[1]) / 16384);

    // Input Coefficients (See Calculations in Report)
    const int16x4_t B0 = vdup_n_s16(0x76B0);
    const int16x4_t B1 = vdup_n_s16(0x76B0);
    const int16x4_t B2 = vdup_n_s16(0x76B0);

    // Output Coefficients (See Calculations in Report)
    const int16x4_t A1 = vdup_n_s16(0x74A7);
    const int16x4_t A2 = vdup_n_s16(0x94D7);

    print_int16x4_t(B0);
    print_int16x4_t(B1);
    print_int16x4_t(B2);
    print_int16x4_t(A1);
    print_int16x4_t(A2);

    // NEON Intrinsics Variables
    int16x4_t x_curr, x_prev1, x_prev2, y_prev1, y_prev2;
    int32x4_t tmp_B0, tmp_B1, tmp_B2, tmp_A1, tmp_A2, sum;

    // Compute the scaled output Y[n] for all n beyond initial conditions (from 2 to 99)
    for (int i = 2; i < 100; i++) { // Process each element individually
        // Load current and previous inputs and outputs into NEON registers
        x_curr  = vld1_lane_s16(&X[i], x_curr, 0);
        x_prev1 = vld1_lane_s16(&X[i - 1], x_prev1, 0);
        x_prev2 = vld1_lane_s16(&X[i - 2], x_prev2, 0);
        y_prev1 = vld1_lane_s16(&Y[i - 1], y_prev1, 0);
        y_prev2 = vld1_lane_s16(&Y[i - 2], y_prev2, 0);

        print_int16x4_t(x_curr);
        print_int16x4_t(x_prev1);
        print_int16x4_t(x_prev2);
        print_int16x4_t(y_prev1);
        print_int16x4_t(y_prev2);

        // Perform multiplication and scaling for inputs
        tmp_B0 = vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 23), B0, x_curr), 24);
        tmp_B1 = vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 22), B1, x_prev1), 23);
        tmp_B2 = vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 23), B2, x_prev2), 24);

        // Perform multiplication and scaling for outputs
        tmp_A1 = vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 13), A1, y_prev1), 14);
        tmp_A2 = vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 14), A2, y_prev2), 15);

        print_int32x4_t(tmp_B0);
        print_int32x4_t(tmp_B1);
        print_int32x4_t(tmp_B2);
        print_int32x4_t(tmp_A1);
        print_int32x4_t(tmp_A2);

        // Compute the scaled output (result of the scaled difference equation)
        sum = vaddq_s32(vaddq_s32(tmp_B0, tmp_B1), vaddq_s32(tmp_B2, vaddq_s32(tmp_A1, tmp_A2)));
        int16x4_t result = vmovn_s32(sum); // Narrow to 16-bit result

        print_int32x4_t(sum);
        print_int16x4_t(result);

        // Store the result
        vst1_lane_s16(&Y[i], result, 0);

        // Display output for each iteration
        printf("Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i, Y[i], Y[i], i, ((float)Y[i]) / 16384);
    }

    return 0;
}
