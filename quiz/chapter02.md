# Chapter 2 Quiz
## Question 1

Use the `#check` command to give the type of each expression listed below.

\(a\) `-2` \
-2 : Int

\(b\) `3.14` \
3.14 : Float

\(c\) `'L'` \
'L' : Char

\(d\) `"Lean"` \
"Lean" : String

\(e\) `[0, 1, 2]` \
[0, 1, 2] : List Nat

\(f\) `1 + 1 = 2` \
1 + 1 = 2 : Prop

## Question 2

Use the `#eval` command to give the value of each expression listed below.

\(a\) `-3 / 5` \
-1 \
풀이 : Lean이 int에 대한 나눗셈 연산을 몫 연산(정수 나눗셈)으로 처리 -> 몫 -1, 나머지 2(고의로 >=0)

\(b\) `Float.sin 0.0` \
0.000000 \
풀이 : sin(0) 결과를 Float 형식으로 반환

\(c\) `Char.toNat 'L'` \
76 \
풀이 : 문자(Char)의 아스키 값을 toNat 자연수로 반환

\(d\) `String.length "Lean"` \
4

\(e\) `List.tail [0, 1, 2]` \
[1, 2] \
풀이 : 리스트의 첫 번째 요소를 제거하고 나머지 반환

\(f\) `1.0 + 1.0 == 2.0` \
true \
풀이 : #eval은 수식 계산뿐 아니라 비교 && 논리 연산 등 다양한 표현식에 대해 처리 가능

## Question 3

There's an error in the following code. Fix the expression after the `#eval`
command to evaluate it.

```lean
namespace Question03

def f (x : Nat) := 2 * x - 1
#eval f(1)

end Question03
```

풀이 : Lean에서의 함수 호출 및 대입 방법 -> f (1)도 동작, 스페이스의 중요성
```lean
namespace Question03

def f (x : Nat) := 2 * x - 1
#eval f (1) -- f 1

end Question03
```

## Question 4

Use the `def` keyword to declare a new constant of each type listed below.

\(a\) `Bool → Bool` 
```lean
def q04a : Bool -> Bool :=
  fun x => x -- 항등 함수
#eval q04a false
```
\(b\) `(Bool → Bool) → Bool` 
```lean
def q04b : (Bool -> Bool) → Bool :=
  fun x : (Bool -> Bool) => x true -- 입력값 x가 함수(고차 함수) : apply x to true
#eval q04b (fun b => not b) 
```
\(c\) `Bool → (Bool → Bool)` 
```lean
def q04c : Bool → (Bool → Bool) :=
  fun x1 => (fun x2 => x1 && x2) -- 괄호 
#eval q04c true false
```
\(d\) `Bool → Bool → Bool`
```lean
def q04d : Bool → Bool → Bool :=
  fun x1 x2 => x1 || x2
#eval q04d false true
```

## Question 5

Use the `def` keyword to declare a new constant of each type listed below. \
풀이 : 순서쌍

\(a\) `Bool × Bool` 
```lean
def q05a : Bool x Bool := (true, false)
#eval q05a
```
\(b\) `(Bool × Bool) × Bool` 
```lean
def q05b : (Bool x Bool) x Bool := ((true, false), true)
#eval q05b
```
\(c\) `Bool × (Bool × Bool)` 
```lean
def q05c : Bool x (Bool x Bool) := (true, (false, true))
#eval q05c
```
\(d\) `Bool × Bool × Bool`
```lean
def q05d : Bool x Bool x Bool := (true, false, true)
#eval q05d
```

## Question 6

Give the value of each expression listed below.

\(a\) `Nat.succ 0`
```lean
#eval Nat.succ 0 -- successor
```
1 \
풀이 : 주어진 자연수 Nat의 다음 자연수를 출력

\(b\) `Nat.add 3 7`
```lean
#eval Nat.add 3 7 -- vs Nat.pred
```
10 \
풀이 : Nat.add 두 자연수를 받아 덧셈 연산 수행

\(c\) `('L', 4).1` 
```lean
#eval ('L', 4).1
```
'L' \
풀이 : 주어진 튜플에서 .1 첫 번째 요소를 반환

\(d\) `('L', 4).2` \
4 \
풀이 : 튜플에서 .2 두 번째 인자를 반환

## Question 7

Give the type of each expression listed below.

\(a\) `Bool → Bool` 
```lean
#check Bool -> Bool
```
Bool -> Bool : Type

\(b\) `Bool × Bool`
```lean
#check Bool × Bool
```
Bool × Bool : Type

## Question 8

Let `Type.id` be a function from `Type` to `Type` defined as follows:

```lean
def Type.id : Type → Type := fun x : Type ↦ x -- identity
```

Give the type of the expression `Type.id Nat`.

Type.id Nat : Type 0 (Type.id Nat의 유형을 쓰는 것이 문제의 의도) \
풀이 : Type.id는 어떤 타입을 입력으로 받아서 그대로 그 타입을 다시 반환하므로 자연수(Nat)이라는 입력 타입을 그대로 출력함. 따라서 그 출력값의 유형은 Type.

## Question 9

Define a constant of each type listed below.

\(a\) `Prod (Type 0) (Type 1)` 
```lean
def α : Prod (Type 0) (Type 1) := (Nat, Type)
```
풀이 : Nat, Bool 등은 Type에 속하고 Type은 Type 1에 속한다는 점을 이용

\(b\) `Type 2 → Type 3`
```lean
def q09d : Type 2 -> Type 3 :=
  fun x : Type 2 => x
```

## Question 10

Define the following two universe-polymorphic functions, replacing each `sorry`
identifier with an actual definition. The functions `f` and `g` shouldn't be
definitionally equal.

```lean
namespace Question10

def f.{u, v, w} : Type u → Type v → Type w → Type (max u v w) :=
  sorry

def g.{u, v, w} : Type u → Type v → Type w → Type (max u v w) :=
  sorry

end Question10
```

```lean
naemspace Question10

-- f.{..} 표기 : 교제 2장 Types as Objects 참고

def f.{u, v, w} : Type u -> Type v -> Type w -> Type (max u v w) :=
  fun (A : Type u) (B : Type v) (C : Type w) => Prod (Prod A B) C

def g.{u, v, w} : Type u -> Type v -> Type w -> Type (max u v w) := 
  fun (A : Type u) (B : Type v) (C : Type w) => Prod A (Prod B C)

-- Prod 이외에 함수 유형도 활용해보자 (=> 기호 활용)
def g1.{u, v, w} : Type u -> Type v -> Type w -> Type (max u v w) := 
  fun (x : Type u) => fun (y : Type v) => fun (z : Type w) => x -> y -> z
  -- 함수 유형 x -> (y -> z): x가 정의역, y -> z가 공역
  -- 함수 g1: 다변수 함수처럼 마치 x, y를 input으로 받는 이변수 함수라고 볼 수 있음(정의역이 두 개인 것처럼)

end Question10
```

```lean
def h : Nat -> String -> Char :=
  fun (x : Nat) => fun (y : String) := 'A'

-- <유형을 만드는 방법 (두 가지 유형을 받아 새로운 유형을 만드는 방법)> : 곱 유형, 함수 유형

-- 함수 유형 : 유형들이 주어져 있을 때 이것들로 함수 유형을 어떻게 만들까?
-- 화살표 유형 ->을 이용한다 : A -> B -> C

-- 곱 유형 : 데카르트 곱 
-- 순서쌍 
-- 곱 기호를 이용한다 : A x B x C
```

## Question 11

Is the function `Type.id` of [Question 8](#question-8) universe-polymorphic?

풀이 : \
유형에 세계 변수가 들어있는지를 묻는 문제 \
세계 변수 없으므로 세계 다형적이 아니다 \
(세계 다형적인지 아닌지를 볼 때는 세계 변수가 있느냐 없느냐로 판단) \
(린의 핵심 라이브러리에 있는 항등 함수 id는 세계 다형적임)

## Question 12

Are the constants you defined in [Question 9](#question-9) universe-polymorphic?

풀이 : 마찬가지로 세계 유형 변수가 없으므로 다형적이 아니다

## Question 13

Give the value of the expression `(λ x : Int => -x + 2) 3`. \
-1
풀이 : 람다 함수의 함숫값을 나타내는 식 -x + 2에서 변수 x에 3을 대입해 결과를 계산

## Question 14

Define a function that takes a natural number as input and returns `true` if the
number is non-zero and `false` if the number is zero.
```lean
def q14 (n : Nat) : Bool :=
  if n=0 then false else true -- 등호 == 2번 가능
  -- a = b  : Prop
  -- a == b : Bool
```

## Question 15

Is the expression `fun x : Nat ↦ x` a *constant* function? \
아니다 \
풀이 : 상수 함수의 경우 함숫값이 특정한 상수여야 하는데, 이 함수는 입력값과 같은 값을 반환하므로 상수 함수가 아니라 항등 함수이다

## Question 16

Is the expression `fun x : Nat ↦ 0` the *identity* function on `Nat`? \
아니다 \
풀이 : 입력값(정의역 원소)이 무엇이든 함숫값이 0이므로 항등 함수가 아니라 상수 함수이다

## Question 17

Define the following function, replacing the `sorry` identifier with an actual
expression *containing* the arguments `f`, `g`, and `s`.

```lean
def q17 (f : List Char → Nat) (g : (List Char → Nat) → (String → Nat)) (s : String) : Nat :=
  sorry
```
```lean
def q17 (f : List Char → Nat) (g : (List Char → Nat) → (String → Nat)) (s : String) : Nat :=
  g f s
```
풀이 : 함수 f에 함수 g를 적용해 String → Nat 타입의 함수를 구성한 다음, 그 함수를 s에 적용해 Nat 값을 얻을 수 있다

## Question 18

Are the following functions alpha-equivalent?

* `fun (s : String) (n : Nat) ↦ String.drop s n`
* `fun (bulhwi : String) (cha : Nat) ↦ String.drop bulhwi cha`

alpha-equivalent이다 \
풀이 : 위 두 함수는 변수 이름만 다르고 모두 입력 문자열에서 입력 자연수만큼의 문자열을 제거하고 반환하는 로직은 동일하기 때문이다

## Question 19

Which of the following functions are alpha-equivalent?

```lean
namespace Question19

def a (n : Nat) := n ^ 2 + 1

def f (a : Nat → Nat) (n : Nat) := a (a n)
def g (b : Nat → Nat) (n : Nat) := b (b n)
def h (a : Nat → Nat) (n : Nat) := Question19.a (a n)

end Question19
```
f와 g가 알파 동치이다 \
풀이 : f와 g 모두 Nat을 입력받아 이 자연수를 처리하는 함수의 이름만 다를 뿐 최종 반환 과정이 동일하고 그이외의 함수는 로직이 다르다

## Question 20

Define a function that takes two natural numbers as input arguments and returns
the one less than or equal to the other.

Note that you can type the less-than-or-equal-to sign `≤` with `\le`.
```lean
def q20 (x1 : Nat) (x2 : Nat) : Nat :=
  if x1 ≤ x2 then x1 else x2
#eval q20 12 13 
```

## Question 21

Why does the definition of `foo` below type check, but the definition of `bar`
doesn't?

```lean
def foo := let a := Nat; fun x : a => x + 2
/-
  def bar := (fun a => fun x : a => x + 2) Nat
-/
```
풀이 : \
foo의 경우 +2 연산 전에 a가 Nat 유형으로 정해져있어서 자연수 연산이 가능했지만 \
bar의 경우 a가 타입 변수로 선언되어 어떤 타입인지 명확하지 않으므로 +2 연산 이후에 Nat임을 밝히기 때문에 bar에서 타입 체크 오류가 뜬다 
## Question 22

Use the `#print` command to check the definitions of the following functions:

```lean
namespace Question22

variable (α β γ : Type)
variable (g : β → γ) (f : α → β) (h : α → α)
variable (x : α)

def compose := g (f x)
def doTwice := h (h x)
def doThrice := h (h (h x))

end Question22
```
chapter02.lean 파일에서 확인

## Question 23

There's an error in the following code. Fix the expression after the `#eval`
command by providing the missing arguments to the function `compose`.

```lean
namespace Question23

section

variable (α β γ : Type)
variable (g : β → γ) (f : α → β) (h : α → α)
variable (x : α)

def compose := g (f x)

end

#eval List.tail [0, 1, 2, 3] -- output: [1, 2, 3]
#eval List.reverse [1, 2, 3] -- [3, 2, 1]
#eval compose List.reverse List.tail [0, 1, 2, 3]

end Question23
```

## Question 24

Give the value and type of each expression listed below.

풀이 : List.cons는 주어진 값(첫 번째 인자)을 리스트(두 번째 인자)의 0번째 index 위치에 추가

\(a\) `List.cons 0 [1, 2, 3]` \
[0, 1, 2, 3] : List Nat 

\(b\) `List.cons true []` \
[true] : List Bool \
빈 리스트의 타입이 자동으로 List Bool이 된다 

\(c\) `List.cons "Lean" ["4"]` \
["Lean", "4"] : List String

## Question 25

Use the `print` command to check the type of the function `List.cons`, then
answer by true or false each of the following statements about the function.

\(a\) It is universe-polymorphic. \
\(b\) It is parametrically polymorphic. \
\(c\) It is a dependent function. \
\(d\) It has a dependent function type.

## Question 26

Answer by true or false each of the following statements about the function
`Type.id` of [Question 8](#question-8).

\(a\) It is parametrically polymorphic. \
\(b\) It is a dependent function. \
\(c\) It has a dependent function type.

## Question 27

Answer by true or false each of the following statements about the constants you
defined in [Question 9](#question-9).

\(a\) At least one of them is parametrically polymorphic. \
\(b\) At least one of them is a dependent function. \
\(c\) At least one of them has a dependent function type. \
\(d\) At least one of them is a dependent product. \
\(e\) At least one of them has a dependent product type.

## Question 28

Is the type `(α : Type) → (β : α → Type) → (a : α) → β a` a dependent function
type?

## Question 29

Is the type `(α : Type) → (β : α → Type) → (a : α) × β a` a dependent product
type?

## Question 30

Is the type `(α : Type) → (β : α → Type) → Σ (a : α), β a` a Sigma type?

## Question 31

Are the types of [Question 29](#question-29) and [Question 30](#question-30) the
same?

## Question 32

Is the type `(α : Type) → Prop` a dependent function type?

## Question 33

Is the type `(α : Type) × Prop` a dependent product type?

## Question 34

There's an error in the following code. Fix the definition of the dependent
function `f`.

```lean
namespace Question34

universe u v

def f (α : Type u) (β : α → Type v) (a : α) (b : β a) : (a : α) × β a :=
  (a, b)

end Question34
```

## Question 35

Give the value of each of the following expressions, where `f` is the function
defined in [Question 34](#question-34).

\(a\) `(f Nat (fun _n => Int) 1 (-1)).1` \
\(b\) `(f Nat (fun _n => Int) 1 (-1)).2`

## Question 36

Give the value and type of each expression listed below.

\(a\) `@List.nil Nat` \
\(b\) `List.append [0, 1] [2, 3]`

## Question 37

Replace the underscore in each expression listed below with an appropriate type,
then check the value of each expression.

\(a\) `@List.cons _ 0 [1, 2, 3]` \
\(b\) `@List.append _ [0, 1] [2, 3]` \
\(c\) `@List.cons _ "Lean" ["4"]` \
\(d\) `@List.append _ ["Lean"] ["4"]`

## Question 38

Give an example of a function that takes one or more implicit arguments.
