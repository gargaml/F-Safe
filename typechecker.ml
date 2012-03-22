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

let decorate_ast dcenv { types = ts; globals = gs; entry = es } =
  let rec decorate aenv te =
    match te.e with
      | EVar v -> { e = EVar v; t = Some (SMap.find v aenv) }
      | EConApp (dc, ans, tes) ->
	decorate_econapp aenv dc ans tes
      | ELet (tvtes, tes) ->
	let f (tv, te) = (tv, decorate aenv te) in
	let add acc ((v, a), _) = SMap.add v a acc in
	let tvtes' = List.map f tvtes in
	let aenv' = List.fold_left add aenv tvtes' in
	let tes' = List.map (decorate aenv') tes in
	{ e = ELet (tvtes', tes'); t = (List.hd tes).t }
      | EAbs (tvs, tps, te) ->
	let add acc (p, a) = SMap.add p a acc in
	let aenv' = List.fold_left add aenv tps in
	let te' = decorate aenv' te in
	let ts = List.map snd tps in (
	match te'.t with
	  | Some a ->
	    { e = EAbs (tvs, tps, te'); t = Some (AArrow (ts, a)) }
	  | None -> failwith "Missing annotation"
	)
      | EApp (v, ans, tes) ->
	let tes' = List.map (decorate aenv) tes in (
	  match SMap.find v aenv with
	    | AArrow (tp, r) -> { e = EApp (v, ans, tes'); t = Some r }
	    | _ -> failwith "An abstraction was expected"
	)
      | ECase (tes, ps) ->
	let tes' = List.map (decorate aenv) tes in
	let ps' = decorate_patterns aenv ps in
	match List.hd ps' with
	  | Pattern (_, { e = _; t = ao }) -> { e = ECase (tes', ps'); t = ao }

  and decorate_econapp aenv dc ans tes =
    match SMap.find dc dcenv with
      | TScheme (_, _, a) -> (
	match a with
	  | (AConApp (tc, _)) as a ->
	    let tes' = List.map (decorate aenv) tes in
	    { e = EConApp (dc, ans, tes'); t = Some a }
	  | _ -> failwith "Unexpected annotation"
      )

  and decorate_patterns aenv ps =
    let rec add_filters aenv = function
      | [] -> aenv
      | f :: fs ->
	let aenv' = add_filter aenv f in
	add_filters aenv' fs
    and add_filter aenv = function
      | PConApp (_, _, fs) ->
	add_filters aenv fs
      | PVar (v, a) ->
	SMap.add v a aenv 
    in
    let decorate_pattern (Pattern (fs, te)) =
      let aenv' = add_filters aenv fs in
      Pattern (fs, decorate aenv' te)
    in
    List.map decorate_pattern ps
  in
  let decorate_definition aenv d =
    match d with
      | GDef ((v, t), te) ->
	let te' = decorate aenv te in (
	match te' with
	  | { e = _; t = Some a } -> GDef ((v, t), te')
	  | _ -> failwith "Unexpected..."
	)
      | GRecDef (tvs, te) -> failwith "Not yet..."
  in
  let decorate_definitions aenv gs =
    let rec loop globals = function
      | [] -> List.rev globals
      | d :: ds ->
	let d' = decorate_definition aenv d in
	loop (d' :: globals) ds
    in loop [] gs
  in
  let decorate_expressions aenv es =
    List.map (decorate aenv) es
  in
  let init aenv =
    let rec loop aenv gs = match gs with
      | [] -> aenv
      | GDef ((v, t), _) :: gs ->
	let aenv' = SMap.add v t aenv in
	loop aenv' gs
      | GRecDef (tvs, _) :: gs ->
	let aenv' = List.fold_left (fun acc (v, t) -> SMap.add v t acc) aenv tvs in
	loop aenv' gs
    in loop aenv gs
  in
  let aenv = init SMap.empty in
  let gs' = decorate_definitions SMap.empty gs in
  let es' = decorate_expressions aenv es in
  { types = ts; globals = gs'; entry = es' }
