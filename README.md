# Hybrid Hugo & Sphinx Project

This repository hosts a hybrid website where **Hugo** powers the main marketing/landing pages and **Sphinx** powers the technical documentation with high-quality LaTeX PDF generation.

## 📂 Project Structure

- **/hugo-site**: The main website (Markdown-based). Uses the *Relearn* theme.
- **/docs-sphinx**: Technical documentation (reStructuredText-based). Uses the *ReadTheDocs* theme.
- **/hugo-site/static/docs**: The "bridge" folder where Sphinx output is mirrored for Hugo.

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
- **Location:** `docs-sphinx/`
- **Steps:**
  1. Create a new file, e.g., `docs-sphinx/feature-details.rst`.
  2. Register the file in the `toctree` of `docs-sphinx/index.rst`.
  3. Write your content using Sphinx directives.

---

## 🚀 Local Development

We use a **Root Makefile** to manage both engines simultaneously.

### Initial Setup
Ensure you have Hugo (extended version), Python, and a LaTeX distribution installed.
```bash
pip install sphinx sphinx_rtd_theme
```
