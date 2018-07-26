#open cabi stations file, read contents to list
cabi_stations = open("Capital_Bike_Share_Locations.csv", "r")
cabi_stations_list = cabi_stations.readlines()
cabi_stations.close()

print cabi_stations_list[1] + cabi_stations_list[2]
#lists to contain the relevant info
station_numbers = []
station_lats = []
station_longs = []

#extracts relevant info from cabi stations list, appends
#each piece of info to its respective list
for i in cabi_stations_list:
    i = i.split(",")
    station_numbers.append(i[3])
    station_lats.append(i[4])
    station_longs.append(i[5])
    
#creates dictionaries where the key is the station number and the value
#is the station lat or long
lat_dict = dict(zip(station_numbers, station_lats))
lon_dict = dict(zip(station_numbers, station_longs))

#open cabi trips file, read contents to list
cabi_trips = open("June2018_capital_bikeshare_trips.csv", "r")
cabi_trips_list = cabi_trips.readlines()
cabi_trips.close()

#list that will contain the csv text
new_file = []


counter = 1
#loops through the trips list and adds geographic data for start and end
#points to each trip
for i in cabi_trips_list:
    i = i.split(",")
    i[8] = i[8][0:-1]
    if counter == 1:
        #adds new headers/columns to first row
        new_fields = ["start_lat", "start_lon", "end_lat", "end_lon"]
        for x in new_fields:
            i.append(x)
        counter += 1
        
        
    else:
        #finds the station numbers, then determines their coordinates
        #based on the earlier dictionaries
        start_station = i[3]
        end_station = i[5]
        start_lat = lat_dict[start_station]
        start_lon = lon_dict[start_station]
        end_lat = lat_dict[end_station]
        end_lon = lon_dict[end_station]
        #adds variables to list of row entries
        new_vars = [start_lat, start_lon, end_lat, end_lon]
        for x in new_vars:
            i.append(x)

    #turns list of row entries into a comma delimited string
    new_line = ",".join(i)
    #adds new string to the file
    new_file.append(new_line)

cabi_trips = open("June2018_cabi_trips_WGSS84.csv", "w")
#writes each list entry to the new file as a row
for i in new_file:
    cabi_trips.write(i + "\n")
cabi_trips.close()

    
