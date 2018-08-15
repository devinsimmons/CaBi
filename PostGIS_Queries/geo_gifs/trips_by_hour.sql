/* this query makes a table where each hour of the month is represented for both 
member trips and casual trips*/

create table trips_by_hour
as
select 
	member_type,
	date_trunc('hour', start_date) AS hour_of_trip, 
	count(*) as number_of_trips
from geo_bike_trips
group by hour_of_trip, member_type
order by hour_of_trip asc
