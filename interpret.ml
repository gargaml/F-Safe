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

module Env = Map.Make(
  struct 
    type t = string
    let compare = String.compare
  end)
  
type expr = Constant of string * expr list
	    | Vide
		
type value = 
  | Cons of expression 
  | Fun of value Env.t * string list * expression
  | Empty 
      
let rec exp_to_string exps =
  match exps with 
    | [] -> ""
    | Constant (constname,exprs) :: es-> 
      let s = (match exprs with
	  [] -> " " 
	| e :: [] -> exp_to_string [e] 
	| e :: tl -> exp_to_string [e] ^ "," ^ exp_to_string tl )
      in constname ^ "(" ^ s ^ ")\n" ^ exp_to_string es 
    | _ -> ""
      
let rec var_of_params params =
  match params with 
      [] -> []
    | (var,_) :: tl ->  var :: (var_of_params tl)
      
let rec not_annotated_exprs = function
  | [] -> []
  | hd :: tl -> hd.e :: not_annotated_exprs tl 
    
let rec env_cons env def = 
  match def with 
    | GDef ((varname,_),exp) -> 
      (match exp.e with 
	| EAbs (_,params,exp) -> 
	  Env.add varname (Fun (env, var_of_params params, exp.e)) env
	| _ -> 
	  Env.add varname (Cons exp.e) env)
    | GRecDef (vars,exps) -> failwith ""
      
let rec assoc_param_exp x y env = 
  match (x,y) with
      ([],_) -> env
    | (_,[]) -> env
    | (h1::tl1,h2::tl2) ->  Env.add h1 (Cons h2.e) (assoc_param_exp tl1 tl2 env)
      
let rec compare_pattern filters exprs =
  match filters, exprs with
    | [],[] -> true
    | [],_ | _, [] -> false
    | PVar (var, _)::tl1, _::tl2 -> compare_pattern tl1 tl2
    | PConApp (cons1, a_typs, pats)::tl1,hd::tl2 -> 
      match hd.e with 
	| EConApp(cons2,_,exps) ->  
	  if (cons1 = cons2) then 
	    (compare_pattern pats exps)&&(compare_pattern tl1 tl2)
	  else false 
	| _ -> false 
	  
let rec assoc_param_pattern filters exprs env=  
  match filters, exprs with
    | [],[] -> env
    | [],_ | _, [] -> failwith "interpret.assoc_pattern1"
    | PVar (var, _)::tl1, hd::tl2 ->  
      assoc_param_pattern tl1 tl2 (Env.add var (Cons hd.e) env)
    | PConApp (cons1, a_typs, pats)::tl1,hd::tl2 -> 
      match hd.e with 
	| EConApp(cons2,_,exps) ->  
	  if (cons1 = cons2) then 
	    (assoc_param_pattern pats exps (assoc_param_pattern tl1 tl2 env))
	  else failwith "interpret.assoc_pattern2"
	| _ -> failwith "interpret.assoc_pattern3"

let eval_exprs env l exp = 
  let rec eval_exp env exp =
    match exp with 
	EConApp (constname,_,exprs) -> 
	  Constant (constname,List.map (eval_exp env) (not_annotated_exprs exprs))
      | EVar (leaf) -> 
	(try 
	   let v = Env.find leaf env in 
	   match v with 
	     | Cons (exp) -> eval_exp env exp
	     | Fun (envlocal,_,exp) -> eval_exp envlocal exp
	     | _ -> failwith ""
	 with Not_found -> failwith "interpret.exp_to_string: variable sans valeur")
      | EAbs (_,_,_) -> failwith "interpret.eval_exprs" 
      | EApp (funname,_,exps) -> 
	(try 
	   let v = Env.find funname env in
	   (match v with 
	     | Fun (envlocal, params, exp) ->
	       eval_exp (assoc_param_exp params 
			   exps
			   envlocal) exp
	     | _ -> failwith "function not declared")
	 with Not_found -> failwith "function not declared")
      | ECase (exps,patterns) -> 
	(match patterns with
	  | (Pattern (filters,expr))::tl2 -> 
	    if (compare_pattern filters exps) then 
	      eval_exp (assoc_param_pattern filters exps env) expr.e
	    else eval_exp env (ECase(exps,tl2))
	  | [] -> Vide) 
      | _ -> failwith "interpret.eval_exprs"
  in (eval_exp env exp) :: l
  
(* interpret : ?? -> ?? *)
let interpret ast =
  let env = List.fold_left env_cons Env.empty ast.globals in
  let exps = List.fold_left (eval_exprs env) [] (not_annotated_exprs ast.entry) in
  exp_to_string exps
    





