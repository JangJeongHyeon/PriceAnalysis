install.packages("UsingR")
install.packages("data.table")
install.packages("readr")
require(readr)
require(data.table)
require(UsingR)
require(ggplot2)

## load dataset
myData <- read_csv("F:/JJH/DevProject/R/DA_price/PreProcessingData/merge_high_weather_wholesale_price.csv")
View(myData)

## load dataset (shift two weeks)
shiftData <- read_csv("F:/JJH/DevProject/R/DA_price/PreProcessingData/merge_high_weather_wholesale_price_shift_2weeks.csv")
View(shiftData)

## check data
par(mfrow=c(1,2))
hist(myData$price, col='blue', breaks=100, xlab='', main='Histogram of price')
hist(myData$highTemper, col='red', breaks=100, xlab='', main='Histogram of high Temperature')
par(mfrow=c(1,1))

## convert to data.frame type
myData <- as.data.frame(myData)
shiftData <- as.data.frame(shiftData)

## correlation test about myData$price and others factor

#### First myData
result <- 'Correlation test of my data'
result$highTemper <- cor.test(myData$price, myData$highTemper)
result$rain <- cor.test(myData$price, myData$rain)
result$sunHour <- cor.test(myData$price, myData$sunHour)
result$sunAmout <- cor.test(myData$price, myData$sunAmount)
result$humidity <- cor.test(myData$price, myData$humidity)
result$cloud <- cor.test(myData$price, myData$cloud)
result$snow <- cor.test(myData$price, myData$snow)
result$wind <- cor.test(myData$price, myData$wind)


result$spearman <- 'Spearman'
result$spearman$highTemper <- cor.test(myData$price, myData$highTemper, method = "spearman")


#### Second shiftData
result2 <- 'Correlation test of shift data'
result2$highTemper <- cor.test(shiftData$price, shiftData$highTemper)
result2$rain <- cor.test(shiftData$price, shiftData$rain)
result2$sunHour <- cor.test(shiftData$price, shiftData$sunHour)
result2$sunAmout <- cor.test(shiftData$price, shiftData$sunAmount)
result2$humidity <- cor.test(shiftData$price, shiftData$humidity)
result2$cloud <- cor.test(shiftData$price, shiftData$cloud)
result2$wind <- cor.test(shiftData$price, shiftData$wind)

## draw scatter plot using ggplot library
result$Graph <- 'Scatter plots'

###########################################################################################################################################################################################################################################################################################################################################################################
## price vs high temperature
result$Graph$highTemper <- ggplot(data=myData, aes(x=price, y=highTemper))+geom_point(colour='navy')+ggtitle("Scatter plot : Pear price VS High Temperature")+labs(x='Pear Price')+labs(y='High Temperature')+theme(plot.title = element_text(hjust = 0.5))
result$Graph$highTemper

## price vs rain
result$Graph$rain <- ggplot(data=myData, aes(x=price, y=rain))+geom_point(colour='navy')+ggtitle("Scatter plot : Pear price VS Rain")+labs(x='Pear Price')+labs(y='Rain')+theme(plot.title = element_text(hjust = 0.5))
result$Graph$rain

## price vs sunHour
result$Graph$sunHour <- ggplot(data=myData, aes(x=price, y=sunHour))+geom_point()+ggtitle("Scatter plot : Pear price VS sunHour")+labs(x='Pear Price')+labs(y='sunHour')+theme(plot.title = element_text(hjust = 0.5))
result$Graph$sunHour


## price vs sunAmount
result$Graph$sunAmount <- ggplot(data=myData, aes(x=price, y=sunAmount))+geom_point(colour='navy')+ggtitle("Scatter plot : Pear price VS Insolation")+labs(x='Pear Price')+labs(y='sunAmount')+theme(plot.title = element_text(hjust = 0.5))
result$Graph$sunAmount


## price vs humidity
result$Graph$humidity <- ggplot(data=myData, aes(x=price, y=humidity))+geom_point(colour='navy')+ggtitle("Scatter plot : Pear price VS Humidity")+labs(x='Pear Price')+labs(y='humidity')+theme(plot.title = element_text(hjust = 0.5))
result$Graph$humidity


## price vs cloud
result$Graph$cloud <- ggplot(data=myData, aes(x=price, y=cloud))+geom_point(colour='navy')+ggtitle("Scatter plot : Pear price VS Cloud")+labs(x='Pear Price')+labs(y='cloud')+theme(plot.title = element_text(hjust = 0.5))
result$Graph$cloud

## price vs wind
result$Graph$wind <- ggplot(data=myData, aes(x=price, y=wind))+geom_point(colour='red')+ggtitle("Scatter plot : Pear price VS wind")+labs(x='Pear Price')+labs(y='wind')+theme(plot.title = element_text(hjust = 0.5))
result$Graph$wind
###########################################################################################################################################################################################################################################################################################################################################################################


###########################################################################################################################################################################################################################################################################################################################################################################
## price vs high temperature
result2$Graph <- "Scatter plots"
result2$Graph$highTemper <- ggplot(data=shiftData, aes(x=price, y=highTemper))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS High Temperature")+labs(x='Pear Price')+labs(y='High Temperature')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result2$Graph$highTemper

## price vs rain
result2$Graph$rain <- ggplot(data=shiftData, aes(x=price, y=rain))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS Rain")+labs(x='Pear Price')+labs(y='Rain')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result2$Graph$rain

## price vs sunHour
result2$Graph$sunHour <- ggplot(data=shiftData, aes(x=price, y=sunHour))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS sunHour")+labs(x='Pear Price')+labs(y='sunHour')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result2$Graph$sunHour


## price vs sunAmount
result2$Graph$sunAmount <- ggplot(data=shiftData, aes(x=price, y=sunAmount))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS sunAmount")+labs(x='Pear Price')+labs(y='sunAmount')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result2$Graph$sunAmount


## price vs humidity
result2$Graph$humidity <- ggplot(data=shiftData, aes(x=price, y=humidity))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS humidity")+labs(x='Pear Price')+labs(y='humidity')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result2$Graph$humidity


## price vs cloud
result2$Graph$cloud <- ggplot(data=shiftData, aes(x=price, y=cloud))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS cloud")+labs(x='Pear Price')+labs(y='cloud')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result2$Graph$cloud

## price vs wind
result2$Graph$wind <- ggplot(data=shiftData, aes(x=price, y=wind))+geom_point(shape=18,size=2.3,colour='red')+ggtitle("Scatter plot : Pear price VS wind")+labs(x='Pear Price')+labs(y='wind')+theme(plot.title = element_text(hjust = 0.5))+stat_smooth(method = lm, se=FALSE)
result2$Graph$wind
###########################################################################################################################################################################################################################################################################################################################################################################

## regression test
out = lm(price~highTemper, data=myData)
summary(out)

## draw graph of regrssion result 
plot(price~highTemper, data=myData, xlab='Average Temperature', ylab='Pear Price')
abline(out,col='red')
ggplot(data=myData, aes(x=price, y=highTemper))+geom_count()+geom_smooth(method='lm')
