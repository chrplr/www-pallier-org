# Root Makefile (Multi-project version)

# List all folders ending in -sphinx
SPHINX_PROJECTS = $(wildcard *-sphinx)
HUGO_STATIC = hugo-site/static

.PHONY: help all docs site clean serve

help:
	@echo "Usage:"
	@echo "  make docs    - Build Sphinx HTML and PDF, sync to Hugo static"
	@echo "  make site    - Build the Hugo site"
	@echo "  make all     - Build everything"
	@echo "  make serve   - Run Hugo local server"


all: docs site

# Loop through each sphinx project and run its internal Makefile
docs:
	@for dir in $(SPHINX_PROJECTS); do \
		echo "Building $$dir..."; \
		$(MAKE) -C $$dir html latexpdf; \
		mkdir -p $(HUGO_STATIC)/$$dir; \
		cp -r $$dir/_build/html/* $(HUGO_STATIC)/$$dir/; \
		cp $$dir/_build/latex/*.pdf $(HUGO_STATIC)/$$dir/manual.pdf; \
	done

site:
	cd hugo-site && hugo

serve: docs
	cd hugo-site && hugo server

clean:
	@for dir in $(SPHINX_PROJECTS); do $(MAKE) -C $$dir clean; done
	rm -rf hugo-site/public $(HUGO_STATIC)/*-sphinx
