# Minimal configuration for Sphinx documentation
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build
HUGO_STATIC   = ../hugo-site/static/docs

.PHONY: help Makefile html latexpdf clean sync

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Build HTML and PDF, then sync to Hugo
all: html latexpdf sync

# Build HTML docs
html:
	@$(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Build PDF via LaTeX
latexpdf:
	@$(SPHINXBUILD) -M latexpdf "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Move files to Hugo's static folder for local preview
sync:
	@echo "Syncing Sphinx output to Hugo static folder..."
	mkdir -p $(HUGO_STATIC)
	# Copy HTML files
	cp -r $(BUILDDIR)/html/* $(HUGO_STATIC)/
	# Copy the PDF (assumes the PDF name matches your project name)
	cp $(BUILDDIR)/latex/*.pdf $(HUGO_STATIC)/manual.pdf
	@echo "Done! You can now run 'hugo server' in the hugo-site directory."

# Clean build directories
clean:
	rm -rf $(BUILDDIR)
	@$(SPHINXBUILD) -M clean "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
