USE albums_db; #Use the albums_db database.

DESCRIBE albums; # How many rows are in the albums table?

SELECT COUNT(DISTINCT(artist)) # How many unique artist names are in the albums table?

FROM albums;

SHOW INDEX FROM albums WHERE Key_name = 'PRIMARY'; # What is the primary key for the albums table?

SELECT release_date;

SELECT * FROM albums;

SELECT min(release_date) FROM albums; # What is the oldest release date for any album in the albums table? 

SELECT max(release_date) FROM albums; # What is the most recent release date?

## 4. Write queries to find the following information:

SELECT * FROM albums where artist = 'Pink Floyd';  # The name of all albums by Pink Floyd

# The year Sgt. Pepper's Lonely Hearts Club Band was released

SELECT * FROM albums where artist = 'Pink Floyd'; 

SELECT release_date 
FROM albums 
where name = "Sgt. Pepper's Lonely Hearts Club Band"
