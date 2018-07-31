/* This query determines the number of trips that happened each day for members and casual riders. For my geogifs, 
I decided to use the most popular day for members (June 12th from my dataset) and the most popular day for casual users
(June 16th) */

select 
	member_type,
	date_trunc('day', start_date) AS date_of_trip, 
	count(*) as number_of_trips
from geo_bike_trips
group by date_of_trip, member_type
order by number_of_trips desc
