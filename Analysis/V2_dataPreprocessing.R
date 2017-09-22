install.packages("data.table")
install.packages("readr")
library(RMySQL)
library(readxl)
library(data.table)

apple <- read.csv("F:/JJH/Desktop/apple.csv")
apple <- as.data.frame(apple)
apple <- data.table(apple)
names(apple)
names(apple) <- c('date','price','amount')
head(apple)
substr("2007-07-10",1,7)
aggregate(apple$amount, by=list(substr(apple$date,1,7)), FUN="sum")
apple$amount
apple$t <- as.table(apple)
db <- dbConnect(MySQL(),user="root",password='soo2080',dbname='pear', host='localhost')
head(watermelon)
names(watermelon) <- c('date','price','amount')
head(watermelon)
watermelon <- as.data.frame(watermelon)


persimmon <- as.data.frame(persimmon)
names(persimmon) <- c('date','price','amount')
persimmon

pear <- as.data.frame(pear)
names(pear) <- c('date','price','amount')
head(pear)

dbWriteTable(db,"pear",pear,overwrite=TRUE)
