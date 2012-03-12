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
  
  let diagonal_check matrix =
    let ok = ref false in
    let i = ref matrix.nb_l in
    let j = ref matrix.nb_c in
    while not !ok && !i < matrix.nb_l && !j < matrix.nb_c do
      if matrix.data.(!i).(!j) = Inf then
	ok := true;
      i := !i + 1;
      j := !j + 1;
    done;
    !ok
  in

  List.map (fun x -> 
    let edges = CallGraph.find x g in
    let result = List.fold_left (fun b (name, _, _, m) -> b && 
      (if String.compare name x = 0 then true
       else diagonal_check m)
    ) true edges in
    (x, result)) functions
