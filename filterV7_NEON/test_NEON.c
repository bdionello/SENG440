#include <stdio.h>
#include "arm_neon.h"

uint32x4_t aa, bb, ss;

void read_inputs( void) {
  register int i;
  int a[8], b[8];

  for( i=0; i<4; i++) {
    printf( "a[%i] = ", i);
    scanf( "%i", &a[i]);
  }
  printf( "\n");

  for( i=0; i<4; i++) {
    printf( "b[%i] = ", i);
    scanf( "%i", &b[i]);
  }
  printf( "\n");

  aa = vld1q_u32( a);
  bb = vld1q_u32( b);
}

void write_outputs( void) {
  register int i;
  int s[8];

  vst1q_u32( s, ss);
  for( i=0; i<4; i++) {
    printf( "s[%i] = %i\n", i, s[i]);
  }
}

int main( void) {
  read_inputs();
  ss = vaddq_u32( aa, bb);
  write_outputs();
}

