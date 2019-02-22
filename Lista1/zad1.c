#include <stdio.h>
#include <float.h>

int main () {
   printf("Macheps Float32 = %g\n", FLT_EPSILON);
   printf("Macheps Float64  = %g\n", DBL_EPSILON);

   printf("Eta Float32 = %g\n", FLT_MIN_10_EXP);
   printf("Eta Float64 = %g\n", DBL_MIN);

   printf("MAX Float32 = %g\n", FLT_MAX);
   printf("MAX Float64 = %g\n", DBL_MAX);
}