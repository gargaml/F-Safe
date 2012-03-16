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

let ident = "  "

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
let string_of_parameter = function s -> s

let rec string_of_ptyp = function
  | TVar v -> string_of_variable v
  | TArrow (p1, p2) -> (string_of_ptyp p1) ^ " -> " ^ (string_of_ptyp p2)
  | TConApp (t, []) -> t
  | TConApp (t, acs) -> 
      t ^ "[" ^ (string_of_list string_of_typed_variable ", " acs) ^ "]"

and string_of_atyp = function
  | Undefined -> failwith "\nUndefined atyp shouldn't be here \nCitation of fsafe.ml : (* useful only at parsing time *)"
  | AVar (v) -> string_of_type_variable v
  | AArrow (a1, a2) -> (string_of_atyp a1) ^ " -> " ^ (string_of_atyp a2)
  | AConApp (t, []) -> t
  | AConApp (t, ats) -> t ^ "[" ^ (string_of_list string_of_atyp ", " ats) ^ "]"

and string_of_typed_variable = function
  | (v, a) -> v ^ " : " ^ (string_of_atyp a)

and string_of_typed_parameter = function
  | (v, a) -> v ^ " : " ^ (string_of_atyp a)

and string_of_assignments ass =
  match ass with
    | [] -> ""
    | [(tv, te)] -> (string_of_typed_variable tv) ^ " = " ^ (string_of_typed_expression 0 te)
    | (tv, te)::q -> (string_of_typed_variable tv) ^ " = " ^ (string_of_typed_expression 0 te) ^ ", "

and string_of_type_definition ind t =
  match t with
  | TDef (t, [], cs) ->
      "type " ^ t ^ " = " ^ 
	(string_of_list string_of_ptyp ("\n" ^ (fun_indent ind) ^ " | ") cs) ^ "\n\n"
  | TDef (t, vs, cs) ->
      "type " ^ t ^ "[ " ^ (string_of_list string_of_type_variable ", " vs) ^ " ] = " ^ 
	(string_of_list string_of_ptyp ("\n" ^ (fun_indent ind) ^ " | ") cs) ^ "\n\n"

and string_of_pattern = function
  | Pattern (fs,te) ->
      (string_of_list string_of_filter ", " fs) ^ " -> " ^ (string_of_typed_expression 0 te)

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
	
and string_of_global_definition ind v =
  match v with
    | GDef ((v,a),{e = EAbs ([], tps,te); t = Undefined}) ->
	(fun_indent ind) ^ "def" ^ (string_of_variable v)
	^ "( " ^ (string_of_list string_of_typed_parameter ", " tps)
	^ " ) : " ^ (string_of_atyp a) ^ " =\n"
	^ (string_of_expression (ind + 1) (EAbs ([], tps,te)))
    | GDef ((v,a),{e = EAbs (tvs, tps,te); t = Undefined}) ->
	(fun_indent ind) ^ "def" ^ (string_of_variable v)
	^ "[ " ^ (string_of_list string_of_type_variable ", " tvs) ^ " ]"
	^ "( " ^ (string_of_list string_of_typed_parameter ", " tps)
	^ " ) : " ^ (string_of_atyp a) ^ " =\n"
	^ (string_of_expression (ind + 1) (EAbs (tvs, tps,te)))
    | GDef (tv, te) ->
	(fun_indent ind) ^ "def " ^ (string_of_typed_variable tv) ^
	  " = \n" ^ (string_of_typed_expression (ind + 1) te)
    | GRecDef (tvs,te) ->
	(fun_indent ind) ^ "def "
	^ (string_of_list string_of_typed_variable ", " tvs) ^
	  " = \n" ^ (string_of_typed_expression (ind + 1) te)

and string_of_expression ind e =
  match e with
    | EVar v -> (fun_indent ind) ^ v
    | EConApp (dc, ats, es) -> 
	(fun_indent ind) ^ (string_of_data_constructor dc) ^ (if (List.length ats) = 0 
	     then "" 
	     else "[" ^ (string_of_list string_of_atyp ", " ats) ^ "]" ) ^ 
	  (if (List.length es) = 0 
	   then "" 
	   else " ( " ^ (string_of_list (string_of_typed_expression 0) ", " es) ^ " ) ")
    | ELet (ass, te) ->
	(fun_indent ind) ^ "let (" ^ (string_of_assignments ass) 
	^ " ) {\n"
	^ (string_of_typed_expression (ind + 1) te) ^ "\n"
	^ (fun_indent ind) ^ "}"
    | EAbs (tvs, tps, te) ->
	(fun_indent ind) ^ "fun " ^ 
	  (if (List.length tvs) = 0 
	   then "" 
	   else "[" ^ (string_of_list string_of_type_variable ", " tvs) ^ "]") 
	^ " ( " ^ (string_of_list string_of_typed_parameter ", " tps) ^ " ) " 
	^ " -> " ^ (string_of_typed_expression 0 te)
    | EApp (v, ats, tes) ->
	(fun_indent ind) ^ (string_of_variable v) ^ 
	  (if (List.length ats) = 0 
	   then "" 
	   else "[" ^ (string_of_list string_of_atyp "," ats) ^ "]") ^ 
	  " ( " ^ (string_of_list (string_of_typed_expression 0) ", " tes) ^ " ) "
    | ECase (tes, ps) ->
	(fun_indent ind) ^ "case "
	^ (string_of_list (string_of_typed_expression 0) ", " tes) ^ " {\n" 
	^ (string_of_list string_of_pattern 
	     ("\n" ^ (fun_indent (ind + 1)) ^ "| ") ps)
	^ "\n" ^ (fun_indent ind) ^ "}"
	  
and string_of_typed_expression ind e =
  (fun_indent ind) ^ (string_of_expression 0 e.e) ^ " : " ^ (string_of_atyp e.t)

and string_of_fsafe f =
  let s1 = 
    List.fold_left 
      (fun acc t -> acc ^ (string_of_type_definition 1 t) ^ "\n") "\n" f.types
  and s2 = 
    List.fold_left 
      (fun acc v -> acc ^ (string_of_global_definition 0 v) ^ "\n") "\n" f.globals
  and s3 = 
    List.fold_left 
      (fun acc e -> acc ^ (string_of_typed_expression 0 e) ^ "\n") "\n" f.entry
  in
    typetag ^ s1 ^ "\n\n" ^ vartag ^ s2 ^ "\n\n" ^ exprtag ^ s3 ^ "\n\n"
