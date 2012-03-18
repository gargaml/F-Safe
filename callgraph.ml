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


type tree = 
  | Node of string * tree list

  let rec  string_of_calls f = function 
    | [] ->""
    | (g,_,_,_) :: rest -> " ( "^ f^ " -> "^ g ^" ) " ^(string_of_calls f rest)


let string_of_callgraph callgraph = 

  let rec string_of_keys = function 
    | [] ->""
    | (f,calls) :: rest -> "  "^ f^ " => { " ^(string_of_calls f calls)^" }\n" ^ (string_of_keys rest)
  in string_of_keys (CallGraph.bindings callgraph )
let init_tree ip =
  Node("", (List.map (fun (v, _) -> Node(v, [])) ip))

let rec add_child t x n =
  match t with
    | Node(p, ls) when p = x -> Node(p, Node(n, [])::ls)
    | Node(p, ls) -> Node(p, List.map (fun l -> add_child l x n) ls)

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

let rec look_for_call e =
    match e.e with
      | EConApp(_, _, es) ->
	List.fold_left (fun acc e -> (look_for_call e)@acc) [] es
      | ELet(a, b) -> 
	(List.fold_left
	   (fun acc (_,exp) -> (look_for_call exp)@acc) 
	   [] a)
	@ (List.flatten(List.fold_left (fun acc b -> look_for_call b :: acc) [] b))
      | EApp(f, _, es) -> 

	List.fold_left (fun acc e -> (look_for_call e)@acc) [f] es
      | ECase(es, fs) ->
	(List.fold_left (fun acc e -> (look_for_call e)@acc) [] es)
	  @ (List.fold_left
	       (fun acc (Pattern(_,e)) -> (look_for_call e)@acc) [] fs)
      | _ -> []
(*
let rec look_for_call' e t ip =
    match e.e with
      | EConApp(_, _, es) ->
	List.fold_left (fun acc e -> (look_for_call' e t ip)@acc) [] es
      | ELet(a, b) ->
	(List.fold_left
	   (fun acc (_,exp) -> (look_for_call' exp t ip)@acc) 
	   [] a)
	@ (List.flatten(List.fold_left (fun acc b-> look_for_call' b t ip :: acc) [] b))
     
      | EApp(f, _, es) -> 
	let op = List.map (fun e -> match e.e with
	  | EVar s -> s
	  | _ -> failwith "expression in call not supported") es in
	let m = empty (List.length ip) (List.length op) in
	for i = 0 to m.nb_l - 1 do
	  for j = 0 to m.nb_c - 1 do
	    m.data.(j).(i) <-
	      match get_relation t (List.nth ip j) (List.nth op i) with
		| None -> Unknown
		| Some s -> s
	  done;
	done;
	[(f, ip, op, m)]
      | ECase(es, fs) ->
	let p = match (List.hd es).e with
	  | EVar s -> s
	  | _ -> failwith "expression in match not supported" in
	let cs = 
	  let rec lookforcall'_filter acc = function  
	    | PVar(v, _) -> v::acc
	    | _ -> failwith 
	      "nested pattern in deconstruction not supported"
	  in 
	  let rec lookforcall'_pattern acc = function
	    | Pattern(p,_) 	 ->
	      match p with
		| [] -> acc
		| PConApp(_, _, ls)::rest ->
		  let cs1 = List.fold_left lookforcall'_filter [] ls
		    in
		    cs1 @ (List.fold_left lookforcall'_filter acc rest) 
		  | _ -> failwith 
		    "weird patterns in deconstruction not supported"
	  in
	  List.fold_left lookforcall'_pattern [] fs
	    
	in
	let t' = List.fold_left (fun t c -> add_child t p c) t cs in
	(List.fold_left (fun acc (Pattern(_,e)) -> (look_for_call' e t' ip)@acc) [] fs)
      | _ -> []

let build_callgraph fsafe fs =
  let build f =
    let vd = List.hd (List.filter (fun x ->
      match x with
	| GDef((v,_), _) when v = f -> true
	| GRecDef(v,_) -> 
	  let rec find_recdef = function
	    | [] -> false 
	    | (v,_):: rest -> if v = f then true else find_recdef rest
	  in
	  find_recdef v
	| _ -> false) fsafe.globals) in
    match vd with
      | GDef(_,e) ->
	begin match e.e with
	  | EAbs(_,ip,e) ->
	     let tree =  init_tree ip in
	     look_for_call' e tree (List.map (fun (v, _) -> v) ip)
	  | _ -> []
	end
      | GRecDef(v,e) ->	
	Printf.printf "In Grecdef with f = %s\n" f;
	match (e.e) with
	  | ELet (vi,es) ->
	    Printf.printf "In Elet\n";
	    begin
	      match (v,es) with 		
	      | ((v,_)::_,e::_) when v = f ->  
		Printf.printf "Var trouvée %s\n" v;
		begin	match e.e with
		  | EAbs(_,ip,e) ->
		    let tree =  init_tree ip in
		    look_for_call' e tree (List.map (fun (v, _) -> v) ip)
		  | EVar (v) -> let rec find_local var locals =
				      match locals with 
					| [] -> []
					| ((v,_),(e)) :: _ when v = var ->
					  Printf.printf "%s la var est bien detectée\n" var;
					  begin	  match e.e with
					    | EAbs(_,ip,e) ->
					      let tree =  init_tree ip in
					      look_for_call' e tree (List.map (fun (v, _) -> v) ip)
					    | _ -> []
					  end
					| _ :: rest -> find_local var rest
				    in	 
				Printf.printf "%s la var va etre cehrchée\n" v;
				    find_local v vi
		  |_ -> []
		end
	      | _ -> []
	    end
	  | _ -> []
	      

  
  
  in
  List.fold_left (fun acc f ->
    let edges = build f in
    CallGraph.add f edges acc) CallGraph.empty fs
    
*)
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

 let rec build_cg_of_f ast globals callgraph f = 
   Printf.printf "building callgraph of %s\n" f;
    match globals with 
      | [] -> callgraph
      | GDef((name,_),e) :: _ when name = f -> 
	begin match e.e with
	  | EAbs(_,ip,e) ->     Printf.printf "creating calls of %s\n" f; 
	    let tree =  init_tree ip in
	    let (calls,newcg) = 
	      (look_for_call'' e tree (List.map (fun (v, _) -> v) ip) 
		 (CallGraph.add f [] callgraph) ast.globals ast)
	    in 
	    Printf.printf "new Callgraph of %s is %s need to add %s \n" f (string_of_callgraph newcg) (string_of_calls f calls);
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
			 ast.globals ast)
		    in   
		    Printf.printf "new Callgraph of %s is %s need to add %s \n" f (string_of_callgraph newcg) (string_of_calls f calls);
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
				 ast.globals ast)
			    in 
			    Printf.printf "new Callgraph of %s is %s need to add %s \n" f (string_of_callgraph newcg) (string_of_calls f calls);
			    CallGraph.add f calls newcg
			     
			  | EVar(s) ->let newcg =  look_in_assigns s assigns
				      in
				      CallGraph.add f [(s,[],[],Relationmatrix.empty 0 0)] newcg
			  | _ -> callgraph
		end
	      | (_::rest,e::rest') ->
		begin
		  match e.e with 
		    |EVar(s) when s=f -> look_in_assigns s assigns
		    | _ -> look_for_rec (rest,rest')
		end
	      | ([],[]) -> callgraph
	      | _ -> failwith "should not happen"
	    in   
	    look_for_rec (v,values)
	  | _ -> build_cg_of_f ast rest callgraph f
	end
	  | _::rest -> build_cg_of_f ast rest callgraph f
      
 and look_for_call'' expr t ip cg glob ast = 
   let rec look_for_call'' expr t ip cg = 
 
     let rec callsinexprlist exprlist cg =
       match exprlist with 
	 | [] -> ([],cg)
	 | e :: rest -> 
	   let (calls,newcg) = look_for_call'' e t ip cg in
	   let (restcalls,restcg) = callsinexprlist rest newcg in
	   
	   (calls @ restcalls , restcg) in
    (* let (calls,newcg) = 
       (List.fold_left (fun acc e -> look_for_call'' e t ip cg :: acc) [] exprlist*)
     match expr.e with 
       | EConApp(_,_,es) when es != [] -> callsinexprlist es cg
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
	 Printf.printf "%s find in function\n" f;
	 let treat_app =
	(*   let calls = List.map (fun e -> look_for_call'' e t ip cg) es in*)
	   let op = List.map (fun e -> match e.e with
	     | EVar s -> s
	     | _ -> "anotherexp") es in
	   let m = empty (List.length ip) (List.length op) in
	   for i = 0 to m.nb_l - 1 do
	     for j = 0 to m.nb_c - 1 do
	       m.data.(j).(i) <-
		 match get_relation t (List.nth ip j) (List.nth op i) with
		   | None -> Unknown
		   | Some s -> s
	     done;
	   done;
	   [(f, ip, op, m)](*@calls*)
	 in
	 if CallGraph.mem f cg then	   

	   
	   begin
	     Printf.printf "%s was in callgraph\n" f;
	     (treat_app, cg)
	   end

	 else 
	   begin
	     Printf.printf "%s was not in callgraph\n" f;
	     (treat_app,build_cg_of_f ast glob cg f ) 
	   end
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
	  in (calls@acc,(CallGraph.fold (fun f calls cg -> CallGraph.add f calls cg) newcg cg) )) ([],cg) fs)
       | _ -> ([],cg)
   in
 
   look_for_call'' expr t ip cg
     


type nat = | Zero |Succ of nat

let rec nattoint = function | Zero -> 0 | Succ(n) -> 1+(nattoint n)
let print_nat n = Printf.printf "%d\n" (nattoint n)  
let rec h x y = match x with Zero -> 
  begin match y with 
    | Zero -> Zero
    | Succ(y') -> h x y  
  end
  | Succ(x') -> h x' y

let rec f x y = match x with 
  |Zero -> Zero 
  | Succ (x') -> match y with 
      |Zero -> Zero 
      | Succ(y') -> h (g x' y) (f (Succ (Succ x)) y')
and  g x y  = match x with | Zero -> Zero 
  | Succ(x') -> match y with | Zero -> Zero 
      | Succ(_) -> h (f x y) (g x' (Succ y))


let rec build_callgraph ast mainfuns cg  = 
  match mainfuns with
    | [] ->  Printf.printf "last Callgraph is %s \n" (string_of_callgraph cg);  cg
    | mainfun :: rest -> 

      (*printf "un petit test sur fgh ";
      print_nat (f (Succ(Succ(Zero))) (Succ(Succ(Zero))));*)
      Printf.printf "building callgraph of %s \n" mainfun; 
      build_callgraph ast rest (build_cg_of_f ast ast.globals cg mainfun)


