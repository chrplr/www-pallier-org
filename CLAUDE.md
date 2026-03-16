# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Hybrid static site combining **Hugo** (marketing/content pages) and **Sphinx** (technical documentation with PDF export). Hugo uses the Relearn theme (git submodule). Deployed to GitHub Pages at `https://www.pallier.org/`.

- Hugo content: `hugo-site/content/` (Markdown)
- Sphinx docs: `docs-sphinx/` (reStructuredText)
- Sphinx output is synced to `hugo-site/static/docs/` so it's served under the Hugo site

## Commands

All commands are run from the repository root.

```bash
make all      # Full build: Sphinx docs + Hugo site
make docs     # Build Sphinx HTML and PDF, sync to hugo-site/static/docs/
make site     # Build Hugo site only (output: hugo-site/public/)
make serve    # Build docs + start Hugo dev server (live reload)
make clean    # Remove all build artifacts
```

Sphinx only (from `docs-sphinx/`):
```bash
make html       # Build HTML docs
make latexpdf   # Build PDF via LaTeX
make sync       # Sync Sphinx output to Hugo static dir
```

## Architecture

### Build pipeline
`make all` → builds Sphinx (HTML + PDF) → syncs to `hugo-site/static/docs/` → builds Hugo site into `hugo-site/public/`. The CI workflow (`.github/workflows/deploy.yml`) runs `make all` on push to `main` and deploys `hugo-site/public/` to GitHub Pages.

### Hugo theme
The Relearn theme lives at `hugo-site/themes/hugo-theme-relearn/` as a git submodule. Clone with `--recurse-submodules` or run `git submodule update --init` after cloning. Hugo config is in `hugo-site/hugo.toml`.

### Sphinx config
`docs-sphinx/conf.py` — uses `sphinx_rtd_theme`, outputs to `docs-sphinx/_build/`. Dependencies: Python with `sphinx` and `sphinx_rtd_theme` installed, plus a LaTeX distribution for PDF builds.

## Dependencies

- Hugo (extended version)
- Python 3 with `sphinx` and `sphinx_rtd_theme`
- LaTeX distribution (for PDF generation via `make latexpdf`)
