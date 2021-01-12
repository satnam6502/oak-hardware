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

Require Import Coq.Bool.Bool.
Require Import Coq.Bool.Bvector.
Require Import Coq.Vectors.Vector.
Import VectorNotations.
Require Import Coq.Lists.List.
Import ListNotations.
Local Open Scope list_scope.

Require Import ExtLib.Structures.Monads.
Require Import ExtLib.Structures.Traversable.
Export MonadNotation.
Open Scope monad_scope.

Require Import Cava.Cava.
Require Import Cava.Acorn.Acorn.

Section WithCava.
  Context {signal} `{Cava signal} `{Monad cava}.

  (* A circuit to xor two bit-vectors *)
  Definition xorV {n : nat} (ab: signal (Vec Bit n) * signal (Vec Bit n)) :
    cava (signal (Vec Bit n)) :=
    zipWith xor2 (fst ab) (snd ab).

Definition l1 : seqType (Vec Bit 3) := [[false; false; false]%vector; [true; true; false]%vector]%list.
Definition l2 : seqType (Vec Bit 3) := [[false; true; false]%vector;  [false; true; false]%vector]%list.

Compute sequential (xorV (l1, l2)).
