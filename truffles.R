setwd("~/Desktop/NYU/Biostatistics/Week_5")
truffledata <- read.csv("truffles.csv")
truffledata
chisq.test( truffledata$TrufflesPerPlot, p=0.6)
