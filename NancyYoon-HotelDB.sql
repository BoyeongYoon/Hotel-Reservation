DROP DATABASE IF EXISTS HotelReservation;
-- CREATE DATABASE HotelReservation;
CREATE DATABASE IF NOT EXISTS HotelReservation;
USE HotelReservation;

CREATE TABLE Amenity (
	AmenityID INT PRIMARY KEY AUTO_INCREMENT,
	Name CHAR(50) NOT NULL
);

CREATE TABLE RoomType (
	RoomTypeID INT PRIMARY KEY AUTO_INCREMENT,
    Type CHAR(10) NOT NULL,   
	StandardOccupancy INT NOT NULL,
	MaximumOccupancy INT NOT NULL,
    BasePrice DECIMAL(5, 2) NOT NULL,
    ExtraPersonPrice DECIMAL(4, 2) NULL
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

CREATE TABLE Guest (
	GuestID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(25),
    LastName VARCHAR(50),
    Address VARCHAR(100),
    City CHAR(25),
    State CHAR(5),
    Zip CHAR(10),
    Phone CHAR(20)
);

CREATE TABLE Reservation (
	ReservationID INT PRIMARY KEY,
    RoomNumber INT NOT NULL,
    FOREIGN KEY fk_Reservation_Room (RoomNumber)
		REFERENCES Room(RoomNumber),    
    GuestID INT NOT NULL,
    FOREIGN KEY fk_Reservation_Guest (GuestID)
		REFERENCES Guest(GuestID),      
    Adult INT NOT NULL,
    Children INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalRoomCost DECIMAL(20, 2)
);

