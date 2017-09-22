install.packages("data.table")
install.packages("readr")
install.packages("readxl")
install.packages("caret")
install.packages("e1071")
require(readr)
require(data.table)
require(ggplot2)
require(caret)
library(readxl)
library(e1071)
## load dataset
ExcelData <- read_excel("F:/JJH/DevProject/R/DA_price/PreProcessingData/merge_weather_wholesale_price.xlsx", 
                                            col_types = c("numeric", "numeric", "numeric", 
                                                          "numeric", "numeric", "numeric", 
                                                          "numeric", "numeric", "numeric", 
                                                          "numeric", "numeric"))
## Converting data to Datframe type
mergeData <- as.data.frame(ExcelData)

## Check missing value
is.na(mergeData)
which(is.na(mergeData))

## check skewness
hist(mergeData$avgTemper)
hist(mergeData$rain)
hist(mergeData$sunAmount)
hist(mergeData$sunHour)

## Shapiro_Wilk normality test
shapiro.test(mergeData$avgTemper)
shapiro.test(mergeData$rain)
shapiro.test(mergeData$sunHour)
shapiro.test(mergeData$sunAmount)
shapiro.test(mergeData$humidity)
shapiro.test(mergeData$cloud)
shapiro.test(mergeData$snow)
shapiro.test(mergeData$wind)
shapiro.test(mergeData$price)


## Scaling
s_data <- scale(mergeData)
s_data <- as.data.frame(s_data)
shapiro.test(s_data$avgTemper)
