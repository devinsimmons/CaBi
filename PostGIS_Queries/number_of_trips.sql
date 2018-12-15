/* This statement queries the main table. It groups the trips based on their origin and destination,
as well as the member type. It then adds a column showing how many trips are in the group */

CREATE TABLE all_trip_frequencies
AS
SELECT start_station, end_station, trip_line, member_type, count(*) as number_of_trips
FROM geo_bike_trips
GROUP BY start_station, end_station, trip_line, member_type
ORDER BY number_of_trips desc
