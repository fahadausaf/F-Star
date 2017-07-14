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

(* 3.3. Lemmas *)

val factorial_is_positive: x:nat -> GTot (u:unit{factorial x > 0})
let rec factorial_is_positive x =
  match x with
  | 0 -> ()
  | _ -> factorial_is_positive (x -1)

(* 3.3.2. Some syntactic sugar for refinement types and lemmas *)

val factorial_is_greater_than_arg1: x:(y:nat{y > 2}) -> GTot (u:unit{factorial x > x})
val factorial_is_greater_than_arg2: x:nat{x > 2} -> GTot (u:unit{factorial x > x})
val factorial_is_greater_than_arg3: x:nat{x > 2} -> Lemma (factorial x > x)
val factorial_is_greater_than_arg4: x:nat -> Lemma (requires (x > 2))
                                              (ensures (factorial x > x))


val factorial_is_greater_than_arg: x:nat -> Lemma (requires (x > 2)) (ensures (factorial x > x))
let rec factorial_is_greater_than_arg x =
  match x with
  | 3 -> ()
  | _ -> factorial_is_greater_than_arg (x - 1)

(*  Exercise 3c: Prove the following property for the fibonacci function: *)

val fibonacci : nat -> Tot nat
let rec fibonacci n =
  if n <= 1 then 1 else fibonacci (n - 1) + fibonacci (n - 2)

val fibonacci_greater_than_arg : n:nat{n >= 2} -> Lemma (fibonacci n >= n)
let rec fibonacci_greater_than_arg n =
  match n with
  | 2 -> ()
  | _ -> fibonacci_greater_than_arg(n-1)

(* 3.4. Admit *)

let rec factorial_is_greater_than_arg x =
  match x with
  | 3 -> ()
  | _ -> admit()
