# Configuration file for the Sphinx documentation builder.

project = 'Technical Manual'
copyright = '2026, Your Name'
author = 'Your Name'
release = '1.0.0'

# -- General configuration ---------------------------------------------------
extensions = [
    'sphinx_rtd_theme',
]

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']


# 2. Add your custom file to the sidebar
html_sidebars = {
    '**': [
        'about.html',
        'navigation.html',
        'relations.html',
        'searchbox.html',
        'sidebarpdf.html', # <--- Add this!
    ]
}

# -- Options for HTML output -------------------------------------------------
html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']

# -- Options for LaTeX/PDF output --------------------------------------------
latex_elements = {
    'papersize': 'a4paper',
    'pointsize': '10pt',
    'preamble': '',
    'figure_align': 'htbp',
}

html_context = {
    "display_github": True, # Add 'Edit on GitHub' link
    "github_user": "your-username", # Your GitHub username
    "github_repo": "your-repo-name", # Your repository name
    "github_version": "main", # The branch name
    "conf_py_path": "/docs-sphinx/", # Path in the checkout to the docs root
}

[params]
  # Link to the root of your repo
  editURL = "https://github.com/chrplr/www-pallier-org/edit/main/hugo-site/content/"

def setup(app):
    app.add_css_file('custom.css')

