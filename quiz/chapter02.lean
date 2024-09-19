-- Question 13
#eval (λ x : Int => -x + 2) 3 -- -1

-- Question 14
def q14 (n : Nat) : Bool :=
  if n=0 then false else true
#eval q14 1 -- true
