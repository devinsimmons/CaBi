select 
	member_type,
	date_trunc('day', start_date) AS date_of_trip, 
	count(*) as number_of_trips
from geo_bike_trips
group by date_of_trip, member_type
order by number_of_trips desc
