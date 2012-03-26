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
(* File        : callgraph.ml                                                *)
(* Description : callgraph and termination stuff                             *)
(*                                                                           *)
(*****************************************************************************)

open Relationmatrix
open Fsafe
open Printf
open Utils
open Pprinter

(* callgraph structure : maps a function name to a list of edges *)
module CallGraph = Map.Make(
struct 
  type t = string
  let compare = String.compare
end);;

type  in_param = string 
type out_param = string 
(* called function name * ( calling function args * called function args * 
   relation matrix beetween calling and called function) *)
type edge = string * in_param list * out_param list * relationmatrix

(* tree type for deconstructions detections *)
type tree = 
  | Node of string * tree list

(* string_of_calls : string -> (string * 'a * 'b * 'c) list -> string *)
let rec string_of_calls f = function 
  | [] ->""
  | (g,_,_,_) :: rest -> " ( "^ f^ " -> "^ g ^" ) " ^(string_of_calls f rest)

(* string * 'a * 'b *'c) list CallGraph.t -> string *)
let string_of_callgraph callgraph = 
  let rec string_of_keys = function 
    | [] ->""
    | (f,calls) :: rest ->
      "  "^ f^ " => { " ^(string_of_calls f calls)^" }\n"
      ^ (string_of_keys rest)
  in string_of_keys (CallGraph.bindings callgraph)

(* init_tree : (string * 'a) list -> tree *)
let init_tree ip =
  Node("", (List.map (fun (v, _) -> Node(v, [])) ip))

(* add_child : tree -> string -> string -> tree *)
let rec add_child t x n =
  match t with
    | Node(p, ls) when p = x -> Node(p, Node(n, [])::ls)
    | Node(p, ls) -> Node(p, List.map (fun l -> add_child l x n) ls)

(* get_relation : tree -> string -> string ->
   Relationmatrix.relation option *)
let get_relation t x n =
  if x = n then Some Eq else
    let rec g l flg =
      match l with
	| [] -> None
	| h::t -> begin match f h flg with
	    | None -> g t flg
	    | Some r -> Some r
	end
    and f t flag =
      match t with
	| Node(p, _) when p = n -> Some flag
	| Node(p, ls) when p = x -> g ls Inf
	| Node(_, ls) -> g ls flag
    in f t Unknown

(* look_for_call : Fsafe.typed_expression -> Fsafe.variable list *)
let rec look_for_call e =
    match e.e with
      | EConApp(_, _, es) ->
	List.fold_left (fun acc e -> (look_for_call e)@acc) [] es
      | ELet(a, b) -> 
	(List.fold_left
	   (fun acc (_,exp) -> (look_for_call exp)@acc) 
	   [] a)
	@ (List.flatten(List.fold_left
			  (fun acc b -> look_for_call b :: acc) [] b))
      | EApp(f, _, es) -> 
	List.fold_left (fun acc e -> (look_for_call e)@acc) [(f,es)] es
      | ECase(es, fs) ->
	(List.fold_left (fun acc e -> (look_for_call e)@acc) [] es)
	@ (List.fold_left
	     (fun acc (Pattern(_,e)) -> (look_for_call e)@acc) [] fs)
      | _ -> []

(* dot_of_callgraph : (string * 'a * 'b * Relationmatrix.relationmatrix)
   list CallGraph.t -> () *)
let dot_of_callgraph graph =
  let oc = open_out "callgraph.dot" in
  fprintf oc "digraph Callgraph {\n";
  CallGraph.iter (fun k _ -> fprintf oc "\"%s\" [ fontcolor=blue ]\n" k) graph;
  CallGraph.iter (fun k ls -> 
    List.iter (fun (l, _, _, m) -> 
      fprintf oc "\"%s\" -> \"%s\" [ label=\"%s\",fontcolor=red ]" k l
	(string_of_relationmatrix' m)) ls) graph;
  fprintf oc "}\n";
  close_out oc

(* build_cg_of_t :
   Fsafe.fsafe ->
   Fsafe.global_definition list ->
   (Fsafe.variable * Fsafe.parameter list * Fsafe.variable list *
   Relationmatrix.relationmatrix)
   list CallGraph.t ->
   (Fsafe.variable* Fsafe.typed_expression list) ->
   (Fsafe.variable * Fsafe.parameter list * Fsafe.variable list *
   Relationmatrix.relationmatrix)
   list CallGraph.t *)
let rec build_cg_of_f ast globals callgraph (f,fparams) = 
  match globals with 
    | [] -> callgraph
    | GDef((name,_),e) :: _ when name = f ->
      Printf.printf "%s is found\n" f;
      begin match e.e with
	| EAbs(_,ip,e) ->    
	  let tree =  init_tree ip in
	  let (calls,newcg) = 
	    (look_for_call'' e tree (List.map (fun (v, _) -> v) ip) 
	       (CallGraph.add f [] callgraph) ast.globals ast  fparams)
	  in 
	  CallGraph.add f calls newcg
	| _ -> callgraph
      end 
    | GRecDef(v,e):: rest  -> 
      begin
	match e.e with 
	  | ELet(assigns,values) -> 
	    let rec look_in_assigns f = function 
	      | [] -> callgraph
	      | ((var,_),exp)::_ when var = f -> 
		begin
		  match exp.e with
		    | EAbs(_,ip,e)  ->
		      let tree =  init_tree ip in
		      let (calls,newcg) = 
			(look_for_call'' e tree 
			   (List.map (fun (v, _) -> v) ip) 
			   (CallGraph.add f [] callgraph)
			   globals ast fparams)
		      in   
		      CallGraph.add f calls newcg
		    | _ -> callgraph
		end
	      | _ ::rest -> look_in_assigns f rest 
	    in    
	    let rec look_for_rec = function
	      | ((v,_)::_,e::_) when v = f ->  
		begin	match e.e with
		  | EAbs(_,ip,e) ->
		    let tree =  init_tree ip in
		    let (calls,newcg) = 
		      (look_for_call'' e tree 
			 (List.map (fun (v, _) -> v) ip) 
			 (CallGraph.add f [] callgraph)
			 globals ast fparams)
		    in 
		    CallGraph.add f calls newcg
		  | EVar(s) ->
		    let newcg =  look_in_assigns s assigns in
		    CallGraph.add f [(s,[],[],Relationmatrix.empty 0 0)] newcg
		  | _ -> callgraph
		end
	      | (_::rest,e::rest') ->
		begin
		  match e.e with 
		    | EVar(s) when s=f -> look_in_assigns s assigns
		    | _ -> look_for_rec (rest,rest')
		end
	      | ([],[]) -> callgraph
	      | _ -> failwith "should not happen"
	    in   
	    look_for_rec (v,values)
	  | _ -> build_cg_of_f ast rest callgraph (f,fparams)
      end
    | _::rest -> build_cg_of_f ast rest callgraph (f,fparams)

(* look_for_call'' :
   Fsafe.typed_expression ->
   tree ->
   Fsafe.parameter list ->
   (Fsafe.variable * Fsafe.parameter list * Fsafe.variable list *
   Relationmatrix.relationmatrix)
   list CallGraph.t ->
   Fsafe.global_definition list ->
   Fsafe.typed_expression ->
   (Fsafe.variable * Fsafe.parameter list * Fsafe.variable list *
   Relationmatrix.relationmatrix)
   list *
   (Fsafe.variable * Fsafe.parameter list * Fsafe.variable list *
   Relationmatrix.relationmatrix)
   list CallGraph.t *)
and look_for_call'' expr t ip cg glob ast fparams = 
  let rec look_for_call'' expr t ip cg =
    let rec callsinexprlist exprlist cg =
      match exprlist with 
	| [] -> ([],cg)
	| e :: rest -> 
	  let (calls,newcg) = look_for_call'' e t ip cg in
	  let (restcalls,restcg) = callsinexprlist rest newcg in
	  (calls @ restcalls , restcg) in
    match expr.e with 
      | EConApp(_,_,es) -> callsinexprlist es cg
      | ELet (assignlist,es) -> 
	let rec callinassigns  cg = function 
	  | [] -> ([],cg)
	  | ((assign,_),exp):: rest -> 
	    match (exp.e,exp) with 
	      | (EAbs(_,ip,e),_) ->	       
		let tree =  init_tree ip in
		let (calls,newcg) = 
		  look_for_call'' e tree (List.map (fun (v, _) -> v) ip) 
		    (CallGraph.add assign [] cg) in
		let newcg_withcalls = CallGraph.add assign calls newcg in
		let (restcalls,restcg) = callinassigns newcg_withcalls rest in 
		(restcalls,restcg)
	      | (_,e) ->let (ecalls,ecg) =  look_for_call'' e t ip cg in
			let (restcalls,restcg) = callinassigns ecg rest in 
			(ecalls@restcalls,restcg)
	in
	let (assigncalls,assigncg) = callinassigns cg assignlist in
	let (bodycalls,bodycg) = callsinexprlist es assigncg in 
	(assigncalls@bodycalls,bodycg)
      | EApp(f, _, es) -> 
	let (paramcalls,paramcg) = callsinexprlist es cg 
	in
	let rec check_fname ip fparams =
	  if List.mem f ip then 
	    match (ip,fparams) with 
	      | (name::_,exp::_) when name = f -> 
		begin	  match exp.e with 
		  | EVar s -> s
		  | _ -> "only function as variables are handled, lambdas can be there ...)"
		end
	      | (_::rest,_::rest') -> check_fname rest rest'
	      | ([],[]) -> failwith "should not happen, f must have been in list"
	  else
	    f
	in
	let actualname = check_fname ip fparams in
	let treat_app =
	  let op = List.map (fun e -> match e.e with
	    | EVar s -> s
	    | EApp(f,_,_) -> f 
	    | _ -> "anotherexp") es in
	  let m = empty (List.length ip) (List.length op) in


	  Printf.printf "matrice dim is %d %d \n" (List.length ip) (List.length op);  
	  for i = 0 to m.nb_l - 1 do
	    for j = 0 to m.nb_c - 1 do
	      Printf.printf "matrice dim is %d %s %d %s\n" i (List.nth op i) j (List.nth ip j);
	      m.data.(j).(i) <-
		match get_relation t (List.nth ip j) (List.nth op i) with
		  | None -> Unknown
		  | Some s -> s
	    done;
	  done;
	  	Printf.printf "matrice is %s \n" (string_of_relationmatrix' m);
	  [(actualname, ip, op, m)]@paramcalls
	in
       
	if CallGraph.mem actualname cg then
	  (treat_app, paramcg)
	else 
	  (treat_app,build_cg_of_f ast glob paramcg (actualname,es) ) 
      | ECase(es, fs) ->
	let p = match (List.hd es).e with
	  | EVar s -> s
	  | _ -> failwith "expression in match not supported" in
	let cs = 
	  let rec lookforcall_filter acc = function  
	    | PVar(v, _) -> v::acc
	    | PConApp(_, _, ls) ->
	      let cs1 = List.fold_left lookforcall_filter [] ls
	      in
	      cs1
	  in 
	  let lookforcall_pattern acc = function
	    | Pattern(p,_) 	 ->
	      match p with
		| [] -> acc
		| PConApp(_, _, ls)::rest ->
		  let cs1 = List.fold_left lookforcall_filter [] ls
		  in
		  cs1 @ (List.fold_left lookforcall_filter acc rest) 
		| _ -> failwith 
		  "weird patterns in deconstruction not supported"
	  in
	  List.fold_left lookforcall_pattern [] fs
	    
	in
 	let t' = List.fold_left (fun t c -> add_child t p c) t cs in
	(List.fold_left (fun (acc,cg) (Pattern(_,e)) -> 
	  let (calls,newcg)= look_for_call'' e t' ip cg
	  in (calls@acc,
	      (CallGraph.fold (fun f calls cg -> CallGraph.add f calls cg)
		 newcg cg) )) ([],cg) fs)
      | _ -> ([],cg)
  in
  look_for_call'' expr t ip cg

(* build_callgraph :
   Fsafe.fsafe ->
   Fsafe.variable list ->
   (Fsafe.variable * Fsafe.parameter list * Fsafe.variable list *
   Relationmatrix.relationmatrix)
   list CallGraph.t ->
   (Fsafe.variable * Fsafe.parameter list * Fsafe.variable list *
   Relationmatrix.relationmatrix)
   list CallGraph.t *)
let rec build_callgraph ast mainfuns cg  = 
  match mainfuns with
    | [] ->   cg
    | (mainfun,fparams) :: rest ->
      Printf.printf "build callgraph of %s and fparams is %s \n" mainfun ( List.fold_left 
      (fun acc e -> acc ^ (string_of_typed_expression e) ^ "\n\n")
      "\n" fparams); 
      build_callgraph ast rest (build_cg_of_f ast ast.globals cg (mainfun,fparams))
