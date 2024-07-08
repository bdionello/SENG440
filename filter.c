# include <stdio.h>

short int X[128]; // Previous Inputs Array (stores up to 128, 16-bit integers)
short int Y[128]; // Previous Outputs Array (stores up to 128, 16-bit integers)

void filter_init(short int *X, short int *Y){

    register int i; //loop counter

    /* Define Initial Conditions for Input and Output *
 * - This provides a consisten starting point helping
 *   to avoid undefined behaviour that could occur if
 *   the arrays contained random garbage */
    X[0] = (short int)0x8001; //-32767
    X[1] = (short int)0x8001; //-32767
    Y[0] = (short int)0x8001; //-32767
    Y[1] = (short int)0x8001; //-32767

    for (i=2; i<100; i++)
        X[i] = (short int)0x7FFF; //+32767
}

void main(void){
    
}