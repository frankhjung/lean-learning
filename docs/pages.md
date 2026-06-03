# Build Docs in CI/CD Pipeline

## Objective

In the CI/CD pipeline, we want to build the documentation automatically. Add a step
to the GitHub Actions workflow to build the documentation using Lake, and
publish to GitHub Pages.

## Detail

- Documentation is generated using the commands:

```bash
cd docbuild
lake update doc-gen4
lake build Learning:docs
```

- The documentation is generated in the `.lake/build/doc` directory. Archive the
  contents of this directory and publish to GitHub Pages.

- Update the GitHub Actions workflow to include this step, ensuring that the
  documentation is built and published on every push to the repository, ignoring
  pushes of tags.

## Decisions

- **Workflow Integration**: The documentation deployment is added as a new
  `pages` job within the existing `.github/workflows/lean_action_ci.yml` file.
- **Trigger Restrictions**: The job is configured with `if: github.ref ==
  'refs/heads/main'` to only deploy on pushes to the `main` branch, ensuring we
  ignore pushes of tags and other branches.
- **Permissions**: The `pages: write` and `id-token: write` permissions are
  assigned specifically to the `pages` job, following the principle of least
  privilege.
- **Job Dependency**: The `pages` job requires the `build` job to complete
  successfully first (`needs: build`) to ensure that broken documentation is not
  deployed.
