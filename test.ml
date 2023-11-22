#use "topfind";;
#use "bagel/init.ml";;

let newline (): unit =
  print_newline()
;;

let banner (str: string): unit =
  print("\n\n" ^ reset_color ^ str ^ "\n" ^ set_color(rgb(100, 100, 100)))
;;

print("
      ██████╗  █████╗  ██████╗ ███████╗██╗     
      ██╔══██╗██╔══██╗██╔════╝ ██╔════╝██║     
      ██████╔╝███████║██║  ███╗█████╗  ██║     
      ██╔══██╗██╔══██║██║   ██║██╔══╝  ██║     
      ██████╔╝██║  ██║╚██████╔╝███████╗███████╗
      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
                   ︵‿︵‿୨♡ ୧‿︵‿︵
         your shortcut to smooth OCaml coding
     you learn about the features of this library
        that's the activity you're doing here!
        
        please use vscode to color the console");;

banner("val print_bool : bool -> unit");;
print_bool(false);; newline();;
print_bool(true);; newline();;

banner("val print_list : ('a -> string) -> 'a list -> unit");;
print_list string_of_int [1; 2; 3];; newline();;

banner("val boolof : 'a -> bool");;
print_bool(boolof 10);; (* true *) newline();;
print_bool(boolof 0);; (* false *) newline();;
print_bool(boolof "text");; (* true *) newline();;
print_bool(boolof "");; (* false *) newline();;
print_bool(boolof 0.1);; (* true *) newline();;
print_bool(boolof 0.0);; (* false *) newline();;
print_bool(boolof [1; 2]);; (* true *) newline();;
print_bool(boolof []);; (* false *) newline();;
print_bool(boolof (ref 1));; (* true *) newline();;
print_bool(boolof (ref 0));; (* false *) newline();;

banner("val all : 'a list -> bool");;
print_bool(all []);; (* true *) newline();;
print_bool(all [1; 2; 3]);; (* true *) newline();;
print_bool(all [1; 2; 0]);; (* false *) newline();;

banner("val any : 'a list -> bool");;
print_bool(any []);; (* false *) newline();;
print_bool(any [0; 0; 0]);; (* false *) newline();;
print_bool(any [0; 2; 0]);; (* true *) newline();;

banner("val ascii : char -> int");;
print_int(ascii 'A');; (* 65 *) newline();;
print_int(ascii 'a');; (* 97 *) newline();;
print_int(ascii '1');; (* 49 *) newline();;
print_int(ascii '$');; (* 36 *) newline();;
print_int(ascii '\n');; (* 10 *) newline();;
print_int(ascii '@');; (* 64 *) newline();;
print_int(ascii ' ');; (* 32 *) newline();;

banner("val string_of_bin : int -> string");;
print_string(string_of_bin 0);; (* 0 *) newline();;
print_string(string_of_bin 1);; (* 1 *) newline();;
print_string(string_of_bin 15);; (* 1111 *) newline();;
print_string(string_of_bin 2134);; (* 100001010110 *) newline();;

banner("val bytearray : int list -> string list");;
print_list (fun x -> x) (bytearray [1; 2; 3]);; newline();;
print_list (fun x -> x) (bytearray [5678; 9876; 31]);; newline();;
print_list (fun x -> x) (bytearray [0; 0; 0]);; newline();;

banner("val chr : int -> char");;
print_char(chr(97));; (* a *) newline();;
print_char(chr(64));; (* @ *) newline();;
print_char(chr(36));; (* $ *) newline();;

banner("val enumerate : 'a list -> (int * 'a) list");;
let enum: (int * string) list = enumerate ["x"; "y"; "z"] in
List.iter (fun (i, elem) -> Printf.printf "(%d, %s) " i elem) enum;;

banner("val float : 'a -> float");;
print_float(float(9));; newline();;
print_float(float(9.3));; newline();;
print_float(float("9"));; newline();;

banner("val hash : 'a -> int");;
print_int(hash(1));; newline();;
print_int(hash("Hello"));; newline();;
print_int(hash([]));; newline();;

banner("val hex : int -> string");;
print_string(hex(0));; (* 0x0 *) newline();;
print_string(hex(15));; (* 0xF *) newline();;
print_string(hex(1234));; (* 0x4D2 *) newline();;

banner("val int : 'a -> int");;
print_int(int(9));; newline();;
print_int(int(9.3));; newline();;
print_int(int("9"));; newline();;

banner("type num = Int of int | Float of float
val simplify : float -> num
val add : 'a * 'b -> num
val sub : 'a * 'b -> num
val mult : 'a * 'b -> num
val div : 'a * 'b -> num
val print_num : num -> unit");;
print_num(add(1.2, -6.0));; newline();;
print_num(sub(87.0, 3));; newline();;
print_num(mult(2.1, 8));; newline();;
print_num(div(34.1, 5.6));; newline();;

banner("val isequal : 'a * 'b -> bool");;
print_bool(isequal(4, 4.0));; (* true *) newline();;
print_bool(isequal(-16, -16.7));; (* false *) newline();;

banner("val typeof : 'a -> string
val stypeof : 'a -> string");;
print_endline "Basics ";;
print_string(typeof(1));; newline ();;
print_string(typeof(1.0));; newline ();;
print_string(typeof(""));; newline ();;
print_string(typeof('a'));; newline ();;
newline ();;

print_endline "References ";;
print_string(typeof(ref 1));; newline ();;
print_string(typeof(ref 1.0));; newline ();;
print_string(typeof(ref ""));; newline ();;
print_string(typeof(ref "a"));; newline ();;
print_string(typeof(ref "abc"));; newline ();;
print_string(typeof(ref 'a'));; newline ();;
print_string(typeof(ref []));; newline ();;

print_endline "Lists ";;
print_string(typeof([]));; newline ();;
print_string(typeof([1]));; newline ();;
print_string(typeof([1; 2]));; newline ();;
print_string(typeof([1; 2; 3]));; newline ();;
print_string(typeof([1.0]));; newline ();;
print_string(typeof([1.0; 2.0]));; newline ();;
print_string(typeof([1.0; 2.0; 3.0]));; newline ();;
print_string(typeof([""]));; newline ();;
print_string(typeof(["a"]));; newline ();;
print_string(typeof(["abc"]));; newline ();;
print_string(typeof(['a']));; newline ();;

print_endline "Arrays ";;
print_string(typeof([||]));; newline ();;
print_string(typeof([|1|]));; newline ();;
print_string(typeof([|1.0|]));; newline ();;
print_string(typeof([|""|]));; newline ();;
print_string(typeof([|"a"|]));; newline ();;
print_string(typeof([|"abc"|]));; newline ();;
print_string(typeof([|'a'|]));; newline ();;

banner("val float_of_num : num -> float");;
print_float(float_of_num(add(1.9, 3)));; newline ();;

banner("val int_of_num : num -> int");;
print_int(int_of_num(add(1.9, 3)));; newline ();;

banner("val ask : string -> string");;
ask("Choose a number :");;

banner("val choice : 'a list -> 'a");;
print_int(choice([1; 2; 3; 4; 5; 6; 7; 8; 9]));; newline();;
print_char(choice(['a'; 'b'; 'c'; 'd'; 'e' ]));; newline();;

banner("val blur_list : int list -> float list");;
print_list string_of_float (blur_list [1.; 2.; 3.; 2.; 1.; 0.]);; newline();;

banner("val list_of_string : string -> string list");;
print_list (fun x -> x) (list_of_string "a; b; x; r; t");; newline();;

banner("val incr_nth : int * int list -> int list");;
print_list string_of_int (incr_nth(3, [1; 2; 3; 4; 5; 6]));; newline();;

banner("val decr_nth : int * int list -> int list");;
print_list string_of_int (decr_nth(3, [1; 2; 3; 4; 5; 6]));; newline();;

banner("val slice : int * int * 'a list -> 'a list");;
print_list string_of_int (slice(2, 4, [1; 2; 3; 4; 5; 6]));; newline();;

banner("val list_max : int list -> int");;
print_int(list_max [108; 213; 89; 31; 243; 98]);; newline();;

banner("val list_max_id : 'a list -> int");;
print_int(list_max_id [1; 2; 3; 2]);; newline();;
print_int(list_max_id [108; 213; 89; 31; 243; 98]);; newline();;

banner("type t_color = int
val rgb : int * int * int -> t_color
val set_color : t_color -> string
val reset_color : string");;
print_endline(set_color(rgb (180, 180, 255)) ^ "Hi I'm in pastel blue !!!" ^ reset_color);;
print_endline(set_color(rgb (255, 190, 200)) ^ "And now I'm in pastel pink !!!" ^ reset_color);;

banner("val len : 'a list -> int");;
print_int(len([]));; newline();;
print_int(len([1; 2; 3; 4]));; newline();;

banner("val uniform : float * float -> float");;
print_float(uniform(0.0, 100.0));; newline();;
print_float(uniform(-1.0, 1.0));; newline();;

banner("val randint : int * int -> int");;
print_int(randint(1, 100));; newline();;
print_int(randint(-23, -15));; newline();;

banner("val dist : int * int * int * int -> float");;
print_float(dist(17, 27, -16, 37));; newline();;
print_float(dist(987, 176, -18, 1));; newline();;

banner("val fdist : float * float * float * float -> float");;
print_float(fdist(34., 13.6, -56.09, 34.6));; newline();;
print_float(fdist(65.87, 16., 3., 90.8752));; newline();;

banner("val clamp : int * int * int -> int");;
print_int(clamp(89, 1, 3));; newline();;
print_int(clamp(14, -12, 31));; newline();;

banner("val fclamp : float * float * float -> float");;
print_float(fclamp(2.0, 1.2, 1.8));; newline();;
print_float(fclamp(-196.0, -111.9, 2.1));; newline();;

banner("val sign : int -> int");;
print_int(sign(456789));; newline();;
print_int(sign(-2));; newline();;

banner("val fsign : float -> float");;
print_float(fsign(34.2));; newline();;
print_float(fsign(-28.1));; newline();;

banner("val round : ?dig:int -> float -> float");;
print_float(round(2.034));; newline();;
print_float(round(2.5));; newline();;
print_float(round(-2.5));; newline();;
print_float(round ~dig:2 2.034);; newline();;
print_float(round ~dig:1 67.567);; newline();;

banner("val string : 'a -> string");;
print_string(string(1));; newline();;
print_string(string("1"));; newline();;
print_string(string(1.));; newline();;

banner("val divmod : int * int -> int * int");;
let (a, b) = divmod(34, 3) in (
  print_int a;
  print_string ", ";
  print_int b;
  newline();
);;

banner("val remove : 'a list * 'a -> 'a list");;
print_list string_of_int (remove([1; 2; 3; 4; 5], 3));; newline();;
print_list string_of_int (remove([1; 2; 3; 1; 2; 3; 6], 2));; newline();;

banner("val replace : 'a list * 'a * 'a -> 'a list");;
print_list string_of_int (replace([1; 2; 3; 4; 5], 3, 0));; newline();;
print_list string_of_int (replace([1; 2; 3; 1; 2; 3; 6], 2, 1));; newline();;
