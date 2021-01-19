(****************************************************************************)
(* Copyright 2020 The Project Oak Authors                                   *)
(*                                                                          *)
(* Licensed under the Apache License, Version 2.0 (the "License")           *)
(* you may not use this file except in compliance with the License.         *)
(* You may obtain a copy of the License at                                  *)
(*                                                                          *)
(*     http://www.apache.org/licenses/LICENSE-2.0                           *)
(*                                                                          *)
(* Unless required by applicable law or agreed to in writing, software      *)
(* distributed under the License is distributed on an "AS IS" BASIS,        *)
(* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. *)
(* See the License for the specific language governing permissions and      *)
(* limitations under the License.                                           *)
(****************************************************************************)

Require Import ExtLib.Structures.Monads.
Require Import Cava.Acorn.CavaClass.
Require Import Cava.Signal.

Section WithCava.
  Context {signal} `{Cava signal} `{Monad cava}.

  (* Constant values sourced by a circuit. *)
  (* This component always returns the value 0. *)
  Definition zero : cava (signal Bit) := ret (constant false).
  (* This component always returns the value 1. *)
  Definition one  : cava (signal Bit) := ret (constant true).

End WithCava.