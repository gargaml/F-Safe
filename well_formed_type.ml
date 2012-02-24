(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : well_formed_type.ml                                         *)
(* Description : check consistency of type declarations after parsing        *)
(*                                                                           *)
(*****************************************************************************)

open Fsafe

exception Duplicate of string

type trie = Trie of ( bool * arcs )
and arcs = ( char * trie ) list

type zipper = 
  | Top
  | Zip of ( bool * arcs * char * arcs * zipper )

and edit_state = ( zipper * trie )

let empty = Trie(false,[])

(* zip : 'a -> ('a * 'b) list -> ('a * 'b) list * ('a * 'b) list *)
let zip n =
  let rec zip acc l =
    match l with
	[] -> (acc,[])
      | ((m,_) as current) :: rest ->
	if m < n then zip (current::acc) rest
	else (acc,l)
  in
  zip []

(* zip_up : zipper -> trie -> trie *)
let rec zip_up z t = match z with
  | Top -> t
  | Zip( b, left, n, right, up ) ->
    zip_up up ( Trie( b, List.rev_append left ((n,t) :: right) ))

(* trie_of : string -> trie *)
let rec trie_of word =
  if String.length word = 0 then
    Trie(true,[])
  else 
    Trie(false, [(word.[0], 
		  trie_of (String.sub word 1 ((String.length word) - 1)))])

(* enter : trie -> string -> trie *)
let enter trie w = 
  let rec enter_edit (z,t) word = match t with
      Trie (b, l) -> 
	if String.length word = 0 then
	  if b then
	    raise (Duplicate w)
	  else
	    zip_up z (Trie (true, l))
	else
	  let n = word.[0] in
	  let (left, right) = zip n l in
	  let rest = (String.sub word 1 ((String.length word) - 1)) in
	  match right with
	    | [] -> zip_up (Zip(b,left,n,[],z)) (trie_of rest)
	    | (m,u) :: r -> 
	      if m = n then enter_edit (Zip(b,left,n,r,z),u) rest
	      else zip_up (Zip(b,left,n,right,z)) (trie_of rest)
  in
  enter_edit (Top, trie) w

(* mem : string -> trie -> bool *)
let rec mem word = function
  | Trie (b,l) -> 
    if String.length word = 0 then b
    else 
      let n = word.[0] in
      let r = (String.sub word 1 ((String.length word) - 1)) in
      try mem r (List.assoc n l)
      with Not_found -> false

(* contents : trie -> char list list *)
let contents = 
  let rec contents pref = function
    | Trie (b,l) -> 
      let f l (n,t) = l @ (contents (n::pref) t) in
      let down = List.fold_left f [] l in
      if b then (List.rev pref) :: down else down 
in 
contents []
(* string_of_chars : char list -> string *)
let string_of_chars l =
  let word = String.create (List.length l) in
  let rec string_of_chars index = function
    | [] -> word
    | c :: rest -> String.set word index c ; string_of_chars (index + 1) rest
  in
  string_of_chars 0 l

(* make_lex : string list -> trie *)
let make_lex = List.fold_left (fun lex -> fun c -> enter lex c ) empty

(* strings_of_trie : trie -> string list *)
let strings_of_trie t = List.map string_of_chars (contents t)

(* print_strings : string list -> unit *)
let rec print_strings = function
  | [] -> ()
  | s :: rest -> print_string s; print_newline() ; print_strings rest

let rec check_data_type_definition_list trie = function
    [] -> trie
  | datatype :: rest -> begin match datatype with
	DefDataType (typecons, _, _) ->
	  check_data_type_definition_list (enter trie typecons) rest
    end

let rec check_list_of_declaration trie = function
    [] -> ()
  | decl :: rest -> 
      begin match decl with
	  DeclDataType l -> 
	    check_list_of_declaration 
	      (check_data_type_definition_list trie l) rest
	| _ -> check_list_of_declaration trie rest
      end
	
let check = function
    Fsafe l -> check_list_of_declarations empty l

