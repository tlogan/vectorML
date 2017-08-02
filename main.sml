
val al = map Word32.fromInt [7,16,18,40]
val bl = map Word32.fromInt [2,3,4,5]

fun listToTuple l = (List.nth (l, 0), List.nth (l, 1), List.nth (l, 2), List.nth (l, 3))
fun tupleToList (a, b, c, d) = [a, b, c, d]

val at = listToTuple al
val bt = listToTuple bl

val av = Vector.fromList al
val bv = Vector.fromList bl

val aSimd = WordSimd32x4.fromVector av
val bSimd = WordSimd32x4.fromVector bv

fun toString v = String.concat [ 
    "{" 
  , String.concatWith ", " (List.map Word32.toString (Vector.foldr op:: [] v)), "}" 
]


fun serialBin rator ((a1, b1, c1, d1), (a2, b2, c2, d2)) =  
  (rator (a1, a2), rator (b1, b2), rator (c1, c2), rator (d1, d2))

fun binLoop (a, b) bin num = let
  fun l (n, acc) = 
    if n <= 0
    then acc 
    else l (n - 1, bin (b, acc))
in
 l (num, a)
end

fun listToString l = "[" ^ String.concatWith ", " (List.map Word32.toString l) ^ "]"
 
fun run (loop, toString, label) = let
  val interationSize = 15000000 
  val startTime = (Time.now ())
  val res = loop interationSize
  val endTime = (Time.now ())
  val duration = Time.- (endTime, startTime)
  val _ = print (label ^ ": ")
  val _ = print ((toString res) ^ "; ")
  val _ = print ((Time.toString duration) ^ "; ")
  val _ = print ("\n")
in
  (res, duration) 
end



fun compare (serRator, parRator, label) = let

  val _ = print ("Operator: " ^ label ^  "\n")
  val (serRes, serTime) = run (binLoop (at, bt) (serialBin serRator), listToString o tupleToList, "Serial  ")
  val (parRes, parTime) = run (binLoop (aSimd, bSimd) parRator, toString o WordSimd32x4.toVector, "Parallel")

  val serResList = tupleToList serRes
  val parResList = Vector.foldr (op ::) [] (WordSimd32x4.toVector parRes)

  val correct = serResList = parResList
  val speedup = (Real.realRound (((Time.toReal serTime) * 100.0) / (Time.toReal parTime))) / 100.0

  val _ = print ("correct : " ^ (Bool.toString correct) ^ "\n")
  val _ = print ("speedup : " ^ (Real.toString speedup) ^ "x\n")
  val _ = print ("------------------------\n")
in
 (correct, speedup) 
end

val _ = compare (Word32.+, WordSimd32x4.+, "add")

val allCorrect = List.all (fn (b, _) => b) (List.map compare [
  (Word32.+, WordSimd32x4.+, "add")
, (Word32.andb, WordSimd32x4.andb, "andb")
, (Word32.*, WordSimd32x4.*, "mul")
, (Word32.orb, WordSimd32x4.orb, "orb")
, (Word32.-, WordSimd32x4.-, "sub")
, (Word32.xorb, WordSimd32x4.xorb, "xorb")
]) 

val _ = print ("all correct : " ^ (Bool.toString allCorrect) ^ "\n")


(*
*** ad-hoc poly tests
val hva = MLton.hash (Vector.fromList al) 
val _ = print ( "HASH aVect: " ^ (Word32.toString hva) ^ "\n" )

val ha = MLton.hash aSimd 
val _ = print ( "HASH aSimd: " ^ (Word32.toString ha) ^ "\n" )


val hb = MLton.hash bSimd 
val _ = print ( "HASH bSimd: " ^ (Word32.toString hb) ^ "\n" )

val hv0 = MLton.hash (Vector.fromList [0,0,0,0]) 
val _ = print ( "HASH zero vec: " ^ (Word32.toString hv0) ^ "\n" )

val hv1 = MLton.hash ([0,0,0,0]) 
val _ = print ( "HASH zero list: " ^ (Word32.toString hv1) ^ "\n" )




val tva =  toString (WordSimd32x4.toVector aSimd)
val _ = print ( "aSimd to vector: " ^ tva ^ "\n" )

val tvb =  toString (WordSimd32x4.toVector bSimd)
val _ = print ( "bSimd to vector: " ^ tvb ^ "\n" )

val cSimd = WordSimd32x4.fromVector av
val _ = if aSimd = cSimd
then print "true aSimd = cSimd\n"
else print "false aSimd = cSimd\n"

val _ = if aSimd = bSimd
then print "true aSimd = bSimd\n"
else print "false aSimd = bSimd\n"

*)
