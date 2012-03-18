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
  
type result = Cons of string * result list
    
type value = 
  | Var of expression 
  | Fun of value Env.t * string list * expression
      
let rec string_of_exp exps =
  match exps with 
    | [] -> ""
    | Cons (constname,exprs) :: es-> 
      let s = 
	(match exprs with
	    [] -> " " 
	  | e :: [] -> string_of_exp [e] 
	  | e :: tl -> string_of_exp [e] ^ "," ^ string_of_exp tl )
      in constname ^ "(" ^ s ^ ")" ^ string_of_exp es
      
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
	  let envlocal = Env.add varname 
	    (Fun (env,var_of_params params, exp.e)) env in
	  Env.add varname (Fun (envlocal, var_of_params params, exp.e)) env
	| _ -> 
	  Env.add varname (Var exp.e) env)
    | GRecDef (vars,exps) -> failwith "not yet implemented: mutual recursion"
      
let rec assoc_param_exp x y env = 
  match (x,y) with
      ([],_) -> env
    | (_,[]) -> env
    | (h1::tl1,h2::tl2) ->  Env.add h1 (Var h2.e) (assoc_param_exp tl1 tl2 env)

let rec var_of_patterns patter =
  match patter with
    | PVar (s,_) :: t -> s::var_of_patterns t
    | _ -> []
      
let rec assoc_param_pattern filters exprs env =  
  match filters, exprs with
    | [],[] -> env
    | [],_ | _, [] -> failwith "case: number of parameters"
    | PVar (var, _)::tl1, hd::tl2 ->  
      assoc_param_pattern tl1 tl2 (Env.add var (Var hd.e) env)
    | PConApp (cons1, a_typs, pats)::tl1,hd::tl2 -> 
      match hd.e with 
	| EConApp(cons2,_,exps) ->  
	  if (cons1 = cons2) then 
	    (assoc_param_pattern tl1 tl2  (assoc_param_pattern pats exps env))
	  else failwith "interpret.assoc_pattern2"
	| ELet _ -> printf "elet_assoc_pat\n"; env
	| EAbs _ -> printf "eabs_assoc_pat\n"; env
	| EApp _ -> printf "eapp_assoc_pat\n"; env
	| ECase _ -> printf "ecase_assoc_pat\n"; env
	| EVar a -> (*printf "evar_assoc_pat\n";*)
	  Env.add a (Var hd.e) env




let rec compare_pattern filters exprs env=
  match filters, exprs with
    | [],[] -> true
    | [],_ | _, [] -> false
    | PVar (var, _)::tl1, _::tl2 -> compare_pattern tl1 tl2 env
    | PConApp (cons1, a_typs, pats)::tl1,hd::tl2 -> 
      match hd.e with 
	| EConApp(cons2,_,exps) ->  
	  if (cons1 = cons2) then 
	    (compare_pattern pats exps env)&&(compare_pattern tl1 tl2 env)
	  else false 
	| EVar v -> (*printf "evar\n"; *)
	  let rec g env v = 
	    try
	      let exp =  Env.find v env in
	      match exp with
		| Fun (_,_,EConApp (dc,_,_))
		| Var (EConApp (dc,_,_)) -> printf "%B\n" (dc = cons1); 
		  if dc = cons1 then true else false
		| Var EVar a -> printf "var evar\n"; g env a
		| Fun (_,_,EVar dc) -> printf "fun Evar\n"; false
		| Fun (_,_,ELet _) -> printf "fun elet\n"; false
		| Fun (_,_,EAbs _) -> printf "fun eabs\n"; false
		| Fun (_,_,EApp _) -> printf "fun eapp\n"; false
		| Fun (_,_,ECase _) -> printf "fun ecase\n"; false
		| Var ELet _ -> printf "var elet\n"; false
		| Var EAbs _ -> printf "var eabs\n"; false
		| Var EApp _ -> printf "var eapp\n"; false
		| Var ECase _ -> printf "var ecase\n"; false 
	    with Not_found -> printf "not found"; false in
	  g env v
	| ELet _ -> printf "elet\n"; false
	| EAbs _ -> printf "eabs\n"; false
	| EApp _ -> printf "eapp\n"; false
	| ECase _ -> printf "ecase\n"; false

let env_size env = 
  let bindings = Env.bindings env in
  List.length bindings

let eval_exprs env l exp = 
  let rec eval_exp env exp =
    (*printf "eval_exp: env size %d\n" (env_size env);*)
    (*Env.iter (fun key elt -> printf "%s\n" key; (ignore elt)) env;*)
    match exp with 
      | EConApp (constname,_,exprs) -> 
	Cons (constname,List.map (eval_exp env) (not_annotated_exprs exprs))
      | EVar (leaf) ->
	begin 
	  try 
	    let v = Env.find leaf env in 
	    match v with 
	      | Var (exp) -> eval_exp env exp
	      | Fun (envlocal,_,exp) -> eval_exp envlocal exp
	  with Not_found -> failwith "variable without value"
	end
      | EAbs (_,_,_) -> failwith "interpret.eval_exprs" 
      | EApp (funname,_,exps) -> 
	begin
	  try 
	    (*printf "case EApp, function name: %s\n" funname; *)
	    (*Env.iter (fun key elt -> printf "%s\n" key; (ignore elt)) env;*)
	    let v = Env.find funname env in
	    match v with 
	      | Fun (envlocal, params, exp) -> 
		(ignore (Env.add funname (Fun (envlocal,params,exp)) envlocal));
		eval_exp (assoc_param_exp params exps envlocal) exp
	      | Var e -> printf "c'est une var\n"; eval_exp env  e
		(*;failwith "the parameter is not a function"*)
	  with Not_found -> failwith "function not declared"
	end
      | ECase (exps,patterns) -> 
	begin
	  match patterns with
	    | [Pattern (filters,expr)] -> 
	      if compare_pattern filters exps env then
		eval_exp (assoc_param_pattern filters exps env) expr.e
	      else failwith "pattern NOT found"
	    | (Pattern (filters,expr))::tl2 -> 
	      if compare_pattern filters exps env then 
		eval_exp (assoc_param_pattern filters exps env) expr.e
	      else eval_exp env (ECase(exps,tl2))
	    | [] -> failwith "empty case"
	end
      | ELet (_,_) -> failwith "interpret.eval_exprs"
  in (eval_exp env exp) :: l


  
(* interpret : ?? -> ?? *)
let interpret ast =
  let env = List.fold_left env_cons Env.empty ast.globals in
  Env.iter (fun key elt -> printf "%s\n" key; (ignore elt)) env;
  let exps = List.fold_left (eval_exprs env) [] (not_annotated_exprs ast.entry) in
  printf "%s\n" (string_of_exp exps)
