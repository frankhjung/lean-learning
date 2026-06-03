# Changelog

All notable changes to the `learning` Lean project are documented in this
file.

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
- **Makefile Documentation (`docs/makefile.md`):** Aligned default goals to
  run `build test lint` (omitting `update`) and corrected grammatical errors.
- **CI Pages Documentation (`docs/pages.md`):** Corrected grammatical typos
  regarding GitHub Pages publishing.

### Fixed

- **Doc Generation Configuration (`docbuild/lakefile.toml`):** Configured
  `[leanOptions]` with `maxHeartbeats = 0` to prevent heartbeat timeout warnings
  during documentation compilation.
- **Lake Configuration (`lakefile.toml`):** Restored the `[[lean_lib]]` definition
  for `Test` to fix build errors where the `Test` module prefix was unknown to
  the compiler.
- **Gitignore (`.gitignore`):** Cleaned up duplicate entries for `/.lake` and
  `docbuild/.lake`, and reordered entries for better readability.
- **Code Standards (`Learning/Basic.lean`, `Test/Basic.lean`):** Renamed the
  `HitchHiker` function to `hitchHiker` to adhere to standard Lean 4 camelCase
  conventions.
- **Code Formatting (`Learning/HelloWorld.lean`):** Replaced hard tabs with
  spaces and corrected pattern-matching indentation.
