# Build a Makefile for the project

## Objective

This project uses Lake as the build system, which provides a convenient way to
manage dependencies, build, test, and lint the project. However, using a
Makefile provides additional convenience and allows for greater flexibility in
defining custom build rules and automating repetitive tasks.

## Tasks

Add a `Makefile` to the root of this project:

Support the following targets:

- `make build`: Builds the project using Lake.
- `make test`: Runs the tests using Lake.
- `make exe`: Runs the `learning` executable with a sample name.
- `make lint`: Runs the linter using Lake.
- `make doc`: Generates documentation using Lake.
- `make clean`: Cleans the build artifacts.
- `make update`: Updates the dependencies using Lake.
- `make help`: Displays the available targets and their descriptions.
- `make all`: Builds, tests, lints and generates documentation for the project.
- `make default`: Builds, tests and lints the project (default goal).

## Notes

### doc target

The `doc` target needs to:

```bash
cd docbuild               -- run from inside the docbuild directory
lake build Learning:docs  -- build the documentation
```

### update target

The `update` target needs to:

```bash
lake update
cd docbuild && lake update doc-gen4
```


### help target

Use Dynamic help as per:

```make
help: ## Show this help message
        @echo ""
        @echo "Default goal: ${.DEFAULT_GOAL}"
        @awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
```

## Decisions

- **Default Goal**: Set to `default`, which runs `build test lint`.
- **Target Definitions**: All non-file targets are explicitly declared as
  `.PHONY` to prevent conflicts with file names.
- **Execution of `doc`**: The commands for generating documentation are
  chained using `&&` within the `docbuild` directory, ensuring the
  sequence stops on any error.
- **`all` Target**: Implemented as a target with prerequisites
  (`all: build test lint doc`) rather than a sub-make command.
