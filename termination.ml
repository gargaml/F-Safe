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

(* termination_check : ?? -> ?? *)
let termination_check fsafe =
  
  let rec look_for_call e =
    match e with
      | EConstant(_, _, es) ->
	List.fold_left (fun acc e -> (look_for_call e)@acc) [] es
      | ELet(_, a, b) -> (look_for_call a) @ (look_for_call b)
      | ECall(f, _, _) -> [f]
      | ECase(es, fs) ->
	(List.fold_left (fun acc e -> (look_for_call e)@acc) [] es)
	  @ (List.fold_left (fun acc (Filter(_,e)) -> (look_for_call e)@acc) [] fs)
      | _ -> []
  in
  let functions =
    List.fold_left (fun acc e -> (look_for_call e)@acc) [] fsafe.entry
  in
  
  (* callgraph building *)
  if !verbose then printf "   *** Building callgraph...\n";
  let g = Callgraph.build_callgraph fsafe in
  if !debug_on then (
    Callgraph.dot_of_callgraph g;
    printf "callgraph saved in callgraph.dot\n"
  );
  
  
  List.map (fun x -> (x, false)) functions
