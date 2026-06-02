-- Numeric evaluation examples
#eval 1 + 2 * 5     -- 11

-- String evaluation examples
#eval String.append "Hello, " "world!"  -- "Hello, world!"

-- Conditional evaluation example
def HitchHiker (name : String) (value : Int) : String :=
  String.append name (toString (if value > 2 then 42 else 0))
#eval  HitchHiker "Arthur" 5  -- "Arthur42"
#eval  HitchHiker "Ford" 1  -- "Ford0"

-- Types: natural numbers
#eval (5 + 10 : Nat)  -- 15
#eval (7 - 20 : Int)  -- -13
#check (10 - 5 : Nat)  -- Nat
#check (5 - 10 : Nat)  -- error: subtraction would result in a negative number, which is not a Nat

def add1 (n : Nat) : Nat := n + 1
#eval add1 5  -- 6
-- this shows the function type signature
#check (add1)  -- add1: Nat → Nat

def maximum (n : Nat) (k : Nat) : Nat := if n < k then k else n

#eval maximum 10 20  -- 20
#eval maximum 30 20  -- 30

-- Type aliases
def Name : Type := String
def name: Name := "Alice"
#eval (String.append "John " name)  -- "John Alice"

-- Type abbreviations
abbrev Age : Type := Nat
def isAdult (age : Age) : Bool := age >= 18
def tonyAge : Age := 25
#eval isAdult tonyAge  -- true
def lisaAge : Age := 15
#eval isAdult lisaAge  -- false
