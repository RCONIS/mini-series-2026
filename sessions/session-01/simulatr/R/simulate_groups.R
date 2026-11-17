#' Simulate two independent groups
#'
#' @param n Positive integer observations per group.
#' @param effect Finite numeric difference in group means.
#' @return A data frame with group and value columns.
#' @export
#' @examples
#' set.seed(42)
#' simulate_groups(5, effect = 1)
simulate_groups <- function(n = 20L, effect = 0) {
  if (!is.numeric(n) || length(n) != 1L || is.na(n) ||
      !is.finite(n) || n < 1 || n != floor(n)) {
    stop("n must be a positive integer")
  }
  if (!is.numeric(effect) || length(effect) != 1L ||
      is.na(effect) || !is.finite(effect)) {
    stop("effect must be a finite number")
  }
  data.frame(
    group = rep(c("control", "treatment"), each = n),
    value = c(stats::rnorm(n), stats::rnorm(n, mean = effect))
  )
}
