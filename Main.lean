import Learning.HelloWorld

def runModule (_ : String) : IO Unit :=
    IO.println (greet "World")

def main (args : List String) : IO Unit :=
  match args with
  | module :: _ => runModule module
  | [] => IO.println "Usage: lake exe learning <HelloWorld>"
