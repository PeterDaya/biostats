#Chapter 18, question 11.





setwd("~/Desktop/NYU/Biostatistics/week_12") #Sets the working directory.
fishdata <- read.csv("18q11ExploitedLarvalFish.csv") #The data is read into R.
fishdata 
attach(fishdata)
anova(lm(cv~age+exploited)) #This is the ANOVA, which takes coefficient as a function of age and exploitation.
#The ANOVA table is shown at the bottom of the code.
yesexploited <- fishdata[exploited=="yes",] #These next two commands seperates the data points by whether or not the species are exploited.
notexploited <-fishdata[exploited=="no",]
lm.exploited <- lm(cv~age, data=yesexploited) #These next two commands generates the regression lines for both data points.
lm.notexploited <- lm(cv~age, data=notexploited)
plot(age, cv, pch=as.numeric(exploited), xlab="Age of Maturation (years)", ylab="Coefficent of Variation") #This command plots the data.
abline(lm.exploited) #The next two commands add the regression line to the plot from the last command.
abline(lm.notexploited)

#Analysis of Variance Table

#Response: cv
#Df  Sum Sq Mean Sq F value    Pr(>F)    
#age        1 0.78488 0.78488  8.0031 0.0090706 ** 
#  exploited  1 1.59239 1.59239 16.2370 0.0004593 ***
#  Residuals 25 2.45180 0.09807                      
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1