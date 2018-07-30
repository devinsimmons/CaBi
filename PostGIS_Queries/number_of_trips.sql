CREATE TABLE all_trip_frequencies
AS
SELECT start_station, end_station, member_type, trip_line, count(*) as number_of_trips
FROM geo_bike_trips
GROUP BY start_station, end_station, member_type, trip_line
ORDER BY number_of_trips desc
