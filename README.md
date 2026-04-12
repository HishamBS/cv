<div align="center">

# Hisham Bin Seddeq

### Lead Software Engineer &nbsp;·&nbsp; AI / ML &nbsp;·&nbsp; Full-Stack

*Architecting enterprise-scale AI platforms, computer vision systems, and agentic AI products.*

<br>

[![Download CV](https://img.shields.io/badge/Download_CV-PDF-2563EB?style=for-the-badge&logo=adobeacrobatreader&logoColor=white)](https://github.com/HishamBS/cv/releases/latest/download/Hisham_BinSeddeq_CV.pdf)
&nbsp;
[![Latest Release](https://img.shields.io/github/v/release/HishamBS/cv?style=for-the-badge&color=1F2937&label=release)](https://github.com/HishamBS/cv/releases/latest)
&nbsp;
[![Build](https://img.shields.io/github/actions/workflow/status/HishamBS/cv/release.yml?branch=main&style=for-the-badge&label=build&color=2563EB)](https://github.com/HishamBS/cv/actions)

<br>

[![LinkedIn](https://img.shields.io/badge/hishambs-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://linkedin.com/in/hishambs)
&nbsp;
[![GitHub](https://img.shields.io/badge/HishamBS-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/HishamBS)
&nbsp;
[![Email](https://img.shields.io/badge/prog.hbs@hotmail.com-D14836?style=flat-square&logo=maildotru&logoColor=white)](mailto:prog.hbs@hotmail.com)
&nbsp;
[![Riyadh](https://img.shields.io/badge/Riyadh,_Saudi_Arabia-1F2937?style=flat-square)](#)

<br>

<a href="https://github.com/HishamBS/cv/releases/latest/download/Hisham_BinSeddeq_CV.pdf">
  <img src="https://github.com/HishamBS/cv/releases/latest/download/Hisham_BinSeddeq_CV_preview.png" alt="CV preview — click to download PDF" width="720" />
</a>

</div>

---

## How it's built

This CV is a single-source LaTeX document that compiles automatically on every push to `main`.
GitHub Actions runs **XeLaTeX** in a Docker container, generates the PDF, renders a preview image, and attaches both to a dated release.

```
edit *.tex  →  git push  →  GitHub Actions  →  fresh PDF release
```

No local LaTeX toolchain required. Write the content, commit, forget.

## Project layout

| Path | Purpose |
|:---|:---|
| `cv.tex` | Main document — personal info and two-column layout |
| `cv.cls` | Custom LaTeX class with stacked entries, narrow-column friendly |
| `cv/experience.tex` | Professional experience *(left column)* |
| `cv/skills.tex` | Technical skills *(right column)* |
| `cv/education.tex` | Education |
| `cv/certifications.tex` | Certifications |
| `cv/courses.tex` | Courses & training |
| `cv/earlier.tex` | Earlier experience |
| `.github/workflows/release.yml` | CI — compile with XeLaTeX, attach PDF + preview to a release |

<details>
<summary><b>Build locally</b></summary>

<br>

Requires XeLaTeX with the `roboto`, `sourcesanspro`, and `microtype` packages.

```bash
latexmk -xelatex cv.tex
```

Or open `cv.tex` in your favorite LaTeX editor with XeLaTeX configured as the compiler.

</details>

<details>
<summary><b>Credits &amp; license</b></summary>

<br>

- `cv.cls` derives from [**russell.cls**](https://github.com/themagicalmammal/Resume) by *themagicalmammal*
- CI / workflow approach inspired by [**hassanalwizrah/resume**](https://github.com/hassanalwizrah/resume)
- Licensed under [**LPPL 1.3c**](LICENSE)

</details>

<br>

<div align="center">

*Built with LaTeX &nbsp;·&nbsp; XeLaTeX &nbsp;·&nbsp; GitHub Actions*

</div>
