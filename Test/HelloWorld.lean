import Learning.HelloWorld
import Test.Util

open Learning.HelloWorld (greet name)
open Test.Util (assertEqual State mkState summary)

namespace Test.HelloWorld

def runTests (st : IO.Ref State) : IO Unit := do
  IO.println "\n[TEST] Testing Learning.HelloWorld"

  assertEqual st name "Lean" "name constant"
  assertEqual st (greet name) "Hello World, Lean!" "greet function with 'Lean'"
  assertEqual st (greet "Alice") "Hello World, Alice!" "greet function with 'Alice'"
  assertEqual st (greet "Bob") "Hello World, Bob!" "greet function with 'Bob'"

end Test.HelloWorld
