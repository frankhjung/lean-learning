import Test.Basic
import Test.HelloWorld
import Test.Structure
import Test.Util

open Test.Util (mkState summary)

def main : IO Unit := do
  IO.println "Running tests..."

  let st ← mkState
  Test.Basic.runTests st
  Test.HelloWorld.runTests st
  Test.Structure.runTests st

  summary st
  let s ← st.get
  if s.fails > 0 then
    IO.println "Some tests failed."
    IO.Process.exit 1
  else
    IO.println "All tests passed!"
