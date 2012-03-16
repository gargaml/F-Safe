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
  end);;

type expr = Constant of string * expr list
	    | Vide
		
type value = 
    Var of expression
  | Fun of Env * string list * expression
(*  | Case of Env * expression lis * expression*)
  | Empty 
      
let rec exp_to_string exps =
  match exps with 
      [] -> ""
    | Vide -> ""
    | Constant (constname,exprs) :: es-> 
      let s = (match exprs with
	  [] -> " " 
	| e :: [] -> exp_to_string [e] 
	| e :: tl -> exp_to_string [e] ^ "," ^ exp_to_string tl )
      in constname ^ "(" ^ s ^ ")\n" ^ exp_to_string es 
      
let rec var_of_params params =
  match params with 
      [] -> []
    | APar (var,_) :: tl ->  var :: (var_of_params tl)
      
let rec env_cons env def = 
  match def with 
      DVar (AVar(varname,_), ELambda(_,param,_,exp)) -> 
	Env.add varname (Fun (var_of_params [param],exp)) env
    | DVar (AVar(varname,_),exp) -> Env.add varname (Var exp) env
    | DVars (_,DLocal _,_) -> failwith "interpret.env_cons"
    | DFun (funname,_,params,_,exp) ->
      (Env.add funname
	 (Fun (List.fold_left (fun e elt -> Env.add elt Empty e ) 
		 env (var_of_params params)),(var_of_params params),exp) env)


let rec assoc_param_exp x y env = 
 match (x,y) with
     ([],_) -> env
   | (_,[]) -> env
   | (h1::tl1,h2::tl2) ->  Env.add h1 h2 (assoc_param_exp tl1 tl2)

let eval_exprs env l exp = 
  let rec eval_exp env exp =
    match exp with 
	EConstant (constname,_,exprs) -> 
	  Constant (constname,List.map (eval_exp env) exprs)
      | EVar (leaf) -> 
	(try 
	   let v = Env.find leaf env in 
	   match v with 
	       Var (exp) -> eval_exp env exp
	     | Fun (_,exp) -> eval_exp env exp
	 with Not_found -> failwith "interpret.exp_to_string: variable sans valeur")
      | ELambda (_,_,_,_) -> failwith "interpret.eval_exprs" 
      | ECall (funname,_,exps) -> 
	try 
	  let v = Env.find funname env in
	  (match v with 
	    | Fun (envlocal, params, exp) -> 
	      eval_exp (assoc_param_exp params exps envlocal) exp
	    | _ -> failwith "function not declared")
      | ECase (exps,filters) ->
	(match filters with
	  | Filter (pat,expr)::tl2 -> 
	    if (compare_pattern pat exps) then eval_exp (assoc_param_pattern exps pat env) expr
	    else eval_exp env ECase(exps,tl2)
	  | [] -> Vide) 
      | _ -> failwith "interpret.eval_exprs"
  in (eval_exp env exp) :: l
  
  
let assoc_param_pattern exps pat env=  
  match exp with 
      Evar (leaf) -> Env.
	
  
let compare_pattern pattern exprs
    match pattern with
	PVar (var, _) -> 
      | PCons (cons, a_typs, pats)::patterns->


(* interpret : ?? -> ?? *)
let interpret ast =
  let env = List.fold_left env_cons Env.empty ast.globals in
  let exps = List.fold_left (eval_exprs env) [] ast.entry in
  exp_to_string exps






