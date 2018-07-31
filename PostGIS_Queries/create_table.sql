/*Query that creates the table to hold trip data. This query should be executed
and then the file created with the python script (found in the data folder) 
should be loaded into the table*/

CREATE TABLE public.geo_bike_trips
(
    duration numeric,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    start_station_number numeric,
    start_station character varying(100) COLLATE pg_catalog."default",
    end_station_number numeric,
    end_station character varying(100) COLLATE pg_catalog."default",
    bike_number character varying(100) COLLATE pg_catalog."default",
    member_type character varying(100) COLLATE pg_catalog."default",
    start_lat numeric,
    start_lon numeric,
    end_lat numeric,
    end_lon numeric,
    start_geom geometry(Point,4326),
    end_geom geometry(Point,4326),
    trip_line geometry(LineString,4326)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.geo_bike_trips
    OWNER to postgres;
