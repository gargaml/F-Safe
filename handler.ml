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
open Pprinter
open Callgraph

(* parse : Lexing.lexbuf -> ?? *)
let parse lexbuf =
  try
    Parser.fsafe Lexer.token lexbuf
  with
    | Parser.Error ->
      Printf.fprintf stderr "At offset %d: lexeme is %s  syntax error.\n%!" 
	(Lexing.lexeme_start lexbuf) (Lexing.lexeme lexbuf);
	Fsafe.Fsafe([],[],[])

(* handle : string -> () *)
let handle filename =
  
  let source = open_in filename in
  let close_files () = 
    close_in source in
  
  try
    (* parsing *)
    if !verbose then printf "*** Parsing... ";
    let lexbuf = Lexing.from_channel source in
    let ast = parse lexbuf in
    if !verbose then printf "done\n";
    
    if !debug_on then printf "*** PPrinter :\n%s\n" (string_of_fsafe ast);

    (* well-formed type *)
    if !verbose then printf "*** Wellformedness checking... ";
    Wftype.check ast;
    if !verbose then printf "done\n";

    (* well-formed type *)
    if !verbose then printf "** Creation of TScheme map... ";
    ignore (Wftype.create_tscheme_map ast);
    let m = Wftype.create_tscheme_map ast in
    if !verbose then printf "done, unumber of elements %d\n" 
      (Wftype.SMap.cardinal m);

    (* type checking *)
    (* Uncomment this code when typechecking is implemented
       if !verbose then printf "Type checking... ";
       ignore (typecheck ast);
       if !verbose then printf "done\n";
    *)
    
    (* callgraph building *)
    if !verbose then printf "*** Callgraph building...";
    let m = Callgraph.build_callgraph ast in 
    if !verbose then printf "done, number of elements %d\n" 
      (Callgraph.CallGraph.cardinal m);
    Callgraph.dot_of_callgraph m;
    
    printf "=> Termination result : don't know...\n";
    
    (* interpreting *)
    (* Uncomment this code when interpreting is implemented
       if !verbose then printf "Interpreting... ";
       ignore (interpret ast);
       if !verbose then printf "done\n";
    *)
    
    close_files ()
  with
    | x -> close_files (); raise x

