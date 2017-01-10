signature WORD32SIMD = sig
  val fromList:  Word32.word list -> Word32.word vector
  val toString: Word32.word vector -> string
  val add: Word32.word vector * Word32.word vector -> Word32.word vector
  val localAdd: Word32.word vector * Word32.word vector -> Word32.word vector
end


structure Word32SIMD: WORD32SIMD = struct

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

  val add = binaryOp (_import "SIMD32_add" : (Word32.word vector * Word32.word vector * Word32.word array) -> unit;)
  val localAdd = binaryOp (_import "localAdd" : (Word32.word vector * Word32.word vector * Word32.word array) -> unit;)
end
