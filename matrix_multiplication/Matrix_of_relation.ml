(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : Matrix_of_relation.ml                                       *)
(* Description : definition of matrix                                        *)
(*                                                                           *)
(*****************************************************************************)

type relation =
    Inf
  | Eq
  | Unknown

type matrix_of_relations = { mutable data : relation array array ; nb_c : int ; nb_l : int }

exception Exception_incompatible_dimensions ;;

let add relations =
  match relations with
      (Inf, _) | (_, Inf) -> Inf
    | (Eq, _) -> Eq
    | (Unknown, Eq) -> Eq
    | (Unknown, Unknown) -> Unknown
;;

let mult relations =
  match relations with
      (Unknown, _) | (_, Unknown) -> Unknown
    | (Inf, _) -> Inf
    | (Eq, Inf) -> Inf
    | (Eq, Eq) -> Eq
;;

(* Mutliplication of two matrices of relations *)
let multiplication m1 m2 = 
  if m1.nb_c == m2.nb_l then
    let lim_i = (m1.nb_l - 1) in
      let lim_j = (m2.nb_c - 1) in
        let lim_k = (m1.nb_c - 1) in
          let matrix_product = ref (Array.make_matrix m1.nb_l m2.nb_c Unknown) in 
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
;;
