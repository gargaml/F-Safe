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
(* File        : utils.ml                                                    *)
(* Description : utils functions and tools                                   *)
(*                                                                           *)
(*****************************************************************************)

(* val string_of_list : ('a -> string) -> string -> 'a list -> string = fun *)
let string_of_list fn sep lst =
  let rec f l =
    match l with
      | [] -> ""
      | h::[] -> fn h
      | h::t -> (fn h) ^ sep ^ (f t)
  in f lst

let fcount = ref 0

let fresh () =
  fcount := !fcount + 1;
  "v" ^ (string_of_int !fcount)

let rec fun_indent i =
  match i with
    | 0 -> ""
    | _ -> "  " ^ (fun_indent (i - 1))

let rec suppr_indent i t =
  match (i,t) with
    | ( 0, _) -> t
    | ( _, t) -> (suppr_indent (i - 1) (String.sub t 2 ((String.length t) - 2)))

