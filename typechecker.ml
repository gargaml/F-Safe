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
(* File        : typechecker.ml                                              *)
(* Description : typing stuff                                                *)
(*                                                                           *)
(*****************************************************************************)

open Fsafe
open Wftype

exception TypingException

(*let type_decorate ({ types = ts ; globals = gs ; entry = es } as ast) dcenv =
  let rec f env { e = e ; t = t } = 
    match e with
      | EVar v -> { e = e ; t = lookup env v }
      | EConApp (dc, ass, tes) -> 
      | ELet (ts, te) ->
	let ts' = List.map (f env) ts in
	let te' = f env 
      | EAbs (tvs, tps, te) ->
      | EApp (v, ass, tes) ->
      | ECase (tes, ps) ->
  in
  let g (gacc, gmacc) = function
    | GDef (tv, te) -> 
    | GRecDef (tvs, te) ->
  in
  let (globals, gamma) = List.fold_left g ([], SMap.empty) gs in
  { types = ts ; globals = globals ; entry = es }*)

let typecheck ast dcenv =
  (*let { types = ts ; globals = gs ; entry = es } = type_decorate ast dcenv in
  { types = ts ; globals = gs ; entry = es }*)
  ast

