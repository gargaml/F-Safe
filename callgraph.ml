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
(* File        : callgraph.ml                                                *)
(* Description : callgraph and termination stuff                             *)
(*                                                                           *)
(*****************************************************************************)

open Relationmatrix
open Fsafe
open Printf


module CallGraph = Map.Make(
struct 
  type t = string
  let compare = String.compare
end);;

type  in_param = string 
type out_param = string 
(* called function name * ( calling function args * called function args * 
   relation matrix beetween calling and called function) *)
type edge = string * in_param list * out_param list * relationmatrix


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


(*Fsafe.fsafe -> Callgraph.edge*)

(*let build_callgraph prog =*)
    (*match prog with*)
    (*Fsafe(_, defs, exps) ->*)
        (*let getgraph graph_map exp =*)
            (*match exp with*)
            (*| ECall  (fname,_,_) -> *)
                (*let checkdef graph_mapp def = *)
                    (*match def with*)
                    (*| DFunction (fname2, _, callingparams, _, exp) ->*)
                            (*if fname == fname2*)
                            (*let inparams = inparamlist callingparams in*)
                            (*match exp with*)
                            (*| ECall (fname_calledf, _, exps) -> 	    *)
                                    (*let outparams = outparamlist exps in*)
                                    (*CallGraph.add fname (fname_calledf, inparams, outparams, Relationmatrix.empty) graph_mapp*)
                            (*| _ -> failwith "Not implemented"*)
                                    (*in List.fold_left checkdef graph_map defs*)
                (*in List.fold_left getgraph CallGraph.empty exps*)


let dot_of_callgraph graph =
  let oc = open_out "callgraph.dot" in
  fprintf oc "digraph Callgraph {\n";
  Graph.iter (fun k _ -> fprintf oc "\"%s\" [ fontcolor=blue ]\n" k) graph;
  Graph.iter (fun k ls -> 
    List.iter (fun (l, _) -> fprintf oc "\"%s\" -> \"%s\" [ fontcolor=red ]"
      k l) ls) graph;
  fprintf oc "}\n";
  close_out oc
