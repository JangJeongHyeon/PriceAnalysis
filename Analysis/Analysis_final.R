install.packages("readr")
install.packages("RMySQL")
require(readr)
require(RMySQL)

db <- dbConnect(MySQL(),user="root",password='soo2080',dbname='pricepridiction', host='localhost')
dbListTables(db)


weather <- read_csv("F:/JJH/Desktop/origin_weather_data.csv")
View(weather)

Encoding(weather$area) <- 'UTF-8'
Encoding(weather$city) <- 'UTF-8'
Encoding(weather$estimateArea) <- 'UTF-8'
weather$area
weather$city
weather$estimateArea


watermellon <- read_excel("F:/JJH/Desktop/watermellon2.xlsx")

dbWriteTable(db, "d",weather, append = TRUE, row.names = FALSE, fileEncoding="UTF-8")
weather
names(weather) <- c('year','area','city','avgTemp','highTemp','lowerTemp','rain','sunHour','sunAmount','humidity','cloud','snow','wind','estimateAtrea')

###################################
# 나중에 Outlier data를 제거해보자
################################################################################################################################################################
# Correlation test
################################################################################################################################################################

apple_result <- 'apple Correlation'
apple_result$temp <- cor.test(apple$AVG_PRICE,apple$AVG_TEMP)
apple_result$water <- cor.test(apple$AVG_PRICE,apple$AVG_WATER)
apple_result$sunset <-  cor.test(apple$AVG_PRICE,apple$AVG_SUNSET)
apple_result$humidity <- cor.test(apple$AVG_PRICE,apple$AVG_HUMIDITY)
apple_result$wind <- cor.test(apple$AVG_PRICE,apple$AVG_WIND)


pear_result <- 'pear correlation'
pear_result$temp <- cor.test(pear$AVG_PRICE, pear$AVG_TEMP)
pear_result$water <- cor.test(pear$AVG_PRICE, pear$AVG_WATER)
pear_result$sunset <- cor.test(pear$AVG_PRICE, pear$AVG_SUNSET)
pear_result$humidity <- cor.test(pear$AVG_PRICE, pear$AVG_HUMIDITY)
pear_result$wind <- cor.test(pear$AVG_PRICE, pear$AVG_WIND)


persimmon_result <- 'persimmon correlation'
persimmon_result$temp <- cor.test(persimmons$AVG_PRICE, persimmons$AVG_TEMP)
persimmon_result$water <- cor.test(persimmons$AVG_PRICE, persimmons$AVG_WATER)
persimmon_result$sunset <- cor.test(persimmons$AVG_PRICE, persimmons$AVG_SUNSET)
persimmon_result$humidity <- cor.test(persimmons$AVG_PRICE, persimmons$AVG_HUMIDITY)
persimmon_result$wind <- cor.test(persimmons$AVG_PRICE, persimmons$AVG_WIND)


watermellon_result <- 'watermellon correlation'
watermellon_result$temp <- cor.test(watermellon$AVG_PRICE, watermellon$AVG_TEMP)
watermellon_result$water <- cor.test(watermellon$AVG_PRICE, watermellon$AVG_WATER)
watermellon_result$sunset <- cor.test(watermellon$AVG_PRICE, watermellon$AVG_SUNSET)
watermellon_result$humidity <- cor.test(watermellon$AVG_PRICE, watermellon$AVG_HUMIDITY)
watermellon_result$wind <- cor.test(watermellon$AVG_PRICE, watermellon$AVG_WIND)
