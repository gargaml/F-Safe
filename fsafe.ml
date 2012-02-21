(*****************************************************************************)
(*                                                                           *)
(* F-Safe                                                                    *)
(*                                                                           *)
(* File        : fsafe.ml                                                    *)
(* Description : fsafe abstract syntax tree description                      *)
(*                                                                           *)
(*****************************************************************************)

type type_var = string

type data_constructor = string

type type_constructor = string 


type ptyp =
  | Tvar of string
  | Tarrow of string *  ptyp
  | Tparam of string *  ptyp list


type param =  Param of string * ptyp

type data_constructor_definition =  DConstructor of data_constructor * param list 
    
type data_type_definition = 
  | DDatatype of type_constructor * ptyp list
    * data_constructor_definition list
type couple_pattern = 
PCouple of pattern * pattern
and
  pattern = 
  | PUndefined
  | PVar of string * ptyp
  | PAnonVar of ptyp
  | PConstante of string * ptyp list * pattern list
  | PVoidApplication of ptyp 
  | PApplication of couple_pattern * param
      
type filter = Filter of pattern list * expression
and
  appcouple =
    EApplicationCouple of expression * expression
and
  expression = 
  | EVar of string
  | EConstante of string * ptyp list * expression list
  | EApplication of appcouple list * ptyp 
  | ELet of param * expression * expression
  | ECase of expression list * filter list
  | ECall of string * ptyp list * expression list
  | EAbstraction of ptyp list * param list * ptyp * expression

type def_local = DLocal of (param * expression) list 
type var_definition =
  | DVar of param list * def_local * expression list
  | DFunction of string * ptyp list * param list * ptyp * expression
type fsafe = Fsafe of data_type_definition list * var_definition list * expression list 
