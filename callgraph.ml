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


let rec inparamlist callingparams =
  match callingparams with 
      [] -> []
    | APar (p,_) :: l ->  p :: (inparamlist l);;

			
let rec outparamlist x = 
  match x with 
    | [] -> []
    | (EVar s) :: l -> s :: outparamlist l
    | (EConstant (s,_, _)) :: l-> s :: outparamlist l
    | _ -> failwith "not  a var or consant param in Callgraph.outparamlist"  


type tree =
  | Node of string * tree list

let init_tree ip =
  Node("", (List.map (fun (APar(v, _)) -> Node(v, [])) ip))

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
    match e with
      | EConstant(_, _, es) ->
	List.fold_left (fun acc e -> (look_for_call e)@acc) [] es
      | ELet(_, a, b) -> (look_for_call a) @ (look_for_call b)
      | ECall(f, _, es) -> 
	List.fold_left (fun acc e -> (look_for_call e)@acc) [f] es
      | ECase(es, fs) ->
	(List.fold_left (fun acc e -> (look_for_call e)@acc) [] es)
	  @ (List.fold_left
	       (fun acc (Filter(_,e)) -> (look_for_call e)@acc) [] fs)
      | _ -> []

let rec look_for_call' e t ip =
    match e with
      | EConstant(_, _, es) ->
	List.fold_left (fun acc e -> (look_for_call' e t ip)@acc) [] es
      | ELet(_, a, b) -> (look_for_call' a t ip) @ (look_for_call' b t ip)
      | ECall(f, _, es) -> 
	let op = List.map (fun e -> match e with
	  | EVar s -> s
	  | _ -> failwith "expression in call not supported") es in
	let m = empty (List.length ip) (List.length op) in
	for i = 0 to m.nb_l - 1 do
	  for j = 0 to m.nb_c - 1 do
	    m.data.(i).(j) <-
	      match get_relation t (List.nth ip j) (List.nth op i) with
		| None -> Unknown
		| Some s -> s
	  done;
	done;
	[(f, ip, op, m)]
      | ECase(es, fs) ->
	let p = match List.hd es with
	  | EVar s -> s
	  | _ -> failwith "expression in match not supported" in
	let cs = List.fold_left (fun acc (Filter(p,_)) -> 
	  match p with
	    | PCons(_, _, ls) ->
	      let cs1 = List.fold_left (fun acc l -> match l with
		| PVar(v, _) -> v::acc
		| _ -> failwith "nested pattern in deconstruction not supported") [] ls in
	      cs1 @ acc
	    | _ -> failwith "weird patterns in deconstruction not supported") [] fs
	in
	let t' = List.fold_left (fun t c -> add_child t p c) t cs in
	(List.fold_left (fun acc (Filter(_,e)) -> (look_for_call' e t' ip)@acc) [] fs)
      | _ -> []

let build_callgraph fsafe fs =
  let build f =
    let vd = List.hd (List.filter (fun x ->
      match x with
	| DFun(v, _, _, _, _) when v = f -> true
	| _ -> false) fsafe.globals) in
    match vd with
      | DFun(_, _, ip, _, e) ->
	let tree =  init_tree ip in
	look_for_call' e tree (List.map (fun (APar(v, _)) -> v) ip)
      | _ -> []
  in
  List.fold_left (fun acc f ->
    let edges = build f in
    CallGraph.add f edges acc) CallGraph.empty fs
    

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
