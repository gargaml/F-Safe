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
(* File        : pprinter.ml                                                 *)
(* Description : fsafe pretty printer                                        *)
(*                                                                           *)
(*****************************************************************************)

open Utils
open Fsafe

let vartag = "/************************************************/\n" ^ 
"/*                Vars Defs                     */\n" ^ 
"/************************************************/\n"

let typetag = "/************************************************/\n" ^ 
"/*                Types Defs                    */\n" ^
"/************************************************/\n"

let exprtag = "/************************************************/\n" ^ 
"/*                Expressions                   */\n" ^ 
"/************************************************/\n"

(* WARNING : OCaml evaluates from RIGHT TO LEFT,
   i.e this way "<-------" (thank you captain obvious),
   indentation management depends on it*)

let string_of_variable = function s -> s
let string_of_type_variable = function s -> s
let string_of_data_constructor = function s -> s
let string_of_type_constructor = function s -> s
let string_of_parameter = function s -> s

let rec string_of_ptyp = function
  | TVar v -> string_of_variable v
  | TArrow (ps, p) ->
    let s1 = List.fold_left (fun acc p -> acc ^ string_of_ptyp p) "" ps in
    let s2 = string_of_ptyp p in
    "(" ^ s1 ^ ") -> " ^ s2
  | TConApp (t, []) -> string_of_data_constructor t
  | TConApp (t, acs) -> 
      string_of_data_constructor t
      ^ "[" ^ (string_of_list string_of_typed_variable ", " acs) ^ "]"

and string_of_atyp = function
  | AVar (v) -> string_of_type_variable v
  | AArrow (a1, a2) ->
    let s1 = List.fold_left (fun acc p -> acc ^ string_of_atyp p) "" a1 in
    let s2 = string_of_atyp a2 in
    "(" ^ s1 ^ ") -> " ^ s2
  | AConApp (t, []) -> string_of_type_constructor t
  | AConApp (t, ats) -> string_of_type_constructor t
      ^ "[" ^ (string_of_list string_of_atyp ", " ats) ^ "]"

and string_of_atyp_option = function
  | None -> ""
  | Some t -> string_of_atyp t

and string_of_typed_variable = function
  | (v, a) -> (string_of_variable v)
      ^ " : " ^ (string_of_atyp a)

and string_of_typed_parameter = function
  | (p, a) -> string_of_parameter p
      ^ " : " ^ (string_of_atyp a)

and string_of_assignments ass =
  match ass with
    | [] -> ""
    | [(tv, te)] -> (string_of_typed_variable tv) ^ " = " ^ (string_of_typed_expression te)
    | (tv, te)::q -> (string_of_typed_variable tv) ^ " = " ^ (string_of_typed_expression te) ^ ", "

and string_of_type_definition  t =
  match t with
  | TDef (t, [], cs) ->
      "type " ^ (string_of_type_constructor t) ^ " = " ^ (id_min ())
      ^ (string_of_list string_of_ptyp ("\n" ^ (id_print ()) ^ "| ") cs)
      ^ "\n" ^ (id_add ())
  | TDef (t, vs, cs) ->
      "type " ^ (string_of_type_constructor t)
      ^ "[ " ^ (string_of_list string_of_type_variable ", " vs) ^ " ]"
      ^ (id_min ())
      ^ " = " ^ (string_of_list string_of_ptyp ("\n" ^ (id_print ()) ^ "| ") cs)
      ^ "\n" ^ (id_add ())

and string_of_pattern = function
  | Pattern (fs,te) ->
      (string_of_list string_of_filter ", " fs) ^ " =>\n"
      ^ (id_print_min ()) ^ (string_of_typed_expression te)
      ^ (id_add ())
	  
and string_of_filter f =
  match f with
    | PConApp (dc,[],[]) -> 
	(string_of_data_constructor dc)
    | PConApp (dc,[],fs) ->
	(string_of_data_constructor dc) ^ " ( "
	^ (string_of_list string_of_filter ", " fs) ^ " ) "
    | PConApp (dc,ats,[]) -> 
	(string_of_data_constructor dc) ^ " [ "
	^ (string_of_list string_of_atyp ", " ats) ^ " ] "
    | PConApp (dc,ats,fs) -> 
	(string_of_data_constructor dc) ^ " [ "
	^ (string_of_list string_of_atyp ", " ats) ^ " ] " ^ " ( "
	^ (string_of_list string_of_filter ", " fs) ^ " ) "
    | PVar tv -> string_of_typed_variable tv
	
and string_of_global_definition  v =
  match v with
    | GDef (tv, te) ->
	"def " ^ (string_of_typed_variable tv)
	^ " = \n" ^ (id_print_min ())
	^ (string_of_typed_expression te) ^ (id_add ())
    | GRecDef (tvs,te) ->
	"def " ^ (string_of_list string_of_typed_variable ", " tvs)
	^ " = \n" ^ (id_print_min ())
	^ (string_of_typed_expression te) ^ (id_add ())

and string_of_expression  e =
  match e with
    | EVar v -> (string_of_variable v)
    | EConApp (dc, ats, es) -> 
	(string_of_data_constructor dc)
	^ (if (List.length ats) = 0
	   then "" 
	   else "[" ^ (string_of_list string_of_atyp ", " ats) ^ "]" )
	^ (if (List.length es) = 0
	   then "" 
	   else " ( "
	     ^ (string_of_list (string_of_typed_expression ) ", " es)
	     ^ " ) ")
    | ELet (ass, te) ->
	"let (" ^ (string_of_assignments ass) 
	^ " ) {\n" ^ (id_print_min ())
	^ (string_of_list (string_of_typed_expression ) "," te)
	^ "\n" ^ (id_add_print ()) ^ "}"
    | EAbs (tvs, tps, te) ->
	"fun " ^ 
	  (if (List.length tvs) = 0 
	   then "" 
	   else "[" ^ (string_of_list string_of_type_variable ", " tvs) ^ "]") 
	^ " ( " ^ (string_of_list string_of_typed_parameter ", " tps) ^ " ) " 
	^ " ->\n" ^ (id_print_min ()) ^ (string_of_typed_expression te) ^ (id_add ())
    | EApp (v, ats, tes) ->
	(string_of_variable v)
	^ (if (List.length ats) = 0 
	   then "" 
	   else "[" ^ (string_of_list string_of_atyp "," ats) ^ "]")
	^ " ( " ^ (string_of_list (string_of_typed_expression ) ", " tes) ^ " ) "
    | ECase (tes, ps) ->
	"case " ^ (string_of_list (string_of_typed_expression ) ", " tes)
	^ " {\n" ^ (id_print_min ()) ^ "| "
	^ (string_of_list (string_of_pattern) ("\n" ^ (id_print ()) ^ "| ") ps)
	^ "\n" ^ (id_add_print ()) ^ "}"
	  
and string_of_typed_expression e =
  (string_of_expression e.e) ^ " : " ^ (string_of_atyp_option e.t)

and string_of_fsafe f =
  let s1 = 
    List.fold_left 
      (fun acc t -> acc ^ (string_of_type_definition t) ^ "\n\n") "\n" f.types
  and s2 = 
    List.fold_left 
      (fun acc v -> acc ^ (string_of_global_definition v) ^ "\n\n") "\n" f.globals
  and s3 = 
    List.fold_left 
      (fun acc e -> acc ^ (string_of_typed_expression e) ^ "\n\n") "\n" f.entry
  in
    typetag ^ s1 ^ "\n" ^ vartag ^ s2 ^ "\n" ^ exprtag ^ s3 ^ "\n"
