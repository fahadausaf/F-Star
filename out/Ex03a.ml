open Prims
let rec factorial: Prims.int -> Prims.int =
  fun n  ->
    if n = (Prims.parse_int "0")
    then Prims.parse_int "1"
    else FStar_Mul.op_Star n (factorial (n - (Prims.parse_int "1")))
let rec fibonacci: Prims.int -> Prims.int =
  fun n  ->
    if n <= (Prims.parse_int "1")
    then Prims.parse_int "1"
    else
      (fibonacci (n - (Prims.parse_int "1"))) +
        (fibonacci (n - (Prims.parse_int "2")))
let rec factorial_is_positive: Prims.nat -> Prims.unit = fun x  -> ()
let rec factorial_is_greater_than_arg: Prims.nat -> Prims.unit = fun x  -> ()
let main: Prims.unit =
  FStar_IO.print_string
    (Prims.strcat "Fib 5 = "
       (Prims.string_of_int (fibonacci (Prims.parse_int "5"))))