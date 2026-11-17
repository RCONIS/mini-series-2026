testthat::test_that("module updates its simulation when requested", {
  shiny::testServer(groupServer, {
    session$setInputs(n = 5, effect = 1, simulate = 1)
    testthat::expect_equal(nrow(result()), 10L)
    session$setInputs(n = 8, effect = 0, simulate = 2)
    testthat::expect_equal(nrow(result()), 16L)
  })
})
