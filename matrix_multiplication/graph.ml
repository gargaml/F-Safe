open Matrix_of_relation
open Fsafe.ml


module Graph = Map.Make(
struct 
  type t =string
  let compare = String.compare
end);;


(* called function name * ( calling function args * called function args * 
   relation matrix beetween calling and called function) *)
type callgraph = (string*(string list*string list*matrix_of_relation)) list


let rec inparamlist callingparams =
  match callingparams with 
      [] -> []
    | Param (p,_) :: l ->  p :: (inparams l);;

			
let rec outparamlist x = 
  match x with 
    |[] -> []
    |  EVar s :: l -> s :: getOutParam l
    | EConstant (s,_) :: l-> s :: getOutParam l
    | _ -> failwith " ")  
	  
(*Fsafe.fsafe -> Callgraph.callgraph*)
let build_callgraph prog =
  let getgraph graph_map ast =
  match prog with 
      Fsafe(_,defs,exps) -> 
List.map
	match exps with
	    [] -> Graph.empty
	  | ECall  (fname,_,exps) :: l1 -> 
	    match defs with
	      |DFunction (fname,_,callingparms,_,exp) :: l2->
		let inparams = inparamlist callingparams in 
                
		match exp with  
		  | ECall (fname_calledf,_,exps) -> 	      
		    let outparams = outparamlist exps in 
		    Graph.add fname (calledf,
				     (inparams, outparams,
				      matrix_of_relation)) graph_map
                  | _ -> 
in getgraph Graph.empty prog
		      
		  
