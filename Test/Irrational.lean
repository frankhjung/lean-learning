import Learning.Irrational
import Test.Util

open Test.Util

namespace Test.Irrational

/-- Run tests for Irrational. -/
def runTests (st : IO.Ref State) : IO Unit := do
  IO.println "\n[TEST] Testing Learning.Irrational"

  -- The theorem itself is verified at compile-time by Lean's kernel.
  -- We can verify concrete cases of the inequality at runtime.
  assertEqual st (decide (3^2 ≠ 2 * 2^2)) true "3^2 ≠ 2 * 2^2"
  assertEqual st (decide (7^2 ≠ 2 * 5^2)) true "7^2 ≠ 2 * 5^2"

end Test.Irrational
