-- Lean Structures

structure Point where
  x : Float
  y : Float
  deriving BEq, Inhabited, Repr

def origin : Point := { x := 0.0, y := 0.0 }

-- Add two points together
def addPoints (p1 : Point) (p2 : Point) : Point :=
  { x := p1.x + p2.x, y := p1.y + p2.y }

def p1 : Point := { x := 3.0, y := 4.0 }
def p2 : Point := { x := 1.0, y := 2.0 }
