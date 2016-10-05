typedef int v4si __attribute__ ((vector_size (16), aligned(16)));

void add (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a + b;
  *((v4si *) pc) = c;
  return;
}

void mult (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a * b;
  *((v4si *) pc) = c;
  return;
}

void subt (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a - b;
  *((v4si *) pc) = c;
  return;
}

void divi (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a / b;
  *((v4si *) pc) = c;
  return;
}

void modu (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a % b;
  *((v4si *) pc) = c;
  return;
}

void xor (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a ^ b;
  *((v4si *) pc) = c;
  return;
}

void bitOr (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a | b;
  *((v4si *) pc) = c;
  return;
}
