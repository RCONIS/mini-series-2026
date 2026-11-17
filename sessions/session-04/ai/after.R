#' Center numeric values around their mean.
#' @param x Numeric vector.
#' @param na.rm Remove missing values when calculating the mean.
#' @return A numeric vector; missing positions remain missing.
center_values <- function(x, na.rm = FALSE) {
  x - mean(x, na.rm = na.rm)
}
