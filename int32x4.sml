signature INT32X4 =
  sig 
    type t

    val fromList: int list -> t

    val toString: t -> string 

    val add: t * t -> t

    val mult: t * t -> t

    val subt: t * t -> t

    val divi: t * t -> t

    val modu: t * t -> t

    val xor: t * t -> t

    val bitOr: t * t -> t

  end

structure Int32x4 :> INT32X4 =
  struct 
    type t = int vector

    fun fromList l = 
      if (length l) <> 4
      then raise Size
      else Vector.fromList l

    fun toString v = "[" ^ String.concatWith ", " (List.map Int.toString (Vector.foldr op:: [] v)) ^ "]"

    fun binaryOp f (a, b) = let
      val c = Array.array(4,0)
      val _ = f (a, b, c)
    in
      Array.vector c
    end

    val add = binaryOp (_import "add" : t * t * int array -> unit;) 

    val mult = binaryOp (_import "mult" : t * t * int array -> unit;) 

    val subt = binaryOp (_import "subt" : t * t * int array -> unit;)

    val divi = binaryOp (_import "divi" : t * t * int array -> unit;)

    val modu = binaryOp (_import "modu" : t * t * int array -> unit;)

    val xor = binaryOp (_import "xor" : t * t * int array -> unit;)

    val bitOr = binaryOp (_import "bitOr" : t * t * int array -> unit;)

  end
