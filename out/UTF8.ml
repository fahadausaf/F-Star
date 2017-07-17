open Prims
type byte = FStar_UInt8.t
type bytes = byte FStar_Seq_Base.seq
type string = FStar_Char.char FStar_Seq_Base.seq
let utf8_encode: string -> bytes =
  Obj.magic (fun uu____7  -> failwith "Not yet implemented:utf8_encode")
let utf8_decode: bytes -> string FStar_Pervasives_Native.option =
  Obj.magic (fun uu____13  -> failwith "Not yet implemented:utf8_decode")
let main: Prims.unit = FStar_IO.print_string "UTF-8 Encoding"