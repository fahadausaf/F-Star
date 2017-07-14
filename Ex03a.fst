module Ex03a
//factorial-types

open FStar.Mul

(*  Exercise 3a: What are some other correct types you can give to factorial?
    Try writing them and see if F* agrees with you. Try describing in words
    what each of those types mean.  *)

(* Here are some other types for factorial:
    val factorial: nat -> Tot nat
    val factorial: nat -> Tot (x:int{x > 0})
    val factorial: int -> int *)
val factorial: x:int{x>=0} -> Tot int
let rec factorial n =
  if n = 0 then 1 else n * (factorial (n - 1))

(*  Exercise 3b: Give several types for the fibonacci function. *)

(* val fibonacci : int -> int *)
(* val fibonacci : int -> ML int (same as above) *)
(* val fibonacci : int -> Tot nat *)
(* val fibonacci : int -> Tot (y:int{y>=1}) *)
(* val fibonacci : x:int -> Tot (y:int{y>=1 /\ y >= x}) *)
(* val fibonacci : x:int -> Tot *)
(*   (y:int{y >= 1 /\ y >= x /\ (x>=3 ==> y>=2)}) *)
val fibonacci : int -> Tot (x:nat{x>0})
let rec fibonacci n =
  if n <= 1 then 1 else fibonacci (n - 1) + fibonacci (n - 2)
