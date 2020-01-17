ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';

SELECT SYSDATE
FROM DUAL;

-- Delete tables
DROP TABLE Booking;
DROP TABLE Guest;
DROP TABLE Room;
DROP TABLE Hotel;
DROP TABLE OldBooking;

-- Create tables
CREATE TABLE Hotel
(hotelNo	CHAR(4)			NOT NULL
,hotelName	VARCHAR2(30)	NOT NULL
,city		VARCHAR2(30)	NOT NULL
,CONSTRAINT PKHotel PRIMARY KEY (hotelNo)
);

CREATE TABLE Room
(roomNo		SMALLINT		NOT NULL
,hotelNo	CHAR(4)			NOT NULL
,roomType	VARCHAR2(10)	NOT NULL
,roomPrice	DECIMAL(4,2)	NOT NULL
,CONSTRAINT PKRoom       PRIMARY KEY (roomNo, hotelNo)
,CONSTRAINT FKHotelNo    FOREIGN KEY (hotelNo) REFERENCES Hotel (hotelNo)
,CONSTRAINT CHKRoomNo    CHECK(roomNo BETWEEN 1 AND 100)
,CONSTRAINT CHKRoomType  CHECK(roomType IN ('Single', 'Double', 'Family'))
,CONSTRAINT CHKRoomPrice CHECK(roomPrice BETWEEN 10.00 AND 100.00)
);

CREATE TABLE Guest
(guestNo		CHAR(8)			NOT NULL
,guestName		VARCHAR2(30)	NOT NULL
,guestAddress	VARCHAR2(50)	NOT NULL
,CONSTRAINT PKGuest PRIMARY KEY (guestNo)
);

CREATE TABLE Booking
(hotelNo	CHAR(4) NOT NULL
,guestNo	CHAR(8)			NOT NULL
,dateFrom	DATE			NOT NULL
,dateTo		DATE			NOT NULL
,roomNo		SMALLINT		NOT NULL
,CONSTRAINT PKBooking 		PRIMARY KEY (hotelNo, guestNo, dateFrom)
,CONSTRAINT FKRoom 			FOREIGN KEY (hotelNo, roomNo) REFERENCES Room (hotelNo, roomNo)
,CONSTRAINT FKguestNo 		FOREIGN KEY (guestNo) REFERENCES Guest (guestNo)
,CONSTRAINT CHKRoomNoBook 	CHECK(roomNo BETWEEN 1 AND 100)
);

-- Create dummy data
INSERT INTO Hotel
   VALUES('H001', 'Dunder Mifflin', 'Scranton');
INSERT INTO Hotel
   VALUES('H002', 'The Lookout', 'Victoria');
INSERT INTO Hotel
   VALUES('H003', 'Early Riser', 'Frederickton');
INSERT INTO Room
   VALUES(27, 'H001', 'Double', 20.10);
INSERT INTO Room
   VALUES(12, 'H002', 'Single', 13.13);
INSERT INTO Room
   VALUES(19, 'H001', 'Family', 59.99);
INSERT INTO Guest
   VALUES('G0000001', 'Hex White', '1234 White Avenue');
INSERT INTO Guest
   VALUES('G0000002', 'Michael Scott', '31-4459 Datemike Boulevard');
INSERT INTO Guest
   VALUES('G0000123', 'Turanga Leela', '1BDI Mutant Street');
INSERT INTO Booking
   VALUES('H001', 'G0000001', DATE'2019-01-23', DATE'2019-01-31', 27);
INSERT INTO Booking
   VALUES('H002', 'G0000001', DATE'2020-01-01', DATE'2020-01-02', 12);
INSERT INTO Booking
   VALUES('H001', 'G0000123', DATE'2001-01-01', DATE'2001-01-11', 19);

-- Add a Deluxe option to the type of rooms available
ALTER TABLE Room
   DROP CONSTRAINT CHKRoomType;
ALTER TABLE Room
   ADD CONSTRAINT CHKRoomType CHECK (roomType IN ('Single', 'Double', 'Family', 'Deluxe'));

-- Add a discount column to Room that can be between 0 and 30%
ALTER TABLE Room
   ADD 
   discount DECIMAL(1,2) DEFAULT(0.00) 
   CONSTRAINT CHKDiscount CHECK (discount BETWEEN 0.00 AND 0.30);

-- Increase the price of the Double rooms by 15%
UPDATE Room
   SET roomPrice = roomPrice * 1.15
   WHERE roomType = 'Double' AND hotelNo = 'H001';

-- Change a booking check-in and check-out time for G0000001 in H001
UPDATE Booking
   SET dateFrom = DATE'2019-01-19'
   , dateTo = DATE'2019-02-01'
   WHERE guestNo = 'G0000001' AND hotelNo = 'H001' AND dateFrom = DATE'2019-01-23';

-- Create old booking table
CREATE TABLE OldBooking
(hotelNo	CHAR(4)			NOT NULL
,guestNo	CHAR(8)			NOT NULL
,dateFrom	DATE			NOT NULL
,dateTo		DATE			NOT NULL
,roomNo		SMALLINT		NOT NULL
,CONSTRAINT PKOldBooking PRIMARY KEY (hotelNo, guestNo, dateFrom)
);

-- Insert rows from the Booking table into the OldBooking table where the date is before 2019-12-31
INSERT INTO OldBooking
   SELECT * 
   FROM Booking
   WHERE dateTo < DATE'2019-12-31';
   
-- Delete all the rows in the Booking table where the date is before 2019-12-31
DELETE
   FROM Booking
   WHERE dateTo < DATE'2019-12-31';