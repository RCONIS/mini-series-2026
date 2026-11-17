# GSWEP4R mini-series

Four sessions on R package structure and building; workflow, clean code and unit
tests; further testing and Shiny development; optimization and AI best practices.
Sessions 1 and 2 take place on 19 and 20 November 2026 (for JnJ, online). 
Sessions 3 and 4: TBD.

- [Website](https://rconis.github.io/mini-series-2026/)
- `slides/`: four session decks, retaining original author credits.
- `sessions/session-01` through `session-04`: independent, completed live demos.
- `slides/download/`: one ZIP per session, linked from the homepage and slides.

Participants extract a session ZIP, open its R project, run `source("setup.R")`
once, then `source("demo.R")`. Session 3 also has `launch-app.R`.

Maintainers: run `python3 scripts/bundle-sessions.py` after editing demos.
Render with `quarto render` after installing dependencies from `DESCRIPTION`.
The program is recorded in `slides/resources/program.csv`.

Adapted teaching materials: CC BY-SA 4.0, with stated exceptions. New demo code
and notes: MIT. See [attribution](ATTRIBUTION.md) and per-directory licenses.
