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