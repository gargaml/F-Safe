/*****************************************************************************|
|*     This file is part of FSafe.                                           *|
|*                                                                           *|
|*     FSafe is free software: you can redistribute it and/or modify         *|
|*     it under the terms of the GNU General Public License as published by  *|
|*     the Free Software Foundation, either version 3 of the License, or     *|
|*     (at your option) any later version.                                   *|
|*                                                                           *|
|*     FSafe is distributed in the hope that it will be useful,              *|
|*     but WITHOUT ANY WARRANTY; without even the implied warranty of        *|
|*     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *|
|*     GNU General Public License for more details.                          *|
|*                                                                           *|
|*     You should have received a copy of the GNU General Public License     *|
|*     along with FSafe.  If not, see <http://www.gnu.org/licenses/>.        *|
|*                                                                           *|
|*                                                                           *|
|* File        : parser.mly                                                  *|
|* Description : fsafe parser                                                *|
|*                                                                           *|
|*****************************************************************************/

%{

  open Fsafe
  open Utils

%}

%token TYPE DEF CASE FUN LET JOKER

%token <string> IDENT
%token <string> MAJIDENT

%token LPAREN RPAREN LBRACKET RBRACKET LBRACE RBRACE 
%token COMMA COLON PIPE EQUAL EOF ARROW TYPEARROW

%right TYPEARROW

%start fsafe
%type <Fsafe.fsafe> fsafe

%%

fsafe:
  | t = type_definitions d = global_definitions p = program EOF
      { { types = t; globals = d; entry = p } }

program :
  |
      { [] }
  | e = expression es = expressions
      { e :: es }

annotation:
  | i = MAJIDENT
      { AVar i }
  | i = IDENT
      { AConApp (i, []) }
  | i = IDENT LBRACKET ans = annotations RBRACKET
      { AConApp (i, ans) }
  | a1 = annotation TYPEARROW a2 = annotation
      { AArrow (a1, a2) }

annotations:
  |
      { [] }
  | a = annotation
      { [ a ] }
  | a = annotation COMMA ans = annotations
      { a :: ans }

type_variables:
  |
      { [] }
  | i = MAJIDENT
      { [i] }
  | i = MAJIDENT COMMA tvs = type_variables
      { i :: tvs }

typed_variable:
  | i = IDENT COLON a = annotation
      { (i, a) }

typed_parameter:
  | i = IDENT COLON a = annotation
      { (i, a) }

typed_variables:
  | av = typed_variable
      { [ av ] }
  | av = typed_variable COMMA avs = typed_variables
      { av :: avs }

typed_parameters:
  | ap = typed_parameter
      { [ ap ] }
  | ap = typed_parameter COMMA aps = typed_parameters
      { ap :: aps }

assignments:
  |
      { [] }
  | tv = typed_variable EQUAL e = expression
      { [ (tv, e) ] }
  | tv = typed_variable EQUAL e = expression COMMA ass = assignments (* sorry *)
      { (tv, e) :: ass }
      
type_definitions:
  |
      { [] }
  | td = type_definition tds = type_definitions
      { td :: tds }

type_definition:
  | TYPE i = IDENT EQUAL dcs = data_constructors
      { TDef (i, [], dcs) }
  | TYPE i = IDENT LBRACKET tvs = type_variables RBRACKET EQUAL dcs = data_constructors
      { TDef (i, tvs, dcs) }

data_constructors:
  | dc = data_constructor
      { [ dc ] }
  | dc = data_constructor PIPE dcs = data_constructors
      { dc :: dcs }

data_constructor:
  | i = MAJIDENT
      { TConApp (i, []) }
  | i = MAJIDENT LPAREN tvs = typed_variables RPAREN
      { TConApp (i, tvs) }
      
global_definitions:
  | 
      { [] }
  | gd = global_definition gds = global_definitions
      { gd :: gds }

global_definition:
  | DEF tv = typed_variable EQUAL e = expression
      { GDef (tv, e) }
  | DEF i = IDENT LPAREN tps = typed_parameters RPAREN COLON a = annotation EQUAL
    e = expression
      { GDef ((i, a), { e = EAbs ([], tps, e); t = None }) }
  | DEF i = IDENT LBRACKET tvs = type_variables RBRACKET LPAREN tps = typed_parameters RPAREN
    COLON a = annotation EQUAL e = expression
      { GDef ((i, a), { e = (EAbs (tvs, tps, e)); t = None }) }
  | DEF is = typed_variables EQUAL e = expression
      { GRecDef (is, e) }

(* expressions return a list of typed_expressions *)

expressions:
  | e = expression
      { [e] }
  | e = expression COMMA es = expressions
      { e :: es }

(* expression returns a typed_expression *)

expression:
  | i = IDENT
      { { e = EVar i; t = None } }
  | tca = dconstructor_application
      { { e = tca; t = None } }
  | LET LPAREN ass = assignments RPAREN LBRACE e = expressions RBRACE (* sorry *)
      { { e = ELet (ass, e); t = None } }
  | CASE tes = expressions LBRACE ps = patterns RBRACE
      { { e = ECase (tes, ps); t = None } }
  | i = IDENT LPAREN es = expressions RPAREN
      { { e = EApp (i, [], es); t = None } }
  | i = IDENT LBRACKET ans = annotations RBRACKET LPAREN es = expressions RPAREN
      { { e = EApp (i, ans, es); t = None } }
  | FUN LBRACKET tvs = type_variables RBRACKET
        LPAREN aps = typed_parameters RPAREN
        COLON a = annotation ARROW e = expression
      { { e = EAbs (tvs, aps, e); t = None } }
  | FUN LPAREN aps = typed_parameters RPAREN
        COLON a = annotation ARROW e = expression
      { { e = EAbs ([], aps, e); t = None } }

dconstructor_application:
  | i = MAJIDENT LBRACKET ans = annotations RBRACKET LPAREN tes = expressions RPAREN
      { EConApp (i, ans, tes) }
  | i = MAJIDENT LBRACKET ans = annotations RBRACKET
      { EConApp (i, ans, []) }
  | i = MAJIDENT LPAREN tes = expressions RPAREN
      { EConApp (i, [], tes) }
  | i = MAJIDENT
      { EConApp (i, [], []) }

patterns:
  | PIPE fs = filters ARROW e = expression
      { [ Pattern (fs, e) ] }
  | PIPE fs = filters ARROW e = expression ps = patterns
      { Pattern (fs, e) :: ps } 
      
filters:
  | f = filter
      { [ f ] }
  | f = filter COMMA fs = filters
      { f :: fs }

filter:
  | fv = filter_variable
      { fv }
  | fdc = filter_data_constructor
      { fdc }

filter_variable:
  | tv = typed_variable
      { PVar tv }
  | JOKER COLON a = annotation
      { PVar (fresh (), a) }

filter_data_constructor:
  | i = MAJIDENT LBRACKET ans = annotations RBRACKET LPAREN fs = filters RPAREN
      { PConApp (i, ans, fs) }
  | i = MAJIDENT LBRACKET ans = annotations RBRACKET
      { PConApp (i, ans, []) }
  | i = MAJIDENT LPAREN fs = filters RPAREN
      { PConApp (i, [], fs) }
  | i = MAJIDENT
      { PConApp (i, [], []) }


%%
