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
  with Parsing.Parse_error -> 
   let curr = lexbuf.Lexing.lex_curr_p in
        let line = curr.Lexing.pos_lnum in
        let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
        let tok = Lexing.lexeme lexbuf in
    printf "line is %d cnul is %d token is %s error here\n " line cnum tok ; Fsafe.Fsafe([],[],[])
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

