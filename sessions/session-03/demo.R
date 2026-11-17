# Session 3: More on tests and Shiny development
#
# Open session-03.Rproj and run source("setup.R") once before joining.
# Keep this session folder as the working directory. The scripts, application,
# module, and tests are complete. Execute each section with the instructor,
# or use source("demo.R") to run all noninteractive checks.

# 1. Inspect the simulation helper and its boundary tests.
# Open simulatr/R/simulate_groups.R and
# simulatr/tests/testthat/test-simulation.R. Compare the normal cases with
# n = 1, zero, fractional values, missing values, and invalid effect arguments.
# Notice that tests check both the error and its useful message. They also
# reset the seed rather than depending on test execution order.
source("simulatr/R/simulate_groups.R")
testthat::test_dir("simulatr/tests/testthat", stop_on_failure = TRUE)

# 2. Inspect the app's separation of responsibilities.
# app/app.R assembles the page and server. app/module.R contains the module UI
# and server; the simulation itself stays in the ordinary R helper above.
# Locate NS() in the UI and moduleServer() in the server. Matching namespaces
# let multiple copies of a module coexist without input/output ID collisions.
source("app/module.R")

# 3. Read tests/test-module.R, then run the server tests below.
# testServer() supplies inputs explicitly: UI defaults are not automatically
# available in this test context. The first simulation uses five observations
# per group (ten rows); the second uses eight per group (sixteen rows).
# Both expectations should pass without launching a browser. These tests check
# server behavior; they do not establish that the page looks correct.
testthat::test_dir("tests", stop_on_failure = TRUE)

# 4. Launch the app separately in the R console when the instructor is ready:
# source("launch-app.R")
# It is intentionally commented out so source("demo.R") finishes by itself.
# In the app, change the sample size or effect, then click Simulate. Check that
# the plot updates and that the control/treatment labels remain readable.
# Stop the app with Escape in RStudio or Ctrl+C in a terminal before continuing.

# 5. Compare the checks: helper tests cover calculation and input validation,
# module tests cover reactive server updates, and the browser walkthrough covers
# visible interaction. A production app can add automated browser/snapshot
# tests; this demo requires neither a browser-test installation nor recording.
