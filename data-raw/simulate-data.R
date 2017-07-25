# This file simulates data for example use in exampleDataPackage.
# The simulated data is the "raw data" included in the package.
# (Usually you would probably not have this file.)

set.seed(999)
group_a <- data.frame(group = "a",
                      score = rnorm(30, 100, 10))
group_b <- data.frame(group = "b",
                      score = rnorm(30, 105, 10))

write.csv(group_a, file = "data-raw/group_a.csv", row.names = F)
write.csv(group_b, file = "data-raw/group_b.csv", row.names = F)
