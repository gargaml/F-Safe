(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : main.ml                                                     *)
(* Description : program entry point                                         *)
(*                                                                           *)
(*****************************************************************************)

open Handler
open Misc

(* exception for main errors *)
exception Error

(* interpret checks the file and calls the interpreter *)
(* interpret : string -> () *)
let interpret file = 
  if Filename.check_suffix file ".fsf"
  then
    handle file
  else
    raise (Arg.Bad ("don't know what to do with " ^ file))

(* usage strings *)
let errmsg = "Options are :"
let doc_verbose = "Set verbose mode"

(* entry point *)
(* main : () -> () *)
let main () = 
  try
    Arg.parse
      [
	"-v", Arg.Set verbose, doc_verbose;
      ]
      interpret
      errmsg;
  with
    | Error -> exit 2;;

main ()
