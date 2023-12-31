library("reshape2")
source("llr_functions.R")
data(french_fries)
french_fries = french_fries[complete.cases(french_fries),]
z = seq(0, 15, length.out = 100)
fits = llr(z = z, x = french_fries$potato, y = french_fries$buttery, omega = 1)

microbenchmark::microbenchmark(llr(z = z, x = french_fries$potato, y = french_fries$buttery, omega = 1))
