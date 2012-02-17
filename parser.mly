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

  let rec lets_of_list l expr =
    match l with
      | [] -> expr
      | (x, a)::t -> Let(x, a, lets_of_list t expr)
    
%}

%token TYPE AND DEF CASE FUN LET ANONVAR

%token <string> IDENT
%token <string> MAJIDENT

%token LPAREN RPAREN LBRACKET RBRACKET LBRACE RBRACE
%token COMMA COLON PIPE EQUAL EOF ARROW TYPEARROW



%start fsafe
%type <Fsafe.fsafe> fsafe

%%

fsafe:
  | list_of_type_dec list_of_var_dec program EOF
      { Fsafe($1, $2, $3) }
program :
  |
      {[]}
  | list_of_expr
      {$1}
list_of_type_dec :
  | 
      { [] }
  | type_dec list_of_type_dec
      { $1 @ $2 }

typevar:
  | typeident
      { $1 }
  | MAJIDENT
      { Tvar($1) }
  | MAJIDENT LBRACKET list_typevar RBRACKET
      { Tparam($1, $3) }
  | MAJIDENT TYPEARROW typevar
      { Tarrow($1, $3) }

typeident:
  | IDENT
      { Tvar($1) }
  | IDENT LBRACKET list_typevar RBRACKET
      { Tparam($1, $3) }
  | IDENT TYPEARROW typevar
      { Tarrow($1, $3) }

type_def:
  | IDENT EQUAL list_of_cons
      { DefDatatype ($1, [], $3) }
  | IDENT LBRACKET list_typevar RBRACKET EQUAL list_of_cons
      { DefDatatype ($1, $3, $6) }

type_dec:
  | TYPE type_def
      { [$2] }
  | TYPE type_def type_decs_and
      { $2 :: $3 }

type_decs_and:
  | AND type_def
      { [$2] }
  | AND type_def type_decs_and
      { $2::$3 }


list_of_var_dec:
  | 
      { [] }
  | var_dec list_of_var_dec
      { $1::$2 }

var_dec:
  | DEF list_of_params EQUAL envloc LBRACKET list_of_expr RBRACKET
      { DefVar($2, $4, $6) }
  | DEF list_of_params EQUAL list_of_expr
      { DefVar($2, EnvLocal([]), $4) }
  | DEF fun_def
      { $2 }
  
envloc:
  |  LET LPAREN list_of_assigns RPAREN
      { EnvLocal($3) }

fun_def:
  | IDENT LPAREN list_of_params RPAREN COLON typevar EQUAL expr
      { DefFunction ($1, $3, $6, $8) } 

list_of_cons:
  | typecons
      { [$1] }
  | typecons PIPE list_of_cons
      { $1::$3 }

typecons:
  | MAJIDENT
      { DefCon($1, []) }
  | MAJIDENT LPAREN list_of_params RPAREN
      { DefCon($1, $3) }


list_of_params:
  | IDENT COLON typevar
      { [Param($1, $3)] } 
  | IDENT COLON typevar COMMA list_of_params
      { Param($1, $3) :: $5 } 


list_typevar:
  | typevar
      { [$1] }
  | typevar COMMA list_typevar
      { $1::$3 }

list_of_expr:
 
  | expr
      { [$1] }
  | expr COMMA list_of_expr
      { $1::$3 }

expr:
  | IDENT
      { Var($1) }
  | constante
      { $1 }
  | LET LPAREN list_of_assigns RPAREN LBRACE expr RBRACE
      { lets_of_list $3 $6 }
  | CASE list_of_expr LBRACE motifs RBRACE
      { Case($2, $4) } 
  | IDENT  LPAREN list_of_expr RPAREN
      { Call ($1, [], $3) }
  | IDENT LBRACKET list_typevar RBRACKET LPAREN list_of_expr RPAREN
      { Call ($1, $3, $6) }
  | FUN LBRACKET list_typevar RBRACKET LPAREN list_of_params RPAREN
      COLON typevar ARROW expr { Anon_fun($3, $6, $9, $11) }
  | FUN LPAREN list_of_params RPAREN
      COLON typevar ARROW expr { Anon_fun([], $3, $6, $8) }

list_of_assigns:
  | IDENT COLON typevar EQUAL expr
      { [(Param($1, $3),$5)] }
  | IDENT COLON typevar EQUAL expr list_of_assigns
      { (Param($1, $3), $5) :: $6 }

constante:
  | MAJIDENT LBRACKET list_typevar RBRACKET LPAREN list_of_expr RPAREN
      { Constante($1, $3, $6) }
  | MAJIDENT LPAREN list_of_expr RPAREN
      { Constante($1, [], $3) }
  | MAJIDENT
      { Constante($1, [], []) }
  | MAJIDENT LBRACKET list_typevar RBRACKET
      { Constante($1, $3, []) }
  | LBRACE list_of_couple RBRACE LBRACKET typevar RBRACKET
      { AppConstr($2, $5) }
  | LBRACE RBRACE LBRACKET typevar RBRACKET
      { AppConstr([], $4) }

 list_of_couple:
  | LPAREN expr COMMA expr RPAREN
      { [AppCouple($2, $4)] }
  | LPAREN expr COMMA expr RPAREN COMMA list_of_couple
      { AppCouple($2,$4) :: $7 }

list_of_filter:
  | filter
      { [$1] }
  | filter COMMA list_of_filter
      { $1::$3 }

filter:
  | IDENT COLON typevar
      { Var_filt(Param($1, $3)) }
  | ANONVAR COLON typevar
      { AnonVar($3) }
  | constante_filter
      { $1 }
  | app_filter
      { $1 }

motifs:
  | PIPE list_of_filter ARROW expr
      { [Filter($2,$4)] }
  | PIPE list_of_filter ARROW expr motifs
      { Filter($2,$4) :: $5 } 
      
app_filter:
  | LBRACE RBRACE LBRACKET typevar RBRACKET
      { AppVide($4) }
  | LBRACE couple COMMA IDENT COLON typevar RBRACE
      {AppFilter($2, Param($4, $6)) }

couple:
  | LPAREN IDENT COLON typevar COMMA IDENT COLON typevar RPAREN
      { Couple(Param($2, $4), Param($6, $8)) }
constante_filter:
  | MAJIDENT LBRACKET list_typevar RBRACKET LPAREN list_of_filter RPAREN
      { Constante_filt($1, $3, $6) }
  | MAJIDENT LBRACKET list_typevar RBRACKET
      { Constante_filt($1, $3, []) }
  | MAJIDENT LPAREN list_of_filter RPAREN
      { Constante_filt($1, [], $3) }
  | MAJIDENT
      { Constante_filt($1, [], [])}

%%
