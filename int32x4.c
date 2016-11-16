typedef int v4si __attribute__ ((vector_size (16), aligned(16)));

void add (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  //memcpy(&a, pa, 16);
  b = *((v4si *) pb);
  //memcpy(&b, pb, 16);
  c = a + b;
  *((v4si *) pc) = c;
  //memcpy(pc, &c, 16);
  return;
}

void mult (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a * b;
  *((v4si *) pc) = c;
  //memcpy(pc, &c, 16);
  return;
}

void subt (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a - b;
  *((v4si *) pc) = c;
  //memcpy(pc, &c, 16);
  return;
}

void divi (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a / b;
  *((v4si *) pc) = c;
  //memcpy(pc, &c, 16);
  return;
}

void modu (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a % b;
  *((v4si *) pc) = c;
  //memcpy(pc, &c, 16);
  return;
}

void xor (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a ^ b;
  *((v4si *) pc) = c;
  //memcpy(pc, &c, 16);
  return;
}

void bitOr (unsigned char * pa, unsigned char * pb, unsigned char * pc) {
  v4si a, b, c;
  a = *((v4si *) pa);
  b = *((v4si *) pb);
  c = a | b;
  *((v4si *) pc) = c;
  //memcpy(pc, &c, 16);
  return;
}
