open Prims
type byte = FStar_UInt8.t
type bytes = byte FStar_Seq_Base.seq
type string = FStar_Char.char FStar_Seq_Base.seq
let utf8_encode: string -> bytes =
  Obj.magic (fun uu____7  -> failwith "Not yet implemented:utf8_encode")
let utf8_decode: bytes -> string FStar_Pervasives_Native.option =
  Obj.magic (fun uu____13  -> failwith "Not yet implemented:utf8_decode")
let rec get_binary: Prims.nat -> byte FStar_Seq_Base.seq =
  fun n1  ->
    match n1 with
    | _0_17 when _0_17 = (Prims.parse_int "0") ->
        FStar_Seq_Base.createEmpty ()
    | uu____24 ->
        FStar_Seq_Base.append (get_binary (n1 / (Prims.parse_int "256")))
          (FStar_Seq_Base.of_list
             [FStar_UInt8.uint_to_t (n1 mod (Prims.parse_int "256"))])
let main: Prims.unit =
  let l = get_binary (Prims.parse_int "8364") in
  FStar_IO.print_string
    (Prims.strcat "value " (Prims.string_of_int (FStar_Char.int_of_char 'A')))