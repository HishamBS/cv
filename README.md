# Resume

[Download Latest PDF](https://github.com/HishamBS/cv/releases/latest/download/resume.pdf)

LaTeX resume built with a custom `resume.cls` document class, auto-compiled via GitHub Actions on every push to `main`.

[![Build and Release Resume](https://github.com/HishamBS/cv/actions/workflows/release.yml/badge.svg)](https://github.com/HishamBS/cv/actions/workflows/release.yml)

## Build

Requires XeLaTeX:

```bash
xelatex resume.tex
```

## Structure

- `resume.tex` — main document
- `resume.cls` — custom document class (derived from russell.cls)
- `cv/` — content sections (experience, skills, education, certifications, courses, earlier)
- `.github/workflows/release.yml` — CI: compiles with XeLaTeX and attaches the PDF to a GitHub Release

## Template

Based on [themagicalmammal/Resume](https://github.com/themagicalmammal/Resume), with the workflow approach adapted from [hassanalwizrah/resume](https://github.com/hassanalwizrah/resume).

## License

[LPPL 1.3c](LICENSE)
