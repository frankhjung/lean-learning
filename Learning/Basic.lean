-- Conditional evaluation example
def HitchHiker (name : String) (value : Int) : String :=
  String.append name (toString (if value > 2 then 42 else 0))

-- Types: natural numbers
-- Demonstrates Nat and Int types and functions.

def add1 (n : Nat) : Nat := n + 1

def maximum (n : Nat) (k : Nat) : Nat := if n < k then k else n

-- Type aliases
def Name : Type := String
def name: Name := "Alice"

-- Type abbreviations
abbrev Age : Type := Nat
def isAdult (age : Age) : Bool := age >= 18
def tonyAge : Age := 25
def lisaAge : Age := 15
