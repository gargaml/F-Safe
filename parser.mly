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
  open List
  let rec lets_of_list l expr =
    match l with
      | [] -> expr
      | (x, a)::t -> ELet(x, a, lets_of_list t expr)
    
  let pattern_of_list patterns expr =
    (map (fun x -> Filter(x,expr)) patterns)
  let rec lambdas_of_list params lambdas funtype expr =
    match lambdas with
      | [] -> expr
      | lambda :: t -> EAbstraction(params, lambda, funtype, lambdas_of_list params t funtype expr)

	
  let  build_annotation paramstype expressions = 
      (map (function x -> EAnnotation(x)) paramstype) @ expressions
%}

%token TYPE AND DEF CASE FUN LET ANONVAR

%token <string> IDENT
%token <string> MAJIDENT

%token LPAREN RPAREN LBRACKET RBRACKET LBRACE RBRACE 
%token COMMA COLON PIPE EQUAL EOF ARROW TYPEARROW UNDEFINED



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
      { DDatatype ($1, [], $3) }
  | IDENT LBRACKET list_typevar RBRACKET EQUAL list_of_cons
      { DDatatype ($1, $3, $6) }

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
  | DEF list_of_params EQUAL locals LBRACE list_of_expr RBRACE
      { DVar($2, $4, $6) }
  | DEF fun_def
      { $2 }

  list_of_assigns:
  | IDENT COLON typevar EQUAL expr
      { [(Param($1, $3),$5)] }
  | IDENT COLON typevar EQUAL expr COMMA list_of_assigns
      { (Param($1, $3), $5) :: $7 }

locals:
  | 
      { DLocal( []) }
  |  LET LPAREN list_of_assigns RPAREN 
      { DLocal($3) }

fun_def:
  | IDENT LPAREN list_of_params RPAREN COLON typevar EQUAL expr
      { DFunction ($1,[], $3, $6, $8) } 
  | IDENT LBRACKET list_typevar RBRACKET LPAREN list_of_params RPAREN COLON typevar EQUAL expr
      { DFunction ($1, $3, $6, $9, $11) } 

list_of_cons:
  | typecons
      { [$1] }
  | typecons PIPE list_of_cons
      { $1::$3 }

typecons:
  | MAJIDENT
      { DConstructor($1, []) }
  | MAJIDENT LPAREN list_of_params RPAREN
      { DConstructor($1, $3) }


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
      { EVar($1) }
  | constante
      { $1 }
  | LET LPAREN list_of_assigns RPAREN LBRACE expr RBRACE
      { lets_of_list $3 $6 }
  | CASE list_of_expr LBRACE filter RBRACE
      { ECase($2, $4) } 
  | IDENT  LPAREN list_of_expr RPAREN
      { ECall ($1, [], $3) }
  | IDENT LBRACKET list_typevar RBRACKET LPAREN list_of_expr RPAREN
      { ECall ($1, $3, $6) }
  | FUN LBRACKET list_typevar RBRACKET LPAREN list_of_params RPAREN
      COLON typevar ARROW expr 
      { (lambdas_of_list $3 $6 $9 $11) }
  | FUN LPAREN list_of_params RPAREN
      COLON typevar ARROW expr
      { (lambdas_of_list [] $3 $6 $8) }



constante:
  | MAJIDENT LBRACKET list_typevar RBRACKET LPAREN list_of_expr RPAREN
      { EConstant($1, build_annotation $3 $6) }
  | MAJIDENT LPAREN list_of_expr RPAREN
      { EConstant($1, $3) }
  | MAJIDENT
      { EConstant($1,[]) }
  | MAJIDENT LBRACKET list_typevar RBRACKET
      { EConstant($1, build_annotation $3 []) }
  | LBRACE list_of_couple RBRACE LBRACKET typevar RBRACKET
      { EApplication($2, $5) }
  | LBRACE RBRACE LBRACKET typevar RBRACKET
      { EApplication([], $4) }

 list_of_couple:
  | LPAREN expr COMMA expr RPAREN
      { [EApplicationCouple($2, $4)] }
  | LPAREN expr COMMA expr RPAREN COMMA list_of_couple
      { EApplicationCouple($2,$4) :: $7 }

list_of_pattern:
  | pattern
      { [$1] }
  | pattern COMMA list_of_pattern
      { $1::$3 }

pattern:
  | pattern_var 
      { $1 }
  | pattern_constant
      { $1 }
  | pattern_application
      { $1 }

pattern_var:
  | UNDEFINED
      { PUndefined }
  | IDENT COLON typevar
      { PVar($1, $3) }
  | ANONVAR COLON typevar
      { PAnonVar($3) }
filter:
  | PIPE list_of_pattern ARROW expr
      { pattern_of_list $2 $4 }
  | PIPE list_of_pattern ARROW expr filter
      { (pattern_of_list $2 $4) @ $5 } 
      
pattern_application:
  | LBRACE RBRACE LBRACKET typevar RBRACKET 
      { PVoidApplication ($4) }
  | LBRACE couple_pattern COMMA IDENT COLON typevar RBRACE
      { PApplication ($2, Param($4, $6)) }

couple_pattern:
  | LPAREN pattern_var COMMA pattern_var RPAREN
      { PCouple($2,$4) }
pattern_constant:
  | MAJIDENT LBRACKET list_typevar RBRACKET LPAREN list_of_pattern RPAREN
      { PConstant($1, $3, $6) }
  | MAJIDENT LBRACKET list_typevar RBRACKET
      { PConstant($1, $3, []) }
  | MAJIDENT LPAREN list_of_pattern RPAREN
      { PConstant($1, [], $3) }
  | MAJIDENT
      { PConstant($1, [], []) }

%%
