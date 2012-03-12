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
(* File        : cycle.ml                                                    *)
(* Description : cycle in callgraph detection algorithm                      *)
(*                                                                           *)
(*****************************************************************************)

open Callgraph
open Relationmatrix
open Printf

type cycle = (string*edge)list
let rec explore_couple callgraph cycle history = function
  | (funname, edges) ->
    match edges with 
      | [] -> []
      | edge :: rest -> 
	let rec explore_edge fun_name edge callgraph cycle history =
	  match edge with 
	    | (calledname,_,_,_) ->
	      if (List.mem
		    calledname
		    history)
	      then [cycle@[(fun_name,edge)]]
	      else explore_couple  callgraph (cycle@[(fun_name,edge)]) 
		history (calledname,(CallGraph.find calledname callgraph))
	in
	(explore_edge funname edge callgraph cycle (funname::history)) 
	@ (explore_couple  callgraph cycle (funname::history) (funname,rest))

    
    
    
    
let get_all_cycles callgraph mainfunc =
  let main_callgraphs = List.map (fun f -> (f,CallGraph.find f callgraph)) mainfunc in 
  let cycles_list = List.map 
    (fun x -> explore_couple  callgraph [] [] x )
    main_callgraphs
  in
 List.flatten cycles_list
    

  let rec string_of_cyclelist cl =
    let rec string_of_cycle cycle = 
      match cycle with
	| [] -> ")"
	| [(calling, (called, _, _, _))] ->  calling^" -> "^called^" )" 
	|(calling, (called, _, _, _))::rest -> calling^" -> "^called^" , "^(string_of_cycle rest)
    in
    match cl with
      | [] -> " }"
      | cycle :: rest -> "( "^(string_of_cycle cycle)^(string_of_cyclelist rest)

      
      
let cycletest = 
  let cycletotest = 
    CallGraph.add 
    "t" [] 
      (CallGraph.add 
	 "h" [("g",[],[],(Relationmatrix.empty 0 0))] 
	 (CallGraph.add 
	    "g" [("f",[],[],(Relationmatrix.empty 0 0));("t",[],[],(Relationmatrix.empty 0 0));("h",[],[],(Relationmatrix.empty 0 0))]
	    ( CallGraph.add 
		"f" [("g",[],[],(Relationmatrix.empty 0 0));("f",[],[],(Relationmatrix.empty 0 0));("h",[],[],(Relationmatrix.empty 0 0))]
		CallGraph.empty
	    )
	 )
      ) 
  in let mainfuns = ["f";"h"]
     in printf "il y a ces cycles dans le programme : %s\n" (string_of_cyclelist (get_all_cycles cycletotest mainfuns))
     
     
