testthat::test_that("centering preserves defaults and handles missing values", {
  testthat::expect_equal(center_values(c(1, 2, 3)), c(-1, 0, 1))
  testthat::expect_true(all(is.na(center_values(c(1, NA, 3)))))
  testthat::expect_equal(center_values(c(1, NA, 3), na.rm = TRUE), c(-1, NA, 1))
  testthat::expect_true(all(is.na(center_values(c(NA_real_, NA_real_), TRUE))))
})
