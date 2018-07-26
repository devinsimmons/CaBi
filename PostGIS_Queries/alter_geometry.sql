UPDATE geo_bike_trips SET start_geom = ST_SetSRID(ST_MakePoint(start_lon, start_lat), 4326);
UPDATE geo_bike_trips SET end_geom = ST_SetSRID(ST_MakePoint(end_lon, end_lat), 4326);
UPDATE geo_bike_trips SET trip_line = ST_SetSRID(ST_MakeLine(start_geom, end_geom), 4326);
