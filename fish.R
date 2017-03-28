#*****Question 13.18

setwd("~/Desktop/NYU/Biostatistics/week_8")
data <- read.csv("fish.csv")
data
attach(data)
t.test(log.nt, log.t, var.equal=T) #Since the data is skewed to the right, the log values were used to normalize the data.

#Two Sample t-test

#data:  log.nt and log.t
#t = -2.9032, df = 9, p-value = 0.01751
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
#  -0.63278707 -0.07852622
#sample estimates:
#  mean of x  mean of y 
#-0.1560032  0.1996535 
#*****It should be noted that the numbers for the 95% confidence interval and the means are
#in log units and will be converted back.  