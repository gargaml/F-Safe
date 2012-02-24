(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : Print_of_matrices.ml                                        *)
(* Description : Print of matrices                                           *)
(*                                                                           *)
(*****************************************************************************)

open Printf

open Matrix

let print_relation x = 
    match x with
    | Inf     ->  printf "< "
    | Eq      ->  printf "= " 
    | Unknown ->  printf "? " 
;;

let print_matrix m =
  for i = 0 to m.nb_l - 1 do
    for j = 0 to m.nb_c - 1 do
      print_relation m.data.(i).(j) ;
    done ;
    printf "\n" ;
  done
;;
