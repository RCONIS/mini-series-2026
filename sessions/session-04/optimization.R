# Compute row means with the same result, using two implementations.
row_means_slow <- function(x) {
  result <- numeric(nrow(x))
  for (i in seq_len(nrow(x))) result[i] <- mean(x[i, ])
  result
}
row_means_fast <- function(x) rowMeans(x)
