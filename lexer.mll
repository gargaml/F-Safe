(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
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
let ident = (['a'-'z']+)
let majident = (['A'-'Z']['a'-'z']*)

let ttype = "type"

let lparen = '('
let rparen = ')'
let lbracket = '['
let rbracket = ']'
let comma = ','
let colon = ':'
let pipe = '|'
let equal = '='

let ws = (['\t' ' ']*)

rule token = parse
  | ws
      { token lexbuf }
  | eol
      { incr line;
	token lexbuf }
  | lparen { LPAREN }
  | rparen { RPAREN }
  | lbracket { LBRACKET }
  | rbracket { RBRACKET }
  | comma { COMMA }
  | colon { COLON }
  | pipe { PIPE }
  | equal { EQUAL }
  | ttype { TYPE }
  | ident as id
      { IDENT (id) }
  | majident as mid
      { MAJIDENT (mid) }
  | eof { EOF }
  | _ { failwith((Lexing.lexeme lexbuf) ^
		    ": error at line " ^ string_of_int !line)}
      
{
}
