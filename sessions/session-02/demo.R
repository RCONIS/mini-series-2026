# Session 2: Workflow, clean code and unit tests
#
# Before joining: open session-02.Rproj and run source("setup.R") once.
# Keep this session folder as the working directory. Follow the numbered
# sections with the instructor, or run source("demo.R") for the full demo.
# The before/after code and tests are complete; no edits are required.

# 1. Agree on behavior before looking at the implementation.
# For a finite numeric vector with at least two entries, the helper should
# return its mean and sample standard deviation. For c(2, 4, 6, 8), the mean
# is 5 and the standard deviation is approximately 2.582.
# Open before.R and after.R side by side. Notice the descriptive function and
# argument names, standard R functions, and removal of repeated calculations.
source("before.R")
source("after.R")

# 2. Verify that the refactoring preserves values on this representative input.
# The new result deliberately has names; unname() lets us compare the values.
# A passing expectation returns quietly. This single check is a regression
# example, not proof that every possible input is handled correctly.
values <- c(2, 4, 6, 8)
testthat::expect_equal(unname(summarize_values(values)), f(values))
print(summarize_values(values))

# 3. Inspect the small package carried forward as an independent copy.
# In simulatr/R/simulate_groups.R, identify descriptive names, input checks,
# and roxygen documentation. Contrast its single responsibility (simulation)
# with mixing simulation, printing, and plotting in one function.
source("simulatr/R/simulate_groups.R")

# 4. Open simulatr/tests/testthat/test-simulation.R before running it.
# Identify each test's setup, action, and expectations. The tests check result
# structure and reproducibility with a caller-supplied seed, not random guesses
# about whether a simulated treatment effect will be statistically significant.
# Run the suite and read the summary: expect zero failures, warnings, or skips.
testthat::test_dir("simulatr/tests/testthat", stop_on_failure = TRUE)

# 5. Review the workflow demonstrated here.
# We stated behavior, inspected a small refactor, checked its result, and ran
# unit tests. When changing a real package, review the diff and update its
# documentation and tests together. Session 3 adds invalid-input and boundary
# checks; you do not need to modify files or save output for that session.
