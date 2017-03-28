setwd("~/Desktop/NYU/Biostatistics/Week_5")
data <- matrix(c(2516, 2920, 2417, 3657, 4653, 3449, 2012, 1627, 1294), ncol= 3, byrow = T) #This command sets up the numerical data into columns of three.
colnames( data ) <- c( "Low Med. Diet" , "Medium Med. Diet", "High Med. Diet") #The next two commands defines the rows and columns.
rownames( data ) <- c( "Never Smoked:" , "Former Smoker:", "Current Smoker:" )
data
rf <- prop.table( data, 2) #This converts the data into the desired relative frequencies.
rf
t.rf <- t( rf ) #Data is transposed from the matrix so the mosaic plot can read the data appropriately.
t.rf
mosaicplot(t.rf , main = "Mediterranean Diet and Smoking" , xlab = "Diet", ylab = "Smoking Status", col = c( "blue" , "red", "yellow") ) #This provides the mosaic plot.
test_results = chisq.test( data ) #THis converts the chi square results into a variable, which can then be referenced for observed and expected values.
E <- test_results$expected
E
O <- test_results$observed
O
test_results

