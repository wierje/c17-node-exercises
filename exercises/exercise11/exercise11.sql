/*Open up the database file in the DB Browser for SQLite application to see it
Copy and paste the queries below into your queries.sql file and comment them out. Then you can write a query for each requrement and refer back to them later as a resource
When you have written a query, paste it into DB Browser and test it by clicking the tab labeled "Execute SQL"
For each of the following exercises, provide the appropriate query. Everything from class and the Sqlite documentation for SQL keywords and functions is fair game. Note that*/

-- 1 Query all of the entries in the Genre table
SELECT * FROM genre

-- 2 Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO artist VALUES(null, 'Judie Tzuke', 1978)

-- 3 Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO ALBUM VALUES(null, 'Welcome To The Cruise', '1979', 2432, 'Rocket',
(SELECT  ARTISTID FROM ARTIST WHERE ARTISTNAME = 'Judie Tzuke'),
(SELECT GENREID FROM GENRE WHERE LABEL = 'Rock'))

INSERT INTO ALBUM VALUES(null, 'Turning Stones', '1989', 2864, 'Polydor',
(SELECT  ARTISTID FROM ARTIST WHERE ARTISTNAME = 'Judie Tzuke'),
(SELECT GENREID FROM GENRE WHERE LABEL = 'Rock'))

-- 4 Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO SONG VALUES(null,
 ""Welcome To The Cruise"",
 285,
 '1989', 
(SELECT GENREID FROM GENRE WHERE LABEL = 'Rock'),
(SELECT  ARTISTID FROM ARTIST WHERE ARTISTNAME = 'Judie Tzuke'),
(SELECT  ALBUMID FROM ALBUM WHERE TITLE = 'Turning Stones'))
/* 5 Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. Here is some more info on joins that might help.

--Reminder: Direction of join matters. Try the following statements and see the difference in results.
--SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
--SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;*/

SELECT s.title, a.title
FROM album a
LEFT JOIN song s
ON s.albumid = a.albumid


-- 6 Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT song.albumid,
 COUNT (songid) AS Songs FROM song
GROUP BY albumid

-- 7 Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT (song.artistid) AS Artist, 
COUNT (songid) AS Songs  FROM song
GROUP BY artistid

-- 8 Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT (genre.label) AS Genre,
COUNT (title) AS Title FROM song
GROUP BY genreid
-- 9  Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT title, MAX(albumlength)
FROM album

-- 10 Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT song.songid, MAX(songlength)
FROM song
JOIN album
ON song.albumid = album.albumid

-- 11 Modify the previous query to also display the title of the album.

SELECT album.title, MAX(songlength)
FROM song
JOIN album
ON song.albumid = album.albumid