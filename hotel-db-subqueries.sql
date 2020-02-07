-- Question 1 a.
SELECT AVG(r.price) AS "AVERAGE ROOM PRICE"
FROM   Hotel h
  JOIN Room r 
    ON h.hotelNo = r.hotelNo
WHERE  h.hotelAddress LIKE '%Paris%'
AND h.country = 'France'
;

--  Question 1 b.
SELECT AVG(r.price) AS "AVERAGE ROOM PRICE"
FROM   Room r
WHERE  r.hotelNo IN
  (SELECT h.hotelNo
   FROM   Hotel h
   WHERE  h.hotelAddress LIKE '%Paris%'
   AND h.country='France')
;

-- Question 2
SELECT h.hotelName, COUNT(DISTINCT b.guestNo) AS "NUMBER OF GUESTS"
FROM   Booking b
  JOIN Hotel h
    ON b.hotelNo = h.hotelNo
WHERE  (dateTo IS NULL OR dateTo >= DATE'2020-02-01') 
  AND  dateFrom < DATE'2020-03-01'
GROUP BY h.hotelName
ORDER BY h.hotelName
;

-- Question 3
SELECT r.hotelNo, r.roomNo, r.type, r.price, g.guestName
FROM   Room r 
  LEFT JOIN
    (SELECT b.hotelNo, b.roomNo, b.guestNo 
     FROM   Booking b
	 WHERE  dateFrom <= DATE'2020-02-05' 
	   AND  (dateTo IS NULL OR dateTo >= Date'2020-02-05')) b
    ON r.hotelNo = b.hotelNo
	  AND r.roomNo = b.roomNo
  LEFT JOIN Guest g
    ON b.guestNo = g.guestNo
WHERE  r.hotelNo IN
  (SELECT h.hotelNo
   FROM   Hotel h
   WHERE  h.hotelName LIKE '%Grosvenor%')
ORDER BY r.hotelNo, r.roomNo
;

-- Question 4
SELECT r.hotelNo, r.roomNo
FROM   Room r
WHERE (r.hotelNo, r.roomNo) NOT IN
    (SELECT b.hotelNo, b.roomNo
     FROM   Booking b
	 WHERE  dateFrom <= DATE'2020-02-05' 
	   AND  (dateTo IS NULL OR dateTo >= Date'2020-02-05'))
  AND  r.hotelNo IN
    (SELECT h.hotelNo
     FROM   Hotel h
     WHERE  h.hotelName LIKE '%Grosvenor%')
ORDER BY r.hotelNo, r.roomNo
;

-- Question 5
SELECT r.hotelNo, r.roomNo
FROM   Room r
WHERE NOT EXISTS
    (SELECT b.hotelNo, b.roomNo
     FROM   Booking b
	 WHERE  dateFrom <= DATE'2020-02-05' 
	   AND  (dateTo IS NULL OR dateTo >= Date'2020-02-05')
	   AND  r.hotelNo = b.hotelNo
	   AND  r.roomNo = b.roomNo)
  AND  r.hotelNo IN
    (SELECT h.hotelNo
     FROM   Hotel h
     WHERE  h.hotelName LIKE '%Grosvenor%')
ORDER BY r.hotelNo, r.roomNo
;

-- Question 6
SELECT r.hotelNo, r.roomNo
FROM   Room r
  LEFT JOIN
    (SELECT b.hotelNo, b.roomNo
     FROM   Booking b
	 WHERE  dateFrom <= DATE'2020-02-05' 
	   AND  (dateTo IS NULL OR dateTo >= Date'2020-02-05')) b
    ON r.hotelNo = b.hotelNo
	  AND r.roomNo = b.roomNo
WHERE  r.hotelNo IN
  (SELECT h.hotelNo
   FROM   Hotel h
   WHERE  h.hotelName LIKE '%Grosvenor%')
  AND  b.roomNo IS NULL
ORDER BY r.hotelNo, r.roomNo
;

-- Question 7
SELECT r.hotelNo, r.roomNo
FROM   Room r
WHERE  r.hotelNo IN
    (SELECT h.hotelNo
     FROM   Hotel h
     WHERE  h.hotelName LIKE '%Grosvenor%')
MINUS
SELECT b.hotelNo, b.roomNo
FROM   Booking b
WHERE  dateFrom <= DATE'2020-02-05' 
  AND  (dateTo IS NULL OR dateTo >= Date'2020-02-05')
ORDER BY hotelNo, roomNo
;

-- Question 8
SELECT h.hotelNo, h.hotelName, SUM(r.price) AS "Lost Income"
FROM   Hotel h 
  JOIN Room r
    ON h.hotelNo = r.hotelNo
WHERE  (h.hotelNo,r.roomNo) NOT IN
  (SELECT b.hotelNo, b.roomNo 
   FROM  Booking b
   WHERE dateFrom <= DATE'2020-02-05' 
     AND (dateTo IS NULL OR dateTo >= Date'2020-02-05'))
GROUP BY h.hotelNo, h.hotelName
ORDER BY h.hotelNo
;

-- Question 9
SELECT COUNT(*)/COUNT(DISTINCT b.hotelNo) AS "AVERAGE BOOKINGS"
FROM   Booking b
WHERE  (b.dateTo IS NULL OR b.dateTo >= DATE'2020-02-01') 
  AND  b.dateFrom < DATE'2020-03-01'
;

-- Question 10
CREATE OR REPLACE VIEW guestAccount
  AS
  SELECT r.roomNo AS Room
        ,g.guestName AS Name
		,b.dateFrom AS "CHECK-IN"
        ,Date'2020-02-05' AS "CHECK-OUT"
		,r.price AS Rate
	    ,(Date'2020-02-05' - b.dateFrom) AS "NUMBER OF DAYS"
	    ,r.price * (Date'2020-02-05' - b.dateFrom) AS "TOTAL"
  FROM   Room r
    JOIN Booking b
      ON r.hotelNo = b.hotelNo
	    AND r.roomNo = b.roomNo
    JOIN Guest g
      ON b.guestNo = g.guestNo
  WHERE  dateFrom <= DATE'2020-02-05' 
    AND  (dateTo IS NULL OR dateTo >= Date'2020-02-05')
	AND  r.hotelNo IN
      (SELECT h.hotelNo
       FROM   Hotel h
       WHERE  h.hotelName = 'Grosvenor Hotel')
;
SELECT *
FROM guestAccount
;

-- Question 11
SELECT g.guestName, g.guestAddress
FROM Guest g
WHERE g.guestNo IN
  (SELECT b.guestNo
   FROM   Booking b
   WHERE  b.hotelNo IN
     (SELECT h.hotelNo
      FROM   Hotel h
      WHERE  h.hotelName LIKE '%Grosvenor%'))
  AND g.guestNo IN
    (SELECT b.guestNo
     FROM   Booking b
     WHERE  b.hotelNo IN
       (SELECT h.hotelNo
        FROM   Hotel h
        WHERE  h.hotelName LIKE '%Park Royal Hotel%'))
  AND g.guestNo NOT IN
    (SELECT b.guestNo
     FROM   Booking b
     WHERE  b.hotelNo IN
       (SELECT h.hotelNo
        FROM   Hotel h
        WHERE  h.hotelName LIKE '%Holiday%'))   
;