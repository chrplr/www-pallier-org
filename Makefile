# Root Makefile

.PHONY: help docs site all clean serve

help:
	@echo "Usage:"
	@echo "  make docs    - Build Sphinx HTML and PDF, sync to Hugo static"
	@echo "  make site    - Build the Hugo site"
	@echo "  make all     - Build everything"
	@echo "  make serve   - Run Hugo local server"

# 1. Build Sphinx and move to Hugo's static folder
docs:
	$(MAKE) -C docs-sphinx all

# 2. Build the final Hugo site (outputs to hugo-site/public)
site:
	cd hugo-site && hugo

# 3. Full build sequence
all: docs site

# 4. Local development: build docs then serve Hugo
serve: docs
	cd hugo-site && hugo server


clean:
	@echo "Cleaning up all build artifacts..."
	# Clean Sphinx
	$(MAKE) -C docs-sphinx clean
	# Clean Hugo
	rm -rf hugo-site/public
	rm -rf hugo-site/resources
	# Clean synced docs in static
	rm -rf hugo-site/static/docs/*
	# Restore the .gitkeep so the directory remains in git
	touch hugo-site/static/docs/.gitkeep
	@echo "All clean."
