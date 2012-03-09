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

open Config
open Printf
open Interpret
open Typechecker
open Termination
open Wftype



(* parse : Lexing.lexbuf -> ?? *)
let parse lexbuf =
  try
    Parser.fsafe Lexer.token lexbuf
   with   Parser.Error ->
	Printf.fprintf stderr "At offset %d: lexeme is %s  syntax error.\n%!" (Lexing.lexeme_start lexbuf) (Lexing.lexeme lexbuf); { Fsafe.types = []; globals = []; entry = [] }
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

    (* well-formed type *)
    if !verbose then printf "Well-formed type checking... ";
    Wftype.check ast;
    if !verbose then printf "done\n";

    (* well-formed type *)
    if !verbose then printf "Creation of TScheme map... ";
    ignore (Wftype.create_tscheme_map ast);
    let m = Wftype.create_tscheme_map ast in
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

