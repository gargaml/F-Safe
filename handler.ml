(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : handler.ml                                                  *)
(* Description : this file contains all the functions to run :               *)
(*               -> parsing                                                  *)
(*               -> type checking                                            *)
(*               -> termination checking                                     *)
(*               -> interpreting                                             *)
(*                                                                           *)
(*****************************************************************************)

open Misc
open Printf
open Interpret
open Typechecker
open Termination



(* parse : Lexing.lexbuf -> ?? *)
let parse lexbuf =
  try
    Parser.fsafe Lexer.token lexbuf
   with   Parser.Error ->
	Printf.fprintf stderr "At offset %d: lexeme is %s  syntax error.\n%!" (Lexing.lexeme_start lexbuf) (Lexing.lexeme lexbuf);Fsafe.Fsafe([],[],[])
  (*with Parser.error -> 
   let curr = lexbuf.Lexing.lex_curr_p in
   let line = curr.Lexing.pos_lnum in
   let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
   let tok = Lexing.lexeme lexbuf in
   let err = Printf.sprintf
      "line is %d charnum is %d token is %s error here"
      line cnum tok in
   failwith err
  *)
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

