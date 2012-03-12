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

let string_of_variable = function s -> s
let string_of_type_variable = function s -> s
let string_of_data_constructor = function s -> s
let string_of_type_constructor = function s -> s

let rec string_of_ptyp = function
  | Tvar v -> string_of_variable v
  | Tarrow (p1, p2) -> (string_of_ptyp p1) ^ " -> " ^ (string_of_ptyp p2)
  | Tparam (t, []) -> t
  | Tparam (t, acs) -> 
      t ^ "[" ^ (string_of_list string_of_annotated_component ", " acs) ^ "]"

and string_of_atyp = function
  | Var (v) -> v
  | AArrow (a1, a2) -> (string_of_atyp a1) ^ " -> " ^ (string_of_atyp a2)
  | AParam (t, []) -> t
  | AParam (t, ats) -> t ^ "[" ^ (string_of_list string_of_atyp ", " ats) ^ "]"

and string_of_annotated_variable = function
  | AVar (v, a) -> v ^ " : " ^ (string_of_atyp a)

and string_of_annotated_parameter = function
  | APar (v, a) -> v ^ " : " ^ (string_of_atyp a)

and string_of_annotated_component = function
  | ACom (v, p) -> v ^ " : " ^ (string_of_ptyp p)

and string_of_constructor_definition = function
  | DConstructor (d, []) -> d 
  | DConstructor (d, acs) ->
      d ^ " ( " ^(string_of_list string_of_annotated_component ", " acs)^ " ) "

and string_of_type_definition = function
  | DTypeDef (t, [], cs) ->
      "type " ^ t ^ " = " ^ 
	(string_of_list string_of_constructor_definition " | " cs)
  | DTypeDef (t, vs, cs) ->
      "type " ^ t ^ "[ " ^ (string_of_list (fun x -> x) ", " vs) ^ " ] = " ^ 
	(string_of_list string_of_constructor_definition " | " cs)

and string_of_key_value = function
  | PKeyValue (p1, p2) ->
      " ( " ^ (string_of_pattern p1) ^ ", " ^ (string_of_pattern p2) ^ " ) "

and string_of_pattern = function
  | PVar (v, a) -> v ^ " : " ^ (string_of_atyp a)
  | PCons (d, [], []) -> d  
  | PCons (d, [], ps) ->
      d ^ " ( " ^ (string_of_list string_of_pattern ", " ps) ^ " ) "
  | PCons (d, ats, []) ->
      d ^ " [" ^ (string_of_list string_of_atyp ", " ats) ^ "]"
  | PCons (d, ats, ps) ->
      d ^ " [" ^ (string_of_list string_of_atyp ", " ats) ^ "]" ^ 
	(string_of_list string_of_pattern ", " ps)
  | PEmptyMap (d, a) -> d ^ "[ " ^ (string_of_atyp a) ^ " ]"
  | PMap (ks, p) ->
      "{" ^ (string_of_list string_of_key_value ", " ks) ^ ", " ^ 
	(string_of_pattern p) ^ "}"

and string_of_filter = function
  | Filter (p, e) -> 
      "| " ^ (string_of_pattern p) ^ " => " ^ (string_of_expression e)

and string_of_var_definition v =
  match v with
    | DVar (a, e) -> 
	"def " ^ (string_of_annotated_variable a) ^ " = " ^ 
	  (string_of_expression e)
    | DVars (avs, d, vs) ->  
	"def " ^ (string_of_list string_of_annotated_variable ", " avs) ^ 
	  " = let ( " ^ (string_of_def_local d) ^ " ) {" ^ 
	  (string_of_list string_of_variable ", " vs) ^ "} "
    | DFun (v, [], aps, a, e) ->
	"def " ^ v ^ " ( " ^ 
	  (string_of_list string_of_annotated_parameter ", " aps) ^ " ) : " ^ 
	  (string_of_atyp a) ^ " = " ^ (string_of_expression e)
    | DFun (v, vs, aps, a, e) ->
	"def " ^ v ^ " [" ^ (string_of_list (fun x -> x) ", " vs) ^ "] ( " ^ 
	  (string_of_list string_of_annotated_parameter ", " aps) ^ " ) : " ^ 
	  (string_of_atyp a) ^ " = " ^ (string_of_expression e)
	
and string_of_def_local (DLocal d) =
  let string_couple (a, e) =
    (string_of_annotated_variable a) ^ " = " ^ (string_of_expression e)
  in
  (string_of_list string_couple ", " d)

and string_of_expression = function
    | EVar v -> v
    | EConstant (s, ats, es) -> 
	s ^ (if (List.length ats) = 0 
	     then "" 
	     else "[" ^ (string_of_list string_of_atyp ", " ats) ^ "]" ) ^ 
	  (if (List.length es) = 0 
	   then "" 
	   else " ( " ^ (string_of_list string_of_expression ", " es) ^ " ) ")
    | EKeyValue (e1, e2) -> "Partie expérimentale à Jerem" ^ 
	(string_of_expression e1) ^ (string_of_expression e2)
    | EMap (es, a) -> "Partie expérimentale à Jerem" ^ 
	(string_of_list string_of_expression ", " es) ^ (string_of_atyp a)
    | ELet (a, e1, e2) -> "let (" ^ (string_of_annotated_variable a)^" = " ^ 
	(string_of_expression e1) ^ " ) { " ^ (string_of_expression e2) ^ " }"
    | ELambda (ats, ap, at, e) -> 
	"fun " ^ (if (List.length ats) = 0 
		  then "" 
		  else "[" ^ (string_of_list string_of_atyp ", " ats) ^ "]") ^ 
	  " ( " ^ (string_of_annotated_parameter ap) ^ " ) " ^ " : " ^ 
	  (string_of_atyp at) ^ " => " ^ (string_of_expression e)
    | ECall (s, ats, es) -> 
	s ^ (if (List.length ats) = 0 
	     then "" 
	     else "[" ^ (string_of_list string_of_atyp "," ats) ^ "]") ^ 
	  " ( " ^ (string_of_list string_of_expression ", " es) ^ " ) "
    | ECase (es, fs) -> "case " ^ 
	(string_of_list string_of_expression ", " es) ^ " {\n" ^ 
	  (string_of_list string_of_filter "\n" fs) ^ "}"
    | EAnnotation (e, a) -> 
	(string_of_expression e) ^ " : " ^ (string_of_atyp a)

and string_of_fsafe f =
  let s1 = 
    List.fold_left 
      (fun acc t -> acc ^ (string_of_type_definition t)) "" f.types
  and s2 = 
    List.fold_left 
      (fun acc v -> acc ^ (string_of_var_definition v)) "" f.globals
  and s3 = 
    List.fold_left 
      (fun acc e -> acc ^ (string_of_expression e)) "" f.entry
  in
    s1^"\n"^s2^"\n"^s3^"\n"
