# ERD

![ERD](https://github.com/BoyeongYoon/Hotel-Reservation-Schema/blob/main/NancyYoon-HotelERD-Ver.4.jpg)

<br>
<br>
<br>

# DB

[See DB details](https://github.com/BoyeongYoon/Hotel-Reservation-Schema/blob/main/NancyYoon-HotelDB.sql)  

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

<br>
<br>
<br>

# QUERIES
