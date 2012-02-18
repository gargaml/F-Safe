(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : graphCall.ml                                                *)
(* Description : multiplication of matrices functionality.                   *)
(*                                                                           *)
(*****************************************************************************)



open Printf

type relation =
    Inf
  | Eq
  | Unknown
  | InitStateOfVariable

type matrix_struct = { data : relation list; d_x: int; d_y: int}

let print_relation x =
    match x with
    | Inf     ->  printf "Inf "
    | Eq      ->  printf "Eq " 
    | Unknown ->  printf "Unknown " 
    | InitStateOfVariable ->  printf "InitStateOfVariable " 


exception Exception_dimensions_not_equals;;
exception Exception_cant_multiply;;

let print_relation_list x =
    printf "\nmatrix data length = %d" (List.length x.data);
    printf "  dimention_x size=%d; dimention_y size=%d\n\n" x.d_x x.d_y ;
    List.iter (fun y-> print_relation y) x.data ;
    print_endline "\n"

let rec insert_at_end l i =
  match l with
    [] -> [i]
  | h :: t -> h :: (insert_at_end t i)

let add relations =
  match relations with
      (Inf, _) | (_, Inf) -> Inf
    | (Eq, _) -> Eq
    | (Unknown, Eq) -> Eq
    | (Unknown, Unknown) -> Unknown
    | (InitStateOfVariable, x ) -> x
    | (x, InitStateOfVariable ) -> x

let mult relations =
  match relations with
      (Unknown, _) | (_, Unknown) -> Unknown
    | (Inf, _) -> Inf
    | (Eq, Inf) -> Inf
    | (Eq, Eq) -> Eq
    | (InitStateOfVariable, x)  -> x
    | (x, InitStateOfVariable ) -> x


let multiplication m1 m2 = 

    if m1.d_y == m2.d_x then
        let len_x = (m1.d_x - 1) in
        let len_y = (m1.d_y - 1) in
        let matrix_of_product = ref [] in 
        (*printf "m1.d_x=%d; m2.d_y=%d\n" m1.d_x m2.d_y ;*)
        for i=0 to len_y do
            (*printf "i=%d -------------- next ----------\n" i;*)
            for j=0 to len_y do
                let add_mult = ref InitStateOfVariable in
                for k=0 to len_y do
                    let m1_index = (i*len_x) + k in
                    let m2_index = (k*len_x) + j in
                    (*printf "m1_index=%d, m2_index=%d\n" m1_index m2_index ;*)
                    let add_res  = mult (List.nth m1.data m1_index,List.nth m1.data m2_index) in
                    add_mult    := add (add_mult.contents,add_res) ;
                done;
                (*printf "-------------- save produit ----------\n";*)
                matrix_of_product :=  insert_at_end !matrix_of_product !add_mult;
            done
        done;
        let new_matrice = { data= !matrix_of_product ; d_x = m1.d_y ; d_y = m1.d_y} in
        new_matrice
        (*{ !matrix_of_product; m1.d_x; m2.d_y } *)
    else
        raise Exception_dimensions_not_equals




(*TEST MATRIX*)
(*--------------------------------------------------------------------*)



(*------TEST 1-------------------------------------------------------------*)

(*let m1 = { data = [Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf] ; d_x = 3; d_y = 3 };;*)
(*let m2 = { data = [Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq] ; d_x = 3; d_y = 3 };;*)
(*let v =     multiplication m1 m2;;*)
(*print_relation_list v;;*)

(*------TEST 2-------------------------------------------------------------*)

(*let m1 = { data = [Inf; Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf; Inf] ; d_x = 4; d_y = 3 };;*)
(*let m2 = { data = [Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq ] ; d_x = 3; d_y = 4 };;*)
(*let v =     multiplication m1 m2;;*)
(*print_relation_list v;;*)

(*------TEST 3-------------------------------------------------------------*)

(*let m1 = { data = [Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf] ; d_x = 3; d_y = 4 };;*)
(*let m2 = { data = [Eq; Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq; Eq ] ; d_x = 4; d_y = 3 };;*)
(*let v =     multiplication m1 m2;;*)
(*print_relation_list v;;*)


(*--------------------------------------------------------------------*)



