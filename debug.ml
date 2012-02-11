(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : fsafe.ml                                                    *)
(* Description : set of debug functions                                      *)
(*                                                                           *)
(*****************************************************************************)

open Printf
open Config

let dmsg x = match debug_on with
| true  -> printf "%s\n" x;
| false -> ()
;;

