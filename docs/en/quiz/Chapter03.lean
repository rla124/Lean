variable (p q r : Prop)

namespace example1
example : p ∧ q ↔ q ∧ p :=
  Iff.intro
    (fun h : p ∧ q => And.intro h.right h.left)
    (fun h : q ∧ p => And.intro h.right h.left)
end example1

namespace example2
example : p ∨ q ↔ q ∨ p :=
  Iff.intro
    (fun h : p ∨ q =>
      Or.elim h
        (fun hp : p => Or.inr hp)
        (fun hq : q => Or.inl hq))
    (fun h : q ∨ p =>
      Or.elim h
        (fun hq : q => Or.inr hq)
        (fun hp : p => Or.inl hp))
end example2

namespace example3
example : (p ∧ q) ∧ r ↔ p ∧ (q ∧ r) :=
  Iff.intro
    (fun h : (p ∧ q) ∧ r =>
      And.intro h.left.left (And.intro h.left.right h.right))
    (fun h : p ∧ (q ∧ r) =>
      And.intro (And.intro h.left h.right.left) h.right.right)
end example3

namespace example4
example : (p ∨ q) ∨ r ↔ p ∨ (q ∨ r) :=
  Iff.intro
    (fun h : (p ∨ q) ∨ r =>
      Or.elim h
        (fun hpq : p ∨ q =>
          Or.elim hpq
            (fun hp : p => Or.inl hp)
            (fun hq : q => Or.inr (Or.inl hq)))
        (fun hr : r => Or.inr (Or.inr hr)))
    (fun h : p ∨ (q ∨ r) =>
      Or.elim h
        (fun hp : p => Or.inl (Or.inl hp))
        (fun hqr : q ∨ r =>
          Or.elim hqr
            (fun hq : q => Or.inl (Or.inr hq))
            (fun hr : r => Or.inr hr)))
end example4

namespace example5
example : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
  Iff.intro
    (fun h : p ∧ (q ∨ r) =>
      have hp : p := h.left
      Or.elim h.right
        (fun hq : q => Or.inl ⟨hp, hq⟩)
        (fun hr : r => Or.inr ⟨hp, hr⟩))
    (fun h : (p ∧ q) ∨ (p ∧ r) =>
      Or.elim h
        (fun hpq : p ∧ q => ⟨hpq.left, Or.inl hpq.right⟩)
        (fun hpr : p ∧ r => ⟨hpr.left, Or.inr hpr.right⟩))
end example5

namespace example6
example : p ∨ (q ∧ r) ↔ (p ∨ q) ∧ (p ∨ r) :=
  Iff.intro
    (fun h : p ∨ (q ∧ r) =>
      Or.elim h
        (fun hp : p => ⟨Or.inl hp, Or.inl hp⟩)
        (fun hqr : q ∧ r => ⟨Or.inr hqr.left, Or.inr hqr.right⟩))
    (fun h : (p ∨ q) ∧ (p ∨ r) =>
      Or.elim h.left
        (fun hp : p => Or.inl hp)
        (fun hq : q =>
          Or.elim h.right
            (fun hp : p => Or.inl hp)
            (fun hr : r => Or.inr ⟨hq, hr⟩)))
end example6

namespace example7
example : (p → (q → r)) ↔ (p ∧ q → r) :=
  Iff.intro
    (fun h : p → q → r =>
      fun h' : p ∧ q =>
        h h'.left h'.right)
    (fun h : p ∧ q → r =>
      fun hp : p =>
        fun hq : q =>
          h ⟨hp, hq⟩)

end example7

namespace example8
example : ((p ∨ q) → r) ↔ (p → r) ∧ (q → r) :=
  Iff.intro
    (fun h : (p ∨ q) → r =>
      ⟨fun hp : p => h (Or.inl hp), fun hq : q => h (Or.inr hq)⟩)
    (fun h : (p → r) ∧ (q → r) =>
      fun h' : p ∨ q =>
        Or.elim h'
          (fun hp : p => h.left hp)
          (fun hq : q => h.right hq))
end example8

namespace example9
example : ¬(p ∨ q) ↔ ¬p ∧ ¬q :=
  Iff.intro
    (fun h : ¬(p ∨ q) =>
      ⟨fun hp : p => h (Or.inl hp), fun hq : q => h (Or.inr hq)⟩)
    (fun h : ¬p ∧ ¬q =>
      fun h' : p ∨ q =>
        Or.elim h'
          (fun hp : p => h.left hp)
          (fun hq : q => h.right hq))
end example9

namespace example10
example : ¬p ∨ ¬q → ¬(p ∧ q) :=
  fun h : ¬p ∨ ¬q =>
    fun h' : p ∧ q =>
      Or.elim h
        (fun hnp : ¬p => hnp h'.left)
        (fun hnq : ¬q => hnq h'.right)
end example10

namespace example11
example : ¬(p ∧ ¬p) :=
  fun h : p ∧ ¬p => h.right h.left
end example11

namespace example12
example : p ∧ ¬q → ¬(p → q) :=
  fun h : p ∧ ¬q =>
    fun h' : p → q =>
      h.right (h' h.left)
end example12

namespace example13
example : ¬p → (p → q) :=
  fun hnp : ¬p =>
    fun hp : p => absurd hp hnp
end example13

namespace example14
example : (¬p ∨ q) → (p → q) :=
  fun h : ¬p ∨ q =>
    fun hp : p =>
      Or.elim h
        (fun hnp : ¬p => absurd hp hnp)
        (fun hq : q => hq)
end example14

namespace example15
example : p ∨ False ↔ p :=
  Iff.intro
    (fun h : p ∨ False =>
      Or.elim h
        (fun hp : p => hp)
        (fun hfalse : False => False.elim hfalse))
    (fun hp : p => Or.inl hp)
end example15

namespace example16
example : p ∧ False ↔ False :=
  Iff.intro
    (fun h : p ∧ False => h.right)
    (fun h : False => False.elim h)
end example16

namespace example17
example : (p → q) → (¬q → ¬p) :=
  fun h : p → q =>
    fun hnq : ¬q =>
      fun hp : p => hnq (h hp)
end example17

open Classical

namespace example18
example : (p → q ∨ r) → ((p → q) ∨ (p → r)) :=
  fun h : p → q ∨ r =>
    Or.elim (em p)
      (fun hp : p =>
        Or.elim (h hp)
          (fun hq : q => Or.inl (fun _ => hq))
          (fun hr : r => Or.inr (fun _ => hr)))
      (fun hnp : ¬p =>
        Or.inl (fun hp => absurd hp hnp))
end example18

namespace example19
example : ¬(p ∧ q) → ¬p ∨ ¬q :=
  fun h : ¬(p ∧ q) =>
    Or.elim (em p)
      (fun hp : p =>
        Or.elim (em q)
          (fun hq : q => absurd (And.intro hp hq) h)
          (fun hnq : ¬q => Or.inr hnq))
      (fun hnp : ¬p => Or.inl hnp)
end example19

namespace example20
example : ¬(p → q) → p ∧ ¬q :=
  fun h : ¬(p → q) =>
    Or.elim (em p)
      (fun hp : p =>
        Or.elim (em q)
          (fun hq : q => absurd (fun _ => hq) h)
          (fun hnq : ¬q => ⟨hp, hnq⟩))
      (fun hnp : ¬p =>
        absurd (fun hp : p => absurd hp hnp) h)
end example20

namespace example21
example : (p → q) → (¬p ∨ q) :=
  fun h : p → q =>
    Or.elim (em p)
      (fun hp : p => Or.inr (h hp))
      (fun hnp : ¬p => Or.inl hnp)
end example21

namespace example22
example : (¬q → ¬p) → (p → q) :=
  fun h : ¬q → ¬p =>
    fun hp : p =>
      Or.elim (em q)
        (fun hq : q => hq)
        (fun hnq : ¬q => absurd hp (h hnq))
end example22

namespace example23
example : p ∨ ¬p :=
  em p
end example23

namespace example24
example : (((p → q) → p) → p) :=
  fun h : (p → q) → p =>
    Or.elim (em p)
      (fun hp : p => hp)
      (fun hnp : ¬p => h (fun hp : p => absurd hp hnp))
end example24

namespace example25
-- Prove ¬(p ↔ ¬p) without using classical logic.
end example25
