module Ex04
//append-intrinsic-type

val length: list 'a -> Tot nat
let rec length l = match l with
  | [] -> 0
  | _ :: tl -> 1 + length tl


(* Give append a type that proves it always returns a list whose
   length is the sum of the lengths of its arguments. *)
val append : list 'a -> list 'a -> Tot (list 'a)
let rec append l1 l2 = match l1 with
  | [] -> l2
  | hd :: tl -> hd :: append tl l2

val append_len: l1:list 'a -> l2:list 'a -> Lemma
  (requires True) (ensures (length (append l1 l2) = length l1 + length l2))
let rec append_len l1 l2 =
  match l1 with
   | [] -> ()
   | hd::tl -> append_len tl l2

val mem: #a:eqtype -> a -> list a -> Tot bool
let rec mem #a x xs =
  match xs with
  | [] -> false
  | hd :: tl -> hd = x || mem x tl

(* Exercise 4c: Prove that mem satisfies the following property: *)

val append_mem:  #a:eqtype -> l1:list a -> l2:list a -> x:a
  -> Lemma (mem x (append l1 l2) <==> mem x l1 || mem x l2)
let rec append_mem #a xs ys z =
  match xs with
  | [] -> ()
  | hd :: tl -> append_mem tl ys z

val reverse: list 'a -> Tot (list 'a)
let rec reverse = function
  | [] -> []
  | hd :: tl -> append (reverse tl) [hd]
(*
val reverse: #a:Type -> f:(list a -> Tot (list a)){forall l. l == f (f l)}
*)
let snoc l h = append l [h]

val snoc_cons: l:list 'a -> h:'a -> Lemma (reverse (snoc l h) == h :: reverse l)
let rec snoc_cons l h = match l with
  | [] -> ()
  | hd :: tl -> snoc_cons tl h

val rev_involutive: l:list 'a -> Lemma (reverse (reverse l) == l)
let rec rev_involutive l = match l with
  | [] -> ()
  | hd :: tl ->
    // (1) [reverse (reverse tl) == tl]
    rev_involutive tl;
    // (2) [reverse (append (reverse tl) [hd]) == h :: reverse (reverse tl)]
    snoc_cons (reverse tl) hd
    // These two facts are enough for Z3 to prove the lemma:
    //   reverse (reverse (hd :: tl))
    //   =def= reverse (append (reverse tl) [hd])
    //   =(2)= hd :: reverse (reverse tl)
    //   =(1)= hd :: tl
    //   =def= l

val snoc_injective: l1:list 'a -> h1:'a -> l2:list 'a -> h2:'a
  -> Lemma (requires (snoc l1 h1 == snoc l2 h2))
           (ensures (l1 == l2 /\ h1 == h2))
let rec snoc_injective l1 h1 l2 h2 = match l1, l2 with
  | _::tl1, _::tl2 -> snoc_injective tl1 h1 tl2 h2
  | _ -> ()

val rev_injective1: l1:list 'a -> l2:list 'a
  -> Lemma (requires (reverse l1 == reverse l2))
           (ensures  (l1 == l2)) (decreases l1)

let rec rev_injective1 l1 l2 =
  match l1,l2 with
  | h1::t1, h2::t2 ->
      // assert(reverse (h1::t1) = reverse (h2::t2));
      // assert(snoc (reverse t1) h1  = snoc (reverse t2) h2);
      snoc_injective (reverse t1) h1 (reverse t2) h2;
      // assert(reverse t1 = reverse t2 /\ h1 = h2);
      rev_injective1 t1 t2
      // assert(t1 = t2 /\ h1::t1 = h2::t2)
  | _, _ -> ()

val rev_injective2: l1:list 'a -> l2:list 'a
  -> Lemma (requires (reverse l1 == reverse l2))
           (ensures  (l1 == l2))
let rev_injective2 #t l1 l2 = rev_involutive l1; rev_involutive l2



(**)
