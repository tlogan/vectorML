
val al = map Word32.fromInt [7,16,18,40]
val bl = map Word32.fromInt [2,3,4,5]

val a = Vml.fromList al
val b = Vml.fromList bl

val aSimd = Vml.simdFromVector a
val bSimd = Vml.simdFromVector b

fun serialAdd (l1, l2) = 
  case (l1, l2) of 
    ([], []) => [] 
  | ([], y::ys) => y :: (serialAdd([], ys))
  | (x::xs, []) => x :: (serialAdd (xs, []))
  | (x::xs, y::ys) => (x + y) :: (serialAdd (xs, ys))

fun serialLoop num = 
  if num <= 0
  then al
  else serialAdd(bl, serialLoop (num - 1))

fun listToString l = "[" ^ String.concatWith ", " (List.map Word32.toString l) ^ "]"

fun parallelLoop parallelAdd num =
  if num <= 0
  then a 
  else parallelAdd (b, parallelLoop parallelAdd (num - 1))


fun simdLoop num = 
  if num <= 0
  then aSimd 
  else Vml.simdAdd(bSimd, simdLoop (num - 1))


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


val _ = test(simdLoop, Vml.toString o Vml.simdToVector, "Parallel SIMD Type")
(*
val _ = test(serialLoop, listToString, "Serial")
val _ = test(parallelLoop Vml.libAdd, Vml.toString, "Parallel Library")
val _ = test(parallelLoop Vml.add, Vml.toString, "Parallel Runtime")
*)


