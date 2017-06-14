setwd("~/Desktop/NYU/Biostatistics/Week_3")
babydata <- read.csv("babymass.csv") 
#I wrote a file containing the data provided in the word document, it includes the standard deviations, mean weight, and standard errors of both groups.

babydata

Mean_Baby_Weight <- babydata$mean.weight #This command gets the mean baby weight from both groups in the excel file.
Mean_Baby_Weight
babySE <- babydata$Standard.Deviation/sqrt(babydata$n) #This command calculates the standard error using that formula.
babySE

upperlimit <- Mean_Baby_Weight + (babySE*2) #These next two commands calculates the upper and lower limits of the intervals using the 2SE rule.
lowerlimit <- Mean_Baby_Weight - (babySE*2) #The upper and lower limits are needed for the plotCI() command.

upperlimit
lowerlimit

install.packages("gplots") #Plotting confidence intervals requires the import of another software package.
library(gplots)

plotCI(x=Mean_Baby_Weight, ui=upperlimit, li=lowerlimit, xlim=c(1,2), xlab="Effects of Smoking on Male and Female Birth Weight", ylab="Baby Mass (grams)")
#The final command plots the final 95% confidence interval.
