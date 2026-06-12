# Changelog

All notable changes to the `learning` Lean project are documented in this file.

## [Unreleased]

### Added

- **Documentation:**
  - Added Elan installation instructions for Linux and macOS.
  - Added a development section outlining common Makefile targets
    (`build`, `test`, `lint`, and `doc`).
  - Documented the repository's project structure in the `README.md`.
  - Added links for the Lean Language Guide and licence references.

### Changed

- **Tooling:** Upgraded the Lean toolchain to `v4.31.0-rc2` and updated
  dependencies (including community `batteries` and `doc-gen4`) for both
  the main package and the documentation build configuration.

### Fixed

- **Build System:**
  - Configured the `Makefile` to dynamically resolve the Lean installation
    prefix and set `LD_LIBRARY_PATH` before invoking `lake`, preventing
    runtime link errors.
  - Silenced the output of Makefile commands by prefixing recipe lines
    with `@`.
  - Fixed syntax errors in the `Makefile` `doc` and `update` targets by
    removing invalid `@` prefixes from within multi-line shell commands.
  - Standardised directory changing in the Makefile by using the `CD`
    variable.
  - Updated Makefile to view locally generated documentation.

## [0.1.0] - 2026-06-03

### Added

- **License:** Added the GNU GPL 3 license.
- **CI/CD Pipeline:**
  - Integrated GitHub Actions workflow for automatic documentation build and
    deployment to GitHub Pages.
  - Integrated automated test suite execution into the CI workflow.
  - Integrated the `batteries` linter driver into the CI/CD pipeline.
- **Build System & Tooling:**
  - Added a `Makefile` supporting targets for `build`, `test`, `lint`, `doc`,
    `update`, `clean`, and `cleanall` to automate developer tasks.
  - Declared `LAKE`, `CD`, and `RM` variables in the `Makefile` for platform
    portability.
  - Upgraded Lean toolchain to `v4.31.0-rc1`.
- **Testing Suite:**
  - Implemented a custom test suite runner (`Test.lean`) and utilities
    (`Test/Util.lean`) to run assertions automatically.
  - Prefixed all test-related console output with `[TEST]` for cleaner logging
    and parsing.
- **Documentation:**
  - Added design documentation for the build system (`docs/makefile.md`).
  - Added deployment documentation for GitHub Pages (`docs/pages.md`).
  - Added default linter suppression file (`scripts/nolints.json`).
  - Expanded `README.md` to include execution examples and linter configuration
    details.

### Changed

- **Main Entrypoint (`Main.lean`):** Updated the entrypoint to support basic CLI
  arguments.
- **Makefile Configuration:** Reorganized targets and aligned the default goal
  to run `build test lint`.
- **Makefile Documentation (`docs/makefile.md`):** Aligned default goals to run
  `build test lint` (omitting `update`) and corrected grammatical errors.
- **CI Pages Documentation (`docs/pages.md`):** Corrected grammatical typos
  regarding GitHub Pages publishing.
- **CI Workflow
  ([.github/workflows/lean_action_ci.yml](.github/workflows/lean_action_ci.yml)):**
  Split the CI into separate `build` (compile, lint, test), `docs` (build
  documentation and upload pages artifact on `main`), and `pages` (deploy-only)
  jobs. This prevents a second compile on the Pages runner and reduces PR
  latency.

### Fixed

- **Doc Generation Configuration (`docbuild/lakefile.toml`):** Configured
  `[leanOptions]` with `maxHeartbeats = 0` to prevent heartbeat timeout warnings
  during documentation compilation.
- **Lake Configuration (`lakefile.toml`):** Restored the `[[lean_lib]]`
  definition for `Test` to fix build errors where the `Test` module prefix was
  unknown to the compiler.
- **Gitignore (`.gitignore`):** Cleaned up duplicate entries for `/.lake` and
  `docbuild/.lake`, and reordered entries for better readability.
- **Code Standards (`Learning/Basic.lean`, `Test/Basic.lean`):** Renamed the
  `HitchHiker` function to `hitchHiker` to adhere to standard Lean 4 camelCase
  conventions.
- **Code Formatting (`Learning/HelloWorld.lean`):** Replaced hard tabs with
  spaces and corrected pattern-matching indentation.
