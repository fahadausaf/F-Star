module Test
open FStar.All
//safe-read-write


let main =
  IO.print_string ("value " ^ (string_of_int (123)));
  ()
