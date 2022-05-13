![Screen Shot 2022-05-12 at 11 57 29 AM](https://user-images.githubusercontent.com/30683150/168118156-7c1cd9e1-400b-42b0-9e91-1a71beea02bf.png)   

<br>
<br>
<br>
<br>
<br>
<br>

# Hotel Reservation Schema

🔧 Requirement: The **MySQL** database server and client (eg.**MySQLWorkbench**)  

<br>
<br>
<br>

1. [Overview](#overview)  
2. [Entity Relationship Diagram (ERD)](https://github.com/BoyeongYoon/Hotel-Reservation-Schema/blob/main/NancyYoon-HotelERD-Ver.4.jpg)  
3. [Database](https://github.com/BoyeongYoon/Hotel-Reservation-Schema/blob/main/NancyYoon-HotelDB.sql)  
4. [Data](https://github.com/BoyeongYoon/Hotel-Reservation-Schema/blob/main/NancyYoon-HotelData.sql)  
5. [Queries](https://github.com/BoyeongYoon/Hotel-Reservation-Schema/blob/main/NancyYoon-HotelQueries.sql)  
   - Displays the name, address, and phone number of a guest based on their phone number.
   - Returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.  
   - Returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.  
   - Returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation.  
   - Returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.  
   - Returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.  
   - Returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.  
6. [Hotel Data](#hotel-data) ✨ Copyright (c) mThree and TheSoftwareGuild  
   - [Room](#room)
   - [Guest](#guest)
   - [Reservation](#reservation)

<br>
<br>
<br>
<br>
<br>
<br>
   

## Overview
Hotel Software Guild is a resort hotel on the West Arm of Lake Minnetonka. It is a relatively small hotel, with three floors of rooms. The top floor includes two large suites, and each of the other floors has eight standard-sized hotel rooms. The ground floor includes the customer service counter, a lounge area, a small exercise room, and a restaurant.

The hotel staff currently uses Excel spreadsheets to keep track of the rooms, guests, and reservations, and they have hired you to convert the existing data into a more flexible relational database.

You will build a database that satisfies at least second normal form (2NF) using the data provided here. While you are given the data itself, you are expected to identify the tables, fields, and relationships that will house this data.

<br>
<br>
<br>
<br>
<br>
<br>

## Hotel Data

### Room
Room details are listed below:

**Rooms 201-204 and 301-304**  
- Each of these rooms is a Double room with two queen beds and can sleep up to 4 people.  
- Each room includes a refrigerator or a microwave, but not both.  

<br>

**Rooms 205-208 and 305-308**  
- Each of these rooms is a Single room with a single king bed and can sleep up to 2 people.
- Each room includes both a microwave and a refrigerator.

<br>

**Rooms 401 and 402**  
- Each suite includes two separate bedrooms: one with two queen-sized beds and the other with one king-sized bed.
- Each suite also includes a shared living room space with a sleeper sofa.
- Each suite can sleep up to 8 people.
- Each suite includes a full kitchen, with a refrigerator, an electric stove and oven, and a microwave oven.
- Each suite is ADA accessible.

<br>

**Base Room Prices**  
The base prices for the rooms are the following:
- Double: $174.99/night for 2 adults, with an additional $10 for each additional adult per night.
- Single: $149.99/night for 2 adults.
- Suite: $399.99/night for 3 adults, with an additional $20 for each additional adult per night.
- A jacuzzi adds $25 to the base price.

<br>

**Additional Data**  
- All even-numbered rooms on the second and third floor are ADA accessible.
- All odd-numbered rooms on the second and third floor have a jacuzzi bath.
- Children (under age 18) do not incur additional charges if there is at least one adult per room on the reservation.

<br>
<br>
<br>

### Room Data
The room data is as follows:  

![Screen Shot 2022-05-12 at 12 41 35 PM](https://user-images.githubusercontent.com/30683150/168126424-0db420c5-b9f8-41a2-86ae-b809239fbb96.png)  

<br>
<br>
<br>

### Guest
Guest information is collected only when a guest makes a reservation, so all guests have at least one reservation in the system. Guests who have made reservations include the following:  

![Screen Shot 2022-05-12 at 12 42 16 PM](https://user-images.githubusercontent.com/30683150/168126169-0f642ac5-42ca-4985-957c-cd13ec048723.png)  

<br>
<br>
<br>

### Reservation
The following reservations appear in the current reservation system:  

![Screen Shot 2022-05-12 at 12 42 49 PM](https://user-images.githubusercontent.com/30683150/168126252-9a864580-5e93-47db-a106-e5488f1812bb.png)  

<br>
<br>
<br>

**Comments:**  
- In the database, a reservation can include multiple rooms reserved by the same guest and for the same dates. There are two examples in the table above. 
- Adults are guests whose age is 18 or older.  
- Children are guests under the age of 18.  
- Start date represents the first evening the guest will stay at the hotel.  
- End date represents the day the guest plans to check out.  

