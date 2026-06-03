.DEFAULT_GOAL := default

.PHONY: all default build test lint doc clean update help exe

all: build test lint doc ## Build, test, lint and generate documentation

default: build test lint ## Default goal: build, test and lint the project

build: ## Build the project using Lake
	lake build

test: ## Run the tests using Lake
	lake test

exe: ## Run the `learning` executable with a sample name
	lake exe learning "Frank Jung"

lint: ## Run the linter using Lake
	lake lint

doc: ## Generate documentation using Lake
	cd docbuild && lake build Learning:docs

clean: ## Clean the build artifacts
	lake clean

update: ## Update the dependencies using Lake
	lake update
	cd docbuild && lake update doc-gen4

help: ## Show this help message
	@echo ""
	@echo "Default goal: ${.DEFAULT_GOAL}"
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
