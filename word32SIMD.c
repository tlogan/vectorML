#include "export.h"
#include <string.h>

typedef Word32 v4si __attribute__ ((vector_size (16), aligned(16)));

void localAdd (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  memcpy(&a, pa, 16);
  memcpy(&b, pb, 16);
  c = a + b;
  memcpy(pc, &c, 16);
}
