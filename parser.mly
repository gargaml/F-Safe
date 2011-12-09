%{
  open Ast
%}

%token TYPE

%token <string> IDENT
%token <string> MAJIDENT

%token LPAREN RPAREN LBRACKET RBRACKET COMMA COLON PIPE EQUAL


type_def:
  | TYPE IDENT EQUAL list_of_cons  { DefDatatype ($2, [], $4) }
  | TYPE IDENT LBRACKET list_of_typevars RBRACKET EQUAL list_of_cons { DefDatatype ($2, $4, $7) }

list_of_cons:
  | typecons { [$1] }
  | typecons PIPE list_of_cons { $1 :: $3 }

typecons:
  | MAJIDENT { [$1] }
  | MAJIDENT LPAREN list_of_params RPAREN { $1 :: $3 }

list_of_typevars:
  | MAJIDENT { [$1] }
  | MAJIDENT COMMA list_of_typevars { $1 :: $3 }

list_of_params:
  | IDENT COLON typevar { [$3] } 
  | IDENT COLON typevar COMMA list_of_params { $3 :: $5 } 

typevars:
  | MAJIDENT { $1 }
  | IDENT { $1 }

