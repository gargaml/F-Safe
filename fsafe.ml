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

type ptyp =
  | Tvar of string
  | Tarrow of string *  ptyp
  | Tparam of string *  ptyp list
  | TvarPolymorphic of string
  | TarrowPolymorphic of string *  ptyp
  | TparamPolymorphic of string *  ptyp list


type param =  Param of string * ptyp

type data_constructor_definition =  DConstructor of string * param list 
    
type data_type_definition = 
  | DDatatype of string * ptyp list
    * data_constructor_definition list
type couple_pattern = 
PCouple of pattern * pattern
and
  pattern = 
  | PVar of string * ptyp
  | PCons of string * ptyp list * pattern list
  | PVoidApplication of ptyp 
  | PApplication of couple_pattern * param
      
type filter = Filter of pattern * expression
and
  appcouple =
    EApplicationCouple of expression * expression
and
  expression = 
  | EVar of string
  | EConstant of string * expression list
  | EApplication of appcouple list * ptyp 
  | ELet of param * expression * expression
  | ECase of expression list * filter list
  | ECall of string * ptyp list * expression list
  | EAbstraction of ptyp list * param * ptyp * expression
  | EAnnotation of ptyp

type def_local = DLocal of (param * expression) list 
type var_definition =
  | DVar of param list * def_local * expression list
  | DFunction of string * ptyp list * param list * ptyp * expression
type fsafe = Fsafe of data_type_definition list * var_definition list * expression list 
