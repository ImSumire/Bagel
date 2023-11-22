let print_bool (b : bool) : unit =
  print_string (string_of_bool b)
;;

let rec print_list : 'a. ('a -> string) -> 'a list -> unit =
  fun to_string lst ->
    match lst with
    | [] -> print_endline "[]"
    | [x] -> print_endline ("[" ^ to_string x ^ "]")
    | head :: tail ->
      begin
        print_string ("[" ^ to_string head);
        List.iter (fun x -> print_string ("; " ^ to_string x)) tail;
        print_string "]"
      end
;;

let print(item : 'a): unit =
  print_string(string(item))
;;
