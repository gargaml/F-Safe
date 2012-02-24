open Printf

open Matrix

open Product_of_matrices

open Print_of_matrices

let m1 = { data = [ Inf ;
                    Eq ;
                    Unknown ] ;
           nb_l = 3 ;
           nb_c = 1 
         }
;;

let m2 = { data = [ Inf ; Eq ; Unknown ] ;
           nb_l = 1 ;
           nb_c = 3 
         }
;;

let m3 = { data = [Inf; Inf; Inf;
                   Inf; Inf; Inf;
                   Inf; Inf; Inf] ;
           nb_l = 3 ;
           nb_c = 3 ;
         }
;;

let m4 = { data = [Eq; Eq; Eq;
                   Eq; Eq; Eq;
                   Eq; Eq; Eq] ;
           nb_l = 3 ;
           nb_c = 3 ;
         }
;;

let m5 = { data = [Inf; Inf; Inf; Inf;
                   Inf; Inf; Inf; Inf;
                   Inf; Inf; Inf; Inf] ;
           nb_l = 3 ;
           nb_c = 4 ;
         }
;;

let m6 = { data = [Eq; Eq; Eq;
                   Eq; Eq; Eq;
                   Eq; Eq; Eq;
                   Eq; Eq; Eq ] ;
           nb_l = 4 ;
           nb_c = 3 ;
         }
;;

let m7 = { data = [Inf; Inf; Inf;
                   Inf; Inf; Inf;
                   Inf; Inf; Inf;
                   Inf; Inf; Inf] ;
            nb_l = 4 ;
            nb_c = 3 ;
         }
;;

let m8 = { data = [Eq; Eq; Eq; Eq;
                   Eq; Eq; Eq; Eq;
                   Eq; Eq; Eq; Eq ] ;
           nb_l = 3 ;
           nb_c = 4 ;
         }
;;

let test1 () =
  printf "Test n° 1\n" ;
  printf "Display of m1\n" ;
  print_matrix m1 ;
  printf "Display of m2\n" ;
  print_matrix m2 ;
  printf "Display of m1 × m2\n" ;
  print_matrix (multiplication m1 m2)
;;

let test2 () =
  printf "Test n° 2\n" ;
  printf "Display of m2\n" ;
  print_matrix m2 ;
  printf "Display of m1\n" ;
  print_matrix m1 ;
  printf "Display of m1 × m2\n" ;
  print_matrix (multiplication m2 m1)
;;

let test3 () =
  printf "Test n° 3\n" ;
  printf "Display of m1\n" ;
  print_matrix m1 ;
  printf "Display of m3\n" ;
  print_matrix m3 ;
  printf "Display of m1 × m3\n" ;
  try
    print_matrix (multiplication m1 m3)
  with Exception_incompatible_dimensions ->
    printf "Matrices are not compatible.\n"
;;

let main () =
	printf "Début des tests...\n" ;
	test1 () ;
	test2 () ;
	test3 () ;
;;

main ()
;;
