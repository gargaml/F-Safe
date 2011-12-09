
type type_var = string

type data_constructor = string

type type_constructor = string 

type 'a ptyp =
  | Tvar of 'a 
  | Tarrow 'a ptyp * 'a ptyp

type typ = type_var ptyp

type data_constructor_definition =  DefCon of data_constructor * typ list 

type data_type_definition = 
  | DefDatatype of type_constructor * type_var list *   	data_constructor_definition list

type program = Prog of data_type_definition list (* * expression *)

