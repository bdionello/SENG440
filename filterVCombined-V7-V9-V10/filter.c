/* SENG 440 - Digital Filters Final Project */

// Compile in the terminal using the following commands:
// gcc -S -static -mfpu=neon filter.c -o filter_nonO3.s
// gcc -S -static -mfpu=neon -O3 filter.c -o filter_O3.s

#include <stdio.h>
#include <arm_neon.h>

#define B0 0x76B0
#define B1 0x76B0
#define B2 0x76B0
#define A1 29863
#define A2 -27433

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
    Y[0] = (short int)0xC000; //-16384 --> Normalized (Y[0] / 2^14) to y[0] = -1
    Y[1] = (short int)0xC000; //-16384 --> Normalized (Y[1] / 2^14) to y[1] = -1

    // Display initial values of the output array (scaled decimal, scaled hex, unscaled decimal)
    printf("Y[ 0] = %+6hi = 0x%04hX ....... y[ 0] = %8.5f\n", Y[0], Y[0], ((float)Y[0]) / 16384);
    printf("Y[ 1] = %+6hi = 0x%04hX ....... y[ 1] = %8.5f\n", Y[1], Y[1], ((float)Y[1]) / 16384);

    // Compute the scaled output Y[n] for all n beyond initial conditions (from 2 to 99)
    register int i;
    for (i=2; i<102; i+=4) {
        // Store Results for BX values into arrays in memory
        int tmp_B0[4], tmp_B1[4], tmp_B2[4];
        vst1q_s32(tmp_B0, vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 23), vdup_n_s16(B0), vld1_s16(&X[i])), 24));
        vst1q_s32(tmp_B1, vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 22), vdup_n_s16(B1), vld1_s16(&X[i - 1])), 23));
        vst1q_s32(tmp_B2, vshrq_n_s32(vmlal_s16(vdupq_n_s32(1 << 23), vdup_n_s16(B2), vld1_s16(&X[i - 2])), 24));

        // Compute the scaled output for iteration i (Y[i])
        Y[i] = (short int)(tmp_B0[0] + tmp_B1[0] + tmp_B2[0] + (((int)A1 * (int)Y[i-1] + (1 << 13)) >> 14) + (((int)A2 * (int)Y[i-2] + (1 << 14)) >> 15));        
        Y[i+1] = (short int)(tmp_B0[1] + tmp_B1[1] + tmp_B2[1] + (((int)A1 * (int)Y[i] + (1 << 13)) >> 14) + (((int)A2 * (int)Y[i-1] + (1 << 14)) >> 15));
        Y[i+2] = (short int)(tmp_B0[2] + tmp_B1[2] + tmp_B2[2] + (((int)A1 * (int)Y[i+1] + (1 << 13)) >> 14) + (((int)A2 * (int)Y[i  ] + (1 << 14)) >> 15));    
        Y[i+3] = (short int)(tmp_B0[3] + tmp_B1[3] + tmp_B2[3] + (((int)A1 * (int)Y[i+2] + (1 << 13)) >> 14) + (((int)A2 * (int)Y[i+1] + (1 << 14)) >> 15));

        // Display output for each iteration
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i, Y[i], Y[i], i, ((float)Y[i])/16384 );           // SFy = 2^14;
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i+1, Y[i+1], Y[i+1], i+1, ((float)Y[i+1])/16384 ); // SFy = 2^14;
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i+2, Y[i+2], Y[i+2], i+2, ((float)Y[i+2])/16384 ); // SFy = 2^14;
        printf( "Y[%2d] = %+6hi = 0x%04hX ....... y[%2d] = %8.5f\n", i+3, Y[i+3], Y[i+3], i+3, ((float)Y[i+3])/16384 ); // SFy = 2^14;
    }

} /* main */