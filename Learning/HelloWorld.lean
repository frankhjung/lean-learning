namespace Learning.HelloWorld

-- Define a simple constant
def name := "Lean"

def greet : String → String
| name => s!"Hello World, {name}!"
