/*
this query determines the bike that was taken for the most trips, then makes a table of all the trips it took
I named the table after the bike that had the most trips
*/

create table bike_w23453 
as
select start_date, end_date, start_station, end_station, member_type, round(speed, 1) as mph_speed, round(distance, 2) as miles_distance, trip_line 
from geo_bike_trips
where bike_number = (select bike_number from(select bike_number, count(*) as trips
from geo_bike_trips
group by bike_number
order by trips desc) as top_trips
limit 1)
order by start_date asc