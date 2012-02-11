/*****************************************************************************/
/*                                                                           */
/* F-Safe                                                                    */
/*                                                                           */
/* File        : parser.mly                                                  */
/* Description : fsafe parser                                                */
/*                                                                           */
/*****************************************************************************/

%{
  open Fsafe
%}

%token TYPE AND DEF CASE FUN LET ANONVAR

%token <string> IDENT
%token <string> MAJIDENT

%token LPAREN RPAREN LBRACKET RBRACKET LBRACE RBRACE COMMA COLON PIPE EQUAL EOF ARROW TYPEARROW



%start fsafe
%type <Fsafe.fsafe> fsafe

%%

fsafe:
  | statements EOF { Fsafe($1) }

statements :
  | statement { [$1]}
  | statement statements { $1 :: $2 }

statement:
  | type_dec {       DeclDataType($1) }
  | fun_dec {        DeclFunction($1) }
  | prog {           DeclProgram ($1) }

typevar:
  | typeident {$1}
  | MAJIDENT { Tvar($1) }
  | MAJIDENT LBRACKET list_typevar RBRACKET { Tparam($1,$3) }
  | MAJIDENT TYPEARROW typevar { Tarrow($1,$3) }
typeident:
  | IDENT { Tvar($1) }
  | IDENT LBRACKET list_typevar RBRACKET { Tparam($1,$3) }
  | IDENT TYPEARROW typevar { Tarrow($1,$3) }
type_dec:
  | TYPE type_def { [$2] }
  | TYPE type_def type_decs_and { $2 :: $3 }

type_decs_and:
  | AND type_def { [$2] }
  | AND type_def type_decs_and {$2 :: $3}


type_def:
  | IDENT EQUAL list_of_cons  { DefDatatype ($1, [], $3) }
  | IDENT LBRACKET list_typevar RBRACKET EQUAL list_of_cons
      { DefDatatype ($1, $3, $6) }

fun_dec: 
  | DEF fun_def { [$2] }
  | DEF fun_def fun_dec_and {  $2 :: $3  }

fun_dec_and :
  | AND fun_def { [$2] }
  | AND fun_def fun_dec_and { $2 :: $3 }

fun_def:
  | IDENT LPAREN RPAREN COLON typevar EQUAL list_of_expr { DefFunction ($1,[],[],$5,$7 ) }
  | IDENT LBRACKET list_typevar RBRACKET LPAREN RPAREN COLON typevar EQUAL list_of_expr { DefFunction ($1,$3,[],$8,$10 ) }
  | IDENT LPAREN list_of_params RPAREN COLON typevar EQUAL list_of_expr { DefFunction ($1,[],$3,$6,$8) } 
  | IDENT LBRACKET list_typevar RBRACKET LPAREN list_of_params RPAREN COLON typevar EQUAL list_of_expr { DefFunction ($1,$3,$6,$9,$11) }

list_of_cons:
  | typecons { [$1] }
  | typecons PIPE list_of_cons { $1 :: $3 }

typecons:
  | MAJIDENT { DefCon ($1, []) }
  | MAJIDENT LPAREN list_of_params RPAREN { DefCon ($1, $3) }


list_of_params:
  | IDENT COLON typevar { [Param($1,$3)] } 
  | IDENT COLON typevar COMMA list_of_params { Param($1,$3) :: $5 } 


list_typevar:
  | typevar { [$1] }
  | typevar COMMA list_typevar { $1 :: $3 }

list_of_expr:
  | expr { [$1] }
  | expr COMMA list_of_expr { $1 :: $3 }

expr:
  | IDENT { Var($1) }
  | constante { $1 }
  | LET LPAREN list_of_assigns RPAREN LBRACE expr RBRACE { Let($3,$6) }
  | CASE list_of_expr LBRACE motifs RBRACE { Case($2,$4) } 
  | IDENT  LPAREN list_of_expr RPAREN { Call ($1,[],$3) }
  | IDENT LBRACKET list_typevar RBRACKET LPAREN list_of_expr RPAREN { Call ($1,$3,$6) }
  | FUN LBRACKET list_typevar RBRACKET LPAREN list_of_params RPAREN COLON typevar ARROW expr { Anon_fun ( $3,$6,$9,$11) } 

list_of_assigns:
  | IDENT COLON typevar EQUAL expr {[Assign(Param($1,$3),$5)]}
  | IDENT COLON typevar EQUAL expr list_of_assigns { Assign(Param($1,$3),$5) :: $6 }
constante:
  | MAJIDENT LBRACKET list_typevar RBRACKET LPAREN list_of_expr RPAREN { Constante($1,$3,$6) }
  | MAJIDENT LPAREN list_of_expr RPAREN { Constante($1,[],$3) }
  | MAJIDENT { Constante($1,[],[])}
  | MAJIDENT LBRACKET list_typevar RBRACKET { Constante($1,$3,[])}
list_of_filter:
  | filter { [$1] }
  | filter COMMA list_of_filter { $1::$3 }

filter:
  |  IDENT COLON typevar { Var_filt(Param($1,$3)) } 
  |  ANONVAR COLON typevar { AnonVar ($3) }
  | constante_filter { $1 }

motifs:
    | PIPE list_of_filter ARROW expr {[Filter($2,$4)] }
    | PIPE list_of_filter ARROW expr motifs {Filter($2,$4) :: $5} 


constante_filter:
  | MAJIDENT LBRACKET list_typevar RBRACKET LPAREN list_of_filter RPAREN { Constante_filt($1,$3,$6) }
  | MAJIDENT LBRACKET list_typevar RBRACKET { Constante_filt($1,$3,[])}
  | MAJIDENT LPAREN list_of_filter RPAREN { Constante_filt($1,[],$3) }
  | MAJIDENT { Constante_filt($1,[],[])}

prog:
  | DEF list_of_params EQUAL list_of_expr { Program($2,$4) }
%%
