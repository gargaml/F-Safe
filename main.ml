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
let doc_interpretor = "Set interpretor mode"
let doc_terminator = "Set terminator mode"

(* entry point *)
(* main : () -> () *)
let main () =
  let liste =  
      [
	"-v", Arg.Set verbose, doc_verbose;
	"-d", Arg.Set debug_on, doc_debug_on;
	"-i", Arg.Set interpretor_on, doc_interpretor;
	"-t", Arg.Set terminator_on, doc_terminator;
      ]
	in
   if ( 1 == Array.length Sys.argv ) then
	  begin
       Printf.printf "Usage : %s " Sys.argv.(0) ;
       let rec aaaa a = 
         match a with
           | (opt,_,_) :: reste -> 	
             begin
               Printf.printf "[%s] " opt ;
               aaaa reste ;
             end
           | [] -> Printf.printf "filename\n" ;
       in aaaa liste ;

       Printf.printf "%s\n" errmsg ;
       let rec aaaa a = 
         match a with
           | (opt,_,texte) :: reste -> 	
             begin
               Printf.printf "%s %s\n" opt texte ;
               aaaa reste ;
             end
           | [] -> exit 1 ;
       in aaaa liste ;
     end ;
  try
    Arg.parse
		liste
      interpret
      errmsg;
  with
    | Error -> exit 2;;

main ()
