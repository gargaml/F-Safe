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
(* File        : termination.ml                                              *)
(* Description : termination algorithms                                      *)
(*                                                                           *)
(*****************************************************************************)

open Printf
open Config
open Fsafe
open Callgraph
open Relationmatrix

module SSet = Set.Make(String)

let diagonal_check matrix =
    let ok = ref false in
    let i = ref 0 in
    while not !ok && !i < matrix.nb_l do
      try
	if matrix.data.(!i).(!i) = Inf then
	  ok := true;
	i := !i + 1;
      with
	| Invalid_argument _ -> ()
    done;
    !ok

let is_terminating cg s f =
  let edges = CallGraph.find f cg in
  List.fold_left (fun b (g, _, _, m) ->
    b && (
      if String.compare f g = 0 then
	diagonal_check m
      else
	SSet.mem g s
    )) true edges

(* termination_check : ?? -> ?? *)
let termination_check fsafe =
  
  let functions =
    List.fold_left (fun acc e -> (look_for_call e)@acc) [] fsafe.entry
  in
  
  (* callgraph building *)
  if !verbose then printf "   *** Building callgraph...\n";
  let g = Callgraph.build_callgraph fsafe functions in
  if !debug_on then (
    Callgraph.dot_of_callgraph g;
    printf "callgraph saved in callgraph.dot\n"
  );
  
  (* TODO : cycles detection *)
  (* TODO : graph completion *)
  
  let count = ref (-1) in
  let prev = ref 0 in
  let s = ref SSet.empty in
  while !count != !prev do
    let tf = List.filter (is_terminating g !s) functions in
    s := List.fold_left (fun s x -> SSet.add x s) !s tf;
    prev := !count;
    count := SSet.cardinal !s;
  done;
  
  List.map (fun x -> (x, SSet.mem x !s)) functions
  
