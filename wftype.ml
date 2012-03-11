(*****************************************************************************)
(*     This file is part of FSafe.                                           *)
(*                                                                           *)
(*     FSafe is free software: you can redistribute it and/or modify         *)
(*     it under the terms of the GNU General Public License as published by  *)
(*     the Free Software Foundation, either version 3 of the License, or     *)
(*     (at your option) any later version.                                   *)
(*                                                                           *)
(*     FSafe is distributed in the hope that it will be useful,              *)
(*     but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*     GNU General Public License for more details.                          *)
(*                                                                           *)
(*     You should have received a copy of the GNU General Public License     *)
(*     along with FSafe.  If not, see <http://www.gnu.org/licenses/>.        *)
(*                                                                           *)
(*                                                                           *)
(* File        : wftype.ml                                                   *)
(* Description : check consistency of type declarations after parsing        *)
(*                                                                           *)
(*****************************************************************************)

open Fsafe

exception Duplicate of string

type tscheme = Scheme of variable list * annotated_component list * ptyp 

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

(* print_strings : string list -> unit *)
let rec print_strings = function
  | [] -> ()
  | s :: rest -> print_string s; print_newline() ; print_strings rest

(* check_list_of_param : string -> trie -> param -> unit *)
let rec check_list_of_param cons trie = function
  | [] -> ()
  | ACom (s, _) :: rest ->
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
      raise (failwith ("Duplicate parameter "))
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
  match ast.types with
    | [] -> SMap.empty
    | (_::_) as typelist ->  
      let rec createScheme tlist map =
	match tlist with
          | [] -> map
          | (DTypeDef (typ, ptypListe, constructorliste)) :: l ->	    
            let rec createConsListe ll mapp = 
	      match ll  with
		  [] -> createScheme l mapp
		| DConstructor (const, paramListe) :: lll -> 
		  SMap.add 
		    const 
		    (Scheme(ptypListe,
			    paramListe,
			    Tparam(typ,[]))) 
		    (createConsListe lll mapp) 
	    in  createConsListe constructorliste map
      in createScheme typelist SMap.empty

