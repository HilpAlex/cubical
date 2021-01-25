{-# OPTIONS --cubical --no-import-sorts --no-exact-split --safe #-}
module Cubical.Data.Fin.Literals where

open import Cubical.Data.Nat.Literals public
open import Cubical.Data.Fin.Base
  using (Fin; fromℕ≤)
open import Agda.Builtin.Nat
  using (suc)
open import Cubical.Data.Nat.Order.Recursive
  using (_≤_)

instance
  fromFin : {n : _} → HasFromNat (Fin (suc n))
  fromFin {n} = record
    { Constraint = λ m → m ≤ n
    ; fromNat    = λ m ⦃ m≤n ⦄ → fromℕ≤ m n m≤n
    }
