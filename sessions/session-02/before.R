# Before: obscure names and duplicated calculations.
f <- function(x) c(sum(x) / length(x), sqrt(sum((x - sum(x) / length(x))^2) / (length(x) - 1)))
