USE HotelReservation;



-- #1 
-- Returns a list of reservations that end in July 2023, 
-- including the name of the guest, the room number(s), and the reservation dates.

SELECT * FROM Reservation;

SELECT CONCAT(FirstName, ' ', LastName) `Name`, RoomNumber Room, StartDate `From`, EndDate `To`
FROM  Reservation
INNER JOIN Guest ON Reservation.GuestID = Guest.GuestID
WHERE EndDate BETWEEN '2023-07-01' AND '2023-07-31';

/* #1
	Name			Room	From		To
1	Nancy Yoon		205	2023-06-28	2023-07-02
2	Walter Holaway		204	2023-07-13	2023-07-14
3	Wilfred Vise		401	2023-07-18	2023-07-21
4	Bettyann Seery		303	2023-07-28	2023-07-29
*/



-- #2
-- Returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.

SELECT CONCAT(FirstName, ' ', LastName) `Name`, Reservation.RoomNumber Room, StartDate `From`, EndDate `To`
FROM Reservation
JOIN Guest ON Reservation.GuestID = Guest.GuestID
JOIN Room ON Reservation.RoomNumber = Room.RoomNumber
JOIN RoomAmenity ON Room.RoomNumber = RoomAmenity.RoomNumber
WHERE AmenityID = 2;

/*
	Name			Room	From		To
1	'Karie Yang',		'201',	'2023-03-06',	'2023-03-07'
2	'Bettyann Seery',	'203',	'2023-02-05',	'2023-02-10'
3	'Karie Yang',		'203',	'2023-09-13',	'2023-09-15'
4	'Nancy Yoon',		'205',	'2023-06-28',	'2023-07-02'
5	'Wilfred Vise',		'207',	'2023-04-23',	'2023-04-24'
6	'Walter Holaway',	'301',	'2023-04-09',	'2023-04-13'
7	'Mack Simmer',		'301',	'2023-11-22',	'2023-11-25'
8	'Bettyann Seery',	'303',	'2023-07-28',	'2023-07-29'
9	'Duane Cullison',	'305',	'2023-02-22',	'2023-02-24'
10	'Bettyann Seery',	'305',	'2023-08-30',	'2023-09-01'
11	'Nancy Yoon',		'307',	'2023-03-17',	'2023-03-20'
*/



-- #3
-- Returns all the rooms reserved for a specific guest, 
-- including the guest's name, the room(s) reserved, the starting date of the reservation, 
-- and how many people were included in the reservation. 

SELECT CONCAT(FirstName, ' ', LastName) `Name`, RoomNumber Room, StartDate `From`, (Adult + Children) NumberOfPeople
FROM Reservation
JOIN Guest ON Reservation.GuestID = Guest.GuestID
WHERE FirstName = 'Mack' AND LastName = 'Simmer';

/*
	Name		Room	From		NumberOfPeople
1	'Mack Simmer',	'308',	'2023-02-02',	'1'
2	'Mack Simmer',	'208',	'2023-09-16',	'2'
3	'Mack Simmer',	'206',	'2023-11-22',	'2'
4	'Mack Simmer',	'301',	'2023-11-22',	'4'
*/



-- #4
-- Returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, 
-- whether or not there is a reservation associated with the room.

SELECT IFNULL(Reservation.RoomNumber, Room.RoomNumber) Room, ReservationID, CONCAT('$', FORMAT(TotalRoomCost, 2)) Cost
FROM Reservation
RIGHT JOIN Room ON Reservation.RoomNumber = Room.RoomNumber
JOIN RoomType ON Room.RoomTypeID = RoomType.RoomTypeID
ORDER BY Room.RoomNumber;

/*
	Room	ReservationID	Cost
1	'201',	'4',			'$199.99'
2	'202',	'7',			'$349.98'
3	'203',	'2',			'$999.95'
4	'203',	'21',			'$399.98'
5	'204',	'16',			'$184.99'
6	'205',	'15',			'$699.96'
7	'206',	'12',			'$599.96'
8	'206',	'23',			'$449.97'
9	'207',	'10',			'$174.99'
10	'208',	'13',			'$599.96'
11	'208',	'20',			'$149.99'
12	'301',	'9',			'$799.96'
13	'301',	'24',			'$599.97'
14	'302',	'6',			'$924.95'
15	'302',	'25',			'$699.96'
16	'303',	'18',			'$199.99'
17	'304',	'14',			'$184.99'
18	'305',	'3',			'$349.98'
19	'305',	'19',			'$349.98'
20	'306',	NULL,			NULL
21	'307',	'5',			'$524.97'
22	'308',	'1',			'$299.98'
23	'401',	'11',			'$1,199.97'
24	'401',	'17',			'$1,259.97'
25	'401',	'22',			'$1,199.97'
26	'402',	NULL,			NULL
*/



/* #5
Write a query that returns all the rooms accommodating at least 
three guests and that are reserved on any date in April 2023.

Expected Results: Write your response on why */

SELECT ReservationID, RoomNumber, (Adult + Children) NumberOfPeople, StartDate `From`, EndDate `To`
FROM Reservation
WHERE (Adult + Children) >= 3 AND EndDate BETWEEN '2023-04-01' AND '2023-04-30';

/*
0 result because there is no reservation with such conditions
*/



/* #6
Write a query that returns a list of all guest names and the 
number of reservations per guest, sorted starting with the guest 
with the most reservations and then by the guest's last name.

Expected Results 11 rows */

SELECT CONCAT(FirstName, ' ', LastName) `Name`, COUNT(ReservationID) NumberOfReservations
FROM Reservation
JOIN Guest ON Reservation.GuestID = Guest.GuestID
GROUP BY CONCAT(FirstName, ' ', LastName)
ORDER BY COUNT(ReservationID) DESC, CONCAT(FirstName, ' ', LastName);

/*
	Name					NumberOfReservations
1	'Mack Simmer',			'4'
2	'Bettyann Seery',		'3'
3	'Aurore Lipton',		'2'
4	'Duane Cullison',		'2'
5	'Joleen Tison',			'2'
6	'Karie Yang',			'2'
7	'Maritza Tilton',		'2'
8	'Nancy Yoon',			'2'
9	'Walter Holaway',		'2'
10	'Wilfred Vise',			'2'
11	'Zachery Luechtefeld',	'1'
*/



/* #7
Write a query that displays the name, address, and phone number of a 
guest based on their phone number. (Choose a phone number from the existing data.)

Expected Results 1 row */

SELECT CONCAT(FirstName, ' ', LastName) `Name`, CONCAT(Address, ', ', City, ', ', State, ' ', Zip) Address, Phone
FROM Guest
WHERE Phone = '(917) 123-4567';

/*
Name			Address								Phone
Nancy Yoon		2020 Broadway, New York, NY 10023	(917) 123-4567
*/
