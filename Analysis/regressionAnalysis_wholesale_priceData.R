install.packages("UsingR")
install.packages("data.table")
install.packages("readr")
install.packages("car")
require(readr)
require(data.table)
require(UsingR)
require(ggplot2)
require(car)


## load dataset
myData <- read_csv("F:/JJH/DevProject/R/DA_price/PreProcessingData/merge_high_weather_wholesale_price.csv")
View(myData)

## load dataset (shift two weeks)
shiftData <- read_csv("F:/JJH/DevProject/R/DA_price/PreProcessingData/merge_high_weather_wholesale_price_shift_2weeks.csv")
View(shiftData)


## convert to data.frame type
myData <- as.data.frame(myData)
shiftData <- as.data.frame(shiftData)

hist(myData$price)
qqnorm(myData$price)
qqline(myData$price)


## choose meaningful factor of correlation test result
model <- lm(price~highTemper+rain+sunAmount+humidity+cloud, data = myData)
summary(model)
vif(model)

mm <- lm(price~rain+sunAmount+humidity+cloud, data = myData)
vif(mm)
summary(mm)


model_simple <- lm(price~rain+sunAmount, data = myData)
anova(model, model_simple)
vif(model)
