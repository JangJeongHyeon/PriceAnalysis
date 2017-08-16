#######################################
#    2017-08-10 Create By JohnMark    #
#######################################

##################################################### Processing [1] #########################################################

## CREATE TABLE daily_location_weather
## merge and calculate average of each weahter factor
CREATE TABLE daily_location_weather SELECT date, location, round(avg(avgTemper),1) as avgTemper, 
round(avg(rain),1) as rain, round(avg(sunHour),1) as sunHour, round(avg(sunAmount),1) as sunAmount, 
round(avg(humidity),1) as humidity, round(avg(cloud),1) as cloud, round(avg(snow),1) as snow, round(avg(wind),1) as wind 
FROM weather GROUP BY date, location;

## CREATE TABLE class_price
## merge and calcuate average price of each product class
CREATE TABLE class_price SELECT date, class, round(avg(price),0) AS price FROM price GROUP BY date, class ORDER BY date ASC;

##############################################################################################################################


##################################################### Processing [2] - Weather #########################################################
## Generate daily weather table
SELECT * FROM daily_location_weather;
CREATE TABLE daily_average_weather SELECT  date, round(avg(avgTemper),1) as avgTemper, 
		round(avg(rain),1) as rain, round(avg(sunHour),1) as sunHour, round(avg(sunAmount),1) as sunAmount, 
		round(avg(humidity),1) as humidity, round(avg(cloud),1) as cloud, round(avg(snow),1) as snow, round(avg(wind),1) as wind
FROM daily_location_weather GROUP BY date;


## convert weekly weather data
SELECT * FROM daily_average_weather ORDER BY date ASC;

## First
SELECT CONCAT(YEAR(date),'-',WEEK(date)), round(avg(avgTemper),1) as avgTemper, 
		round(avg(rain),1) as rain, round(avg(sunHour),1) as sunHour, round(avg(sunAmount),1) as sunAmount, 
		round(avg(humidity),1) as humidity, round(avg(cloud),1) as cloud, round(avg(snow),1) as snow, round(avg(wind),1) as wind
FROM daily_average_weather GROUP BY CONCAT(YEAR(date),'-',WEEK(date)) ORDER BY CONCAT(YEAR(date),'-',WEEK(date)) ASC;

## Second
SELECT 
	YEAR(date) AS YEAR, WEEK(date) AS WEEK, date, avgTemper, 
    rain, sunHour, sunAmount, humidity, cloud, snow, wind 
FROM daily_average_weather;

## Third
CREATE TABLE year_week_avg_weather SELECT 
	YEAR(date) AS YEAR, WEEK(date) AS WEEK, date, avgTemper, 
    rain, sunHour, sunAmount, humidity, cloud, snow, wind 
FROM daily_average_weather;
SELECT * FROM year_week_avg_weather;

## Forth
SELECT YEAR(date) as YEAR, WEEK(date) AS WEEK, round(avg(avgTemper),1) as avgTemper, 
		round(avg(rain),1) as rain, round(avg(sunHour),1) as sunHour, round(avg(sunAmount),1) as sunAmount, 
		round(avg(humidity),1) as humidity, round(avg(cloud),1) as cloud, round(avg(snow),1) as snow, round(avg(wind),1) as wind
FROM daily_average_weather GROUP BY YEAR(date), WEEK(date);

##############################################################################################################################################

##################################################### Processing [3] - price #################################################################
CREATE TABLE year_week_price SELECT YEAR(date), WEEK(date), class, price FROM price ORDER BY date ASC;
SELECT * FROM year_week_price;
CREATE TABLE year_week_avg_price SELECT date, week, class, ROUND(AVG(price),0) as price FROM year_week_price GROUP BY date, week, class;
SELECT * FROM year_week_avg_price;
##############################################################################################################################################

##################################################### Processing [3] - merge #################################################################
SELECT * FROM year_week_avg_weather;
SELECT * FROM year_week_avg_price;
SELECT 
     W.YEAR, W.WEEK, W.avgTemper, W.rain, W.sunHour, W.sunAmount, 
     W.humidity, W.cloud, W.snow, W.wind, P.price
FROM year_week_avg_weather AS W
	INNER JOIN year_week_avg_price AS P
		ON W.YEAR = P.
##############################################################################################################################################
