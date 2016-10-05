val a = Int32x4.fromList([7,16,18,40]);
val b = Int32x4.fromList([2,3,4,5]);

print ("vector a: " ^ (Int32x4.toString a) ^ "\n");
print ("vector b: " ^ (Int32x4.toString b) ^ "\n");


val addResult = Int32x4.add(a, b);
print ("addResult: " ^ (Int32x4.toString addResult) ^ "\n");

val multResult = Int32x4.mult(a, b);
print ("multResult: " ^ (Int32x4.toString multResult) ^ "\n");

val subtResult = Int32x4.subt(a, b);
print ("subtResult: " ^ (Int32x4.toString subtResult) ^ "\n");

val diviResult = Int32x4.divi(a, b);
print ("diviResult: " ^ (Int32x4.toString diviResult) ^ "\n");

val moduResult = Int32x4.modu(a, b);
print ("moduResult: " ^ (Int32x4.toString moduResult) ^ "\n");

val xorResult = Int32x4.xor(a, b);
print ("xorResult: " ^ (Int32x4.toString xorResult) ^ "\n");

val bitOrResult = Int32x4.bitOr(a, b);
print ("bitOrResult: " ^ (Int32x4.toString bitOrResult) ^ "\n");
