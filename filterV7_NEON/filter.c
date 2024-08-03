/* SENG 440 - Digital Filters Final Project */

// Compile in the terminal using the following command:
// gcc -O3 -mfpu=neon filter.c -o filter.exe

# include <stdio.h>
#include <arm_neon.h>

// Note: short int -> 16 bits
// Note:       int -> 32 bits

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

void main(void){

    // Initial Conditions
    Y[0] = (short int)0xC000; // -16384 --> Normalized (Y[0] / 2^14) to y[0] = -1
    Y[1] = (short int)0xC000; // -16384 --> Normalized (Y[1] / 2^14) to y[1] = -1

    // Display initial values of the output array (scaled decimal, scaled hex, unscaled decimal)
    printf( "Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\n", Y[0], Y[0], ((float)Y[0])/16384 ); // SFy = 2^14; used to be 2^15 = 32768
    printf( "Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\n", Y[1], Y[1], ((float)Y[1])/16384 ); // SFy = 2^14; used to be 2^15 = 32768
    
    //Coefficients
    const short int B[4] = {0x76B0, 0x76B0, 0x76B0}; // {B0, B1, B2}
    const short int A[4] = {0x74A7, 0x94D7};         // {A1, A2}

    int32x4_t NEON_B = vld1q_s32( B ); // Load Input Coefficients into NEON d-register (64-bits)
    int32x4_t NEON_A = vld1q_s32( A ); // Load Output Coefficients into NEON d-register (64-bits)

    // Inputs and Outputs
    int32x4_t NEON_X;
    int32x4_t NEON_Y;

    // Rounding bits
    // const int roundbitsB[4] = {(1 << 23), (1 << 22), (1 << 23)};
    // const int roundbitsA[4] = {(1 < 13), (1 << 14)};

    // int32x4_t NEON_roundbitsB = vld1q_s32( roundbitsB ); // Load Coefficients into NEON q-register (128-bits)
    // int32x4_t NEON_roundbitsA = vld1q_s32( roundbitsA ); // Load Coefficients into NEON q-register (128-bits)
    
    // Scale Factors -> use 23 and 14
    //const int sfB[4] = {24, 23, 24};
    //const int sfA[4] = {14, 15};

    //uint16x4_t NEON_sfB = vld1_u16( sfB );
    //uint16x4_t NEON_sfA = vld1_u16( sfA );

    // Compute the scaled output Y[n] for all n beyond initial conditions (from 2 to 99)
    register int i;
    for (i=2; i<100; i++) {

        // Inputs and Outputs
        short int tmp_X[4] = {&X[i], &X[i-1], &X[i-2]};
        short int tmp_Y[4] = {       &Y[i-1], &Y[i-2]};

        // Load IO into NEON registers
        NEON_X = vld1q_s32( tmp_X );
        NEON_Y = vld1q_s32( tmp_Y );

        // Multiply, Round and Scale
        int32x4_t NEON_BX = vmulq_s32(NEON_B, NEON_X); //<----------------------------arguments might need ot be int32x4_t
        int32x4_t NEON_BX_S = vshrq_n_s32(NEON_BX, 23); // reduced all SFs for efficiency //<----------------argument types are correct
        //int32x4_t NEON_BX_R = vaddq_s32(NEON_BX, NEON_roundbitsB); //<----------------argument types are correct
        //int32x4_t NEON_BX_R_S = vshrq_n_s32(NEON_BX_R, 23); // reduced all SFs for efficiency //<----------------argument types are correct

        int32x4_t NEON_AY = vmulq_s32(NEON_A, NEON_Y); //<----------------------------arguments might need ot be int32x4_t
        int32x4_t NEON_AY_S = vshrq_n_s32(NEON_AY, 14); // reduced all SFs for efficiency //<----------------argument types are correct
        //int32x4_t NEON_AY_R = vaddq_s32(NEON_AY, NEON_roundbitsA); //<----------------argument types are correct
        //int32x4_t NEON_AY_R_S = vshrq_n_s32(NEON_AY_R, 14); // reduced all SFs for efficiency //<----------------argument types are correct

        // Store results in a new array for access during accumulate
        int tmp_a[4];
        int tmp_b[4];
        vst1q_s32(tmp_b, NEON_BX_S);
        vst1q_s32(tmp_a, NEON_AY_S);

        Y[i] = (short int)(tmp_b[0] + tmp_b[1] + tmp_b[2] + tmp_a[0] + tmp_a[1]);

        // Display output for each iteration
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i, Y[i], Y[i], i, ((float)Y[i])/16384 ); // SFy = 2^14;

        // int Bunscaled[4];
        // int Aunscaled[4]; 
        
        // vst1q_s32(NEON_BX_R, Bunscaled);
        // vst1q_s32(NEON_AY_R, Aunscaled);

        // Bunscaled[0] = Bunscaled[0] >> 24;
        // Aunscaled =



        /* Note: When a 32-bit processor performs operations on 16-bit fixed-point numbers, 
         * intermediate results can still use the full 32-bit range. 
         * We must ensure that intermediate results do not exceed the range of a 32-bit signed integer [-2^31, 2^31 - 1].
         */
        
        // Multiply Current and Previous Two Scaled Inputs by Input Coefficients then divide by scalefactor and round
        // tmp_B0 = ((int)B0 * (int)X[i  ] + (1 << 23)) >> 24; // Scale Factor = 2^24
        // tmp_B1 = ((int)B1 * (int)X[i-1] + (1 << 22)) >> 23; // Scale Factor = 2^23
        // tmp_B2 = ((int)B2 * (int)X[i-2] + (1 << 23)) >> 24; // Scale Factor = 2^24

        // // Multiply Previous Two Scaled Ouptuts by Ouptut Coefficients then divide by scalefactor and round
        // tmp_A1 = ((int)A1 * (int)Y[i-1] + (1 << 13)) >> 14; // Scale Factor = 2^14
        // tmp_A2 = ((int)A2 * (int)Y[i-2] + (1 << 14)) >> 15; // Scale Factor = 2^15
    
        // // Compute the scaled output (result of the scaled difference equation)
        // Y[i] = (short int)(tmp_B0 + tmp_B1 + tmp_B2 + tmp_A1 + tmp_A2); // Recall: y[n] = Y[n] / SFy

    }

} /* main */