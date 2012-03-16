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
(* File        : lexer.mll                                                   *)
(* Description : fsafe lexer                                                 *)
(*                                                                           *)
(*****************************************************************************)

{
  open Parser
  let line = ref 1
}

let eol = '\n'
let ident = (['a'-'z']['a'-'z' '0'-'9' '_' '\'']*)
let majident = (['A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_' '\'']*)

let ttype = "type"
let tand = "and"
let case = "case"
let anonfun = "fun"
let def ="def"
let tlet = "let"
let undefined = "undefined"
let letloc = "letloc"

let typearrow = "->"
let joker = "_"
let arrow = "=>"
let lparen = '('
let rparen = ')'
let lbracket = '['
let rbracket = ']'
let comma = ','
let colon = ':'
let pipe = '|'
let equal = '='

let lbrace = '{'
let rbrace = '}' 

let ws = (['\t' ' ']*)

rule token = parse
  | ws
      { token lexbuf }
  | eol
      { incr line;
	token lexbuf }
  | typearrow { TYPEARROW }
  | lparen { LPAREN }
  | rparen { RPAREN }
  | lbracket { LBRACKET }
  | rbracket { RBRACKET }
  | lbrace { LBRACE }
  | rbrace { RBRACE }
  | tlet { LET }
  | comma { COMMA }
  | colon { COLON }
  | arrow { ARROW }
  | pipe { PIPE }
  | equal { EQUAL }
  | joker { JOKER }
  | ttype { TYPE }
  | case { CASE }
  | def { DEF }
  | anonfun { FUN }
  | ident as id
      { IDENT (id) }
  | majident as mid
      { MAJIDENT (mid) }
  | eof { EOF }
  | _ { failwith((Lexing.lexeme lexbuf) ^
		    ": error at line " ^ string_of_int !line)}
      
{
}
