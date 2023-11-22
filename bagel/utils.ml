let blur_list (p_list: float list): float list =
  let rec blur_helper (p_list: float list) =
    match p_list with
    | x :: y :: z :: rest ->
      (x +. y +. z) /. 3.0 :: blur_helper (y :: z :: rest)
    | _ -> []
  in
  ((List.nth p_list 0) +. List.nth p_list 1) /. 3.0
  :: blur_helper p_list
  @ [((List.nth p_list (List.length p_list - 1)) +. List.nth p_list (List.length p_list - 2)) /. 3.0]
;;

let incr_nth (n, lst : int * int list): int list =
  List.mapi (fun i x -> if i = n then x + 1 else x) lst
;;

let decr_nth (n, lst : int * int list): int list =
  List.mapi (fun i x -> if i = n then x - 1 else x) lst
;;

let slice (n, m, lst : int * int * 'a list): 'a list =
  let rec take n m acc = function
    | [] -> List.rev acc
    | hd :: tl when n > 0 -> take (n - 1) m acc tl
    | hd :: tl when m >= 0 -> take 0 (m - 1) (hd :: acc) tl
    | _ -> List.rev acc
  in
  take n m [] lst
;;

let list_max (lst : 'a list): 'a =
  List.fold_left max min_int lst
;;

let list_max_id (lst : 'a list): int =
  let _, max_id, _ =
    List.fold_left
    (fun (current_max, max_id, id) elem ->
      if elem > current_max then (elem, id, id + 1)
      else (current_max, max_id, id + 1))
    (List.hd lst, 0, 1) (List.tl lst)
    in
    max_id
;;

let remove (lst, item : 'a list * 'a) : 'a list =
  List.filter (fun x -> x <> item) lst
;;

let rec replace (lst, a, b : 'a list * 'a * 'a): 'a list =
  match lst with
  | [] -> []
  | hd :: tl ->
    if hd = a then
      b :: replace(tl, a, b)
    else
      hd :: replace(tl, a, b)
;;
