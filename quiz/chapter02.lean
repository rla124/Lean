-- Question 13
#eval (λ x : Int => -x + 2) 3 -- -1

-- Question 14
def q14 (n : Nat) : Bool :=
  if n=0 then false else true
#eval q14 1 -- true

-- Question 20
def q20 (x1 : Nat) (x2 : Nat) : Nat :=
  if x1 ≤ x2 then x1 else x2
#eval q20 12 13 -- 12

-- Question 21
def foo := let a := Nat; fun x : a => x + 2
-- def bar := (fun a => fun x : a => x + 2) Nat
