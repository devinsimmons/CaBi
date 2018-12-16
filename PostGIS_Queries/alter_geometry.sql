/*Adds geometries to our table. One is the origin, one is the destination, and one is 
a line joining the two*/

UPDATE geo_bike_trips SET start_geom = ST_SetSRID(ST_MakePoint(start_lon, start_lat), 4326);
UPDATE geo_bike_trips SET end_geom = ST_SetSRID(ST_MakePoint(end_lon, end_lat), 4326);
UPDATE geo_bike_trips SET trip_line = ST_SetSRID(ST_MakeLine(start_geom, end_geom), 4326);

/* Calculates speed by determining the length of the trip line in the maryland state plane NAD83
coordinate system, which is most accurate for measurement at this location. Speed in in miles per hour */
UPDATE geo_bike_trips SET speed = ST_Length(ST_Transform(trip_line, 2248)) * 60 * 60 / (duration * 5280)