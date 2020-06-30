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

From Coq Require Import Ascii String.

From Coq Require Import Lists.List.
Import ListNotations.

Require Import ExtLib.Structures.Monads.
Export MonadNotation.

Require Import Omega.

Open Scope monad_scope.

Require Import Cava.Cava.
Require Import Cava.Monad.CavaMonad.

Definition NPeriphIn := 32.
Definition NPeriphOut := 32.
Definition NMioPads := 32.

Definition pinmuxInterface :=
  sequentialInterface "pinmux"
     "clk_i" PositiveEdge "rst_ni" NegativeEdge

     (mkPort "tl_i" (ExternalType "tlul_pkg::tl_h2d_t"),
      mkPort "periph_to_mio_i" (BitVec Bit NPeriphOut),
      mkPort "periph_to_mio_oe_i" (BitVec Bit NPeriphOut),
      mkPort "mio_in_i" (BitVec Bit NMioPads)
     )

     (mkPort "tl_o" (ExternalType "tlul_pkg::tl_d2h_t"),
      mkPort "mio_to_periph_o" (BitVec Bit NPeriphIn),
      mkPort "mio_out_o" (BitVec Bit NMioPads),
      mkPort "mio_oe_o" (BitVec Bit NMioPads)
     )
     [].

Definition pinmux (inputs: Signal (ExternalType "tlul_pkg::tl_h2d_t") *
                           Signal (BitVec Bit NPeriphOut) *
                           Signal (BitVec Bit NPeriphOut) *
                           Signal (BitVec Bit NMioPads)) :
                    state CavaState 
                    (Signal (ExternalType "tlul_pkg::tl_d2h_t") *
                     Signal (BitVec Bit NPeriphIn) *
                     Signal (BitVec Bit NMioPads) *
                     Signal (BitVec Bit NMioPads))%type :=
  let '(tl_i, periph_to_mio_i, periph_to_mio_oe_i, mio_in_i) := inputs in
  z <- zero ;;
  ret (UninterpretedSignal "xxx",
       VecLit (Vector.const z NPeriphIn),
       VecLit (Vector.const z NMioPads),
       VecLit (Vector.const z NMioPads)).

Definition pinmuxNetlist := makeNetlist pinmuxInterface pinmux.
