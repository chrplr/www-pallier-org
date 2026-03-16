# Hybrid Hugo & Sphinx Project

This repository hosts a hybrid website where **Hugo** powers the main marketing/landing pages and **Sphinx** powers the technical documentation with high-quality LaTeX PDF generation.

## 📂 Project Structure

- **/hugo-site**: The main website (Markdown-based). Uses the *Relearn* theme.
- ***-sphinx** directories: Technical documentation projects (reStructuredText-based). Uses the *ReadTheDocs* theme. Any directory ending in `-sphinx` (e.g. `docs-sphinx/`, `manual-sphinx/`) is automatically picked up by the Makefile.
- **/hugo-site/static/\*-sphinx**: The "bridge" folders where each Sphinx project's output is mirrored for Hugo (e.g. `hugo-site/static/docs-sphinx/`).

---

## 📝 How to Add Content

### 1. Main Website (Blog, Landing Pages, Overviews)
- **Format:** Markdown (`.md`)
- **Location:** `hugo-site/content/`
- **Steps:**
  1. Create a new file, e.g., `hugo-site/content/my-page.md`.
  2. Add Hugo front matter (Title, Date, etc.) at the top.
  3. Write your content in standard Markdown.

### 2. Technical Documentation (Manuals, API, Specs)
- **Format:** reStructuredText (`.rst`)
- **Location:** any `*-sphinx/` directory at the repository root
- **Steps:**
  1. To add a document to an existing project (e.g. `docs-sphinx/`), create a new `.rst` file there and register it in its `index.rst` toctree.
  2. To add a **new document**, create a new `<name>-sphinx/` directory with its own `Makefile` and `conf.py`. The root `make docs` will automatically build it and sync its output to `hugo-site/static/<name>-sphinx/`.

---

## 🚀 Local Development

We use a **Root Makefile** to manage both engines simultaneously.

### Initial Setup
Ensure you have Hugo (extended version), Python, and a LaTeX distribution installed.
```bash
pip install sphinx sphinx_rtd_theme
```
