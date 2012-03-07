open Matrix_of_relation


module Graph = Map.Make(
struct 
  type t =string
  let compare = String.compare
end);;


(* called function name * ( calling function args * called function args * relation matrix beetween calling and called function) *)
type callgraph = (string*(string list*string list*matrix_of_relation)) list



