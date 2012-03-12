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
(* File        : handler.ml                                                  *)
(* Description : main stream for ast :                                       *)
(*               -> parsing                                                  *)
(*               -> type checking                                            *)
(*               -> termination checking                                     *)
(*               -> interpreting                                             *)
(*                                                                           *)
(*****************************************************************************)

open Config
open Printf
open Pprinter
open Interpret
open Typechecker
open Termination
open Wftype


(* parse : Lexing.lexbuf -> ?? *)
let parse lexbuf =
  try
    Parser.fsafe Lexer.token lexbuf
  with
    | Parser.Error ->
	Printf.fprintf stderr 
	  "At offset %d: lexeme is %s  syntax error.\n%!"
	  (Lexing.lexeme_start lexbuf)
	  (Lexing.lexeme lexbuf);
      { Fsafe.types = []; globals = []; entry = [] }

(* handle : string -> () *)
let handle filename =
  
  let source = open_in filename in
  let close_files () = 
    close_in source in
  
  try
    (* parsing *)
    if !verbose then printf "*** Parsing...\n";
    let lexbuf = Lexing.from_channel source in
    let ast = parse lexbuf in
    if !debug_on then printf "%s\n" (string_of_fsafe ast);

    (* well-formed type *)
    if !verbose then printf "*** Checking types well-formedness...\n";
    Wftype.check ast;

    (* well-formed type *)
    (* Uncomment this code when typechecking is implemented
       if !verbose then printf "** Creating type schemes map...\n";
       ignore (Wftype.create_tscheme_map ast);
    *)

    (* type checking *)
    (* Uncomment this code when typechecking is implemented
       if !verbose then printf "Type checking...\n";
       ignore (typecheck ast);
    *)
    
    (* termination checking *)
    if !verbose then printf "*** Termination checking...\n";
    let results = termination_check ast in
    printf "\n";
    List.iter (fun (f,r) -> printf "%s Function \"%s\" %s termination check\n"
      (if r then "[X]" else "[ ]")
      f (if r then "passes" else "doesn't pass")) results;
    
    (* interpreting *)
    (* Uncomment this code when interpreting is implemented
       if !verbose then printf "Interpreting...\n";
       ignore (interpret ast);
    *)

    close_files ()
  with
    | x -> close_files (); raise x
