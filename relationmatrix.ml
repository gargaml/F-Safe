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
(* File        : relationmatrix.ml                                           *)
(* Description : definition of matrix                                        *)
(*                                                                           *)
(*****************************************************************************)

exception Exception_incompatible_dimensions ;;

type relation =
  | Inf
  | Eq
  | Unknown

type relationmatrix = 
    { mutable data : relation array array ; nb_c : int ; nb_l : int }

let empty c l = 
  { data = Array.create_matrix c l Unknown ; nb_c = c ; nb_l = l }

let add relations =
  match relations with
    | (Inf, _) | (_, Inf) -> Inf
    | (Eq, _) -> Eq
    | (Unknown, Eq) -> Eq
    | (Unknown, Unknown) -> Unknown

let mult relations =
  match relations with
    | (Unknown, _) | (_, Unknown) -> Unknown
    | (Inf, _) -> Inf
    | (Eq, Inf) -> Inf
    | (Eq, Eq) -> Eq

(* Mutliplication of two matrices of relations *)
let multiplication m1 m2 = 
  if m1.nb_c == m2.nb_l then
    let lim_i = (m1.nb_l - 1) in
      let lim_j = (m2.nb_c - 1) in
        let lim_k = (m1.nb_c - 1) in
          let matrix_product = 
	    ref (Array.make_matrix m1.nb_l m2.nb_c Unknown) in 
            for i = 0 to lim_i do
              let line = ref (Array.make m2.nb_c Unknown) in 
                for j = 0 to lim_j do
                  let add_mult = ref Unknown in
                    (* Because Unknown is the neutral element for addition *)
                    for k = 0 to lim_k do
                      let add_res  = mult (m1.data.(i).(k), m2.data.(k).(j)) in
                        add_mult  := add (add_mult.contents,add_res) ;
                    done ;
                    Array.set !line j !add_mult ;
                done ;
                Array.set !matrix_product i !line ;
            done ;
            { data = !matrix_product ; nb_l = m1.nb_l ; nb_c = m2.nb_c } ;
  else
    raise Exception_incompatible_dimensions
      
let string_of_relation x = 
  match x with
    | Inf     -> "< "
    | Eq      -> "= " 
    | Unknown -> "? " 
	
let string_of_relationmatrix m =
  let accu = ref "" in
    for i = 0 to m.nb_l - 1 do
      for j = 0 to m.nb_c - 1 do
	accu := !accu ^ (string_of_relation m.data.(i).(j))
      done;
      accu := !accu ^ "\n"
    done;
    !accu
      
let string_of_relationmatrix' m =
  let accu = ref "" in
  for i = 0 to m.nb_l - 1 do
    for j = 0 to m.nb_c - 1 do
      accu := !accu ^ (string_of_relation m.data.(i).(j))
    done;
    accu := !accu ^ "\\n"
  done;
  !accu
