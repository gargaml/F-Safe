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
(* Description : this file contains all the functions to run :               *)
(*               -> parsing                                                  *)
(*               -> type checking                                            *)
(*               -> termination checking                                     *)
(*               -> interpreting                                             *)
(*                                                                           *)
(*****************************************************************************)

open Config
open Printf
open Interpret
open Typechecker
open Termination
open Well_formed_type

(* parse : Lexing.lexbuf -> ?? *)
let parse lexbuf =
  try
    Parser.fsafe Lexer.token lexbuf
  with
    | Parser.Error ->
      Printf.fprintf stderr "At offset %d: lexeme is %s  syntax error.\n%!" (Lexing.lexeme_start lexbuf) (Lexing.lexeme lexbuf);Fsafe.Fsafe([],[],[])

(* handle : string -> () *)
let handle filename =
  
  let source = open_in filename in
  let close_files () = 
    close_in source in
  
  try
    (* parsing *)
    if !verbose then printf "Parsing... ";
    let lexbuf = Lexing.from_channel source in
    let ast = parse lexbuf in
    if !verbose then printf "done\n";

    (* well-formed type *)
    if !verbose then printf "Well-formed type checking... ";
    Well_formed_type.check ast;
    if !verbose then printf "done\n";

    (* well-formed type *)
    if !verbose then printf "Creation of TScheme map... ";
    ignore (Well_formed_type.create_tscheme_map ast);
    let m = Well_formed_type.create_tscheme_map ast in
    if !verbose then printf "done, unumber of elements %d\n" (SMap.cardinal m);

    (* type checking *)
    if !verbose then printf "Type checking... ";
    ignore (typecheck ast);
    if !verbose then printf "done\n";
    
    (* termination checking *)
    if !verbose then printf "Termination checking... ";
    ignore (termination_check ast);
    if !verbose then printf "done\n";
    
    (* interpreting *)
    if !verbose then printf "Interpreting... ";
    ignore (interpret ast);
    if !verbose then printf "done\n";
    
    close_files ()
  with
    | x -> close_files (); raise x

