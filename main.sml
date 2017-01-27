
val al = map Word32.fromInt [7,16,18,40]
val bl = map Word32.fromInt [2,3,4,5]

fun listToTuple l = (List.nth (l, 0), List.nth (l, 1), List.nth (l, 2), List.nth (l, 3))
fun tupleToList (a, b, c, d) = [a, b, c, d]

val at = listToTuple al
val bt = listToTuple bl

val av = Vml.fromList al
val bv = Vml.fromList bl

val aSimd = Vml.simdFromVector av
val bSimd = Vml.simdFromVector bv

fun serialAdd ((a1, b1, c1, d1), (a2, b2, c2, d2)) =  (a1 + a2, b1 + b2, c1 + c2, d1 + d2)


fun addLoop (a, b) add num = let
  fun l (n, acc) = 
    if n <= 0
    then acc 
    else l (n - 1, add(b, acc))
in
 l (num, a)
end

fun listToString l = "[" ^ String.concatWith ", " (List.map Word32.toString l) ^ "]"

fun test (loop, toString, label) = let
  val interationSize = 2000000 
  val _ = print ("Test " ^ label ^ "\n")
  val startTime = (Time.now ())
  val res = loop interationSize
  val endTime = (Time.now ())
  val duration = Time.- (endTime, startTime)

  val _ = print (label ^ " Runtime: " ^ (Time.toString duration) ^ "\n")
  val _ = print (label ^ " Result: " ^ (toString res) ^ "\n")
  val _ = print ("------------------------\n")
in
  ()
end


val _ = test(addLoop (at, bt) serialAdd, listToString o tupleToList, "Serial")
val _ = test(addLoop (av, bv)  Vml.libAdd, Vml.toString, "Parallel Library")
val _ = test(addLoop (aSimd, bSimd) Vml.simdAdd, Vml.toString o Vml.simdToVector, "Parallel SIMD Type")


