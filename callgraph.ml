open Relationmatrix
open Fsafe


module Graph = Map.Make(
struct 
  type t =string
  let compare = String.compare
end);;


(* called function name * ( calling function args * called function args * 
   relation matrix beetween calling and called function) *)
type callgraph = (string*(string list*string list*relationmatrix)) list


let rec inparamlist callingparams =
  match callingparams with 
      [] -> []
    | Param (p,_) :: l ->  p :: (inparamlist l);;

			
let rec outparamlist x = 
  match x with 
    | [] -> []
    | EVar s :: l -> s :: outparamlist l
    | EConstant (s, _) :: l-> s :: outparamlist l
    | _ -> failwith " "  
	  
(*Fsafe.fsafe -> Callgraph.callgraph*)
(* 
let build_callgraph prog =
  match prog with 
      Fsafe(_, defs, exps) -> 
	let getgraph graph_map exp =
	  match exp with
	    | ECall  (fname,_,exps) -> 
	      let checkdef graph_mapp def = 
		match def with
		  | DFunction (fname, _, callingparams, _, exp) ->
		    let inparams = inparamlist callingparams in
		    match exp with  
		      | ECall (fname_calledf, _, exps) -> 	      
			let outparams = outparamlist exps in 
			Graph.add fname (fname_calledf,
					 (inparams, outparams,
					  Relationmatrix.empty)) 
			  graph_mapp
                      | _ -> failwith "Not implemented"
	      in List.fold_left checkdef graph_map defs
	in List.fold  getgraph Graph.empty exps
*)
