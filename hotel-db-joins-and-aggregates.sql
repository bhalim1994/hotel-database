--
-- Create sample tables
--
CREATE TABLE Hotel
(hotelNo         NUMBER(4)       NOT NULL
,hotelName       VARCHAR2(16)    NOT NULL
,hotelAddress    VARCHAR2(40)    NOT NULL
,country         VARCHAR2(20)    NOT NULL
,PRIMARY KEY (hotelNo)
);

CREATE TABLE Room
(hotelNo         NUMBER(4)       NOT NULL
,roomNo          NUMBER(4)       NOT NULL
,type            VARCHAR2(8)     NOT NULL
,price           NUMBER(6,2)     NOT NULL
,PRIMARY KEY (hotelNo, roomNo)
);

CREATE TABLE Guest
(guestNo         NUMBER(4)       NOT NULL
,guestName       VARCHAR2(15)    NOT NULL
,guestAddress    VARCHAR2(40)    NOT NULL
,country         VARCHAR2(20)    NOT NULL
,PRIMARY KEY (guestNo)
);

CREATE TABLE Booking
(hotelNo          NUMBER(4)      NOT NULL
,guestNo          NUMBER(4)      NOT NULL
,dateFrom         DATE           NOT NULL
,dateTo           DATE
,roomNo           NUMBER(4)      NOT NULL
,PRIMARY KEY (hotelNo, guestNo, dateFrom)
);
--
-- Insert Sample Data
--
INSERT INTO Hotel
  VALUES (1, 'Grosvenor Hotel', '100 Rue St. Dominique, Paris', 'France');
INSERT INTO Hotel
  VALUES (2, 'Holiday Hotel', '789 Paris St.,Surrey', 'Canada');
INSERT INTO Hotel
  VALUES (3, 'Holiday Inn', '56 Rue Bonaparte, Paris', 'France');
INSERT INTO Hotel
  VALUES (4, 'The Ramada', '22 Memorial Ave., New York', 'USA');
INSERT INTO Hotel
  VALUES (5, 'Imperial Palace', '777 Douglas Rd, North Surrey', 'Canada');
INSERT INTO Hotel
  VALUES (6, 'Park Royal Hotel', '88 Chestnut Dr, South Surrey', 'Canada');
INSERT INTO Hotel
  VALUES (7, 'Delta Inn', '900 Delta Street, Surrey', 'Canada');
INSERT INTO Hotel
  VALUES (8, 'Grosvenor Inn', '123 Surrey Street,  Surrey', 'Canada');
INSERT INTO Hotel
  VALUES (9, 'Royale Paris', '500 Avenue Montaigne, Paris', 'France');
INSERT INTO Hotel
  VALUES (10, 'Olympic Resort', '223 Olympic Street, Whistler', 'Canada');
INSERT INTO Hotel
  VALUES (11, 'Romantic Hotel', '223 Rue Cler, Paris', 'France');
--
INSERT INTO Room
  VALUES (1, 1, 'Single', 40);
INSERT INTO Room
  VALUES (1, 2, 'Single', 40);
INSERT INTO Room
  VALUES (1, 3, 'Single', 40);
INSERT INTO Room
  VALUES (1, 4, 'Single', 40);
INSERT INTO Room
  VALUES (1, 5, 'Double', 55);
INSERT INTO Room
  VALUES (1, 6, 'Double', 55);
INSERT INTO Room
  VALUES (1, 7, 'Double', 55);
INSERT INTO Room
  VALUES (1, 8, 'Double', 55);
INSERT INTO Room
  VALUES (1, 9, 'Family', 85);
INSERT INTO Room
  VALUES (1, 10, 'Family', 90);
INSERT INTO Room
  VALUES (1, 11, 'Deluxe', 110);
INSERT INTO Room
  VALUES (1, 12, 'Deluxe', 120);
INSERT INTO Room
  VALUES (1, 13, 'Deluxe', 120);
INSERT INTO Room
  VALUES (2, 1, 'Double', 80);
INSERT INTO Room
  VALUES (2, 2, 'Double', 80);
INSERT INTO Room
  VALUES (2, 3, 'Double', 80);
INSERT INTO Room
  VALUES (2, 4, 'Double', 80);
INSERT INTO Room
  VALUES (2, 5, 'Double', 80);
INSERT INTO Room
  VALUES (2, 6, 'Family', 90);
INSERT INTO Room
  VALUES (2, 7, 'Family', 90);
INSERT INTO Room
  VALUES (2, 8, 'Family', 90);
INSERT INTO Room
  VALUES (2, 9, 'Family', 90);
INSERT INTO Room
  VALUES (2, 10, 'Deluxe', 150);
INSERT INTO Room
  VALUES (2, 11, 'Deluxe', 150);
INSERT INTO Room
  VALUES (2, 12, 'Deluxe', 150);
INSERT INTO Room
  VALUES (3, 1, 'Single', 35);
INSERT INTO Room
  VALUES (3, 2, 'Single', 35);
INSERT INTO Room
  VALUES (3, 3, 'Single', 35);
INSERT INTO Room
  VALUES (3, 4, 'Single', 35);
INSERT INTO Room
  VALUES (3, 5, 'Single', 35);
INSERT INTO Room
  VALUES (3, 6, 'Single', 35);
INSERT INTO Room
  VALUES (3, 7, 'Single', 35);
INSERT INTO Room
  VALUES (3, 8, 'Single', 35);
INSERT INTO Room
  VALUES (3, 9, 'Double', 50);
INSERT INTO Room
  VALUES (3, 10, 'Double', 50);
INSERT INTO Room
  VALUES (3, 11, 'Double', 50);
INSERT INTO Room
  VALUES (3, 12, 'Double', 50);
INSERT INTO Room
  VALUES (3, 13, 'Double', 50);
INSERT INTO Room
  VALUES (3, 14, 'Double', 50);
INSERT INTO Room
  VALUES (4, 1, 'Double', 100);
INSERT INTO Room
  VALUES (4, 2, 'Double', 100);
INSERT INTO Room
  VALUES (4, 3, 'Double', 100);
INSERT INTO Room
  VALUES (4, 4, 'Double', 100);
INSERT INTO Room
  VALUES (4, 5, 'Double', 100);
INSERT INTO Room
  VALUES (4, 6, 'Double', 100);
INSERT INTO Room
  VALUES (4, 7, 'Family', 160);
INSERT INTO Room
  VALUES (4, 8, 'Family', 160);
INSERT INTO Room
  VALUES (4, 9, 'Family', 160);
INSERT INTO Room
  VALUES (4, 10, 'Family', 160);
INSERT INTO Room
  VALUES (4, 11, 'Family', 160);
INSERT INTO Room
  VALUES (4, 12, 'Deluxe', 240);
INSERT INTO Room
  VALUES (4, 13, 'Deluxe', 240);
INSERT INTO Room
  VALUES (4, 14, 'Deluxe', 240);
INSERT INTO Room
  VALUES (4, 15, 'Deluxe', 240);
INSERT INTO Room
  VALUES (4, 16, 'Deluxe', 240);
INSERT INTO Room
  VALUES (5, 1, 'Double', 80);
INSERT INTO Room
  VALUES (5, 2, 'Double', 80);
INSERT INTO Room
  VALUES (5, 3, 'Double', 80);
INSERT INTO Room
  VALUES (5, 4, 'Double', 80);
INSERT INTO Room
  VALUES (5, 5, 'Double', 80);
INSERT INTO Room
  VALUES (5, 6, 'Double', 80);
INSERT INTO Room
  VALUES (5, 7, 'Family', 120);
INSERT INTO Room
  VALUES (5, 8, 'Family', 120);
INSERT INTO Room
  VALUES (5, 9, 'Family', 120);
INSERT INTO Room
  VALUES (5, 10, 'Family', 120);
INSERT INTO Room
  VALUES (5, 11, 'Family', 120);
INSERT INTO Room
  VALUES (5, 12, 'Family', 120);
INSERT INTO Room
  VALUES (5, 13, 'Deluxe', 145);
INSERT INTO Room
  VALUES (5, 14, 'Deluxe', 145);
INSERT INTO Room
  VALUES (5, 15, 'Deluxe', 145);
INSERT INTO Room
  VALUES (5, 16, 'Deluxe', 145);
INSERT INTO Room
  VALUES (5, 17, 'Deluxe', 145);
INSERT INTO Room
  VALUES (5, 18, 'Deluxe', 145);
INSERT INTO Room
  VALUES (6, 1, 'Single', 48);
INSERT INTO Room
  VALUES (6, 2, 'Single', 48);
INSERT INTO Room
  VALUES (6, 3, 'Single', 48);
INSERT INTO Room
  VALUES (6, 4, 'Single', 48);
INSERT INTO Room
  VALUES (6, 5, 'Single', 48);
INSERT INTO Room
  VALUES (6, 6, 'Single', 48);
INSERT INTO Room
  VALUES (6, 7, 'Single', 48);
INSERT INTO Room
  VALUES (6, 8, 'Single', 48);
INSERT INTO Room
  VALUES (6, 9, 'Double', 86);
INSERT INTO Room
  VALUES (6, 10, 'Double', 86);
INSERT INTO Room
  VALUES (6, 11, 'Double', 86);
INSERT INTO Room
  VALUES (6, 12, 'Double', 86);
INSERT INTO Room
  VALUES (6, 13, 'Double', 86);
INSERT INTO Room
  VALUES (6, 14, 'Double', 86);
INSERT INTO Room
  VALUES (6, 15, 'Double', 86);
INSERT INTO Room
  VALUES (6, 16, 'Double', 86);
INSERT INTO Room
  VALUES (7, 1, 'Double', 75);
INSERT INTO Room
  VALUES (7, 2, 'Double', 75);
INSERT INTO Room
  VALUES (7, 3, 'Double', 75);
INSERT INTO Room
  VALUES (7, 4, 'Double', 75);
INSERT INTO Room
  VALUES (7, 5, 'Double', 75);
INSERT INTO Room
  VALUES (7, 6, 'Double', 75);
INSERT INTO Room
  VALUES (7, 7, 'Double', 75);
INSERT INTO Room
  VALUES (7, 8, 'Double', 75);
INSERT INTO Room
  VALUES (7, 9, 'Double', 75);
INSERT INTO Room
  VALUES (7, 10, 'Double', 75);
INSERT INTO Room
  VALUES (7, 11, 'Double', 75);
INSERT INTO Room
  VALUES (7, 12, 'Double', 75);
INSERT INTO Room
  VALUES (8, 1, 'Double', 95);
INSERT INTO Room
  VALUES (8, 2, 'Double', 95);
INSERT INTO Room
  VALUES (8, 3, 'Double', 95);
INSERT INTO Room
  VALUES (8, 4, 'Double', 95);
INSERT INTO Room
  VALUES (8, 5, 'Double', 95);
INSERT INTO Room
  VALUES (8, 6, 'Family', 125);
INSERT INTO Room
  VALUES (8, 7, 'Family', 125);
INSERT INTO Room
  VALUES (8, 8, 'Family', 125);
INSERT INTO Room
  VALUES (8, 9, 'Family', 125);
INSERT INTO Room
  VALUES (8, 10, 'Family', 125);
INSERT INTO Room
  VALUES (8, 11, 'Deluxe', 155);
INSERT INTO Room
  VALUES (8, 12, 'Deluxe', 155);
INSERT INTO Room
  VALUES (8, 13, 'Deluxe', 155);
INSERT INTO Room
  VALUES (8, 14, 'Deluxe', 155);
INSERT INTO Room
  VALUES (8, 15, 'Deluxe', 155);
INSERT INTO Room
  VALUES (8, 16, 'Single', 45);
INSERT INTO Room
  VALUES (8, 17, 'Single', 45);
INSERT INTO Room
  VALUES (8, 18, 'Single', 45);
INSERT INTO Room
  VALUES (8, 19, 'Single', 45);
INSERT INTO Room
  VALUES (8, 20, 'Single', 45);
--
INSERT INTO Guest
  VALUES (1, 'Tony Saunders', '2000 Queens Avenue, Winnipeg', 'Canada');
INSERT INTO Guest
  VALUES (2, 'Ed Cunningham', '30 Oak Street, Surrey', 'Canada');
INSERT INTO Guest
  VALUES (3, 'Dawn Smith', '25 Walton Drive, Banff', 'Canada');
INSERT INTO Guest
  VALUES (4, 'George Michaels', '30 Hampton Street, Paris', 'France');
INSERT INTO Guest
  VALUES (5, 'Rick Hamilton', '987 King Edward Road, Paris', 'France');
INSERT INTO Guest
  VALUES (6, 'Floyd Mann', '8 Wascana Crescent, Regina', 'Canada');
INSERT INTO Guest
  VALUES (7, 'Thomas Lee', '200 Main Street, Surrey', 'Canada');
INSERT INTO Guest
  VALUES (8, 'Sandy Alford', '234 Ontario Street, Montreal', 'Canada');
INSERT INTO Guest
  VALUES (9, 'Peter Kennedy', '20 Austin Drive, Paris', 'France');
INSERT INTO Guest
  VALUES (10, 'Gordon Ho', '5 No. 3 Road, Paris', 'France');
INSERT INTO Guest
  VALUES (11, 'Diana Darby', '50 Robson Street, Surrey', 'Canada');
INSERT INTO Guest
  VALUES (12, 'Sundeep Mohan', '1000 Victoria Avenue, Paris',  'France');
INSERT INTO Guest
  VALUES (13, 'Eileen Reynolds', '100 Willow Stree, Calgary', 'Canada');
INSERT INTO Guest
  VALUES (14, 'Ken Matsuda', '333 100th Avenue, Surrey', 'Canada');
INSERT INTO Guest
  VALUES (15, 'Ivan Pratt', '20 Lincoln Square, Paris', 'France');
--
INSERT INTO Booking
  VALUES (1, 5, DATE'2020-01-16', DATE'2020-01-24', 7);
INSERT INTO Booking
  VALUES (1, 9, DATE'2020-01-24', DATE'2020-02-04', 5);
INSERT INTO Booking
  VALUES (1, 9, DATE'2020-02-07', DATE'2020-02-14', 5);
INSERT INTO Booking
  VALUES (1, 9, DATE'2020-03-07', DATE'2020-03-14', 5);
INSERT INTO Booking
  VALUES (1, 10, DATE'2020-03-22', DATE'2020-03-30', 1);
INSERT INTO Booking
  VALUES (1, 11, DATE'2020-02-06', DATE'2020-02-22', 3);
INSERT INTO Booking
  VALUES (1, 12, DATE'2020-01-21', DATE'2020-02-24', 4);
INSERT INTO Booking
  VALUES (1, 13, DATE'2020-01-30', NULL, 7);
INSERT INTO Booking
  VALUES (1, 14, DATE'2020-01-25', DATE'2020-01-28', 2);
INSERT INTO Booking
  VALUES (1, 15, DATE'2020-01-22', DATE'2020-02-02', 3);
INSERT INTO Booking
  VALUES (2, 1, DATE'2020-01-21', DATE'2020-01-23', 9);
INSERT INTO Booking
  VALUES (2, 6, DATE'2020-01-21', NULL, 10);
INSERT INTO Booking
  VALUES (3, 2, DATE'2020-01-26', NULL, 3);
INSERT INTO Booking
  VALUES (3, 6, DATE'2020-03-05', DATE'2020-03-07', 12);
INSERT INTO Booking
  VALUES (4, 11, DATE'2020-01-27', DATE'2020-01-28', 14);
INSERT INTO Booking
  VALUES (4, 7, DATE'2020-02-09', DATE'2020-02-11', 4);
INSERT INTO Booking
  VALUES (4, 8, DATE'2020-03-10', DATE'2020-03-18', 7);
INSERT INTO Booking
  VALUES (5, 3, DATE'2020-02-06', DATE'2020-02-08', 17);
INSERT INTO Booking
  VALUES (5, 11, DATE'2020-02-06', NULL, 16);
INSERT INTO Booking
  VALUES (6, 1, DATE'2020-01-30', DATE'2020-02-02', 5);
INSERT INTO Booking
  VALUES (6, 14, DATE'2020-03-06', DATE'2020-03-08', 8);
INSERT INTO Booking
  VALUES (6, 9, DATE'2020-03-06', NULL, 4);
INSERT INTO Booking
  VALUES (7, 15, DATE'2020-02-28', DATE'2020-03-05', 1);
INSERT INTO Booking
  VALUES (7, 4, DATE'2020-02-02', DATE'2020-02-04', 2);
INSERT INTO Booking
  VALUES (8, 1, DATE'2020-02-03', DATE'2020-03-26', 15);
INSERT INTO Booking
  VALUES (8, 12, DATE'2020-02-01', DATE'2020-03-07', 20);
INSERT INTO Booking
  VALUES (8, 5, DATE'2020-01-19', DATE'2020-02-28', 1);
--
COMMIT;
--
-- For all hotels in city Paris in France, list hotel name, hotelAddress, room type 
-- and price of all Single, Double or Family rooms with a price below 100.00 per 
-- night, in descending order of hotelName, ascending order of price and descending 
-- order of type. List each result entry only once.
--
SELECT DISTINCT h.hotelName, h.hotelAddress, r.type, r.price 
	FROM Room r
		INNER JOIN Hotel h 
			ON r.hotelNo = h.hotelNo
	WHERE h.hotelAddress LIKE '%Paris%' 
	AND country = 'France'
	AND price < 100.00 
	AND type in ('Single', 'Double', 'Family') 
	ORDER BY hotelName DESC, price ASC, type DESC;
--
-- For hotels in city Surrey in Canada, list the bookings for which no dateTo has 
-- been specified. List the hotelName, hotelAddress, room number, dateFrom and 
-- dateTo. Note: Hotels in South Surrey and North Surrey should be excluded 
-- explicitly. Do not rely on specific sample data instances.
--
SELECT h.hotelName, h.hotelAddress, b.roomNo, b.dateFrom, b.dateTo
	FROM Booking b
		INNER JOIN Hotel h
			ON b.hotelNo = h.hotelNo
	WHERE h.hotelAddress LIKE '%Surrey%'
	AND h.country = 'Canada'
	AND h.hotelAddress NOT LIKE '%South Surrey%'
	AND h.hotelAddress NOT LIKE '%North Surrey%'
	AND b.dateTo IS NULL;
--
-- What is the average price of a room for each hotel? 
-- List it with the hotelName and in hotelName order.
--
SELECT h.hotelName, AVG(r.price) AS "Avg.Price"
   FROM Room r
      INNER JOIN Hotel h
         ON r.hotelNo = h.hotelNo
   GROUP BY h.hotelName
   ORDER BY h.hotelName ASC;
--
-- What is the average price of a room that is not Deluxe, for each hotel in each 
-- country? List it with the country and hotelName, and in country then hotelName 
-- order.
--
SELECT h.country, h.hotelName, AVG(r.price) AS "Avg.Price"
   FROM Room r
      INNER JOIN Hotel h
         ON r.hotelNo = h.hotelNo
   WHERE r.type<>'Deluxe'
   GROUP BY h.country, h.hotelName
   ORDER BY h.country ASC, h.hotelName ASC;
--
-- Do this for each hotel and in one single query. List the total revenue with the 
-- hotelName, and only if the total revenue is between $500 to $1000. 
-- List in hotelName order.
--
-- Note: We define revenue from rooms that have been 
-- booked since unbooked rooms do NOT create revenue.
--
SELECT h.hotelName, SUM(r.price) AS "Total Revenue"
	FROM Booking b
		INNER JOIN Hotel h 
			ON b.hotelNo = h.hotelNo
		INNER JOIN Room r 
			ON r.hotelNo = b.hotelNo 
			AND r.roomNo = b.roomNo
	HAVING SUM(r.price) BETWEEN 500 AND 1000
	GROUP BY h.hotelName
	ORDER BY h.hotelName ASC;
--
-- List the type and price of all rooms at the hotels with 'Grosvenor' in name, 
-- including the number of rooms for each possible combination of type and price. 
-- List only if the number of rooms for each type and price combination is greater 
-- than 3.
--
SELECT h.hotelName, r.price, r.type, COUNT(*) AS "Count"
   FROM Room r
      INNER JOIN Hotel h
         ON r.hotelNo = h.hotelNo
   WHERE h.hotelName LIKE '%Grosvenor%'
   GROUP BY h.hotelName, r.price, r.type
   HAVING COUNT(*) > 3;
--
-- Include also the roomNo in the output. Include all guest information in the 
-- output. Use 2020-01-21 as the current date.
--
SELECT g.guestNo, g.guestName, g.guestAddress, g.country, b.roomNo
   FROM Booking b
      INNER JOIN Hotel h
         ON b.hotelNo = h.hotelNo
      INNER JOIN Guest g
         ON b.guestNo = g.guestNo
   WHERE h.hotelName LIKE '%Grosvenor Hotel%'
   AND b.dateFrom <= DATE'2020-01-21'
   AND (b.dateTo IS NULL OR b.dateTo >= DATE'2020-01-21');
--
-- Do this question for each of the hotels with 'Grosvenor' in name. 
-- Use 2020-01-21 as the current date.
--
SELECT h.hotelName, SUM(r.price) AS "Total Income"
   FROM Room r
      INNER JOIN Booking b
         ON r.roomNo = b.roomNo
		 AND r.hotelNo = b.hotelNo
      INNER JOIN Hotel h
         ON r.hotelNo = h.hotelNo
   WHERE h.hotelName LIKE '%Grosvenor%'
   AND b.dateFrom <= DATE'2020-01-21'
   AND (b.dateTo IS NULL OR b.dateTo >= DATE'2020-01-21')
   GROUP BY h.hotelName;
--
-- What is the total income for each room type from bookings for each hotel 
-- (listing hotel names, not just hotelNo) today? Use 2020-01-21 as today's date. 
-- List in ascending order of hotel name and room type.
--
SELECT h.hotelNo, h.hotelName, r.type, SUM(r.price) AS "Total Income"
   FROM Booking b
      INNER JOIN Hotel h
         ON b.hotelNo = h.hotelNo
      INNER JOIN Room r
         ON r.hotelNo = b.hotelNo
		 AND r.roomNo = b.roomNo
   WHERE b.dateFrom <= DATE'2020-01-21'
   AND (b.dateTo IS NULL OR b.dateTo >= DATE'2020-01-21')
   GROUP BY h.hotelNo, h.hotelName, r.type
   ORDER BY h.hotelName ASC, r.type ASC;
--
-- List the new hotels that are still under construction, 
-- i.e. no room data in the Room table as yet for these hotels.
--
SELECT h.hotelNo, h.hotelName, h.hotelAddress
   FROM Hotel h
      LEFT OUTER JOIN Room r
         ON h.hotelNo = r.hotelNo
   GROUP BY h.hotelName, h.hotelNo, h.HotelAddress
   HAVING COUNT(*) = 1
   ORDER BY h.hotelNo ASC;
-- 
-- What is the percentage of hotels still under construction? List the total number 
-- of hotels, number of hotels completed, the number of hotels under construction, 
-- and the percentage of hotels under construction. (Note: NO SUBQUERY; use OUTER 
-- JOIN with aggregates.)
--
SELECT 
	COUNT(DISTINCT h.hotelNo)
		AS "Total Number"
	,COUNT(DISTINCT r.hotelNo)
		AS "Completed"
	,COUNT(DISTINCT h.hotelNo) - COUNT(DISTINCT r.hotelNo)
		AS "Under Construction"
	,(COUNT(DISTINCT h.hotelNo) - COUNT(DISTINCT r.hotelNo)) * 100 / COUNT(DISTINCT h.hotelNo)
		AS "Percent Under Construction"
	FROM Hotel h
		LEFT JOIN Room r 
			ON h.hotelNo = r.hotelNo;