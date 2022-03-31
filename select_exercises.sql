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

SELECT release_date # The year Sgt. Pepper's Lonely Hearts Club Band was released
FROM albums 
where name = "Sgt. Pepper's Lonely Hearts Club Band";

# The genre for the album Nevermind

SELECT genre FROM albums WHERE name = 'Nevermind';

# Which albums were released in the 1990s

SELECT name AS '90s music' FROM albums WHERE release_date BETWEEN 1990 AND 1999;

# Which albums had less than 20 million certified sales

SELECT name AS 'Under 20 mil. sales' FROM albums WHERE sales <= 20;

# All the albums with a genre of "Rock". 

SELECT name AS 'Albums with Rock genre' from albums WHERE genre = 'Rock' || genre ='Hard Rock' || genre ='Progressive Rock';


# Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?





