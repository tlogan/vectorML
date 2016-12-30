#include <string.h>


typedef int v4si __attribute__ ((vector_size (16), aligned(16)));

void add (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  memcpy(&a, pa, 16);
  memcpy(&b, pb, 16);
  c = a + b;
  memcpy(pc, &c, 16);
}

void mult (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  memcpy(&a, pa, 16);
  memcpy(&b, pb, 16);
  c = a * b;
  memcpy(pc, &c, 16);
}

void subt (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  memcpy(&a, pa, 16);
  memcpy(&b, pb, 16);
  c = a - b;
  memcpy(pc, &c, 16);
}

void divi (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  memcpy(&a, pa, 16);
  memcpy(&b, pb, 16);
  c = a / b;
  memcpy(pc, &c, 16);
}

void modu (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  memcpy(&a, pa, 16);
  memcpy(&b, pb, 16);
  c = a % b;
  memcpy(pc, &c, 16);
}

void xor (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  memcpy(&a, pa, 16);
  memcpy(&b, pb, 16);
  c = a ^ b;
  memcpy(pc, &c, 16);
}

void bitOr (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  memcpy(&a, pa, 16);
  memcpy(&b, pb, 16);
  c = a | b;
  memcpy(pc, &c, 16);
}
