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
(* File        : fsafe.ml                                                    *)
(* Description : fsafe abstract syntax tree description                      *)
(*                                                                           *)
(*****************************************************************************)

type variable = string

type type_variable = string

type data_constructor = string

type type_constructor = string

type ptyp =
  | Tvar of variable
  | Tarrow of ptyp * ptyp
  | Tparam of type_constructor * annotated_component list

and atyp =
  | Var of variable
  | AArrow of atyp * atyp
  | AParam of type_constructor * atyp list

and annotated_variable =
  | AVar of variable * atyp

and annotated_parameter =
  | APar of variable * atyp

and annotated_component =
  | ACom of variable * ptyp

type constructor_definition =
  | DConstructor of data_constructor * annotated_component list 
    
type type_definition = 
  | DTypeDef of type_constructor * variable list * constructor_definition list

type key_value =
  | PKeyValue of pattern * pattern

and pattern =
  | PVar of variable * atyp
  | PCons of data_constructor * atyp list * pattern list
  | PEmptyMap of data_constructor * atyp
  | PMap of key_value list * pattern
      
type filter = Filter of pattern * expression

and expression = 
  | EVar of string
  | EConstant of string * atyp list * expression list
  | EKeyValue of expression * expression
  | ELet of annotated_variable * expression * expression
  | ELambda of atyp list * annotated_parameter * atyp * expression
  | ECall of string * atyp list * expression list
  | ECase of expression list * filter list
  | EMap of expression list * atyp
  | EAnnotation of expression * atyp

type def_local = DLocal of (annotated_variable * expression) list 

type var_definition =
  | DVar of annotated_variable * expression
  | DVars of annotated_variable list * def_local * variable list
  | DFun of variable * variable list * annotated_parameter list * atyp * expression

type fsafe =
    {
      types   : type_definition list;
      globals : var_definition list;
      entry   : expression list
    }
