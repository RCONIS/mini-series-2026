# Session 4: Code optimization
#
# Open session-04.Rproj and run source("setup.R") once before joining.
# Keep this session folder as the working directory. Follow the numbered
# sections with the instructor, or use source("demo.R") to run the whole demo.
# AI best practices are discussed in the slides; there is no AI coding demo.

# 1. Read optimization.R before measuring anything.
# row_means_slow() calculates each row's mean in an R loop; row_means_fast()
# delegates the same operation to rowMeans(). Both implementations are supplied.
# Identify repeated work in the loop and discuss why a built-in vectorized
# operation can reduce overhead while keeping the code easy to understand.
source("optimization.R")

# 2. Create a reproducible synthetic matrix and check correctness first.
# Both functions must return the same row means within numerical tolerance.
# The expectation returns quietly when it passes; a faster wrong answer would
# not be an acceptable optimization.
set.seed(42)
x <- matrix(rnorm(200000), ncol = 20)
testthat::expect_equal(row_means_slow(x), row_means_fast(x))

# 3. Compare elapsed times using the same input on your laptop.
# Read the elapsed column. The built-in version will usually be faster, but
# exact timings vary with hardware and background activity; very short runs
# may round to zero. Repeat the two commands interactively if helpful.
print(system.time(row_means_slow(x)))
print(system.time(row_means_fast(x)))

# 4. Profile the slow version to find where time is spent.
# Repeat it to collect more samples. Rprof() writes profile.out in this folder;
# Rprof(NULL) stops sampling before summaryRprof() reads the result.
# In the by.total table, look for row_means_slow(), mean(), and their callees.
# Profiling is sampled: exact percentages and visible rows vary between runs.
Rprof("profile.out")
for (i in seq_len(10)) invisible(row_means_slow(x))
Rprof(NULL)
print(summaryRprof("profile.out")$by.total)

# 5. Discuss the result before considering more complex implementations.
# We checked equivalence, measured runtime, found repeated work, and used a
# simpler built-in alternative. Profile a real workload before adding parallel
# processing or C++; consider maintenance cost as well as speed. profile.out
# is disposable and excluded from the participant download on future builds.
