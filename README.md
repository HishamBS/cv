# CV

LaTeX resume built with a custom `resume.cls` document class, auto-compiled via GitHub Actions on every push to `main`.

[![Build and Release Resume](https://github.com/HishamBS/cv/actions/workflows/release.yml/badge.svg)](https://github.com/HishamBS/cv/actions/workflows/release.yml)

## Download

Grab the latest compiled PDF from [Releases](https://github.com/HishamBS/cv/releases/latest/download/resume.pdf) — no LaTeX toolchain required.

## Structure

```
.
├── resume.tex                      Main document (personal info + layout)
├── resume.cls                      Custom LaTeX class (stacked-entry, two-column ready)
├── cv/
│   ├── experience.tex              Professional experience (left column)
│   ├── skills.tex                  Technical skills (right column)
│   ├── education.tex               Education (right column)
│   ├── certifications.tex          Certifications (right column)
│   ├── courses.tex                 Courses & training (right column)
│   └── earlier.tex                 Earlier experience (right column)
└── .github/workflows/release.yml   CI: compile with XeLaTeX, attach PDF to release
```

## Local build (optional)

Requires XeLaTeX and the TeX Live `fontawesome5`, `roboto`, and `sourcesanspro` packages:

```bash
latexmk -xelatex resume.tex
```

## Credits

- `resume.cls` derived from [russell.cls](https://github.com/themagicalmammal/Resume) (LPPL 1.3c)
- Workflow and file organization inspired by [hassanalwizrah/resume](https://github.com/hassanalwizrah/resume)

## License

[LPPL 1.3c](LICENSE)
