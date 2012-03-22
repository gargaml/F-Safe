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

let vartag = "/***** Vars Defs *****/\n"
let typetag = "/***** Types Defs *****/\n"
let exprtag = "/***** Expressions *****/\n"


let rec string_of_ptyp = function
  | TVar v -> v
  | TArrow (ps, p) ->
    let s1 = List.fold_left (fun acc p -> acc ^ string_of_ptyp p) "" ps in
    let s2 = string_of_ptyp p in
    "(" ^ s1 ^ ") -> " ^ s2
  | TConApp (t, []) -> t
  | TConApp (t, acs) -> 
      t ^ "[" ^ (string_of_list string_of_typed_variable ", " acs) ^ "]"

and string_of_atyp = function
  | AVar v -> v
  | AArrow (a1, a2) ->
    let s1 = List.fold_left (fun acc p -> acc ^ string_of_atyp p) "" a1 in
    let s2 = string_of_atyp a2 in
    "(" ^ s1 ^ ") -> " ^ s2
  | AConApp (t, []) -> t
  | AConApp (t, ats) -> t
      ^ "[" ^ (string_of_list string_of_atyp ", " ats) ^ "]"

and string_of_atyp_option = function
  | None -> ""
  | Some t -> string_of_atyp t

and string_of_typed_variable = function
  | (v, a) -> v ^ " : " ^ (string_of_atyp a)

and string_of_typed_parameter = function
  | (p, a) -> p ^ " : " ^ (string_of_atyp a)

and string_of_assignments ass =
  match ass with
    | [] -> ""
    | [(tv, te)] ->
      (string_of_typed_variable tv) ^ " = " ^ (string_of_typed_expression te)
    | (tv, te)::q ->
      (string_of_typed_variable tv) ^ " = "
      ^ (string_of_typed_expression te) ^ ", "

and string_of_type_definition  t =
  match t with
  | TDef (t, [], cs) ->
      "type " ^ t ^ " = " ^ (id_min ())
      ^ (string_of_list string_of_ptyp ("\n" ^ (id_print ()) ^ "| ") cs)
      ^ "\n" ^ (id_add ())
  | TDef (t, vs, cs) ->
      "type " ^ t
      ^ "[ " ^ (string_of_list (fun x -> x) ", " vs) ^ " ]"
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
    | PConApp (dc,[],[]) -> dc
    | PConApp (dc,[],fs) -> dc ^ " ( "
      ^ (string_of_list string_of_filter ", " fs) ^ " ) "
    | PConApp (dc,ats,[]) -> 
      dc ^ " [ " ^ (string_of_list string_of_atyp ", " ats) ^ " ] "
    | PConApp (dc,ats,fs) -> 
      dc ^ " [ "
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
    | EVar v -> v
    | EConApp (dc, ats, es) -> dc
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
	 else "[" ^ (string_of_list (fun x -> x) ", " tvs) ^ "]") 
      ^ " ( " ^ (string_of_list string_of_typed_parameter ", " tps) ^ " ) " 
      ^ " ->\n" ^ (id_print_min ())
      ^ (string_of_typed_expression te) ^ (id_add ())
    | EApp (v, ats, tes) ->
      v ^ (if (List.length ats) = 0 
	then "" 
	else "[" ^ (string_of_list string_of_atyp "," ats) ^ "]")
      ^ " ( " ^ (string_of_list (string_of_typed_expression ) ", " tes) ^ " ) "
    | ECase (tes, ps) ->
      "case " ^ (string_of_list (string_of_typed_expression ) ", " tes)
      ^ " {\n" ^ (id_print_min ()) ^ "| "
      ^ (string_of_list (string_of_pattern) ("\n" ^ (id_print ()) ^ "| ") ps)
      ^ "\n" ^ (id_add_print ()) ^ "}"
	
and string_of_typed_expression e =
  (string_of_expression e.e) ^
    (match e.t with
      | None -> ""
      | Some _ -> " : " ^ (string_of_atyp_option e.t))
    
and string_of_fsafe f =
  let s1 = 
    List.fold_left 
      (fun acc t -> acc ^ (string_of_type_definition t) ^ "\n\n")
      "\n" f.types
  and s2 = 
    List.fold_left 
      (fun acc v -> acc ^ (string_of_global_definition v) ^ "\n\n")
      "\n" f.globals
  and s3 = 
    List.fold_left 
      (fun acc e -> acc ^ (string_of_typed_expression e) ^ "\n\n")
      "\n" f.entry
  in
  typetag ^ s1 ^ "\n" ^ vartag ^ s2 ^ "\n" ^ exprtag ^ s3 ^ "\n"
