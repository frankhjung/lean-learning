# Learning Lean

[Lean][lean-homepage] is an open-source programming language and proof assistant
that enables correct, maintainable, and formally verified code

## Installation

Follow the instructions on the [Lean installation page][lean-installation] to
install

## First Steps

Create a new project:

```bash
lake new learning
```

Then you should be able to build and run the project:

```bash
lake build
lake exe learning
```

## Basic Concepts

The [Basic.lean](Learning/Basic.lean) file contains examples of basic concepts
in Lean.

## CI/CD

### Building

This project uses GitHub Actions for continuous integration. The workflow is
defined in the
[.github/workflows/lean_action_ci.yml](.github/workflows/lean_action_ci.yml)
file. It runs on every push to the repository.

### Linting

This project uses `lake lint` with the Batteries linter. To install the
dependency and run the linter locally, run:

```bash
lake update
lake build
lake lint
```

If the linter reports missing documentation or unused-argument warnings, edit
the indicated files to satisfy the linters (there is no general autofix).

## Resources

- [Functional Programming in Lean][functional-programming-in-lean] - A book on
  functional programming in Lean.
- [API Documentation][lean-api-docs] - The API documentation for Lean.
- [Lean GitHub][lean-github] - The GitHub repository for Lean.
- [Lean Homepage][lean-homepage] - The official homepage of Lean.
- [FAQ][lean-faq] - A frequently asked questions page about Lean.
- [Notebook][lean-notebook] - A notebook interface for Lean.

[functional-programming-in-lean]: https://lean-lang.org/functional_programming_in_lean/
[lean-api-docs]: https://lean-lang.org/doc/api/
[lean-faq]: https://lean-lang.org/faq/
[lean-github]: https://github.com/leanprover/lean4
[lean-homepage]: https://leanprover.github.io/
[lean-installation]: https://lean-lang.org/install/
[lean-notebook]: https://notebooklm.google.com/notebook/c5971c43-5793-44b4-8fa9-65a968dfe8c5
