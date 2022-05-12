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
