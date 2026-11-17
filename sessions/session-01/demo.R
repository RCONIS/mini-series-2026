# Session 1: R package structure and building it
#
# Before the live demo: extract the session ZIP, open session-01.Rproj,
# and run source("setup.R") once. Use this session folder as the working
# directory, not the simulatr subfolder. Run the numbered sections alongside
# the instructor, or run source("demo.R") to execute the complete walkthrough.
# All package files are supplied; no scaffolding or typing is required.

# 1. Inspect the completed package in RStudio's Files pane.
# Open simulatr/DESCRIPTION: identify its name, version, authors, dependencies,
# and License field. Compare the MIT license declaration with simulatr/LICENSE.
# Open simulatr/R/simulate_groups.R: find the function and the roxygen comments
# describing its arguments, return value, example, and export.
# Inspect simulatr/NAMESPACE, man/, and tests/ to connect the package structure
# to the files discussed in the slides. These files are already present.

# 2. Regenerate help and exports from the roxygen comments.
# After this command, inspect man/simulate_groups.Rd and NAMESPACE again.
# Repeating it without changing the function should leave their contents unchanged.
roxygen2::roxygenise("simulatr")

# 3. Check the package, including its examples and unit tests.
# Read the final check summary: expect zero errors and zero warnings.
# Some machines may report a note if network time verification is unavailable.
# This checks the supplied package without requiring you to edit it first.
devtools::check("simulatr", document = FALSE, error_on = "warning")

# 4. Build a source archive and inspect the generated build/ folder.
# The archive is a distributable R package, distinct from this session's ZIP.
dir.create("build", showWarnings = FALSE)
archive <- devtools::build("simulatr", path = "build")

# 5. Install the archive into a library inside this session folder, then load it.
# This keeps the demonstration installation separate from your usual library.
# On a repeat run in the same R session, restart R first to avoid a locked
# package installation on Windows. The generated build/ and library/ can be deleted.
dir.create("library", showWarnings = FALSE)
install.packages(archive, repos = NULL, type = "source", lib = "library")
library(simulatr, lib.loc = "library")

# 6. Execute an exported function from the installed package.
# Expect ten rows: five control and five treatment observations. Resetting the
# seed makes the simulated values reproducible. The help page is available via
# help("simulate_groups", package = "simulatr") in the console.
set.seed(42)
print(simulate_groups(5, effect = 1))
