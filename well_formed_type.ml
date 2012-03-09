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

type tscheme = Scheme of variable list * annotated_parameter list * ptyp 

module SMap = Map.Make(String)

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

(* ptyp list -> string *)
let rec string_of_ptyplist = function
  | [] -> ""
  | ptyp :: [] -> string_of_ptyp ptyp
  | ptyp :: rest -> (string_of_ptyp ptyp) ^ ", " ^ (string_of_ptyplist rest)

and string_of_atyplist = function
  | [] -> ""
  | atyp :: [] -> string_of_atyp atyp
  | atyp :: rest -> (string_of_atyp atyp) ^ ", " ^ (string_of_atyplist rest)

(* ptyp -> string *)
and string_of_ptyp = function
  | Tvar s -> s
  | Tarrow (t1, t2) -> (string_of_ptyp t1)  ^ " -> " ^ (string_of_ptyp t2)
  | Tparam (s, ts) ->
    s ^ "[" ^ (string_of_atyplist (List.map (fun (APar (_, t)) -> t) ts)) ^ "]"

and string_of_atyp = function
  | Var s -> s
  | AArrow (t1, t2) -> (string_of_atyp t1) ^ " -> " ^ (string_of_atyp t2)
  | AParam (s, ts) ->
    s ^ "[" ^ string_of_atyplist ts

(* print_strings : string list -> unit *)
let rec print_strings = function
  | [] -> ()
  | s :: rest -> print_string s; print_newline() ; print_strings rest

(* check_list_of_param : string -> trie -> param -> unit *)
let rec check_list_of_param cons trie = function
  | [] -> ()
  | APar (s, _) :: rest ->
    try
      check_list_of_param cons (enter trie s) rest
    with Duplicate s ->
      raise (failwith ("Duplicate label " ^ s ^ " in constructor " ^ cons))

(* ptyp -> ptyp list -> bool *)
let rec is_in ptyp = function
  | [] -> false
  | ptyp2 :: rest ->
    if ptyp2 = ptyp then true else is_in ptyp rest

(* check_list_of_ptyp : ptyp list -> unit *)
let rec check_list_of_ptyp = function
  | [] -> ()
  | ptyp :: rest ->
    if is_in ptyp rest then
      raise (failwith ("Duplicate parameter " ^ (string_of_ptyp ptyp)))
    else
      check_list_of_ptyp rest

(* check_list_of_contructor : trie -> data_contructor_definition -> trie *)
let rec check_list_of_constructor constrie = function
  | [] -> constrie
  | DConstructor (s,paramlist) :: rest ->
    (check_list_of_param s empty paramlist);
    begin 
      try
	check_list_of_constructor (enter constrie s) rest
      with Duplicate s ->
	raise (failwith ("Duplicate constructor " ^ s))
    end

(* check_list_of_definition : trie -> trie -> data_type_definition -> unit *)
let rec check_list_of_definition typeidenttrie constrie = function
  | [] -> ()
  | DTypeDef (tc, _, conslist) :: rest -> 
    begin
      try
	check_list_of_definition 
	  (enter typeidenttrie tc) 
	  (check_list_of_constructor constrie conslist)
	  rest
      with Duplicate tc ->
	raise (failwith ("Duplicate type identifier " ^ tc))
    end
 
(* check : fsafe -> unit *)
let check = function
    { types = l; globals = _; entry = _ } -> check_list_of_definition empty empty l


(* check : fsafe -> SMap *)
let create_tscheme_map ast =
  match ast with
      { types = []; globals = _; entry = _ } -> SMap.empty
    | { types = ts; globals = _; entry = _ } ->  
      let rec createScheme tlist map =
	match tlist with
          | [] -> map
          | DTypeDef (tc, tvs, dcs) :: l ->	    
            let rec createConsListe ll mapp = 
	      match ll with
		| [] -> mapp
		| DConstructor (dc, aps) :: lll -> 
		  let map' =
		    SMap.add dc (Scheme (tvs, aps, Tparam (tc, aps))) mapp in
		  createConsListe lll map' 
	    in
	    let map' = createConsListe dcs map in
	    createScheme l map'
      in createScheme ts SMap.empty
      
