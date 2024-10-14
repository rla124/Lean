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

-- Question 35


-- Question 36
-- 아래는 check, eval의 결과를 주석에 혼합
#check @List.nil Nat -- [] : List Nat
#check List.append [0, 1] [2, 3] -- [0, 1].append [2, 3] == [0, 1, 2, 3] : List Nat

-- Question 37
-- 아래는 check와 eval의 결과 혼합
#check @List.cons _ 0 [1, 2, 3] -- [0, 1, 2, 3] : List Nat
#check @List.append _ [0, 1] [2, 3] -- [0, 1].append [2, 3] : List Nat
#check @List.cons _ "Lean" ["4"] -- ["Lean", "4"] : List String
#check @List.append _ ["Lean"] ["4"] -- ["Lean"].append ["4"] : List String

-- Question 9 (b)
-- 상수 함수 형태
def q09d : Type 2 → Type 3 :=
  fun a : Type 2 => Type 2 -- 린의 유형론 : 유형 자체도 상수가 될 수 있다

-- 상수 함수가 아닌 형태
def q09d1 : Type 2 → Type 3 :=
  fun x : Type 2 => Type 2 × x
  -- Type 2는 Type 3에 속하고 x는 Type 2에 속하므로 최종적으로 Type 3에 속함

namespace test
variable (x : Type 2)
#print Prod -- structure Prod.{u, v} : Type u → Type v → Type (max u v)

-- Prod(곱), 순서쌍, 함수형의 결과 타입 반환 차이
#check List x × Bool -- : Type 2 (max)
-- (List x는 Type 2에 속하고 Bool은 Type 1에 속하므로 최종적으로 Type 2)

#check (List x, Bool) -- : Type 2 × Type

#check x -> Type 2 -- : Type 3 (Sort imax)
end test

namespace question37
#eval @List.cons Nat 0 [1,2,3]
#eval @List.append Nat [0, 1] [2, 3]
#eval @List.cons String "Lean" ["4"]
#eval @List.append String ["Lean"] ["4"]
end question37

#print List.cons
def q38 : {α : Type u} → α → List α → List α :=
  @fun α (x1 : α) (x2 : List α) => x1 :: x2 -- @ : 암시적 인자를 명시적으로 쓸 때 사용
  -- fun {α} (x1 : α) (x2 : List α) => x1 :: x2
  -- List.cons -- 같은 유형
