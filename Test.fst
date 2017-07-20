module Test

open FStar.All


let main =
  IO.print_string ("value " ^ (int_of_char ('A')));
  ()
