type num =
| Int of int
| Float of float
;;

let float (x : 'a) : float =
  match x with
  (* float *)
  | f when (Obj.tag (Obj.repr f)) = 253 -> Obj.magic f
  (* int *)
  | i when (Obj.tag (Obj.repr i)) = 1000 -> float_of_int (Obj.magic i)
  (* string *)
  | s when (Obj.tag (Obj.repr s)) = 252 -> float_of_string (Obj.magic s)
  | _ -> failwith "Invalid argument, cannot convert into float"
;;

let int (x : 'a) : int =
  match x with
  (* float *)
  | f when (Obj.tag (Obj.repr f)) = 253 -> int_of_float (Obj.magic f)
  (* int *)
  | i when (Obj.tag (Obj.repr i)) = 1000 -> Obj.magic i
  (* string *)
  | s when (Obj.tag (Obj.repr s)) = 252 -> int_of_string (Obj.magic s)
  | _ -> failwith "Invalid argument, cannot convert into integer"
;;

let string (x : 'a) : string =
  match x with
  (* float *)
  | f when (Obj.tag (Obj.repr f)) = 253 -> string_of_float (Obj.magic f)
  (* int *)
  | i when (Obj.tag (Obj.repr i)) = 1000 -> string_of_int (Obj.magic i)
  (* string *)
  | s when (Obj.tag (Obj.repr s)) = 252 -> Obj.magic s
  | _ -> failwith "Invalid argument, cannot convert into integer"
;;

let simplify (x : float) : num =
  (* Return the int of x if the decimal part of x is null *)
  match x -. float_of_int(int_of_float x) with
  | 0. -> Int (int_of_float x)
  | _ -> Float x
;;

let add (n, m : 'a * 'b) : num =
  simplify(float(Obj.magic n) +. float(Obj.magic m))
;;

let sub (n, m : 'a * 'b) : num =
  simplify(float(Obj.magic n) -. float(Obj.magic m))
;;

let mult (n, m : 'a * 'b) : num =
  simplify(float(Obj.magic n) *. float(Obj.magic m))
;;

let div (n, m : 'a * 'b) : num =
  simplify(float(Obj.magic n) /. float(Obj.magic m))
;;

let isequal (n, m : 'a * 'b) : bool =
  float(n) = float(m)
;;

let print_num (n : 'a): unit =
  match n with
  | Int i -> Printf.printf "%d" i
  | Float f -> Printf.printf "%f" f
;;

let float_of_num (n : num): float =
  match n with
  | Int i -> float_of_int i
  | Float f -> f
;;

let int_of_num (n : num): int =
  match n with
  | Int f -> f
  | Float i -> int_of_float i
;;
