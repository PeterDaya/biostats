
setwd("~/Desktop/NYU/Biostatistics/week_11")
#####################################
# Calculating and Testing Correlation

# read data into R
Chickadee <- read.csv( "17e3ChickadeeAlarmsCalls.csv" )
Chickadee

mass <- Chickadee$mass
dees <- Chickadee$dees

# get an intuition about any trends in the data by visualizing it
plot( mass , dees )
# are there any obvious trends in the data?
# 

# beyond intuition, lets use a more rigorous test for dependence
help( cor.test )
cor.test( mass , dees )
# which is the independent variable?
# 

# as a formal hypothesis test, we can test the null hypothesis that there is
# no correlation (rho = zero)

# calculate the correlation coefficient

# get deviations from the mean
mean( mass )
mean( dees )

xminusxbar <- (mass - mean( mass ))
yminusybar <- (dees - mean( dees ))

# sum the product of these deviations
vectorbars <- xminusxbar * yminusybar
sumvectorbars <- sum( vectorbars )

# calculate the individual variations
xminusxbarsq <- xminusxbar^2
sumxminusxbar <- sum( xminusxbarsq )
yminusybarsq <- yminusybar^2
sumyminusybar <- sum( yminusybarsq )
sqrt( sumxminusxbar * sumyminusybar )

# finally...calculate r
r = sumvectorbars/sqrt( sumxminusxbar * sumyminusybar )
SEr <- sqrt(( 1 - r^2 )/(length( mass ) - 2))
r^2
# calculate a t value
t = r/SEr
t
# what is the probability of a t this large or larger?
# i.e. how would we calculate a p-value for this?
# 
# how many degrees of freedom?
# 


############
# Regression

# initially look to see if regression seems appropriate
# i.e. any obvious clues we should STOP!
lm( dees ~ mass )
slope=-1.038
y_intercept=3.373
yhat <- mass*slope + y_intercept
residuals <- dees-yhat
plot(mass, residuals)
plot(mass, dees)
abline(lm(dees~mass))
summary( lm( dees ~ mass ) )
anova( lm( dees ~ mass ) )

# calculate the slope of the line
# y = m*x + b
# which variable is the independent variable (x)?
# 
# slope = covariance(x,y)/variance(x)
slope = cov( mass , dees )/var(mass )

# if we know the slope, this is easy to calculate
y_intercept = mean( dees ) - slope*mean( mass )

yhat <- mass*slope + y_intercept
yhat

residuals <- dees - yhat
residuals

plot( mass , residuals )	

plot( mass , dees )
abline( lm( dees ~ mass ) )


#############################
# Spearman's Rank Correlation

# measures the magnitude and direction of a LINEAR association
# between 2 variables
# for variables that do not meet the assumptions of normality,
# even after transformation
# ranks of both variables to calculate a measure of correlation

# testing if there is an association between the impressiveness
# of eyewitness accounts and the time elapsed of the writing of the description
RopeTrick <- read.csv("16e5IndianRopeTrick.csv")
Years <- RopeTrick$years
Years
Impressive <- RopeTrick$impressiveness.score
Impressive

# look at the data
plot( Years , Impressive )
# impressiveness is an ordered, categorial value!...but they CAN be ranked
# spearmans rank measures the association between the ranks of the variables
# measured by roS which is estimated by rS

# rank the data      
Years_rank <- rank( Years , ties.method = c("average") )
Years_rank
Impressive_rank <- rank( Impressive , ties.method=c("average") )
Impressive_rank

# calculate the means of each rank
mean( Years_rank )
mean( Impressive_rank )

# calculate the numerator of r (page 446 in the textbook)
Numerator <- sum( (Years_rank - mean( Years_rank ))*(Impressive_rank - mean( Impressive_rank )))

# calculate the denominator    
SSY <- sum( (Years_rank - mean( Years_rank ))^2 )
SSI <- sum( (Impressive_rank - mean( Impressive_rank ))^2 )

# calculate r
r <- Numerator/( sqrt(SSY)*sqrt(SSI) )
r

# compare r to critical r for 0.05 alpha and 21 sample size (0.435)

# this can also be done using cor.test and you get the same r
cor.test( Years , Impressive , method = "spearman" )
help( cor.test )


