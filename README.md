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
make build
# or: lake build

lake exe learning <name>
# e.g. lake exe learning "Frank Jung"
```

## Basic Concepts

The [Basic.lean](Learning/Basic.lean) file contains examples of basic concepts
in Lean.

## CI/CD

### CI/CD Workflow

This project uses GitHub Actions for continuous integration and deployment. The
workflow is defined in the
[.github/workflows/lean_action_ci.yml](.github/workflows/lean_action_ci.yml)
file. It runs on every push to the repository to build, test, and lint the code.
Pushes to the `main` branch will also automatically generate and deploy the
documentation to GitHub Pages.

### Linting

This project uses `lake lint` with the Batteries linter. To install the
dependency and run the linter locally, run:

```bash
make update
make lint
# or using lake directly:
lake update
lake build
lake lint
```

If the linter reports missing documentation or unused-argument warnings, edit
the indicated files to satisfy the linters (there is no general autofix).

Configuration: this project uses the `batteries` linter driver. The
`batteries` runner reads `scripts/nolints.json` (if present) to store and
retrieve suppressed lint entries. To update the `nolints` file after
inspecting linter output, run:

```bash
lake lint -- --update
```

To add project-specific suppressions, create or edit `scripts/nolints.json`.

### Testing

To run the tests locally, run:

```bash
make test
# or using lake directly:
lake test
```

This will rebuild the project and execute the tests defined in the `Test`
directory.

### Documentation

The project documentation is automatically published to GitHub Pages and can be
viewed at:
[https://frankhjung.github.io/lean-learning/](https://frankhjung.github.io/lean-learning/)

To generate the project documentation locally, run:

```bash
make doc
# or using lake directly:
cd docbuild
lake update doc-gen4
lake build Learning:docs
```

Once generated, you can serve the documentation locally by running:

```bash
python3 -m http.server --directory docbuild/.lake/build/doc 8000
```

This should render something like this in your browser:

![Documentation Screenshot](docs/doc-screenshot.png)

## GitHub Actions

The following GitHub Actions are used in this project:

- [actions/checkout](https://github.com/actions/checkout)
- [leanprover/lean-action](https://github.com/leanprover/lean-action)
- [actions/upload-pages-artifact](https://github.com/actions/upload-pages-artifact)
- [actions/deploy-pages](https://github.com/actions/deploy-pages)

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
