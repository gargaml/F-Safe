(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : Product_of_matrices.ml                                      *)
(* Description : multiplication of matrices functionality.                   *)
(*                                                                           *)
(*****************************************************************************)

open Printf

open Matrix

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
          let matrix_product = ref [] in 
            (* Since a list must be populate by the head, *)
            (* we start by the end to get all in order.   *)
            for i = lim_i downto 0 do
              for j = lim_j downto 0 do
                let add_mult = ref Unknown in (* Because Unknown is the neutral element for addition *)
                  for k = 0 to lim_k do
                    let m1_index = (i * m1.nb_c) + k in
                      let m2_index = (k * m2.nb_c) + j in
                        let add_res  = mult (List.nth m1.data m1_index, List.nth m2.data m2_index) in
                          add_mult  := add (add_mult.contents,add_res) ;
                  done ;
                  matrix_product := !add_mult :: !matrix_product ;
              done ;
            done ;
            { data = !matrix_product ; nb_l = m1.nb_l ; nb_c = m2.nb_c } ;
  else
    raise Exception_incompatible_dimensions
;;



(*TEST MATRIX*)
(*--------------------------------------------------------------------*)



(*------TEST 1-------------------------------------------------------------*)

(*let m1 = { data = [Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf] ; nb_c = 3; nb_l = 3 };;*)
(*let m2 = { data = [Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq] ; nb_c = 3; nb_l = 3 };;*)
(*let v =     multiplication m1 m2;;*)
(*print_relation_list v;;*)

(*------TEST 2-------------------------------------------------------------*)

(*let m1 = { data = [Inf; Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf; Inf] ; nb_c = 4; nb_l = 3 };;*)
(*let m2 = { data = [Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq ] ; nb_c = 3; nb_l = 4 };;*)
(*let v =     multiplication m1 m2;;*)
(*print_relation_list v;;*)

(*------TEST 3-------------------------------------------------------------*)

(*let m1 = { data = [Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf] ; nb_c = 3; nb_l = 4 };;*)
(*let m2 = { data = [Eq; Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq; Eq ] ; nb_c = 4; nb_l = 3 };;*)
(*let v =     multiplication m1 m2;;*)
(*print_relation_list v;;*)


(*--------------------------------------------------------------------*)



