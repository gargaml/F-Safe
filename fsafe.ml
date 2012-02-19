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

type data_constructor_definition =  DefCon of data_constructor * param list 
    
type data_type_definition = 
  | DefDatatype of type_constructor * ptyp list
    * data_constructor_definition list
type coupleparam = 
Couple of param * param

type motif = 
  | Var_filt of param
  | AnonVar of ptyp
  | Constante_filt of string * ptyp list * motif list
  | AppVide of ptyp 
  | AppFilter of coupleparam * param
      
type filter = Filter of motif list * expression
and
  appcouple =
    AppCouple of expression * expression
and
  expression = 
  | Var of string
  | Constante of string * ptyp list * expression list
  | AppConstr of appcouple list * ptyp 
  | Let of param * expression * expression
  | Case of expression list * filter list
  | Call of string * ptyp list * expression list
  | Anon_fun of ptyp list * param list * ptyp * expression

type env_local = EnvLocal of (param * expression) list
type var_definition =
  | DefVar of param list * env_local * expression list
  | DefFunction of string * ptyp list * param list * ptyp * expression
type fsafe = Fsafe of data_type_definition list * var_definition list * expression list 
