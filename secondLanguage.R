setwd("~/Desktop/NYU/Biostatistics/week_11") #Sets the working directory.
languagedata <- read.csv("16q13LanguageGreyMatter Mechelli et al 2004 replica.csv")
languagedata

proficiency <- languagedata$proficiency
greymatter <- languagedata$greymatter

plot(proficiency, greymatter, xlab="Proficiency Score for Second Language", ylab="Gray-matter density (mm^3/voxel)")
xminusxbar <- (proficiency - mean( proficiency )) #The following commands will be used to calculate r.
yminusybar <- (greymatter - mean( greymatter ))
vectorbars <- xminusxbar * yminusybar
sumvectorbars <- sum( vectorbars )
xminusxbarsq <- xminusxbar^2
sumxminusxbar <- sum( xminusxbarsq )
yminusybarsq <- yminusybar^2
sumyminusybar <- sum( yminusybarsq )
sqrt( sumxminusxbar * sumyminusybar )

r = sumvectorbars/sqrt( sumxminusxbar * sumyminusybar )
r #r=0.8183134
SE <- sqrt(( 1 - r^2 )/(22 - 2)) #r=t/SE
t <- r/SE
t #t=6.36706
#For df=20, the t critical=2.09.  We can therefore reject the null hypothesis.  
#Second language proficiency affects gray matter density in the brain.
