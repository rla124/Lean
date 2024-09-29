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

-- Question 22
namespace Question22

variable (α β γ : Type)
variable (g : β → γ) (f : α → β) (h : α → α)
variable (x : α)

def compose := g (f x)
def doTwice := h (h x)
def doThrice := h (h (h x))

#print compose
#print doTwice
#print doThrice

end Question22

-- Question 24
-- (a) List.cons 0 [1, 2, 3]
#eval List.cons 0 [1, 2, 3]
#check List.cons 0 [1, 2, 3]

-- (b) List.cons true []
#eval List.cons true []
#check List.cons true []

-- (c) List.cons "Lean" ["4"]
#eval List.cons "Lean" ["4"]
#check List.cons "Lean" ["4"]

-- Question 25
#print List.cons

-- Question 26
def Type.id : Type → Type := fun x : Type ↦ x
#check Type.id Bool
#check Type.id String
#check Type.id Char
