import Learning.HelloWorld

/-- Runs the selected module of the demo executable. -/
def runModule : IO Unit :=
  IO.println (greet "World")

/-- Entrypoint for the `learning` executable. -/
def main (args : List String) : IO Unit :=
  match args with
  | _ :: _ => runModule
  | [] => IO.println "Usage: lake exe learning <HelloWorld>"
