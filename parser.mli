exception Error

type token = 
  | TYPEARROW
  | TYPE
  | RPAREN
  | RBRACKET
  | RBRACE
  | PIPE
  | MAJIDENT of (string)
  | LPAREN
  | LET
  | LBRACKET
  | LBRACE
  | JOKER
  | IDENT of (string)
  | FUN
  | EQUAL
  | EOF
  | DEF
  | COMMA
  | COLON
  | CASE
  | ARROW


val fsafe: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Fsafe.fsafe)