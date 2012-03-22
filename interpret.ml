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
(* File        : interpret.ml                                                *)
(* Description : fsafe interpreter                                           *)
(*                                                                           *)
(*****************************************************************************)

open Fsafe
open Printf
open Utils

(* environment for evaluation : maps string to value *)
module Env = Map.Make(
  struct 
    type t = string
    let compare = String.compare
  end)

(* evaluation result *)
type value =
  | Cons of string * value list
  | Fun of string * string list * typed_expression

(* string_of_value : value -> string *)
let string_of_value v = 
  let rec f = function
    | Cons (s, vs) -> sprintf "%s(%s)" s (string_of_list f "," vs)
    | Fun (_, _, _) -> "<fun>"
  in (f v) ^ "\n"

(* string_of_values : value list -> string *)
let string_of_values vs = 
  List.fold_left (fun acc s -> acc ^ (string_of_value s)) "" vs

(* string_of_env : value Env.t -> string *)
let string_of_env env =
  sprintf "*** Environment :%s*** End of environment\n"
    (List.fold_left (fun acc (k, v) ->
      sprintf "%s\n%s -> %s" acc k (string_of_value v))
       "" (Env.bindings env))

(* eval_expr : value Env.t -> Fsafe.typed_expression -> value *)
let rec eval_expr env e =
  match e.e with
    | EVar v ->
      Env.find v env
    | EConApp (dc, _, es) -> 
      let es' = List.map (eval_expr env) es in
      Cons (dc, es')
    | ELet (ls, es) ->
      let env' = List.fold_left
	(fun ev ((v,_), e) -> Env.add v (eval_expr env e) env) env ls in
      eval_expr env' (List.hd es)
    | EAbs (_, args, e) -> 
      Fun ("", List.map fst args, e)
    | EApp (f, _, es) ->
      let es' = List.map (eval_expr env) es in
      begin match Env.find f env with
	| Fun (_, vs, e) ->
	  begin try
	    let env' = List.fold_left2
	      (fun env v e -> Env.add v e env) env vs es' in
	    eval_expr env' e
	  with Invalid_argument _ -> failwith "Bad number of arguments";
	  end
	| _ -> failwith "Only abstraction can be applied"
      end
    | ECase (es, ps) -> 
      match eval_expr env (List.hd es) with
	| Cons (dc, args) -> eval_match env dc args ps
	| _ -> failwith "Pattern matching cannot occur on an abstraction"
(* eval_match : value Env.t -> Fsafe.data_constructor ->
   value list -> Fsafe.pattern list -> value *)
and eval_match env dc args ps =
  let rec f ps =
    match ps with
      | [] -> failwith "No matching pattern found"
      | (Pattern (fs, e)) :: ps ->
	begin match List.hd fs with
	  | PConApp (cstr, _, fls) ->
	    if compare cstr dc <> 0 then
	      f ps
	    else
	      let env' = List.fold_left2 
		(fun env v e -> Env.add v e env) env
		(List.map (fun x -> match x with
		  | PVar (v, _) -> v
		  | _ -> failwith "Non-flat pattern to be implemented") fls)
		args
	      in eval_expr env' e
	  | PVar (v, _) -> failwith "Non-flat pattern to be implemented"
	end
  in f ps


let rec assoc env vars exps = 
  match vars,exps with
    | [],[] -> env
    | [],_ | _,[] -> failwith "error in number of arguments"
    | (v,_)::vs,e::es ->  assoc (Env.add v (eval_expr env e) env) vs es
 

(* build_env : value Env.t -> Fsafe.global_definition -> value Env.t *)
let rec build_env env def =
  match def with
    | GDef ((varname, _), exp) ->
      begin match exp.e with
	| EAbs (_, params, exp) ->
	  Env.add varname (Fun (varname, List.map fst params, exp)) env
	| _ -> failwith "GlobalDef must be an abstraction definition"
      end
    | GRecDef (typvars,exp) ->
      begin match exp.e with
	| ELet(ls, es) ->  
	  let env' = List.fold_left
	    (fun ev ((v,_), e) -> 
	      match e.e with
		| EAbs (_, params, exp) ->
		  Env.add v (Fun (v, List.map fst params, exp)) ev
		| _ -> failwith "GlobalDef must be an abstraction definition"
	    )
	    env ls in
	  assoc env' typvars es
	    
	| _ -> failwith "GlobalDef must be an abstraction definition"
      end
      
(* interpret : Fsafe.fsafe -> () *)
let interpret ast =
  let env = List.fold_left build_env Env.empty ast.globals in
  let values = List.fold_left
    (fun acc e -> acc @ [eval_expr env e]) [] ast.entry in
  printf "%s" (string_of_values values)
