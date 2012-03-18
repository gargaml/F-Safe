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

let idt = "  "

let icpt = ref 0

let debug_test () = " icpt is "^ (string_of_int !icpt) ^") "

let rec print_count txt nb=
  match nb with
    | 0 -> ""
    | nb when nb<0 -> failwith "negative icpt number"
    | nb -> txt ^ (print_count txt (nb-1))
  
(* increases indent counting then print*)
let id_add_print () =
  icpt:= !icpt +1;
  (print_count idt !icpt)
(*  ^ " (add_print "^  debug_test ();*)

(* print then increases indent counting*)
and id_print_add () =
  icpt:= !icpt +1;
  (print_count idt ((!icpt) - 1))
(*  ^ " (print_add " ^ debug_test ();*)

(* decreases indent counting then print*)
and id_min_print () =
  icpt:= !icpt -1;
  (print_count idt (!icpt))
(*  ^ " (min_print" ^debug_test ();*)

(* print then decreases indent counting*)
and id_print_min () =
  icpt:= !icpt -1;
  (print_count idt ((!icpt) + 1))
(*  ^ " (print_min" ^debug_test ();*)

(* print icpt indentations *)
and id_print () =
  (print_count idt (!icpt))
(*  ^" (print" ^debug_test ();*)

(* increases icpt *)
and id_add () =
  icpt:= (!icpt) + 1;
  ""
(*  ^" (id_add" ^ debug_test ();*)

(* decreases icpt *)
and id_min () =
  icpt:= (!icpt) - 1;
  ""
(*  ^ " (id_min" ^ debug_test ();*)
