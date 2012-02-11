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


type motif = 
  | Var_filt of param
  | AnonVar of ptyp
  | Constante_filt of string * ptyp list * motif list
type filter = Filter of motif list * expression
and
  assign = Assign of param * expression
and
 expression = 
  | Var of string
  | Constante of string * ptyp list * expression list
  | Let of assign list * expression
  | Case of expression list * filter list
  | Call of string * ptyp list * expression list
  | Anon_fun of ptyp list * param list * ptyp * expression

type function_definition =
  | DefFunction of string * ptyp list * param list * ptyp * expression list

type program =
  | Program of param list * expression list

type declaration = 
  | DeclDataType of data_type_definition list
  | DeclFunction of function_definition list
  | DeclProgram of program

type fsafe = Fsafe of declaration list 
