(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : Tests_for_matrices.ml                                       *)
(* Description : Tests for matrices                                          *)
(*                                                                           *)
(*****************************************************************************)

open Printf

open Matrix_of_relation

open Print_of_matrices

type result = Passed | Failed ;;

type expectation = OK | KO of exn * string ;;

let _MAX_TESTS = 10 ;;

let m1 = { data = [|
             [| Inf |] ;
             [| Eq |] ;
             [| Unknown |]
           |] ;
           nb_l = 3 ;
           nb_c = 1 
         }
;;

let m2 = { data = [|
             [| Inf ; Eq ; Unknown |]
           |] ;
           nb_l = 1 ;
           nb_c = 3 
         }
;;

let m3 = { data = [|
             [| Inf; Inf; Inf |] ;
             [| Inf; Inf; Inf |] ;
             [| Inf; Inf; Inf |]
           |] ;
           nb_l = 3 ;
           nb_c = 3 ;
         }
;;

let m4 = { data = [|
             [| Eq; Eq; Eq |] ;
             [| Eq; Eq; Eq |] ;
             [| Eq; Eq; Eq |]
           |] ;
           nb_l = 3 ;
           nb_c = 3 ;
         }
;;

let m5 = { data = [|
             [| Inf; Inf; Inf; Inf |] ;
             [| Inf; Inf; Inf; Inf |] ;
             [| Inf; Inf; Inf; Inf |]
           |] ;
           nb_l = 3 ;
           nb_c = 4 ;
         }
;;

let m6 = { data = [|
             [| Eq; Eq; Eq |] ;
             [| Eq; Eq; Eq |] ;
             [| Eq; Eq; Eq |] ;
             [| Eq; Eq; Eq |]
           |] ;
           nb_l = 4 ;
           nb_c = 3 ;
         }
;;

let m7 = { data = [|
             [| Inf; Inf; Inf |] ;
             [| Inf; Inf; Inf |] ;
             [| Inf; Inf; Inf |] ;
             [| Inf; Inf; Inf |]
            |] ;
            nb_l = 4 ;
            nb_c = 3 ;
         }
;;

let m8 = { data = [|
             [| Eq; Eq; Eq; Eq |] ;
             [| Eq; Eq; Eq; Eq |] ;
             [| Eq; Eq; Eq; Eq |]
           |] ;
           nb_l = 3 ;
           nb_c = 4 ;
         }
;;

(* num    : the number of the test *)
(* m1     : the 1st matrix         *)
(* m2     : the 2nd matrix         *)
(* expect : the expect result      *)
let test num m1 m2 expect =
  printf "\nTest n° %d\n" (num + 1) ;
  printf "Display of m1\n" ;
  print_matrix m1 ;
  printf "Display of m2\n" ;
  print_matrix m2 ;
  printf "Display of m1 × m2\n" ;
  match expect with
    OK ->
      begin
        try
          print_matrix (multiplication m1 m2) ;
          Passed ;
        with _ -> Failed ;
      end
  | KO(excep, message) ->
      begin
        try
          print_matrix (multiplication m1 m2) ;
          Failed ;
        with excep ->
          printf "%s\n" message ;
          Passed ;
      end
;;

let print_result res =
  match res with
    Passed -> printf "PASSED" ;
  | Failed -> printf "FAILED" ;
;;

let main () =
  printf "Start of tests...\n" ;
  let results = Array.make _MAX_TESTS Failed in
    let number = ref 0 in
      Array.set results
        !number
        (test !number m1 m2 OK)
      ;
      incr number ;
      Array.set results
        !number
        (test !number m2 m1 OK)
      ;
      incr number ;
      Array.set results
        !number
        (test
          !number
          m1
          m3
          (KO(
            Exception_incompatible_dimensions,
            "Matrices are not compatible."
          ))
        )
      ;
      incr number ;
      Array.set results
        !number
        (test !number m2 m4 OK)
      ;
      incr number ;
      Array.set results
        !number
        (test !number m2 m5 OK)
      ;
      incr number ;
      Array.set results
        !number
        (test
          !number
          m1
          m6
          (KO(
            Exception_incompatible_dimensions,
            "Matrices are not compatible."
          ))
        )
      ;
      incr number ;
      Array.set results
        !number
        (test !number m6 m1 OK)
      ;
      incr number ;
      Array.set results
        !number
        (test !number m7 m8 OK)
      ;
      printf "\n\nSummary : \n" ;
      for i = 0 to !number do
        printf "Test n° %d... " (i+1) ;
        print_result (Array.get results i) ;
        printf "\n" ;
      done ;
;;

main ()
;;
