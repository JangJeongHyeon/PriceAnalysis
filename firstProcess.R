# package install and load
install.packages("Rcpp")
install.packages("readr")
install.packages("reader")
install.packages("RMySQL")
library(Rcpp)
library(readr)
library(reader)
library(RMySQL)

#Configuration value of database connect object 
dbInfo <- "Mysql"
dbInfo$user <- "root"
dbInfo$password <- "soo2080"
dbInfo$host <- "localhost"
dbInfo$dbname <- "pear"


# Connect to local database and character encoding setting
db <- dbConnect(MySQL(), user = dbInfo$user, password = dbInfo$password, dbname = dbInfo$dbname, host = dbInfo$host)
dbSendQuery(db, "SET NAMES utf8")

# Check list tables of exist on db
dbListTables(db)

# Import dataSet(.csv file)
clean_pear_price <- read_csv("F:/JJH/DevProject/R/DA_price/dataSet/clean_pear_price.csv")
View(clean_pear_price)
clean_weather_data <- read_csv("F:/JJH/DevProject/R/DA_price/dataSet/clean_weather_data.csv")
View(clean_weather_data)
origin_auction_pear_price <- read_csv("F:/JJH/DevProject/R/DA_price/dataSet/origin_auction_pear_price.csv")
View(origin_auction_pear_price)
origin_wholesale_pear_price <- read_csv("F:/JJH/DevProject/R/DA_price/dataSet/origin_wholesale_pear_price.csv")
View(origin_wholesale_pear_price)

# Encoding of characterset
Encoding(clean_weather_data$location) <- "UTF-8"

# Save imported data to database
#dbWriteTable(db,"price",clean_pear_price)
#dbWriteTable(db,"weather",clean_weather_data)
dbWriteTable(db, "wholesale_price", origin_wholesale_pear_price)
dbWriteTable(db, "auction_price", origin_auction_pear_price)

##### get data from mysql database

# preprocessing Price data
price <- dbSendQuery(db, "SELECT date, price FROM price")
price <- fetch(price)
rs <- dbSendQuery(db, "SELECT date, class, round(avg(price),0) AS price FROM price GROUP BY date, class ORDER BY date ASC")
price$class <- fetch(rs)
View(price$class)


weather <- dbSendQuery(db, "SELECT date, location, avgTemper, rain, sunHour, sunAmount, humidity, cloud, snow, wind FROM weather")
weather <- fetch(weather)
Encoding(weather$location) <- "UTF-8"
rs <- dbSendQuery(db,"SELECT * FROM daily_location_weather") 
weather$daily <- fetch(rs)
Encoding(weather$daily$location) <- "UTF-8"
View(weather$daily)
