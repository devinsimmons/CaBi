/* This query makes two separate tables which show the trips for the most popular day 
for members and the most popular day for casual users, respectively */

CREATE TABLE june_12_2018
AS 
SELECT *
FROM geo_bike_trips
WHERE date_trunc('day', start_date) = '2018-06-12 00:00:00';

CREATE TABLE june_16_2018
AS 
SELECT *
FROM geo_bike_trips
WHERE date_trunc('day', start_date) = '2018-06-16 00:00:00'
