/-! Basic examples: conditionals, numeric functions, and simple types.

This file contains small example definitions used in the `learning` package's
tests and demos. The examples illustrate conditional expressions, basic
arithmetic, type aliases/abbreviations, and simple boolean predicates.
-/

/-- Return a string that appends either `42` or `0` to `name` depending on `value`.
    This demonstrates a conditional expression and `toString` conversion. -/
def hitchHiker (name : String) (value : Int) : String :=
  String.append name (toString (if value > 2 then 42 else 0))

/-- Increment `n` by one. Simple example of a numeric function on `Nat`. -/
def add1 (n : Nat) : Nat := n + 1

/-- Return the larger of `n` and `k`. -/
def maximum (n : Nat) (k : Nat) : Nat := if n < k then k else n

/-- `Name` is a type alias for `String`, used in examples. -/
def Name : Type := String

/-- An example `Name` value used in demonstrations. -/
def name: Name := "Alice"

/-- `Age` is a type abbreviation for `Nat` used to make intent clearer. -/
abbrev Age : Type := Nat

/-- Return `true` when `age` represents an adult (>= 18). -/
def isAdult (age : Age) : Bool := age >= 18

/-- Example ages used in tests/demonstrations. -/
def tonyAge : Age := 25
def lisaAge : Age := 15
