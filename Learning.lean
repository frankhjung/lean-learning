import Learning.HelloWorld

open Learning.HelloWorld (greet)

/-- Entrypoint for the `learning` executable. -/
def main (args : List String) : IO Unit :=
  match args with
  | x :: _ => IO.println (greet x)
  | []     => IO.println "Usage: lake exe learning <name>"
