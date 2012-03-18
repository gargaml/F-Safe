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

type parameter = string

type data_constructor = string

type type_constructor = string

type type_variable = string

type typed_variable = variable * atyp

and typed_parameter = parameter * atyp

and ptyp =
  | TVar of type_variable
  | TArrow of ptyp list * ptyp
  | TConApp of data_constructor * typed_variable list

and atyp =
  | AVar of type_variable
  | AArrow of atyp list * atyp (* do we need to modify the arrow ?! *)
  | AConApp of type_constructor * atyp list

type type_definition = 
  | TDef of type_constructor * type_variable list * ptyp list

type global_definition =
  | GDef of typed_variable * typed_expression
  | GRecDef of typed_variable list * typed_expression

and pattern =
  | Pattern of filter list * typed_expression

and filter =
  | PConApp of data_constructor * atyp list * filter list
  | PVar of typed_variable

and expression = 
  | EVar of variable
  | EConApp of data_constructor * atyp list * typed_expression list
  | ELet of (typed_variable * typed_expression) list * typed_expression list
  | EAbs of type_variable list * typed_parameter list * typed_expression
  | EApp of variable * atyp list * typed_expression list
  | ECase of typed_expression list * pattern list

and typed_expression = { e : expression;
			 t : atyp option }

type fsafe =
    {
      types   : type_definition list;
      globals : global_definition list;
      entry   : typed_expression list
    }
 
