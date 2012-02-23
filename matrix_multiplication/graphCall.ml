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
    let len = List.length x.data in
    for i=0 to (len-1) do
        (*printf "i=%d\n" i;*)
        if ((i mod x.d_x) == 0) then
            print_endline "\n";

        print_relation (List.nth  x.data (i ));
    done;
    print_endline "\n";
    printf "dimention (x=%d,y=%d); len =%d\n\n" x.d_x x.d_y len


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

    if m1.d_x == m2.d_y then
        let matrix_of_product = ref [] in 
        (*printf "m1.d_x=%d; m2.d_y=%d\n" m1.d_x m2.d_y ;*)
        for i=0 to (m1.d_y - 1) do
            (*printf "i=%d -------------- next ----------\n" i;*)
            for j=0 to (m2.d_x - 1) do
                let add_mult = ref InitStateOfVariable in
                for k=0 to (m1.d_x - 1) do
                    let m1_index = (i*m1.d_x) + k in
                    let m2_index = (k*m2.d_x) + j in
                    (*printf "m1_index=%d, m2_index=%d\n" m1_index m2_index ;*)
                    let add_res  = mult (List.nth m1.data m1_index,List.nth m2.data m2_index) in
                    add_mult    := add (add_mult.contents,add_res) ;
                done;
                (*printf "-------------- save produit ----------\n";*)
                matrix_of_product :=  insert_at_end !matrix_of_product !add_mult;
            done
        done;
        let new_matrice = { data= !matrix_of_product ; d_x = m2.d_x ; d_y = m1.d_y} in
        new_matrice
        (*{ !matrix_of_product; m1.d_x; m2.d_y } *)
    else
        raise Exception_dimensions_not_equals




(*TEST MATRIX*)
(*--------------------------------------------------------------------*)



(*------TEST 1-------------------------------------------------------------*)

(*let m1 = { data = [Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf;*)
                  (*] ; d_x = 3; d_y = 2 };;*)
(*let m2 = { data = [Eq; Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq; Eq   ] ; d_x = 4; d_y = 3 };;*)
(*let v =     multiplication m1 m2;;*)
(*print_relation_list v;;*)

(*output*)
(*Inf Inf Inf Inf*)

(*Inf Inf Inf Inf*)

(*dimention (x=4,y=2); len =8*)




(*------TEST 2-------------------------------------------------------------*)
(*let m1 = { data = [ Inf; Inf;*)
                    (*Inf; Inf;*)
                    (*Inf; Inf;*)
                    (*Inf; Inf;*)
                  (*] ; d_x = 2; d_y = 4 };;*)
(*let m2 = { data = [Eq; Eq; Eq;*)
                   (*Eq; Eq; Eq;*)
                   (*] ; d_x = 3; d_y = 2 };;*)
(*let v =     multiplication m1 m2;;*)
(*print_relation_list v;;*)

(*Inf Inf Inf*)

(*Inf Inf Inf*)

(*Inf Inf Inf*)

(*Inf Inf Inf*)

(*dimention (x=3,y=4); len =12*)


(*------TEST 3-------------------------------------------------------------*)

(*let m1 = { data = [Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf;*)
                   (*Inf; Inf; Inf;*)
                  (*] ; d_x = 3; d_y = 3 };;*)
(*let m2 = { data = [Eq; Eq; Eq; *)
                   (*Eq; Eq; Eq; *)
                   (*Eq; Eq; Eq   ] ; d_x = 3; d_y = 3 };;*)
(*let v =     multiplication m1 m2;;*)
(*print_relation_list v;;*)

(*output*)
(*Inf Inf Inf*)

(*Inf Inf Inf*)

(*Inf Inf Inf*)

(*dimention (x=3,y=3); len =9*)



(*--------------------------------------------------------------------*)



