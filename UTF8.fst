module UTF8

open FStar.Seq
open FStar.Char
//include FStar.List.Tot


module U = FStar.UInt
module U8 = FStar.UInt8
module U16 = FStar.UInt16
module U32 = FStar.UInt32
module U64 = FStar.UInt64

type byte = U8.t
abstract type bytes = seq byte
abstract type string = seq FStar.Char.char

assume val utf8_encode: string -> bytes
assume val utf8_decode: bytes -> option string

val get_binary: n:nat -> Tot (bytes)
let rec get_binary n =
  match n with
  | 0 -> Seq.createEmpty
  | _ -> Seq.append (get_binary (n / 256)) (of_list [U8.uint_to_t (n % 256)])

let main =
  let l = get_binary 8364 in
   //let s = U8.to_string l in
    //IO.print_string ("value " ^ (string_of_int (int_of_char 'A')));
    IO.print_string ("hello world");
  ()
