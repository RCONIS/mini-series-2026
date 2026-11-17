source("simulatr/R/simulate_groups.R")
source("app/module.R")
testthat::test_dir("simulatr/tests/testthat", stop_on_failure = TRUE)
testthat::test_dir("tests", stop_on_failure = TRUE)
# Run source("launch-app.R") separately to open the interactive app.
# Stop the app with Escape in RStudio or Ctrl+C in a terminal.
