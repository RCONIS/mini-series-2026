# Workflow: agree on behavior, compare the refactor, then run regression tests.
source("before.R")
source("after.R")
values <- c(2, 4, 6, 8)
testthat::expect_equal(unname(summarize_values(values)), f(values))
print(summarize_values(values))
source("simulatr/R/simulate_groups.R")
testthat::test_dir("simulatr/tests/testthat", stop_on_failure = TRUE)
