let string_of_bin (n : int): string =
  let rec aux (n : int): string =
    if n < 2
      then string_of_int n
    else
      aux (n / 2) ^ string_of_int (n mod 2) in
  "0b" ^ aux n
;;

let list_of_string (p_str : string): string list =
  String.split_on_char ';' p_str
;;
