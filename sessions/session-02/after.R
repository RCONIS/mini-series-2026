# After: clear purpose, names and standard library functions.
summarize_values <- function(values) {
  c(mean = mean(values), sd = stats::sd(values))
}
