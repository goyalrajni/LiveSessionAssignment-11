
#install.packages("fpp")
library(fpp)

data(visitors)
class(visitors)
summary(visitors)
plot(visitors)


#This time series has an upward linear trend and yearly seasonal variations.When the time series increase the seasonal variation increase more and more.It probably has some cyclical variations too, but this third component seems to be less significant than the other two. This plot indicates multiplicity in data set.

#	Use a classical decomposition to calculate the trend-cycle and seasonal indices.
fitd <- decompose(visitors)
plot(fitd)

#Do the results support the graphical interpretation from part (a)? 

#Yes, the results support the graphical interpretation from part(a). As can be seen, the trend is linear upward and  seasonal variations also increase more and more as time series increases.

#Compute and plot the seasonally adjusted data. 
eeadj <- seasadj(fitd)
plot(eeadj)

#Change one observation to be an outlier (e.g., add 500 to one observation), and recompute the seasonally adjusted data. What is the effect of the outlier? 
visitors2 <-ts(c(visitors[1:54],visitors[55]+500,visitors[56:191]),start=c(1978,1),frequency=12)
plot(visitors2)

#It looks like the outlier is an additive outlier.The additive outlier is a point outlier which occurred at a given date or time of the year. It affects one observation only and is modeled by the variable.

#
visitors2 <-ts(c(visitors[1:54],visitors[55:180],visitors[181:191]+500),start=c(1978,1),frequency=12)
plot(visitors2) 

#It looks like that an outlier at the end affects all the observations and the effect is consistent after that .

#Does it make any difference if the outlier is near the end rather than in the middle of the time series? 


#Yes, it makes a difference. If the outlier is in middle, then it looks like one time due to certain event. But the outlier in the end is more consistent and it looks like the same trend continues after the certain event. 

#Use STL to decompose the series. 
fit <- stl(visitors, s.window=5)
plot(fit)
plot(visitors, col="gray",main="Visitors Data",ylab="New orders index", xlab="")
lines(fit$time.series[,2],col="red",ylab="Trend")
