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
  let rec ligne data = match data with
      [] -> ()
    | _ ->
    let rec colonne data len = match len with
        0 -> printf "\n" ; ligne data ;
      | _ -> match data with
          hd :: tl -> print_relation hd ; colonne tl (len - 1) ;
        | _ -> ()
    in colonne data m.nb_c
  in ligne m.data 
;;
