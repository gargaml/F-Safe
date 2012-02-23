(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : Print_of_matrices.ml                                        *)
(* Description : multiplication of matrices functionality.                   *)
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

let print_relation_list x = 
    printf "\nmatrix data length = %d" (List.length x.data);
    printf "  number of lines = %d ; number of columns = %d\n\n" x.nb_l x.nb_c ;
    List.iter (fun y-> print_relation y) x.data ;
    print_endline "\n"
;;

let print_matrix m =
  let rec ligne data = match data with
      [] -> printf "\n" ;
    | _ ->
    let rec colonne data len = match len with
        0 -> printf "\n" ; ligne data ;
      | _ -> match data with
          hd :: tl -> print_relation hd ; colonne tl (len - 1) ;
        | _ -> ligne []
    in colonne data m.nb_c
  in ligne m.data 
;;
