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

(*let ident = "  "

let idtcpt = ref 0

let vartag = "/************************************************/\n" ^ 
"/*                Vars Defs                     */\n" ^ 
"/************************************************/\n"

let typetag = "/************************************************/\n" ^ 
"/*                Types Defs                    */\n" ^
"/************************************************/\n"

let exprtag = "/************************************************/\n" ^ 
"/*                Expressions                   */\n" ^ 
"/************************************************/\n"

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

and string_of_type_definition ind t =
  match t with
  | DTypeDef (t, [], cs) ->
      "type " ^ t ^ " = " ^ 
	(string_of_list string_of_constructor_definition ("\n" ^ (fun_indent ind) ^ " | ") cs) ^ "\n\n"
  | DTypeDef (t, vs, cs) ->
      "type " ^ t ^ "[ " ^ (string_of_list (fun x -> x) ", " vs) ^ " ] = " ^ 
	(string_of_list string_of_constructor_definition ("\n" ^ (fun_indent ind) ^ " | ") cs) ^ "\n\n"

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

and string_of_filter ind f =
  match f with
    | Filter (p, e) -> 
	(fun_indent ind) ^ "| " ^ (string_of_pattern p) ^ " => \n" ^ (string_of_expression (ind + 2) e)

and string_of_var_definition ind v =
  match v with
    | DVar (a, e) ->
	(fun_indent ind) ^ "def " ^ (string_of_annotated_variable a) ^ " = \n" ^ 
	  (string_of_expression (ind + 1) e) ^ "\n\n"
    | DVars (avs, d, vs) ->  
	(fun_indent ind) ^ "def " ^ (string_of_list string_of_annotated_variable ", " avs) ^ 
	  " = \n " ^ (fun_indent (ind + 1)) ^ "let ( " ^ (string_of_def_local d) ^ " ) {\n" ^ 
	 (fun_indent (ind + 2)) ^ (string_of_list string_of_variable ", " vs) ^ "\n" ^ (fun_indent (ind + 1)) ^"}\n\n"
    | DFun (v, [], aps, a, e) ->
	(fun_indent ind) ^ "def " ^ v ^ " ( " ^ 
	  (string_of_list string_of_annotated_parameter ", " aps) ^ " ) : " ^ 
	  (string_of_atyp a) ^ " = \n" ^ (string_of_expression (ind + 1) e) ^ "\n\n"
    | DFun (v, vs, aps, a, e) ->
	(fun_indent ind) ^ "def " ^ v ^ " [" ^ (string_of_list (fun x -> x) ", " vs) ^ "] ( " ^ 
	  (string_of_list string_of_annotated_parameter ", " aps) ^ " ) : " ^ 
	  (string_of_atyp a) ^ " = \n" ^ (string_of_expression (ind + 1) e) ^ "\n\n"
	
and string_of_def_local (DLocal d) =
  let string_couple (a, e) =
    (string_of_annotated_variable a) ^ " = " ^ (string_of_expression 0 e)
  in
  (string_of_list string_couple ", " d)

and string_of_expression ind e =
  match e with
    | EVar v -> (fun_indent ind) ^ v
    | EConstant (s, ats, es) -> 
	(fun_indent ind) ^ s ^ (if (List.length ats) = 0 
	     then "" 
	     else "[" ^ (string_of_list string_of_atyp ", " ats) ^ "]" ) ^ 
	  (if (List.length es) = 0 
	   then "" 
	   else " ( " ^ (string_of_list (string_of_expression 0) ", " es) ^ " ) ")
    | EKeyValue (e1, e2) -> (fun_indent ind) ^ "Partie expérimentale à Jerem" ^ 
	(string_of_expression 0 e1) ^ (string_of_expression 0 e2)
    | EMap (es, a) -> (fun_indent ind) ^ "Partie expérimentale à Jerem" ^ 
	(string_of_list (string_of_expression 0) ", " es) ^ (string_of_atyp a)
    | ELet (a, e1, e2) -> (fun_indent ind) ^ "let (" ^ (string_of_annotated_variable a) ^ " = " ^ 
	(string_of_expression 0 e1) ^ " ) {\n"
	^ (string_of_expression (ind + 1) e2) ^ "\n"
	^ (fun_indent ind) ^ "}"
    | ELambda (ats, ap, at, e) -> 
	(fun_indent ind) ^ "fun " ^ (if (List.length ats) = 0 
		  then "" 
		  else "[" ^ (string_of_list string_of_atyp ", " ats) ^ "]") ^ 
	  " ( " ^ (string_of_annotated_parameter ap) ^ " ) " ^ " : " ^ 
	  (string_of_atyp at) ^ " => " ^ (string_of_expression 0 e)
    | ECall (s, ats, es) -> 
	(fun_indent ind) ^ s ^ (if (List.length ats) = 0 
	     then "" 
	     else "[" ^ (string_of_list string_of_atyp "," ats) ^ "]") ^ 
	  " ( " ^ (string_of_list (string_of_expression 0) ", " es) ^ " ) "
    | ECase (es, fs) -> (fun_indent ind) ^ "case " ^ 
	(string_of_list (string_of_expression 0) ", " es) ^ " {\n" ^ 
	  (string_of_list (string_of_filter (ind + 1)) "\n" fs)
	^ "\n" ^ (fun_indent ind) ^ "}"
    | EAnnotation (e, a) ->
	(fun_indent ind) ^ (string_of_expression 0 e) ^ " : " ^ (string_of_atyp a)

and string_of_fsafe f =
  let s1 = 
    List.fold_left 
      (fun acc t -> acc ^ (string_of_type_definition 1 t)) "\n" f.types
  and s2 = 
    List.fold_left 
      (fun acc v -> acc ^ (string_of_var_definition 0 v)) "\n" f.globals
  and s3 = 
    List.fold_left 
      (fun acc e -> acc ^ (string_of_expression 0 e) ^ "\n") "\n" f.entry
  in
    typetag ^ s1 ^ "\n\n" ^ vartag ^ s2 ^ "\n\n" ^ exprtag ^ s3 ^ "\n\n"
*)

let string_of_fsafe f = ""
