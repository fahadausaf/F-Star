module FStar.BytesUTF

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

(* UTF-8 Encoding *)
val get_byte_count: s:string { length s >= 4 /\ length s <= 5}  -> Tot(nat)
let get_byte_count s =
  if length s = 5 then 4 else
    let first = head s in
      let second = head (tail s) in
        let third = head (tail (tail s)) in
          let fourth = last s in
            if (int_of_char first = 48 && int_of_char second = 48 && int_of_char third < 55 ) then 1
            else if (int_of_char first = 48 && int_of_char second >= 48 && int_of_char third <= 55 ) then 2
            else 3
