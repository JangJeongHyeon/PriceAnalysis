install.packages("UsingR")
install.packages("data.table")
install.packages("readr")
require(readr)
require(data.table)
require(UsingR)
require(ggplot2)

## load dataset
myData <- read_csv("F:/JJH/DevProject/R/DA_price/PreProcessingData/merge_weather_wholesale_price.csv")
View(myData)

## load dataset (shift two weeks)
shiftData <- read_csv("F:/JJH/DevProject/R/DA_price/PreProcessingData/merge_weather_wholesale_price_shift_2weeks.csv")
View(shiftData)

## check data
par(mfrow=c(1,2))
hist(myData$price, col='blue', breaks=100, xlab='', main='Histogram of price')
hist(myData$avgTemper, col='red', breaks=100, xlab='', main='Histogram of averageTemperature')
par(mfrow=c(1,1))

## convert to data.frame type
myData <- as.data.frame(myData)
shiftData <- as.data.frame(shiftData)

## correlation test about myData$price and others factor

#### First myData
result <- 'Correlation test of my data'
result$avgTemper <- cor.test(myData$price, myData$avgTemper)
result$rain <- cor.test(myData$price, myData$rain)
result$sunHour <- cor.test(myData$price, myData$sunHour)
result$sunAmout <- cor.test(myData$price, myData$sunAmount)
result$humidity <- cor.test(myData$price, myData$humidity)
result$cloud <- cor.test(myData$price, myData$cloud)
result$wind <- cor.test(myData$price, myData$wind)

#### Second shiftData
result2 <- 'Correlation test of shift data'
result2$avgTemper <- cor.test(shiftData$price, shiftData$avgTemper)
result2$rain <- cor.test(shiftData$price, shiftData$rain)
result2$sunHour <- cor.test(shiftData$price, shiftData$sunHour)
result2$sunAmout <- cor.test(shiftData$price, shiftData$sunAmount)
result2$humidity <- cor.test(shiftData$price, shiftData$humidity)
result2$cloud <- cor.test(shiftData$price, shiftData$cloud)
result2$wind <- cor.test(shiftData$price, shiftData$wind)

## draw scatter plot using ggplot library
result$Graph <- 'Scatter plots'

###########################################################################################################################################################################################################################################################################################################################################################################
## price vs average temperature
result$Graph$avgTemper <- ggplot(data=myData, aes(x=price, y=avgTemper))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS Average Temperature")+labs(x='Pear Price')+labs(y='Average Temperature')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result$Graph$avgTemper

## price vs rain
result$Graph$rain <- ggplot(data=myData, aes(x=price, y=rain))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS Rain")+labs(x='Pear Price')+labs(y='Rain')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result$Graph$rain

## price vs sunHour
result$Graph$sunHour <- ggplot(data=myData, aes(x=price, y=sunHour))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS sunHour")+labs(x='Pear Price')+labs(y='sunHour')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result$Graph$sunHour


## price vs sunAmount
result$Graph$sunAmount <- ggplot(data=myData, aes(x=price, y=sunAmount))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS sunAmount")+labs(x='Pear Price')+labs(y='sunAmount')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result$Graph$sunAmount


## price vs humidity
result$Graph$humidity <- ggplot(data=myData, aes(x=price, y=humidity))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS humidity")+labs(x='Pear Price')+labs(y='humidity')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result$Graph$humidity


## price vs cloud
result$Graph$cloud <- ggplot(data=myData, aes(x=price, y=cloud))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS cloud")+labs(x='Pear Price')+labs(y='cloud')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result$Graph$cloud

## price vs wind
result$Graph$wind <- ggplot(data=myData, aes(x=price, y=wind))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS wind")+labs(x='Pear Price')+labs(y='wind')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result$Graph$wind
###########################################################################################################################################################################################################################################################################################################################################################################








## regression test
out = lm(price~avgTemper, data=myData)
summary(out)

## draw graph of regrssion result 
plot(price~avgTemper, data=myData, xlab='Average Temperature', ylab='Pear Price')
abline(out,col='red')
ggplot(data=myData, aes(x=price, y=avgTemper))+geom_count()+geom_smooth(method='lm')
