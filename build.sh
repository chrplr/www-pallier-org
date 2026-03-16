#!/bin/bash

# 1. Build the Sphinx HTML and PDF
cd docs-sphinx
make html
make latexpdf

# 2. Build the Hugo site
cd ../hugo-site
hugo

# 3. Inject Sphinx output into Hugo's public folder
# This puts your documentation at yoursite.com/docs/
mkdir -p public/docs
cp -r ../docs-sphinx/_build/html/* public/docs/

# 4. Move the PDF into the site so it's downloadable
cp ../docs-sphinx/_build/latex/*.pdf public/docs/technical-manual.pdf
