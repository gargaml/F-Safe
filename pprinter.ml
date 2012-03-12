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
(* File        : pprinter.ml                                                 *)
(* Description : fsafe pretty printer                                        *)
(*                                                                           *)
(*****************************************************************************)

open Printf
open Utils
open Fsafe

let string_of_type _ = 
  "..."

let string_of_expression e =
  let rec f e =
    match e with
      | EConstant(_, _, es) -> sprintf "...%s...\n"
	(List.fold_left (fun acc e -> acc ^ (f e)) "" es)
      | ELet(_, a, b) -> sprintf "...%s...%s...\n" (f a) (f b)
      | ECall(fn, _, es) -> sprintf "(\"%s\" call)\n%s" fn
	(List.fold_left (fun acc e -> acc ^ (f e)) "" es)
      | ECase(es, fs) -> sprintf "...%s...%s...\n"
	(List.fold_left (fun acc e -> acc ^ (f e)) "" es)
	(List.fold_left (fun acc (Filter(_,e)) -> acc ^ (f e)) "" fs)
      | _ -> ""
  in f e

let string_of_global g =
  match g with
    | DFun(f, vs, _, _, e) ->
      sprintf "def %s(%s) = %s\n" f
	(string_of_list (fun x -> x) "," vs)
	(string_of_expression e)
    | _ -> "...\n"

let string_of_fsafe fsafe =
  sprintf "/* Types */\n%s\n\n/* Vars */\n%s\n\n/* Expressions */\n%s\n\n"
    (string_of_list string_of_type "\n" fsafe.types)
    (string_of_list string_of_global "\n" fsafe.globals)
    (string_of_list string_of_expression "\n" fsafe.entry)

