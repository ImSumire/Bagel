#use "topfind";;
#use "bagel/convert.ml";;

let boolof (x : 'a): bool =
  try
    match x with
    | _ when x = Obj.magic 0  -> false
    | _ when x = Obj.magic 0. -> false
    | _ when x = Obj.magic "" -> false
    | _ when x = Obj.magic [] -> false
    | _ when x = Obj.magic () -> false

    | _ when x = Obj.magic ref 0  -> false
    | _ when x = Obj.magic ref 0. -> false
    | _ when x = Obj.magic ref "" -> false
    | _ when x = Obj.magic ref [] -> false
    | _ when x = Obj.magic ref () -> false

    | _ -> true
  with _ -> false
;;

let rec all (lst : 'a list) : bool =
  match lst with
  | [] -> true
  | hd :: tl -> boolof hd && all tl
;;

let rec any (lst : 'a list) : bool =
  match lst with
  | [] -> false
  | hd :: tl -> if boolof hd then true else any tl
;;

let ascii (c : char) : int =
  Char.code c
;;

let rec bytearray (lst: int list): string list =
  List.map string_of_bin lst
;;

let chr (code : int) : char =
  Char.chr code
;;

let enumerate lst =
  let rec aux lst index =
    match lst with
    | [] -> []
    | hd :: tl -> (index, hd) :: aux tl (index + 1) in
  aux lst 0
;;

let hash (x : 'a) : int =
  Hashtbl.hash x
;;

let hex (x : int) : string =
  Printf.sprintf "0x%X" x
;;

let typeof (x: 'a): string =
  (* 
    It's difficult to know the type of a variable, so
    here I'm testing the object's properties
  *)
  match x with
  | i when (Obj.tag (Obj.repr i)) = 1000 -> "int | char | empty list"
  | a when (Obj.tag (Obj.repr a)) = 254 -> "float array"
  | f when (Obj.tag (Obj.repr f)) = 253 -> "float"
  | s when (Obj.tag (Obj.repr s)) = 252 -> "string"
  | l when (Obj.tag (Obj.repr l)) = 0 ->
    (
      let l_rw: int = Obj.reachable_words (Obj.repr x) in
      match l_rw with
      | 0 -> "empty array"
      | 2 -> "(int | char | empty list) ref | (int | float) array"
      | 4 -> "(int | char | float | empty list | empty array) array | (float | string) ref"
      | 9 -> "(int | char | empty list | empty array) list"
      | _ when (l_rw mod 3 = 0) && (l_rw mod 5 = 0) -> "(int | char | empty list | float | string) list"
      | _ when l_rw mod 3 = 0 -> "(int | char | empty list) list"
      | _ when l_rw mod 5 = 0 -> "(float | string) list | string array"
      | _ -> "unknown (list | array)"
    )
  | _ -> "unknown"
;;

let stypeof (x: 'a): string =
  (* 
    It's difficult to know the type of a variable, so
    here I'm testing the object's properties
  *)
  match x with
  | i when (Obj.tag (Obj.repr i)) = 1000 -> "int | char | list"
  | a when (Obj.tag (Obj.repr a)) = 254 -> "array"
  | f when (Obj.tag (Obj.repr f)) = 253 -> "float"
  | s when (Obj.tag (Obj.repr s)) = 252 -> "string"
  | l when (Obj.tag (Obj.repr l)) = 0 ->
    (
      let l_rw: int = Obj.reachable_words (Obj.repr x) in
      match l_rw with
      | 0 -> "array"
      | 2 -> "ref | array"
      | 4 -> "ref | array"
      | 9 -> "list"
      | _ when (l_rw mod 3 = 0) && (l_rw mod 5 = 0) -> "list"
      | _ when l_rw mod 3 = 0 -> "list"
      | _ when l_rw mod 5 = 0 -> "list | array"
      | _ -> "list | array"
    )
  | _ -> "unknown"
;;

let choice (lst : 'a list): 'a =
  List.nth lst (Random.int (List.length lst))
;;

let len (lst : 'a list): int =
  List.length lst
;;

let uniform (n, m : float * float) : float =
  Random.float(m -. n) +. n
;;

let randint (n, m : int * int): int =
  Random.int(m - n) + n
;;

let dist (x1, x2, y1, y2 : int * int * int * int): float =
  sqrt (float(x2 - x1) ** 2. +. float(y2 - y1) ** 2.)
;;

let fdist (x1, x2, y1, y2 : float * float * float * float): float =
  sqrt ((x2 -. x1) ** 2. +. (y2 -. y1) ** 2.)
;;

let clamp (x, a, b : int * int * int) : int =
  max a (min x b)
;;

let fclamp (x, a, b : float * float * float) : float =
  max a (min x b)
;;

let sign (x: int): int =
  if x >= 0 then 1 else -1
;;

let fsign (x: float): float =
  if x >= 0.0 then 1.0 else -1.0
;;

let round ?(dig : int = 0) (x : float) : float =
  if dig = 0 then
    floor (x +. 0.5 *. fsign x)
  else
    if dig < 0 then
      failwith "Invalid digit value, cannot round with a negative digit number"
    else 
      let factor = 10.0 ** float_of_int dig in
      floor (x *. factor +. 0.5 *. fsign x) /. factor
;;

let divmod (a, b : int * int) : int * int =
  (a / b, a mod b)
;;
