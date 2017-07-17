module UTF8

open FStar.Seq

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

let main =
  IO.print_string ("UTF-8 Encoding");
  ()
