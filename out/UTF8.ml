open Prims
type byte = FStar_UInt8.t
type bytes = byte FStar_Seq_Base.seq
type string = FStar_Char.char FStar_Seq_Base.seq
let utf8_encode: string -> bytes =
  Obj.magic (fun uu____7  -> failwith "Not yet implemented:utf8_encode")
let utf8_decode: bytes -> string FStar_Pervasives_Native.option =
  Obj.magic (fun uu____13  -> failwith "Not yet implemented:utf8_decode")
let get_byte_count: string -> Prims.nat =
  fun s  ->
    if (FStar_Seq_Base.length s) = (Prims.parse_int "5")
    then Prims.parse_int "4"
    else
      if
        (((FStar_Char.int_of_char (FStar_Seq_Properties.head s)) =
            (Prims.parse_int "48"))
           &&
           ((FStar_Char.int_of_char
               (FStar_Seq_Properties.head (FStar_Seq_Properties.tail s)))
              = (Prims.parse_int "48")))
          &&
          ((FStar_Char.int_of_char
              (FStar_Seq_Properties.head
                 (FStar_Seq_Properties.tail (FStar_Seq_Properties.tail s))))
             < (Prims.parse_int "55"))
      then Prims.parse_int "1"
      else
        if
          (((FStar_Char.int_of_char (FStar_Seq_Properties.head s)) =
              (Prims.parse_int "48"))
             &&
             ((FStar_Char.int_of_char
                 (FStar_Seq_Properties.head (FStar_Seq_Properties.tail s)))
                >= (Prims.parse_int "48")))
            &&
            ((FStar_Char.int_of_char
                (FStar_Seq_Properties.head
                   (FStar_Seq_Properties.tail (FStar_Seq_Properties.tail s))))
               <= (Prims.parse_int "55"))
        then Prims.parse_int "2"
        else Prims.parse_int "3"
let main: Prims.unit =
  let l = ['a'; 'a'; 'a'; 'a'] in FStar_IO.print_string "Go Go Go...!"