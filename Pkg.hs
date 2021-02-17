
{-# OPTIONS_GHC -cpp -XMagicHash #-}
{- For Hugs, use the option -F"cpp -P -traditional" -}

module Pkg where

import qualified Prelude
import qualified CavaClass
import qualified CavaPrelude
import qualified Monad
import qualified Nat
import qualified Signal
import qualified Vector
import qualified VectorUtils

#ifdef __GLASGOW_HASKELL__
import qualified GHC.Base
#else
-- HUGS
import qualified IOExts
#endif

#ifdef __GLASGOW_HASKELL__
type Any = GHC.Base.Any
#else
-- HUGS
type Any = ()
#endif

aes_transpose :: 
(CavaClass.Cava
a1) ->
Prelude.Integer
->
Prelude.Integer
-> a1 ->
a1
aes_transpose semantics n m matrix =
  
let {
columns = 
CavaClass.peel
semantics
(Signal.Vec
(Signal.Vec
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))))))
n) m
matrix}
in
let {
items = 
Vector.map
(CavaClass.peel
semantics
(Signal.Vec
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))))))
n) m
columns}
in
let {
columns0 = 
Vector.map
(CavaClass.unpeel
semantics
(Signal.Vec
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))))))
m) n
(VectorUtils.transpose
n m
items)}
in
CavaClass.unpeel
semantics
(Signal.Vec
(Signal.Vec
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))))))
m) n
columns0

aes_mul2 :: 
(CavaClass.Cava
a1) ->
(Monad.Monad
(CavaClass.Coq_cava
a1 
Any)) ->
a1 ->
CavaClass.Coq_cava
a1 
a1
aes_mul2 semantics monad x =
  
Monad.bind
monad
(CavaClass.xor2
semantics
((,)
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x 0)
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))))
(\a ->
Monad.bind
monad
(CavaClass.xor2
semantics
((,)
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x
(Prelude.succ
(Prelude.succ
0)))
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))))
(\b ->
Monad.bind
monad
(CavaClass.xor2
semantics
((,)
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))))
(\c ->
Monad.ret
monad
(CavaClass.unpeel
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
(Vector.Coq_cons
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))))
(Vector.Coq_cons
a
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))
(Vector.Coq_cons
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x
(Prelude.succ
0))
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))
(Vector.Coq_cons
b
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))
(Vector.Coq_cons
c
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))
(Vector.Coq_cons
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))
(Prelude.succ
(Prelude.succ
0))
(Vector.Coq_cons
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))
(Prelude.succ
0)
(Vector.Coq_cons
(CavaClass.indexConst
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
x
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))))
0
Vector.Coq_nil))))))))))))

aes_mul4 :: 
(CavaClass.Cava
a1) ->
(Monad.Monad
(CavaClass.Coq_cava
a1 
Any)) ->
a1 ->
CavaClass.Coq_cava
a1 
a1
aes_mul4 semantics monad =
  
Monad.mcompose
monad
(aes_mul2
semantics
monad)
(aes_mul2
semantics
monad)

zero_byte :: 
(CavaClass.Cava
a1) -> a1
zero_byte semantics =
  
CavaClass.unpeel
semantics
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))))
(Vector.const
(CavaPrelude.zero
semantics)
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))))))

aes_circ_byte_shift :: 
(CavaClass.Cava
a1) ->
(Monad.Monad
(CavaClass.Coq_cava
a1 
Any)) ->
Prelude.Integer
-> a1 ->
CavaClass.Coq_cava
a1 
a1
aes_circ_byte_shift semantics monad shift input =
  
let {
indices = Vector.Coq_cons
(Nat.sub
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))
shift)
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))
(Vector.Coq_cons
(Nat.sub
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))
shift)
(Prelude.succ
(Prelude.succ
0))
(Vector.Coq_cons
(Nat.sub
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))))
shift)
(Prelude.succ
0)
(Vector.Coq_cons
(Nat.sub
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))))
shift) 0
Vector.Coq_nil)))}
in
let {
indices0 = 
Vector.map
(\x ->
Nat.modulo
x
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))
indices}
in
Monad.ret
monad
(CavaClass.unpeel
semantics
(Signal.Vec
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))))))
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))
(Vector.map
(CavaClass.indexConst
semantics
(Signal.Vec
Signal.Bit
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0)))))))))
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))
input)
(Prelude.succ
(Prelude.succ
(Prelude.succ
(Prelude.succ
0))))
indices0))

