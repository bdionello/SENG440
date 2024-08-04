# SENG440

-In this final project we have coded and optimized an IIR Low-Pass Butterworth digital filter to be compiled by GCC and deployed on a 32-bit ARM Architecture.

-All code was compiled and tested on a Beagle Bone Black Running:

  Operating System: Debian GNU/Linux 10 (buster)
          Kernel: Linux 4.19.94-ti-r42
      Architecture: arm
      gcc (Debian 8.3.0-6) 8.3.0

-The Repo directory contains several optimization iterations and a final implementation that combines version 7, 9, and 10. 

-Please compile using the commands listed at the top of each C file. See below for reference:

# Compile NEON dependent files (such as filterVFinal) in the terminal using the following commands:

gcc -S -static -mfpu=neon filter.c -o filter_nonO3.s
gcc -S -static -mfpu=neon -O3 filter.c -o filter_O3.s

# Compile Non-NEON dependent file using:

gcc -S -O3 filter.c -o filter_O3.s
gcc -S filter.c -o filter_nonO3.s

# Timed Output files are generated using the included shell script:

bash FilterTimed.sh > FilterTimed_out.txt

