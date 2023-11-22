type t_color = int;;

let ask (entry : string) : string =
  print_string entry;
  flush stdout;
  input_line stdin
;;

let rgb (r, g, b: int * int * int): t_color =
  if r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255 then
    failwith "Invalid RGB components"
  else
    (r lsl 16) lor (g lsl 8) lor b
;;

let set_color (p_color: t_color): string =
  let r: string = string_of_int ((p_color lsr 16) land 255) in
  let g: string = string_of_int ((p_color lsr 8) land 255) in
  let b: string = string_of_int (p_color land 255) in
  "\027[38;2;" ^ r ^ ";" ^ g ^ ";" ^ b ^ "m"
;;

let reset_color: string = "\027[0m";;
