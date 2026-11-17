# Example code
f <- function() {
  profvis::pause(0.1)
  for (i in seq_len(3)) {
    g()
  }
}
g <- function() {
  profvis::pause(0.1)
}
