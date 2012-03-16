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
open Cycle
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


let rec is_terminating cycles =
  let check_cycle cycle =
    let rec process_matrice cycle base_matrice = 
      match cycle with 
	| [] -> failwith "should not be empty"
	| [(_,(_,_,_,matrice))] -> multiplication base_matrice matrice
	| (_,(_,_,_,matrice)) :: rest
	  -> process_matrice  rest (multiplication base_matrice matrice) 
    in
    match cycle with
      | [] -> true
      | [(_,(_,_,_,matrice))] -> diagonal_check matrice
      | (_,(_,_,_,matrice)) :: rest -> 
	diagonal_check (process_matrice rest matrice)
  in
  match cycles with 
    | [] -> true
    | cycle :: rest  -> if (check_cycle cycle) 
      then is_terminating rest 
      else false



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
  if  !verbose then printf "   *** Processing cycles...\n";
  let cycles = get_all_cycles g functions in 
  if !debug_on then (
    printf "here are the cycles in your program :\n%s" (string_of_cycles cycles );

  );
  (* TODO : graph completion *)
 
 List.map (fun (fname,cycle) -> (fname,is_terminating cycle)) cycles
  
