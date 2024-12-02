--q1 write a query to return the email , first name , last name & genre of all rock music listeners.
-- return your list order alphabatically by email starting with A

SELECT DISTINCT email, first_name, last_name 
FROM customer 
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
      SELECT track_id FROM track 
      JOIN genre ON track.genre_id = genre.genre_id
	  WHERE genre.name LIKE 'Rock'
	  )
ORDER BY email;	  



--q2 lets invite the artist who have written the most rock music in our dataset 
--write a query that return thr artist and total track count of top 10 rock bands 

SELECT artist.artist_id, artist.name, COUNT (artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.album_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id 
ORDER BY number_of_songs DESC
LIMIT 10;


--Q3 return all the track namethat have a song length longer than the average song length longer than the average song of length
--return the name and milLiseconds of each track. order by song length which is listed first.

SELECT name, milliseconds 
FROM track 
WHERE milliseconds > (
    SELECT avg(milliseconds) AS avg_track_length
	from track)

ORDER BY milliseconds DESC;





