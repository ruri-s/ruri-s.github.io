# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal academic website for Ruri Sase, deployed as a GitHub Pages site at `ruri-s.github.io`. It is a static HTML site with no build step for the web content itself. Jekyll is configured only to generate a sitemap via the `jekyll-sitemap` plugin (`_config.yml`).

## Key files

- `index.html` — single-page site containing all profile, publication, and achievement content. This is the primary file to edit when updating the site.
- `cv/cv.tex` — LaTeX source for the English CV, compiled to `cv/out/cv.pdf` (linked from the site).
- `css/style.css`, `css/fuwaimg.css` — site styles.
- `js/common.js`, `js/fuwaimg.js` — site scripts; `js/jquery.js` and `js/scrollbooster.min.js` are vendored libraries.

## Compiling the CV

The CV is compiled with `latexmk` from inside the `cv/` directory. The `.latexmkrc` there sets `$pdf_mode = 1` (pdflatex) and writes output to `cv/out/`.

```bash
cd cv && latexmk cv.tex
```

To clean auxiliary files:

```bash
cd cv && latexmk -c cv.tex
```

## Deploying the site

Push to `main`; GitHub Pages deploys automatically. There is no CI or preview step. The `out/` directory at the repo root is unused and can be ignored.
