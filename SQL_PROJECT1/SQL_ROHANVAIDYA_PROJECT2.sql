/* =========================================================
Name   : ROHAN NAMDEO VAIDYA
Batch  : DA NOV 2025
Project: Hotel Management System
========================================================= */

/* Question - 1] The accounts team wants to check payments made via UPI to measure digital adoption. */
SELECT * FROM Payments WHERE PaymentMethod = 'UPI';

/* Question - 2] List all unique first names of customers for a duplicate check. */
SELECT DISTINCT FirstName FROM Customers;

/* Question - 3] Delete all rooms with Capacity = 1. */
DELETE FROM Rooms WHERE Capacity = 1;

/* Question - 4] Display each customer’s name and phone number together using CONCAT. */
SELECT CONCAT(FirstName, ' ', LastName, ' - ', Phone) AS CustomerContact
FROM Customers;

/* Question - 5] The booking office wants to see bookings where RoomID = 10 to check utilization of a specific room. */
SELECT * FROM Bookings WHERE RoomID = 10;

/* Question - 6] Identify rooms whose Capacity is greater than the average Capacity of all rooms. */
SELECT * FROM Rooms
WHERE Capacity > (SELECT AVG(Capacity) FROM Rooms);

/* Question - 7] Create a VIEW StaffContact showing Staff FirstName, LastName, Role, and Phone. */
CREATE VIEW StaffContact AS
SELECT FirstName, LastName, Role, Phone FROM Staff;

/* Question - 8] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. */
SELECT * FROM Rooms
WHERE RoomType = 'Suite' AND PricePerNight < 7000;

/* Question - 9] The admin wants to see email addresses sorted by LastName from the Customers table. */
SELECT Email FROM Customers ORDER BY LastName;

/* Question - 10] Show staff full names combined into one column. */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Staff;

/* Question - 11] Display all payment details in one line using CONCAT_WS. */
SELECT CONCAT_WS(' | ', PaymentID, PaymentMethod, Amount, PaymentDate)
FROM Payments;

/* Question - 12] The hotel wants to display the 2 most expensive rooms for VIP guests. */
SELECT * FROM Rooms
ORDER BY PricePerNight DESC
LIMIT 2;

/* Question - 13] Show each BookingID with its CheckIn and CheckOut dates combined. */
SELECT CONCAT(BookingID, ' : ', CheckInDate, ' to ', CheckOutDate) AS BookingDuration
FROM Bookings;

/* Question - 14] Finance wants to calculate the average Amount per PaymentMethod. */
SELECT PaymentMethod, AVG(Amount) AS AvgAmount
FROM Payments
GROUP BY PaymentMethod;

/* Question - 15] The analytics team wants to find the city where average CustomerID is greater than 50. */
SELECT City
FROM Customers
GROUP BY City
HAVING AVG(CustomerID) > 50;

/* Question - 16] Find bookings where TotalAmount exceeds the average TotalAmount. */
SELECT * FROM Bookings
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Bookings);

/* Question - 17] Display the last 2 added rooms from the Rooms table. */
SELECT * FROM Rooms
ORDER BY RoomID DESC
LIMIT 2;

/* Question - 18] The cashier wants a report of payments where Amount < ₹1500 for small transactions. */
SELECT * FROM Payments WHERE Amount < 1500;

/* Question - 19] Management wants to list all customers who have made more than 5 bookings. */
SELECT CustomerID
FROM Bookings
GROUP BY CustomerID
HAVING COUNT(*) > 5;

/* Question - 20] Identify customers who live in the same city. */
SELECT c1.CustomerID, c1.FirstName, c1.City
FROM Customers c1
JOIN Customers c2
ON c1.City = c2.City AND c1.CustomerID <> c2.CustomerID;

/* Question - 21] Show the total revenue handled by each StaffID. */
SELECT StaffID, SUM(TotalAmount) AS TotalRevenue
FROM Bookings
GROUP BY StaffID;

/* Question - 22] The manager wants to see all customers from Mumbai. */
SELECT * FROM Customers WHERE City = 'Mumbai';

/* Question - 23] Display the 3 lowest booking amounts. */
SELECT * FROM Bookings
ORDER BY TotalAmount ASC
LIMIT 3;

/* Question - 24] Insert 5 new room records with type, price, and capacity. */
INSERT INTO Rooms (RoomType, PricePerNight, Capacity) VALUES
('Single', 2000, 1),
('Double', 3500, 2),
('Suite', 6500, 3),
('Family', 5000, 4),
('Deluxe', 4500, 2);

/* Question - 25] Show all unique CustomerIDs from bookings. */
SELECT DISTINCT CustomerID FROM Bookings;

/* Question - 26] Create a trigger to automatically delete a payment when its corresponding booking is deleted. */
CREATE TRIGGER delete_payment_after_booking_delete
AFTER DELETE ON Bookings
FOR EACH ROW
DELETE FROM Payments WHERE BookingID = OLD.BookingID;

/* Question - 27] Update the FirstName of CustomerID = 30 to 'Rahul'. */
UPDATE Customers SET FirstName = 'Rahul' WHERE CustomerID = 30;

/* Question - 28] List all bookings ordered by CheckInDate. */
SELECT * FROM Bookings ORDER BY CheckInDate;

/* Question - 29] Show all rooms where capacity is greater than 2. */
SELECT * FROM Rooms WHERE Capacity > 2;

/* Question - 30] List staff emails ordered by their roles. */
SELECT Email FROM Staff ORDER BY Role;

/* Question - 31] Display each customer’s full name and city using CONCAT_WS. */
SELECT CONCAT_WS(' - ', FirstName, LastName, City) AS CustomerDetails
FROM Customers;

/* Question - 32] Show the first 4 customers’ full names only. */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers
LIMIT 4;

/* Question - 33] Show each staff’s role with their full name. */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName, Role
FROM Staff;

/* Question - 34] Management wants to find the average StaffID per role. */
SELECT Role, AVG(StaffID) AS AvgStaffID
FROM Staff
GROUP BY Role;

/* Question - 35] List all bookings handled by StaffID = 2. */
SELECT * FROM Bookings WHERE StaffID = 2;

/* Question - 36] Display the first 3 staff alphabetically by their first names. */
SELECT * FROM Staff
ORDER BY FirstName
LIMIT 3;

/* Question - 37] Customers where FirstName = 'Amit' AND City = 'Nagpur'. */
SELECT * FROM Customers
WHERE FirstName = 'Amit' AND City = 'Nagpur';

/* Question - 38] Show all unique payment methods in descending order. */
SELECT DISTINCT PaymentMethod
FROM Payments
ORDER BY PaymentMethod DESC;

/* Question - 39] Insert 5 staff members into the Staff table. */
INSERT INTO Staff (FirstName, LastName, Role, Phone, Email) VALUES
('Amit', 'Sharma', 'Manager', '9876543210', 'amit@hotel.com'),
('Priya', 'Patil', 'Receptionist', '9123456789', 'priya@hotel.com'),
('Rohit', 'Verma', 'Chef', '9988776655', 'rohit@hotel.com'),
('Neha', 'Singh', 'Waiter', '9090909090', 'neha@hotel.com'),
('Karan', 'Mehta', 'Housekeeping', '9112233445', 'karan@hotel.com');

/* Question - 40] Bookings where CheckInDate is after '2024-01-01'. */
SELECT * FROM Bookings
WHERE CheckInDate > '2024-01-01';

/* Question - 41] List all customers whose FirstName is 'Rahul'. */
SELECT * FROM Customers WHERE FirstName = 'Rahul';

/* Question - 42] Show all unique room types offered by the hotel. */
SELECT DISTINCT RoomType FROM Rooms;

/* Question - 43] Identify customers who spent more than 50,000 in total. */
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Bookings
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 50000;

/* Question - 44] Delete all customers from the city 'TestCity'. */
DELETE FROM Customers WHERE City = 'TestCity';

/* Question - 45] Find rooms that have the same PricePerNight. */
SELECT r1.RoomID, r1.PricePerNight
FROM Rooms r1
JOIN Rooms r2
ON r1.PricePerNight = r2.PricePerNight
AND r1.RoomID <> r2.RoomID;

/* Question - 46] Staff whose Email ends with '@tcs.in'. */
SELECT * FROM Staff
WHERE Email LIKE '%@tcs.in';

/* Question - 47] Cities where maximum CustomerID is more than 100. */
SELECT City
FROM Customers
GROUP BY City
HAVING MAX(CustomerID) > 100;

/* Question - 48] Show all unique capacities in descending order. */
SELECT DISTINCT Capacity
FROM Rooms
ORDER BY Capacity DESC;

/* Question - 49] List staff working as Managers. */
SELECT * FROM Staff WHERE Role = 'Manager';

/* Question - 50] Display each payment’s ID, Method, Amount in one line. */
SELECT CONCAT(PaymentID, ' - ', PaymentMethod, ' - ', Amount) AS PaymentInfo
FROM Payments;

/* Question - 51] Show the first 4 payments only. */
SELECT * FROM Payments
LIMIT 4;

/* Question - 52] Rooms where PricePerNight is between ₹2000 and ₹4000. */
SELECT * FROM Rooms
WHERE PricePerNight BETWEEN 2000 AND 4000;

/* Question - 53] List all bookings ordered by CheckInDate. */
SELECT * FROM Bookings
ORDER BY CheckInDate;

/* Question - 54] Display all unique CustomerIDs from bookings. */
SELECT DISTINCT CustomerID
FROM Bookings;

/* Question - 55] Insert 5 new customer records into Customers table. */
INSERT INTO Customers (FirstName, LastName, Phone, Email, City) VALUES
('Rahul', 'Kumar', '9876541111', 'rahul@gmail.com', 'Delhi'),
('Amit', 'Patel', '9876542222', 'amit@gmail.com', 'Ahmedabad'),
('Sneha', 'Joshi', '9876543333', 'sneha@gmail.com', 'Pune'),
('Neeraj', 'Singh', '9876544444', 'neeraj@gmail.com', 'Bhopal'),
('Kavita', 'Sharma', '9876545555', 'kavita@gmail.com', 'Jaipur');

/* Question - 56] Show the last 2 staff hired. */
SELECT * FROM Staff
ORDER BY StaffID DESC
LIMIT 2;

/* Question - 57] Rooms with price higher than max price of rooms with capacity = 2. */
SELECT * FROM Rooms
WHERE PricePerNight >
(SELECT MAX(PricePerNight) FROM Rooms WHERE Capacity = 2);

/* Question - 58] Staff whose Role is not 'Chef'. */
SELECT * FROM Staff
WHERE Role <> 'Chef';

/* Question - 59] Show all unique cities in descending order. */
SELECT DISTINCT City
FROM Customers
ORDER BY City DESC;

/* Question - 60] Display the phone number of the Waiter only. */
SELECT Phone FROM Staff
WHERE Role = 'Waiter';

/* Question - 61] Display the last 2 bookings in the table. */
SELECT * FROM Bookings
ORDER BY BookingID DESC
LIMIT 2;

/* Question - 62] Customers living in Delhi or Chennai. */
SELECT * FROM Customers
WHERE City IN ('Delhi', 'Chennai');

/* Question - 63] Rooms where RoomType != 'Family'. */
SELECT * FROM Rooms
WHERE RoomType <> 'Family';

/* Question - 64] List staff emails ordered by their roles. */
SELECT Email FROM Staff
ORDER BY Role;

/* Question - 65] Display all unique payment methods. */
SELECT DISTINCT PaymentMethod
FROM Payments;

/* Question - 66] Customers whose Phone starts with '98'. */
SELECT * FROM Customers
WHERE Phone LIKE '98%';

/* Question - 67] Show the 3 cheapest rooms available. */
SELECT * FROM Rooms
ORDER BY PricePerNight ASC
LIMIT 3;

/* Question - 68] Display the last 2 payments. */
SELECT * FROM Payments
ORDER BY PaymentID DESC
LIMIT 2;

/* Question - 69] Unique cities customers come from. */
SELECT DISTINCT City FROM Customers;

/* Question - 70] Bookings where TotalAmount > 5000. */
SELECT * FROM Bookings
WHERE TotalAmount > 5000;

/* Question - 71] Display each staff’s Role with their Email in one column. */
SELECT CONCAT(Role, ' - ', Email) AS StaffRoleEmail
FROM Staff;

/* Question - 72] Show the first 4 staff full names. */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Staff
LIMIT 4;

/* Question - 73] Bookings with TotalAmount greater than all bookings of CustomerID = 10. */
SELECT * FROM Bookings
WHERE TotalAmount >
(SELECT MAX(TotalAmount) FROM Bookings WHERE CustomerID = 10);

/* Question - 74] Rooms with capacity >= 3 for family bookings. */
SELECT * FROM Rooms
WHERE Capacity >= 3;

/* Question - 75] Display RoomType and Price of only Suite rooms. */
SELECT RoomType, PricePerNight
FROM Rooms
WHERE RoomType = 'Suite';

/* Question - 76] Payments with Amount between ₹2000 and ₹7000. */
SELECT * FROM Payments
WHERE Amount BETWEEN 2000 AND 7000;

/* Question - 77] Insert 5 booking records into the Bookings table. */
INSERT INTO Bookings (CustomerID, RoomID, StaffID, CheckInDate, CheckOutDate, TotalAmount) VALUES
(1, 2, 1, '2024-01-10', '2024-01-12', 6000),
(2, 3, 2, '2024-02-05', '2024-02-08', 12000),
(3, 1, 3, '2024-03-01', '2024-03-03', 4000),
(4, 4, 2, '2024-03-10', '2024-03-15', 15000),
(5, 5, 1, '2024-04-01', '2024-04-04', 9000);

/* Question - 78] Display the 3 lowest payments made by customers. */
SELECT * FROM Payments
ORDER BY Amount ASC
LIMIT 3;

/* Question - 79] Show each BookingID with TotalAmount using CONCAT. */
SELECT CONCAT(BookingID, ' - ', TotalAmount) AS BookingAmount
FROM Bookings;

/* Question - 80] Show all unique RoomIDs in descending order. */
SELECT DISTINCT RoomID
FROM Rooms
ORDER BY RoomID DESC;

/* Question - 81] Display each room’s RoomType and Price using CONCAT_WS. */
SELECT CONCAT_WS(' | ', RoomType, PricePerNight) AS RoomInfo
FROM Rooms;

/* Question - 82] Delete all bookings handled by StaffID = 3. */
DELETE FROM Bookings WHERE StaffID = 3;

/* Question - 83] Customers whose FirstName length > 5 characters. */
SELECT * FROM Customers
WHERE LENGTH(FirstName) > 5;

/* Question - 84] Show all unique roles available in the hotel. */
SELECT DISTINCT Role FROM Staff;

/* Question - 85] List all rooms where capacity is greater than 2. */
SELECT * FROM Rooms
WHERE Capacity > 2;

/* Question - 86] Display each payment’s ID with Amount using CONCAT. */
SELECT CONCAT(PaymentID, ' - ', Amount) AS PaymentInfo
FROM Payments;

/* Question - 87] List all Card payments from the Payments table. */
SELECT * FROM Payments
WHERE PaymentMethod = 'Card';

/* Question - 88] Delete all customers whose Email ends with '@test.com'. */
DELETE FROM Customers
WHERE Email LIKE '%@test.com';

/* Question - 89] Bookings where CheckOutDate before '2023-12-31'. */
SELECT * FROM Bookings
WHERE CheckOutDate < '2023-12-31';

/* Question - 90] Rooms with capacity = 2 for couples. */
SELECT * FROM Rooms
WHERE Capacity = 2;

/* Question - 91] Show all unique capacities in descending order. */
SELECT DISTINCT Capacity
FROM Rooms
ORDER BY Capacity DESC;

/* Question - 92] Find the minimum TotalAmount in bookings. */
SELECT MIN(TotalAmount) AS MinBookingAmount
FROM Bookings;

/* Question - 93] Display all rooms by capacity in ascending order. */
SELECT * FROM Rooms
ORDER BY Capacity ASC;

/* Question - 94] Show each BookingID with TotalAmount using CONCAT. */
SELECT CONCAT(BookingID, ' : ', TotalAmount) AS BookingInfo
FROM Bookings;

/* Question - 95] Rooms with Capacity = 4 AND PricePerNight > ₹6000. */
SELECT * FROM Rooms
WHERE Capacity = 4 AND PricePerNight > 6000;

/* Question - 96] Show staff full names combined into one column. */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Staff;

/* Question - 97] Bookings where TotalAmount > ₹10,000. */
SELECT * FROM Bookings
WHERE TotalAmount > 10000;

/* Question - 98] Show all unique payment methods in descending order. */
SELECT DISTINCT PaymentMethod
FROM Payments
ORDER BY PaymentMethod DESC;

/* Question - 99] Staff members who share the same Role. */
SELECT s1.StaffID, s1.FirstName, s1.Role
FROM Staff s1
JOIN Staff s2
ON s1.Role = s2.Role
AND s1.StaffID <> s2.StaffID;

/* Question - 100] Show customer first name, last name, and TotalAmount using JOIN. */
SELECT c.FirstName, c.LastName, b.TotalAmount
FROM Customers c
JOIN Bookings b
ON c.CustomerID = b.CustomerID;

/* Question - 101] Display the first 4 bookings only. */
SELECT * FROM Bookings
LIMIT 4;

/* Question - 102] Show all unique staff first names. */
SELECT DISTINCT FirstName
FROM Staff;

/* Question - 103] Insert 5 new room records with type, price, and capacity. */
INSERT INTO Rooms (RoomType, PricePerNight, Capacity) VALUES
('Single', 1800, 1),
('Double', 3200, 2),
('Suite', 7200, 3),
('Family', 4800, 4),
('Deluxe', 5500, 2);

/* Question - 104] Display each customer’s full name and city using CONCAT_WS. */
SELECT CONCAT_WS(' ', FirstName, LastName, '-', City) AS CustomerInfo
FROM Customers;

/* Question - 105] Show all unique cities in descending order from the Customers table. */
SELECT DISTINCT City
FROM Customers
ORDER BY City DESC;

/* Question - 106] Cities where maximum CustomerID is more than 100. */
SELECT City
FROM Customers
GROUP BY City
HAVING MAX(CustomerID) > 100;

/* Question - 107] Staff whose FirstName is 'Priya'. */
SELECT * FROM Staff
WHERE FirstName = 'Priya';

/* Question - 108] Display the last 2 staff members from the Staff table. */
SELECT * FROM Staff
ORDER BY StaffID DESC
LIMIT 2;

/* Question - 109] Create a VIEW BookingSummary. */
CREATE VIEW BookingSummary AS
SELECT BookingID, CustomerID, RoomID, TotalAmount
FROM Bookings;

/* Question - 110] Show all unique RoomIDs in descending order. */
SELECT DISTINCT RoomID
FROM Rooms
ORDER BY RoomID DESC;

/* Question - 111] Display each staff’s role with their full name. */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName, Role
FROM Staff;

/* Question - 112] Offer Suite rooms under ₹7000 to business travelers. */
SELECT * FROM Rooms
WHERE RoomType = 'Suite' AND PricePerNight < 7000;

/* Question - 113] Display the first 3 staff alphabetically by their first names. */
SELECT * FROM Staff
ORDER BY FirstName
LIMIT 3;

/* Question - 114] List all bookings ordered by CheckInDate. */
SELECT * FROM Bookings
ORDER BY CheckInDate;

/* Question - 115] Show all unique StaffIDs from the bookings. */
SELECT DISTINCT StaffID
FROM Bookings;

/* Question - 116] Display the first 4 customers’ full names only. */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers
LIMIT 4;

/* Question - 117] Show all unique room types offered by the hotel. */
SELECT DISTINCT RoomType
FROM Rooms;

/* Question - 118] Display the phone number of the Waiter only. */
SELECT Phone FROM Staff
WHERE Role = 'Waiter';

/* Question - 119] Show all bookings where TotalAmount > 5000. */
SELECT * FROM Bookings
WHERE TotalAmount > 5000;

/* Question - 120] Update Role = 'Senior Manager' where StaffID = 12. */
UPDATE Staff
SET Role = 'Senior Manager'
WHERE StaffID = 12;

/* Question - 121] List all staff working as Managers. */
SELECT * FROM Staff
WHERE Role LIKE '%Manager%';

/* Question - 122] Show the last 2 registered customers. */
SELECT * FROM Customers
ORDER BY CustomerID DESC
LIMIT 2;

/* Question - 123] Display each BookingID with TotalAmount using CONCAT. */
SELECT CONCAT(BookingID, ' - ', TotalAmount) AS BookingInfo
FROM Bookings;

/* Question - 124] Insert 5 staff members into the Staff table. */
INSERT INTO Staff (FirstName, LastName, Role, Phone, Email) VALUES
('Suresh', 'Nair', 'Manager', '9000011111', 'suresh@hotel.com'),
('Meena', 'Iyer', 'Receptionist', '9000022222', 'meena@hotel.com'),
('Vikas', 'Rao', 'Chef', '9000033333', 'vikas@hotel.com'),
('Anita', 'Kapoor', 'Waiter', '9000044444', 'anita@hotel.com'),
('Raj', 'Malhotra', 'Housekeeping', '9000055555', 'raj@hotel.com');

/* Question - 125] Display the RoomType and Price of only Suite rooms. */
SELECT RoomType, PricePerNight
FROM Rooms
WHERE RoomType = 'Suite';


/* Question - 126] The admin wants to delete all payments linked to BookingID = 15. */
DELETE FROM Payments
WHERE BookingID = 15;

/* Question - 127] Display all unique capacities in descending order. */
SELECT DISTINCT Capacity
FROM Rooms
ORDER BY Capacity DESC;

/* Question - 128] Show the first 4 rooms sorted alphabetically by RoomType. */
SELECT * FROM Rooms
ORDER BY RoomType
LIMIT 4;

/* Question - 129] Payments where Amount < ₹1500. */
SELECT * FROM Payments
WHERE Amount < 1500;

/* Question - 130] Show each BookingID with TotalAmount using CONCAT. */
SELECT CONCAT(BookingID, ' - ', TotalAmount) AS BookingInfo
FROM Bookings;

/* Question - 131] Display the last 2 added rooms from the Rooms table. */
SELECT * FROM Rooms
ORDER BY RoomID DESC
LIMIT 2;

/* Question - 132] Customers where FirstName = 'Amit' AND City = 'Nagpur'. */
SELECT * FROM Customers
WHERE FirstName = 'Amit' AND City = 'Nagpur';

/* Question - 133] Insert 5 new customer details into Customers table. */
INSERT INTO Customers (FirstName, LastName, Phone, Email, City) VALUES
('Aakash', 'Verma', '9888111122', 'aakash@gmail.com', 'Indore'),
('Ritu', 'Shah', '9888222233', 'ritu@gmail.com', 'Surat'),
('Manoj', 'Yadav', '9888333344', 'manoj@gmail.com', 'Kanpur'),
('Pooja', 'Mehta', '9888444455', 'pooja@gmail.com', 'Udaipur'),
('Sahil', 'Khan', '9888555566', 'sahil@gmail.com', 'Bhopal');

/* Question - 134] Show staff full names combined into one column. */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Staff;

/* Question - 135] Show all room details separated by commas using CONCAT_WS. */
SELECT CONCAT_WS(', ', RoomID, RoomType, PricePerNight, Capacity) AS RoomDetails
FROM Rooms;

/* Question - 136] Display each customer’s name and phone number together using CONCAT. */
SELECT CONCAT(FirstName, ' ', LastName, ' - ', Phone) AS CustomerContact
FROM Customers;

/* Question - 137] Display all payment details in one line using CONCAT_WS. */
SELECT CONCAT_WS(' | ', PaymentID, PaymentMethod, Amount, PaymentDate)
FROM Payments;

/* Question - 138] Display the last 2 bookings in the table. */
SELECT * FROM Bookings
ORDER BY BookingID DESC
LIMIT 2;

/* Question - 139] List all payments ordered by PaymentDate. */
SELECT * FROM Payments
ORDER BY PaymentDate;

/* Question - 140] Show the 2 highest payments received. */
SELECT * FROM Payments
ORDER BY Amount DESC
LIMIT 2;

/* Question - 141] Customers whose FirstName is 'Rahul'. */
SELECT * FROM Customers
WHERE FirstName = 'Rahul';

/* Question - 142] Display each PaymentID with its method using CONCAT. */
SELECT CONCAT(PaymentID, ' - ', PaymentMethod) AS PaymentInfo
FROM Payments;

/* Question - 143] PaymentMethods used more than 5 times. */
SELECT PaymentMethod
FROM Payments
GROUP BY PaymentMethod
HAVING COUNT(*) > 5;

/* Question - 144] Show the 2 most expensive rooms for VIP guests. */
SELECT * FROM Rooms
ORDER BY PricePerNight DESC
LIMIT 2;

/* Question - 145] Show each room’s RoomType and Price using CONCAT_WS. */
SELECT CONCAT_WS(' - ', RoomType, PricePerNight) AS RoomInfo
FROM Rooms;

/* Question - 146] Display the first 3 staff alphabetically by their first names. */
SELECT * FROM Staff
ORDER BY FirstName
LIMIT 3;

/* Question - 147] List all bookings handled by StaffID = 2. */
SELECT * FROM Bookings
WHERE StaffID = 2;

/* Question - 148] City where average CustomerID is greater than 50. */
SELECT City
FROM Customers
GROUP BY City
HAVING AVG(CustomerID) > 50;

/* Question - 149] Display the 2 most expensive rooms for VIP guests. */
SELECT * FROM Rooms
ORDER BY PricePerNight DESC
LIMIT 2;

/* Question - 150] Show all unique first names of customers for a duplicate check. */
SELECT DISTINCT FirstName
FROM Customers;


/* Question - 151] Show all unique roles in descending order. */
SELECT DISTINCT Role
FROM Staff
ORDER BY Role DESC;

/* Question - 152] Identify rooms whose Capacity is greater than the average Capacity of all rooms. */
SELECT * FROM Rooms
WHERE Capacity > (SELECT AVG(Capacity) FROM Rooms);

/* Question - 153] Display all rooms by capacity in ascending order. */
SELECT * FROM Rooms
ORDER BY Capacity ASC;

/* Question - 154] Display the first 4 payments only. */
SELECT * FROM Payments
LIMIT 4;

/* Question - 155] Show each payment’s ID, Method, Amount in one line. */
SELECT CONCAT(PaymentID, ' - ', PaymentMethod, ' - ', Amount) AS PaymentInfo
FROM Payments;

/* Question - 156] List all bookings where TotalAmount > 5000. */
SELECT * FROM Bookings
WHERE TotalAmount > 5000;

/* Question - 157] Customers whose CustomerID is greater than the average CustomerID. */
SELECT * FROM Customers
WHERE CustomerID > (SELECT AVG(CustomerID) FROM Customers);

/* Question - 158] Staff whose Role is not 'Chef'. */
SELECT * FROM Staff
WHERE Role <> 'Chef';

/* Question - 159] Bookings where TotalAmount > ₹10,000. */
SELECT * FROM Bookings
WHERE TotalAmount > 10000;

/* Question - 160] Display each staff’s role with their full name. */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName, Role
FROM Staff;

/* Question - 161] Staff members who share the same Role. */
SELECT s1.StaffID, s1.FirstName, s1.Role
FROM Staff s1
JOIN Staff s2
ON s1.Role = s2.Role
AND s1.StaffID <> s2.StaffID;

/* Question - 162] Show Customer Name and Payment Amount by joining Customers, Bookings, and Payments. */
SELECT c.FirstName, c.LastName, p.Amount
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Payments p ON b.BookingID = p.BookingID;

/* Question - 163] Display all bookings where TotalAmount > 5000. */
SELECT * FROM Bookings
WHERE TotalAmount > 5000;

/* Question - 164] Customers whose Phone starts with '98'. */
SELECT * FROM Customers
WHERE Phone LIKE '98%';

/* Question - 165] Identify customers who live in the same city. */
SELECT c1.CustomerID, c1.FirstName, c1.City
FROM Customers c1
JOIN Customers c2
ON c1.City = c2.City
AND c1.CustomerID <> c2.CustomerID;

/* Question - 166] Bookings where CheckOutDate before '2023-12-31'. */
SELECT * FROM Bookings
WHERE CheckOutDate < '2023-12-31';

/* Question - 167] Show all unique StaffIDs from the bookings. */
SELECT DISTINCT StaffID
FROM Bookings;

/* Question - 168] Create a VIEW OnlinePayments showing payments made by Online method. */
CREATE VIEW OnlinePayments AS
SELECT * FROM Payments
WHERE PaymentMethod = 'Online';

/* Question - 169] Display all unique payment methods in descending order. */
SELECT DISTINCT PaymentMethod
FROM Payments
ORDER BY PaymentMethod DESC;

/* Question - 170] Display each payment’s ID with Amount using CONCAT. */
SELECT CONCAT(PaymentID, ' - ', Amount) AS PaymentInfo
FROM Payments;

/* Question - 171] Show all unique RoomIDs in descending order. */
SELECT DISTINCT RoomID
FROM Rooms
ORDER BY RoomID DESC;

/* Question - 172] Cities where maximum CustomerID is more than 100. */
SELECT City
FROM Customers
GROUP BY City
HAVING MAX(CustomerID) > 100;

/* Question - 173] List staff emails ordered by their roles. */
SELECT Email
FROM Staff
ORDER BY Role;

/* Question - 174] Bookings where TotalAmount exceeds the average TotalAmount. */
SELECT * FROM Bookings
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Bookings);

/* Question - 175] Rooms where PricePerNight > ₹5000. */
SELECT * FROM Rooms
WHERE PricePerNight > 5000;


/* Question - 176] Show all unique capacities in descending order. */
SELECT DISTINCT Capacity
FROM Rooms
ORDER BY Capacity DESC;

/* Question - 177] Display the first 4 rooms sorted alphabetically by RoomType. */
SELECT * FROM Rooms
ORDER BY RoomType
LIMIT 4;

/* Question - 178] Show all unique staff first names. */
SELECT DISTINCT FirstName
FROM Staff;

/* Question - 179] Rooms with price higher than max price of rooms with capacity = 2. */
SELECT * FROM Rooms
WHERE PricePerNight >
(SELECT MAX(PricePerNight) FROM Rooms WHERE Capacity = 2);

/* Question - 180] Show all unique cities in descending order from Customers table. */
SELECT DISTINCT City
FROM Customers
ORDER BY City DESC;

/* Question - 181] List all bookings where TotalAmount > 5000. */
SELECT * FROM Bookings
WHERE TotalAmount > 5000;

/* Question - 182] PaymentID, Customer Name, BookingID for Credit Card payments. */
SELECT p.PaymentID, c.FirstName, c.LastName, b.BookingID
FROM Payments p
JOIN Bookings b ON p.BookingID = b.BookingID
JOIN Customers c ON b.CustomerID = c.CustomerID
WHERE p.PaymentMethod = 'Credit Card';

/* Question - 183] Display each BookingID with TotalAmount using CONCAT. */
SELECT CONCAT(BookingID, ' - ', TotalAmount) AS BookingInfo
FROM Bookings;

/* Question - 184] Show all bookings handled by StaffID = 2. */
SELECT * FROM Bookings
WHERE StaffID = 2;

/* Question - 185] Display the last 2 added rooms from the Rooms table. */
SELECT * FROM Rooms
ORDER BY RoomID DESC
LIMIT 2;

/* Question - 186] List all rooms where capacity is greater than 2. */
SELECT * FROM Rooms
WHERE Capacity > 2;

/* Question - 187] Display the last 2 staff members from the Staff table. */
SELECT * FROM Staff
ORDER BY StaffID DESC
LIMIT 2;

/* Question - 188] Show all unique roles available in the hotel. */
SELECT DISTINCT Role
FROM Staff;

/* Question - 189] Display the last 2 payments. */
SELECT * FROM Payments
ORDER BY PaymentID DESC
LIMIT 2;

/* Question - 190] Bookings where CustomerID IN (2,4,6,8). */
SELECT * FROM Bookings
WHERE CustomerID IN (2,4,6,8);

/* Question - 191] Show all unique first names of customers. */
SELECT DISTINCT FirstName
FROM Customers;

/* Question - 192] Display all bookings where TotalAmount > 5000. */
SELECT * FROM Bookings
WHERE TotalAmount > 5000;

/* Question - 193] Delete all payments where Amount < 1000. */
DELETE FROM Payments
WHERE Amount < 1000;

/* Question - 194] Display all unique RoomIDs in descending order. */
SELECT DISTINCT RoomID
FROM Rooms
ORDER BY RoomID DESC;

/* Question - 195] List customers who made more than 5 bookings. */
SELECT CustomerID
FROM Bookings
GROUP BY CustomerID
HAVING COUNT(*) > 5;

/* Question - 196] Display all rooms by capacity in ascending order. */
SELECT * FROM Rooms
ORDER BY Capacity ASC;

/* Question - 197] Show each BookingID with TotalAmount using CONCAT. */
SELECT CONCAT(BookingID, ' : ', TotalAmount) AS BookingInfo
FROM Bookings;

/* Question - 198] List all staff working as Managers. */
SELECT * FROM Staff
WHERE Role LIKE '%Manager%';

/* Question - 199] Customers whose FirstName length > 5 characters. */
SELECT * FROM Customers
WHERE LENGTH(FirstName) > 5;

/* Question - 200] Display all unique capacities in descending order. */
SELECT DISTINCT Capacity
FROM Rooms
ORDER BY Capacity DESC;

/* Question - 201] Staff members who share the same Role. */
SELECT s1.StaffID, s1.FirstName, s1.Role
FROM Staff s1
JOIN Staff s2
ON s1.Role = s2.Role
AND s1.StaffID <> s2.StaffID;

/* Question - 202] PaymentID, Customer Name, BookingID for Credit Card payments. */
SELECT p.PaymentID, c.FirstName, c.LastName, b.BookingID
FROM Payments p
JOIN Bookings b ON p.BookingID = b.BookingID
JOIN Customers c ON b.CustomerID = c.CustomerID
WHERE p.PaymentMethod = 'Credit Card';

/* Question - 203] Display the first 4 payments only. */
SELECT * FROM Payments
LIMIT 4;

/* Question - 204] Show each payment’s ID, Method, Amount in one line. */
SELECT CONCAT(PaymentID, ' | ', PaymentMethod, ' | ', Amount) AS PaymentInfo
FROM Payments;

/* Question - 205] Create a VIEW HighValueBookings with TotalAmount > 20000. */
CREATE VIEW HighValueBookings AS
SELECT * FROM Bookings
WHERE TotalAmount > 20000;

/* Question - 206] Trigger to delete payment when booking is deleted. */
CREATE TRIGGER delete_payment_after_booking
AFTER DELETE ON Bookings
FOR EACH ROW
DELETE FROM Payments
WHERE BookingID = OLD.BookingID;

/* Question - 207] Trigger to prevent CheckOutDate < CheckInDate. */
DELIMITER $$

CREATE TRIGGER check_booking_dates
BEFORE INSERT ON Bookings
FOR EACH ROW
BEGIN
    IF NEW.CheckOutDate < NEW.CheckInDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CheckOutDate cannot be before CheckInDate';
    END IF;
END$$

DELIMITER ;
 

/* Question - 208] Trigger to update TotalAmount when payment is inserted. */
CREATE TRIGGER update_total_amount
AFTER INSERT ON Payments
FOR EACH ROW
UPDATE Bookings
SET TotalAmount = TotalAmount + NEW.Amount
WHERE BookingID = NEW.BookingID;

   /*------------------------ END OF PROJECT -----------------------------------------------*/