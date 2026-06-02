import Learning.Basic
import Test.Util

namespace Test.Basic

open Test.Util (assertEqual State mkState summary)

def runTests (st : IO.Ref State) : IO Unit := do
  IO.println "\n--- Testing Learning.Basic ---"

  -- Numeric evaluation examples
  assertEqual st (1 + 2 * 5) 11 "1 + 2 * 5"

  -- String evaluation examples
  assertEqual st (String.append "Hello, " "world!") "Hello, world!" "String.append"

  -- Conditional evaluation example
  assertEqual st (HitchHiker "Arthur" 5) "Arthur42" "HitchHiker Arthur 5"
  assertEqual st (HitchHiker "Ford" 1) "Ford0" "HitchHiker Ford 1"

  -- Types: natural numbers
  assertEqual st (5 + 10 : Nat) 15 "5 + 10 : Nat"
  assertEqual st (7 - 20 : Int) (-13) "7 - 20 : Int"

  -- Functions
  assertEqual st (add1 5) 6 "add1 5"
  assertEqual st (maximum 10 20) 20 "maximum 10 20"
  assertEqual st (maximum 30 20) 30 "maximum 30 20"

  -- Type aliases
  assertEqual st (String.append "John " name) "John Alice" "Type alias name"

  -- Type abbreviations
  assertEqual st (isAdult tonyAge) true "isAdult tonyAge"
  assertEqual st (isAdult lisaAge) false "isAdult lisaAge"

end Test.Basic
