# GSWEP4R mini-series

Four sessions on R package structure and building; workflow, clean code and unit
tests; further testing and Shiny development; optimization and AI best practices.
Sessions 1 and 2 take place on 19 and 20 November 2026 (for JnJ, online). 
Sessions 3 and 4: TBD.

- [Website](https://rconis.github.io/mini-series-2026/)
- `slides/`: four session decks, retaining original author credits.
- `sessions/session-01` through `session-04`: independent, completed live demos.
- `slides/download/`: generated ZIPs, linked from the homepage and slides; excluded from version control.

Participants extract a session ZIP, open its R project, run `source("setup.R")`
once, then `source("demo.R")`. Session 3 also has `launch-app.R`.

Maintainers: edit the normal source files under `sessions/session-01` through
`session-04`, including the walkthrough comments in each `demo.R`.
Run `quarto render` after installing the R dependencies from `DESCRIPTION`.
The project pre-render hook runs `scripts/bundle-sessions.R` automatically,
creating one ZIP per source directory before Quarto copies downloads into the
rendered site. A clean checkout needs no existing ZIP files. Generated archives
exclude local build output, installed libraries, RStudio state, and profiling output.
To build only the archives, run `Rscript scripts/bundle-sessions.R`.
The program is recorded in `slides/resources/program.csv`.

Adapted teaching materials: CC BY-SA 4.0, with stated exceptions. New demo code
and notes: MIT. See [attribution](ATTRIBUTION.md) and per-directory licenses.
