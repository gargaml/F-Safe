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

let rec explore_couple callgraph cycle history = function
  | funname, edges ->
    match edges with 
      | [] -> []
      | edge :: rest -> 
	let rec explore_edge fun_name edge callgraph cycle history =
	  let rec filter_cycle fname = function
	    | (calledname,edge)::rest ->  if (String.compare calledname fname) == 0 then (fname,edge)::rest else filter_cycle fname rest
	    |[] -> failwith "error here"
	  in
	  match edge with 
	    | (calledname,_,_,_) ->
	      let next_cycle = cycle @ [(fun_name,edge)] in
	      let next_edges = CallGraph.find calledname callgraph in
	      let next_cycles = calledname, next_edges in
	      if List.mem calledname history then
		[filter_cycle calledname next_cycle]
	      else
		explore_couple callgraph next_cycle history next_cycles
	in
	explore_edge funname edge callgraph cycle (funname::history)
	@ explore_couple  callgraph cycle (funname::history) (funname, rest)


let get_all_cycles callgraph mainfunc =   let main_callgraphs =
    List.map (fun f -> (f,CallGraph.find f callgraph)) mainfunc in
  let cycles_list = List.map 
    (fun x ->match x with | (f,_) ->
(f, (explore_couple  callgraph [] [] x )))
    main_callgraphs
  in
    cycles_list


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
 
     
     
