(*****************************************************************************)
(*     This file is part of FSafe.                                           *)
(*                                                                           *)
(*     FSafe is free software: you can redistribute it and/or modify         *)
(*     it under the terms of the GNU General Public License as published by  *)
(*     the Free Software Foundation, either version 3 of the License, or     *)
(*     (at your option) any later version.                                   *)
(*                                                                           *)
(*     FSafe is distributed in the hope that it will be useful,              *)
(*     but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*     GNU General Public License for more details.                          *)
(*                                                                           *)
(*     You should have received a copy of the GNU General Public License     *)
(*     along with FSafe.  If not, see <http://www.gnu.org/licenses/>.        *)
(*                                                                           *)
(*                                                                           *)
(* File        : main.ml                                                     *)
(* Description : program entry point                                         *)
(*                                                                           *)
(*****************************************************************************)

open Handler
open Config

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
let doc_debug_on = "Set debug mode"

(* entry point *)
(* main : () -> () *)
let main () = 
  try
    Arg.parse
      [
	"-v", Arg.Set verbose, doc_verbose;
	"-d", Arg.Set debug_on, doc_debug_on;
      ]
      interpret
      errmsg;
  with
    | Error -> exit 2;;

main ()
