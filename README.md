# Learning Lean

[Lean][lean-homepage] is an open-source programming language and proof assistant
that enables correct, maintainable, and formally verified code.

## Installation

This project requires Lean 4. You can install it using
[Elan](https://github.com/leanprover/elan).

### Linux

```bash
curl https://raw.githubusercontent.com/leanprover/elan/master/toolchain.sh | sh
```

Alternatively, follow the instructions on the
[Lean installation page][lean-installation].

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

## Development

A `Makefile` is provided to simplify development and testing targets.

```bash
# Build the project
make build

# Run the unit test suite
make test

# Run the linter
make lint

# Generate documentation
make doc
```

### Default Lean 4

This project is built using the latest stable release of Lean 4:

```bash
elan default leanprover/lean4:stable
cd docbuild && elan default leanprover/lean4:stable
```

To ensure you are using the correct version, you can check your Lean version
with:

```bash
lean --version
```

### Project Structure

- `Learning.lean`: The entrypoint for the `learning` executable.
- `Learning/`: Directory containing the library modules:
  - `All.lean`: Convenience re-export of all library modules.
  - `Basic.lean`: Basic concepts — conditionals, arithmetic, types.
  - `HelloWorld.lean`: Greeting utilities used by the executable.
  - `Structure.lean`: A 2D `Point` structure and helpers.
- `Test.lean`: The test runner entrypoint that executes the test suite.
- `Test/`: Directory containing tests corresponding to each lesson.
  - `Util.lean`: Test utilities including assertion helpers.
- `lakefile.toml`: Package build configuration for Lake.

## CI/CD

### CI/CD Workflow

This project uses GitHub Actions for continuous integration and deployment. The
workflow is defined in the
[.github/workflows/lean_action_ci.yml](.github/workflows/lean_action_ci.yml)
file. It runs on every push to the repository to build, test, and lint the code.
Pull requests run the `build` job only; documentation is built on `main` by a
`docs` job and `pages` is deploy-only (publishes the uploaded artifact). Pushes
to the `main` branch will also automatically generate and deploy the
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

Configuration: this project uses the `batteries` linter driver. The `batteries`
runner reads `scripts/nolints.json` (if present) to store and retrieve
suppressed lint entries. To update the `nolints` file after inspecting linter
output, run:

```bash
lake lint --update
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

Once generated, you can serve the documentation locally on
[http://localhost:8000](http://localhost:8000) with:

```bash
python3 -m http.server --directory docbuild/.lake/build/doc 8000
```

Or open a browser to `./docbuild/.lake/build/doc/index.html`:

```bash
# Default Browser
exo-open --launch www docbuild/.lake/build/doc/index.html

# Google Chrome
google-chrome docbuild/.lake/build/doc/index.html
```

#### Example

![Documentation Screenshot](docs/doc-screenshot.png)

## GitHub Actions

The following GitHub Actions are used in this project:

- [actions/checkout](https://github.com/actions/checkout)
- [leanprover/lean-action](https://github.com/leanprover/lean-action)
- [actions/upload-pages-artifact](https://github.com/actions/upload-pages-artifact)
- [actions/deploy-pages](https://github.com/actions/deploy-pages)

## Resources

- [API Documentation][lean-api-docs] - The API documentation for Lean.
- [FAQ][lean-faq] - A frequently asked questions page about Lean.
- [Functional Programming in Lean][functional-programming-in-lean] - A book on
  functional programming in Lean.
- [Lean GitHub][lean-github] - The GitHub repository for Lean.
- [Lean Homepage][lean-homepage] - The official homepage of Lean.
- [Lean Language Guide][lean-language-guide] - A guide to the Lean programming
  language.
- [Notebook][lean-notebook] - A notebook interface for Lean.
- [Package Reservoir][lean-reservoir] - The GitHub repository for Lean.
- [Verso][lean-verso] - Writing documentation with Lean.

## License

This project is licensed under the
[GNU General Public License Version 3](LICENSE).

[functional-programming-in-lean]: https://lean-lang.org/functional_programming_in_lean/
[lean-api-docs]: https://lean-lang.org/doc/api/
[lean-faq]: https://lean-lang.org/faq/
[lean-github]: https://github.com/leanprover/lean4
[lean-homepage]: https://leanprover.github.io/
[lean-installation]: https://lean-lang.org/install/
[lean-language-guide]: https://lean4.dev/language
[lean-notebook]: https://notebooklm.google.com/notebook/c5971c43-5793-44b4-8fa9-65a968dfe8c5
[lean-reservoir]: https://reservoir.lean-lang.org/
[lean-verso]: https://verso.lean-lang.org/
