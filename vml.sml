signature VML = sig
  val fromList:  Word32.word list -> Word32.word vector
  val toString: Word32.word vector -> string
  val add: Word32.word vector * Word32.word vector -> Word32.word vector
  val libAdd: Word32.word vector * Word32.word vector -> Word32.word vector
  val simdAdd: WordSimd32x4.wordSimd * WordSimd32x4.wordSimd -> WordSimd32x4.wordSimd
  val simdFromVector: Word32.word vector -> WordSimd32x4.wordSimd
  val simdToVector: WordSimd32x4.wordSimd -> Word32.word vector 
end


structure Vml: VML = struct

  val vecSize = Int.div (128, Word32.wordSize)

  fun fromList l =
      if (length l) <> vecSize
      then raise Size
      else Vector.fromList l

  fun toString v = String.concat [ "[" , String.concatWith ", " (List.map Word32.toString (Vector.foldr op:: [] v)), "]" ]

  fun binaryOp f (a, b) = let
    val c = Array.array(vecSize, Word32.fromInt 0)
    val _ = f (a, b, c)
  in
    Array.vector c
  end

  val add = binaryOp (_import "pvector32x4_add" : Word32.word vector * Word32.word vector * Word32.word array -> unit;)

  val libAdd = binaryOp (_import "libAdd" : Word32.word vector * Word32.word vector * Word32.word array -> unit;)

  val simdAdd = _import "WordSimd32x4_add" : WordSimd32x4.wordSimd * WordSimd32x4.wordSimd -> WordSimd32x4.wordSimd;
  val simdFromVector = _import "WordSimd32x4_fromVector": Word32.word vector -> WordSimd32x4.wordSimd;

  val simdToVector = fn simd => (let
    val f = _import "WordSimd32x4_toArray": WordSimd32x4.wordSimd * Word32.word array -> unit;
    val arr = Array.array(vecSize, Word32.fromInt 0)
    val _ = f (simd, arr)
  in
    Array.vector arr
  end)

end
