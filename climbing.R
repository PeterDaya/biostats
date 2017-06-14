setwd("~/Desktop/NYU/Biostatistics/week_8")
data <- read.csv("climbing.csv")
data

attach(data)
hist(Difference, breaks=20, col="blue", xlab="#Climbing Plants-#Non-Climbing Plants per Genus")

shapiro.test(Difference) 
#We reject the null that the data has a normal distribution.
#Although it is not shown, trying to fit the data mathemamatically could not result in a normal distribution.

wilcox.test(Difference)

#Wilcoxon signed rank test with continuity correction

#data:  Difference
#V = 919.5, p-value = 0.0006863
#alternative hypothesis: true location is not equal to 0
