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

  let rec lets_of_list l expr
    match l with
      | [] -> expr
      | (x, a)::t -> ELet(x, a, lets_of_list t expr)
	
  let pattern_of_list patterns expr =
    (map (fun x -> Filter(x,expr)) patterns)

  let rec lambdas_of_list params lambdas funtype expr =
    match lambdas with
      | [] -> expr
      | lambda :: t ->
	ELambda (params, lambda, funtype, lambdas_of_list params t funtype expr)
%}

%token TYPE AND DEF CASE FUN LET ANONVAR

%token <string> IDENT
%token <string> MAJIDENT

%token LPAREN RPAREN LBRACKET RBRACKET LBRACE RBRACE 
%token COMMA COLON PIPE EQUAL EOF ARROW TYPEARROW UNDEFINED

%right TYPEARROW

%start fsafe
%type <Fsafe.fsafe> fsafe

%%

fsafe:
  | list_of_type_dec global_defs program EOF
      { { types = $1; globals = $2; entry = $3 } }

program :
  |
      { [] }
  | exprs
      { $1 }

idents:
  |
      { [] }
  | IDENT
      { [ $1 ] }
  | IDENT COMMA idents
      { $1 :: $3 }

majidents:
  |
      { [] }
  | MAJIDENT
      { [ $1 ] }
  | MAJIDENT COMMA majidents
      { $1 :: $3 }

list_of_type_dec :
  | 
      { [] }
  | type_dec list_of_type_dec
      { $1 @ $2 }

annotation:
  | MAJIDENT
      { Var $1 }
  | IDENT
      { AParam ($1, []) }
  | IDENT LBRACKET idents RBRACKET
      { AParam ($1, List.map (fun x -> AParam (x, [])) $3) }
  | annotation TYPEARROW annotation
      { AArrow ($1, $3) }

type_:
  | MAJIDENT
      { Tvar $1 }
  | IDENT
      { Tparam ($1, []) }
  | IDENT LBRACKET types_ RBRACKET
      { Tparam ($1, []) }

types_:
  |
      { [] }
  | type_
      { [ $1 ] }
  | type_ COMMA types_
      { $1 :: $3 }

annotations:
  |
      { [] }
  | annotation
      { [ $1 ] }
  | annotation COMMA annotations
      { $1 :: $3 }

annotated_variable:
  | IDENT COLON annotation
      { AVar ($1, $3) }

annotated_parameter:
  | IDENT COLON annotation
      { APar ($1, $3) }

annotated_component:
  | IDENT COLON type_
      { ACom ($1, $3) }

annotated_variables:
  | annotated_variable
      { [ $1 ] }
  | annotated_variable COMMA annotated_variables
      { $1 :: $3 }

annotated_parameters:
  | annotated_parameter
      { [ $1 ] }
  | annotated_parameter COMMA annotated_parameters
      { $1 :: $3 }

annotated_components:
  |
      { [] }
  | annotated_component
      { [ $1 ] }
  | annotated_component COMMA annotated_components
      { $1 :: $3 }

assignments:
  |
      { [] }
  | annotated_variable EQUAL expr 
      { [ ($1, $3) ] }
  | annotated_variable EQUAL expr COMMA assignments
      { ($1, $3) :: $5 }

type_def:
  | IDENT EQUAL list_of_cons
      { DTypeDef ($1, [], $3) }
  | IDENT LBRACKET majidents RBRACKET EQUAL list_of_cons
      { DTypeDef ($1, $3, $6) }

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

global_defs:
  | 
      { [] }
  | global_def global_defs
      { $1::$2 }

global_def:
  | DEF annotated_variable EQUAL expr
      { DVar($2, $4) }
  | DEF IDENT LPAREN annotated_parameters RPAREN COLON annotation EQUAL expr
      { DFun ($2, [], $4, $7, $9) }
  | DEF annotated_variables EQUAL LET LPAREN assignments RPAREN LBRACE idents RBRACE
      { DVars ($2, DLocal $6, $9) }
  | DEF IDENT LBRACKET idents RBRACKET LPAREN annotated_parameters RPAREN
    COLON annotation EQUAL expr
      { DFun ($2, $4, $7, $10, $12) }

list_of_cons:
  | typecons
      { [$1] }
  | typecons PIPE list_of_cons
      { $1::$3 }

typecons:
  | MAJIDENT
      { DConstructor($1, []) }
  | MAJIDENT LPAREN annotated_components RPAREN
      { DConstructor($1, $3) }
      
exprs: 
  | expr
      { [$1] }
  | expr COMMA exprs
      { $1::$3 }

expr:
  | IDENT
      { EVar($1) }
  | constante
      { $1 }
  | LET LPAREN assignments RPAREN LBRACE expr RBRACE
      { lets_of_list $3 $6 }
  | CASE exprs LBRACE filter RBRACE
      { ECase($2, $4) }
  | IDENT  LPAREN exprs RPAREN
      { ECall ($1, [], $3) }
  | IDENT LBRACKET annotations RBRACKET LPAREN exprs RPAREN
      { ECall ($1, $3, $6) }
  | FUN LBRACKET annotations RBRACKET LPAREN annotated_parameters RPAREN
      COLON annotation ARROW expr 
      { (lambdas_of_list $3 $6 $9 $11) }
  | FUN LPAREN annotated_parameters RPAREN
      COLON annotation ARROW expr
      { (lambdas_of_list [] $3 $6 $8) }

constante:
  | MAJIDENT LBRACKET annotations RBRACKET LPAREN exprs RPAREN
      { EConstant ($1, $3, $6) }
  | MAJIDENT LBRACKET annotations RBRACKET
      { EConstant ($1, $3, []) }
  | MAJIDENT LPAREN exprs RPAREN
      { EConstant ($1, [], $3) }
  | MAJIDENT
      { EConstant ($1, [], []) }
  | LBRACE list_of_key_value RBRACE LBRACKET annotation RBRACKET
      { EMap ($2, $5) }
  | LBRACE RBRACE LBRACKET annotation RBRACKET
      { EMap ([], $4) }

list_of_key_value:
  | LPAREN expr COMMA expr RPAREN
      { [ EKeyValue ($2, $4) ] }
  | LPAREN expr COMMA expr RPAREN COMMA list_of_key_value
      { EKeyValue ($2,$4) :: $7 }

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
      { PVar("undefined", Var("Undefined")) }
  | IDENT COLON annotation
      { PVar($1, $3) }
  | ANONVAR COLON annotation
      { PVar("_",$3) }
filter:
  | PIPE list_of_pattern ARROW expr
      { pattern_of_list $2 $4 }
  | PIPE list_of_pattern ARROW expr filter
      { (pattern_of_list $2 $4) @ $5 } 
      
pattern_application:
  | LBRACE RBRACE LBRACKET annotation RBRACKET 
      { PEmptyMap ("{}", $4) }
  | LBRACE key_value COMMA pattern RBRACE
      { PMap ($2, $4) }

key_value:
  | 
      { [ ] }
  | LPAREN pattern COMMA pattern RPAREN COMMA key_value
      { PKeyValue ($2, $4) :: $7 }

pattern_constant:
  | MAJIDENT LBRACKET annotations RBRACKET LPAREN list_of_pattern RPAREN
      { PCons ($1, $3, $6) }
  | MAJIDENT LBRACKET annotations RBRACKET
      { PCons ($1, $3, []) }
  | MAJIDENT LPAREN list_of_pattern RPAREN
      { PCons ($1, [], $3) }
  | MAJIDENT
      { PCons ($1, [], []) }

%%
