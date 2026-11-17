testthat::test_that("simulation has the expected structure", {
  set.seed(42)
  result <- simulate_groups(5, 1)
  testthat::expect_named(result, c("group", "value"))
  testthat::expect_equal(nrow(result), 10L)
  testthat::expect_equal(as.integer(table(result$group)), c(5L, 5L))
  testthat::expect_true(all(is.finite(result$value)))
})
testthat::test_that("simulation is reproducible with a caller supplied seed", {
  set.seed(42)
  first <- simulate_groups(5)
  set.seed(42)
  testthat::expect_identical(simulate_groups(5), first)
})
