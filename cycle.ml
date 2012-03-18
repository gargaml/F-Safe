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
(* File        : cycle.ml                                                    *)
(* Description : cycle in callgraph detection algorithm                      *)
(*                                                                           *)
(*****************************************************************************)

open Callgraph
open Relationmatrix
open Printf

type cycle = (string*edge)list

module CMap = Map.Make(
struct 
  type t =string
  let compare = String.compare
end);;

let rec extand_cyclelist (cyclelist:(string * (cycle list)) list) (extanded_cyclelist:(string * (cycle list)) list) = 
  let rec buildcyclemap (cyclemap:(cycle list) CMap.t) (cyclelist:cycle list) = 
    match cyclelist with 
      | [] -> cyclemap
      | cycle::rest ->
	let rec buildmap cycle (map:(cycle list) CMap.t) = match cycle  with 
	  |(f,_)::rest  -> 
	    let newmap = 
	      if CMap.mem  f map then 
		CMap.add f (cycle::(CMap.find f map)) map 
	      else 
		CMap.add f [cycle] map 
       	    in buildmap rest newmap
	  |[] -> map
	in
	buildcyclemap (buildmap cycle cyclemap) rest
  in 
  let extandcyclemap cyclelist = 
    let rec extand_cycle bindings (history:cycle list) map =
      match bindings with 
	| [] -> history
	|  (f,cyclelist)::rest -> 
	  let rec treat_cycle  cycle (beginning:cycle list ) (fextand:cycle  list) map =
	    match cycle with 
	      |[] -> beginning
	      |(calling,cg)::rest -> 
		let expand_cycle  (beginners:cycle list) (expanders:cycle  list) = 
		  let cycle_expanders = List.fold_left (fun acc expand -> (expand@[(calling,cg)]) :: acc) [] expanders in
		  let cycle_expanders_beginners = 
		    List.fold_left (fun acc beginner -> 
		      List.fold_left ( fun acc' expand_cycle ->
			(beginner@expand_cycle) :: acc')
			acc cycle_expanders)
		      [] beginners
		  in
		  cycle_expanders_beginners
		in
		  if calling = f then
		    treat_cycle rest (expand_cycle beginning fextand) fextand map
		  else
		    treat_cycle rest (expand_cycle beginning (CMap.find calling map)) fextand map

	  in
   
	  let rec treat_cyclelist (cyclelist: cycle list) (fextand:cycle list) map = 
	  match cyclelist with
	    |[] -> fextand
	    | cycle::rest -> if List.length cycle  = 1 then 
		treat_cyclelist rest (cycle::fextand) map 
	      else 
		(treat_cycle cycle [] (fextand@ rest) map) @ (treat_cyclelist rest (cycle::fextand) map)
	  in
	  let new_history =  (treat_cyclelist cyclelist [] map)@history
	  in
	  extand_cycle rest new_history map
    in
    let cyclemap = buildcyclemap CMap.empty cyclelist 
    in
    let extanded_map = extand_cycle (CMap.bindings cyclemap) [] cyclemap
    in

    extanded_map
  in
 match cyclelist with 
   | [] -> extanded_cyclelist
   | (f,cycles)::rest -> extand_cyclelist rest ((f,(extandcyclemap cycles))::extanded_cyclelist)

let rec explore_couple callgraph cycle history = function
  | funname, edges ->
    match edges with 
      | [] -> []
      | edge :: rest -> 
	let rec explore_edge fname edge history =
	  let rec filter_cycle name  = function
	    | (calledname,edge)::rest ->  if (String.compare calledname name) == 0 then (name,edge)::rest else filter_cycle name rest
	    |[] -> failwith "error here"
	  in
	  match edge with 
	    | (calledname,_,_,_) ->
	      let next_cycle = cycle @ [(fname,edge)] in
	      let next_edges = CallGraph.find calledname callgraph in
	      let next_cycles = calledname, next_edges in
	      if List.mem calledname history then
		[filter_cycle calledname 
next_cycle]
	      else
		explore_couple callgraph next_cycle history next_cycles
	in
	explore_edge funname edge  (funname::history)
	@ explore_couple  callgraph cycle (funname::history) (funname, rest)


let get_all_cycles callgraph mainfunc =   let main_callgraphs =
    List.map (fun f -> (f,CallGraph.find f callgraph)) mainfunc in
  let cycles_list = List.map 
    (fun x ->match x with | (f,_) ->
(f, (explore_couple  callgraph [] [] x )))
    main_callgraphs
  in

extand_cyclelist cycles_list []
	   


let rec  string_of_cycles =
  let rec string_of_cyclelist =
    let rec string_of_cycle  = 
      function
	| [] -> ")"
	| [(calling, (called, _, _, _))] ->
	  calling ^ " -> " ^ called ^ ")" 
	| (calling, (called, _, _, _)) :: rest ->
	  calling ^ " -> " ^ called ^ " , " ^ (string_of_cycle rest)
    in
    function
      | [] -> ""
      | cycle :: rest -> 
	"(" ^ (string_of_cycle cycle) ^ (string_of_cyclelist rest)
  in
  function 
    | [] -> "no cycle in your program\n"
    | [(fname, cycle)] ->
      fname ^ " => { " ^ (string_of_cyclelist cycle) ^ " }"
    | (fname, cycle)::rest-> fname ^ " => { " ^ 
      (string_of_cyclelist cycle) ^ " } \n"  ^ (string_of_cycles rest)
 



    
