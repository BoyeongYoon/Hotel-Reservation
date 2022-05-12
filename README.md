![Screen Shot 2022-05-12 at 11 57 29 AM](https://user-images.githubusercontent.com/30683150/168118156-7c1cd9e1-400b-42b0-9e91-1a71beea02bf.png)  

<br>
<br>
<br>

1. [Overview](#overview)  
2. Hotel Data
   - Room
   - Guest
   - Reservation
3. ERD
4. Database
5. Data
6. Queries
   - Returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates  
   - Returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation  
   - Returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, 
and how many people were included in the reservation  
   - Returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room  
   - Returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023  
   - Returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name  
   - Displays the name, address, and phone number of a guest based on their phone number  
 
<br>
<br>
<br>
<br>
<br>
<br>
   

# Overview # {#overview}
Hotel Software Guild is a resort hotel on the West Arm of Lake Minnetonka. It is a relatively small hotel, with three floors of rooms. The top floor includes two large suites, and each of the other floors has eight standard-sized hotel rooms. The ground floor includes the customer service counter, a lounge area, a small exercise room, and a restaurant.

The hotel staff currently uses Excel spreadsheets to keep track of the rooms, guests, and reservations, and they have hired you to convert the existing data into a more flexible relational database.

You will build a database that satisfies at least second normal form (2NF) using the data provided here. While you are given the data itself, you are expected to identify the tables, fields, and relationships that will house this data.

# Hotel Data

## Rooms
Room details are listed below:

Rooms 201-204 and 301-304
Each of these rooms is a Double room with two queen beds and can sleep up to 4 people.
Each room includes a refrigerator or a microwave, but not both.

Rooms 205-208 and 305-308
Each of these rooms is a Single room with a single king bed and can sleep up to 2 people.
Each room includes both a microwave and a refrigerator.

Rooms 401 and 402
Each suite includes two separate bedrooms: one with two queen-sized beds and the other with one king-sized bed.
Each suite also includes a shared living room space with a sleeper sofa.
Each suite can sleep up to 8 people.
Each suite includes a full kitchen, with a refrigerator, an electric stove and oven, and a microwave oven.
Each suite is ADA accessible.

Base Room Prices
The base prices for the rooms are the following:
Double: $174.99/night for 2 adults, with an additional $10 for each additional adult per night.
Single: $149.99/night for 2 adults.
Suite: $399.99/night for 3 adults, with an additional $20 for each additional adult per night.
A jacuzzi adds $25 to the base price.

Additional Data
All even-numbered rooms on the second and third floor are ADA accessible.
All odd-numbered rooms on the second and third floor have a jacuzzi bath.
Children (under age 18) do not incur additional charges if there is at least one adult per room on the reservation.


## Room Data
The room data is as follows:

Room	Type	Amenities	ADA Accessible	Standard Occupancy	Maximum Occupancy	Base Price	Extra Person
201	Double	Microwave, Jacuzzi	No	2	4	$199.99	$10
202	Double	Refrigerator	Yes	2	4	$174.99	$10
203	Double	Microwave, Jacuzzi	No	2	4	$199.99	$10

## Guests
Guest information is collected only when a guest makes a reservation, so all guests have at least one reservation in the system. Guests who have made reservations include the following:

Name	Address	City	State	Zip	Phone
Your Name	Your Address	City	State	Zip	Phone
Mack Simmer	379 Old Shore Street	Council Bluffs	IA	51501	(291) 553-0508
Bettyann Seery	750 Wintergreen Dr.	Wasilla	AK	99654	(478) 277-9632
Duane Cullison	9662 Foxrun Lane	Harlingen	TX	78552	(308) 494-0198
Karie Yang	9378 W. Augusta Ave.	West Deptford	NJ	08096	(214) 730-0298
Aurore Lipton	762 Wild Rose Street	Saginaw	MI	48601	(377) 507-0974
Zachery Luechtefeld	7 Poplar Dr.	Arvada	CO	80003	(814) 485-2615
Jeremiah Pendergrass	70 Oakwood St.	Zion	IL	60099	(279) 491-0960
Walter Holaway	7556 Arrowhead St.	Cumberland	RI	02864	(446) 396-6785
Wilfred Vise	77 West Surrey Street	Oswego	NY	13126	(834) 727-1001
Maritza Tilton	939 Linda Rd.	Burke	VA	22015	(446) 351-6860
Joleen Tison	87 Queen St.	Drexel Hill	PA	19026	(231) 893-2755

## Reservations
The following reservations appear in the current reservation system:

Room Number	Name	Adults	Children	Start Date	End Date	Total Room Cost
308	Mack Simmer	1	0	2/2/2023	2/4/2023	$299.98
203	Bettyann Seery	2	1	2/5/2023	2/10/2023	$999.95
305	Duane Cullison	2	0	2/22/2023	2/24/2023	$349.98
201	Karie Yang	2	2	3/6/2023	3/7/2023	$199.99
307	Your Name	1	1	3/17/2023	3/20/2023	$524.97
302	Aurore Lipton	3	0	3/18/2023	3/23/2023	$924.95
202	Zachery Luechtefeld	2	2	3/29/2023	3/31/2023	$349.98
304	Jeremiah Pendergrass	2	0	3/31/2023	4/5/2023	$874.95
301	Walter Holaway	1	0	4/9/2023	4/13/2023	$799.96
207	Wilfred Vise	1	1	4/23/2023	4/24/2023	$174.99
401	Maritza Tilton	2	4	5/30/2023	6/2/2023	$1,199.97
206	Joleen Tison	2	0	6/10/2023	6/14/2023	$599.96
208	Joleen Tison	1	0	6/10/2023	6/14/2023	$599.96
304	Aurore Lipton	3	0	6/17/2023	6/18/2023	$184.99
205	Your Name	2	0	6/28/2023	7/2/2023	$699.96
204	Walter Holaway	3	1	7/13/2023	7/14/2023	$184.99
401	Wilfred Vise	4	2	7/18/2023	7/21/2023	$1,259.97
303	Bettyann Seery	2	1	7/28/2023	7/29/2023	$199.99
305	Bettyann Seery	1	0	8/30/2023	9/1/2023	$349.98
208	Mack Simmer	2	0	9/16/2023	9/17/2023	$149.99
203	Karie Yang	2	2	9/13/2023	9/15/2023	$399.98
401	Duane Cullison	2	2	11/22/2023	11/25/2023	$1,199.97
206	Mack Simmer	2	0	11/22/2023	11/25/2023	$449.97
301	Mack Simmer	2	2	11/22/2023	11/25/2023	$599.97
302	Maritza Tilton	2	0	12/24/2023	12/28/2023	$699.96

Comments:
In the database, a reservation can include multiple rooms reserved by the same guest and for the same dates. There are two examples in the table above.
Adults are guests whose age is 18 or older.
Children are guests under the age of 18.
Start date represents the first evening the guest will stay at the hotel.
End date represents the day the guest plans to check out.


# ERD

![ERD](https://github.com/BoyeongYoon/Hotel-Reservation-Schema/blob/main/NancyYoon-HotelERD-Ver.4.jpg)

<br>
<br>
<br>

# DB

[See the DB details](https://github.com/BoyeongYoon/Hotel-Reservation-Schema/blob/main/NancyYoon-HotelDB.sql)  

```
CREATE TABLE Amenity (
	AmenityID INT PRIMARY KEY AUTO_INCREMENT,
	Name CHAR(50) NOT NULL
);

CREATE TABLE Room (
	RoomNumber INT PRIMARY KEY,
    ADAAccessible BOOL NOT NULL,
    RoomTypeID INT NOT NULL,
    FOREIGN KEY fk_Room_RoomType (RoomTypeID)
		REFERENCES RoomType(RoomTypeID)    
);

CREATE TABLE RoomAmenity (
    RoomNumber INT NOT NULL,
	AmenityID INT NOT NULL,
    PRIMARY KEY pk_RoomAmenity (RoomNumber, AmenityID),
	FOREIGN KEY fk_ARoomAmenity_Room (RoomNumber)
		REFERENCES Room(RoomNumber),
    FOREIGN KEY fk_RoomAmenity_Amenity (AmenityID)
		REFERENCES Amenity(AmenityID)
);
```

<br>
<br>
<br>

# DATA

[See the DATA details](https://github.com/BoyeongYoon/Hotel-Reservation-Schema/blob/main/NancyYoon-HotelData.sql)  


```
INSERT INTO RoomAmenity (RoomNumber, AmenityID) VALUES 
	(201, 1), (201, 2), (203, 1), (203, 2), (301, 1), (301, 2), (303, 1), (303, 2),
    (202, 3), (204, 3), (302, 3), (304, 3), 
    (206, 1), (206, 3), (208, 1), (208, 3), (306, 1), (306, 3), (308, 1), (308, 3),
    (205, 1), (205, 2), (205, 3), (207, 1), (207, 2), (207, 3),
    (305, 1), (305, 2), (305, 3), (307, 1), (307, 2), (307, 3),
    (401, 1), (401, 3), (401, 4), (402, 1), (402, 3), (402, 4);
```

<br>
<br>
<br>

# QUERIES

**A query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.**  

```
SELECT CONCAT(FirstName, ' ', LastName) `Name`, COUNT(ReservationID) NumberOfReservations
FROM Reservation
JOIN Guest ON Reservation.GuestID = Guest.GuestID
GROUP BY CONCAT(FirstName, ' ', LastName)
ORDER BY COUNT(ReservationID) DESC, CONCAT(FirstName, ' ', LastName);
```
> 	Name				NumberOfReservations  
> 1	'Mack Simmer',			'4'  
> 2	'Bettyann Seery',		'3'  
> 3	'Aurore Lipton',		'2'  
> 4	'Duane Cullison',		'2'  
> 5	'Joleen Tison',			'2'  
> 6	'Karie Yang',			'2'  
> 7	'Maritza Tilton',		'2'  
> 8	'Nancy Yoon',			'2'  
> 9	'Walter Holaway',		'2'  


10	'Wilfred Vise',			'2'
11	'Zachery Luechtefeld',	'1'
