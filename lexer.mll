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
let anonvar = "_"
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
  | undefined { UNDEFINED }
  | comma { COMMA }
  | colon { COLON }
  | arrow { ARROW }
  | pipe { PIPE }
  | equal { EQUAL }
  | anonvar { ANONVAR }
  | ttype { TYPE }
  | tand { AND }
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
