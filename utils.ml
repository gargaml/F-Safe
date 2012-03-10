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
