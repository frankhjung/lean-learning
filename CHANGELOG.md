# Changelog

All notable changes to the `learning` Lean project are documented in this
file.

## [0.1.0] - 2026-06-03

### Added

- Created the default `scripts/nolints.json` directory and file for linter
  suppressions.
- **Documentation (`README.md`):** Added execution examples for `lake exe
  learning <name>`.
- **Documentation (`README.md`):** Added instructions for configuring and
  updating linter suppressions via `scripts/nolints.json`.

### Changed

- **Lake Configuration (`lakefile.toml`):** Removed duplicate `[[lean_lib]]`
  definition for `Test` to prevent duplicate target compilation conflicts.
- **CI/CD Workflow (`.github/workflows/lean_action_ci.yml`):** Removed the
  `lake update doc-gen4` step from the build process to ensure reproducible and
  deterministic builds.
- **Makefile:**
  - Optimised the `doc` target to only build the documentation, removing the
    automatic package updates.
  - Updated the `update` target to update both the main project dependencies
    and the `docbuild` dependencies.
- **Makefile Documentation (`docs/makefile.md`):**
  - Aligned the `default` goal description to only run `build test lint`
    (omitting `update`).
  - Added details for the new `update` target and optimised `doc` target.
  - Corrected grammatical typo ("using Makefile provides" -> "using a Makefile
    provides").
- **CI Pages Documentation (`docs/pages.md`):**
  - Corrected typos ("we want build" -> "we want to build", "publish to pages"
    -> "publish to GitHub Pages").

### Fixed

- **Lake Configuration (`lakefile.toml`):** Restored the `[[lean_lib]]` definition
  for `Test` to fix build errors where the `Test` module prefix was unknown to
  the compiler.
- **Gitignore (`.gitignore`):** Reordered entries for better readability and
  cleaned up duplicate entries for `/.lake` and `docbuild/.lake`.
- **Code Standards (`Learning/Basic.lean`, `Test/Basic.lean`):** Renamed the
  `HitchHiker` function to `hitchHiker` to adhere to standard Lean 4 camelCase
  conventions.
- **Code Formatting (`Learning/HelloWorld.lean`):** Replaced hard tabs with
  spaces and corrected pattern-matching indentation.
