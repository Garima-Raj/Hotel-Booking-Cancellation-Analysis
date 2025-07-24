CREATE DATABASE hotel_data;
USE hotel_data;

CREATE TABLE hotel_bookings (
  `Hotel` VARCHAR(255),
  `Is_Canceled` INT,
  `Lead_Time` INT,
  `Arrival_Date_Year` INT,
  `Arrival_Date_Month` VARCHAR(255),
  `Arrival_Date_Week_Number` INT,
  `Arrival_Date_Day_Of_Month` INT,
  `Stays_In_Weekend_Nights` INT,
  `Stays_In_Week_Nights` INT,
  `Adults` INT,
  `Children` INT,
  `Babies` INT,
  `Meal` VARCHAR(255),
  `Country` VARCHAR(255),
  `Market_Segment` VARCHAR(255),
  `Distribution_Channel` VARCHAR(255),
  `Is_Repeated_Guest` INT,
  `Previous_Cancellations` INT,
  `Previous_Bookings_Not_Canceled` INT,
  `Reserved_Room_Type` VARCHAR(255),
  `Assigned_Room_Type` VARCHAR(255),
  `Booking_Changes` INT,
  `Deposit_Type` VARCHAR(255),
  `Agent` VARCHAR(255),
  `Days_In_Waiting_List` INT,
  `Customer_Type` VARCHAR(255),
  `Adr` FLOAT,
  `Required_Car_Parking_Spaces` INT,
  `Total_Of_Special_Requests` INT,
  `Reservation_Status` VARCHAR(255),
  `Reservation_Status_Date` VARCHAR(255)
);

USE hotel_data;
SELECT COUNT(*) FROM hotel_bookings;

-- 1. Top countries by bookings
SELECT country, COUNT(*) AS bookings
FROM hotel_bookings
GROUP BY country
ORDER BY bookings DESC
LIMIT 10;

-- 2. Cancellation rate by hotel type
SELECT hotel, 
       ROUND(AVG(Is_Canceled) * 100, 2) AS cancel_rate
FROM hotel_bookings
GROUP BY hotel;

-- 3. Average ADR by room type
SELECT Reserved_Room_Type, AVG(Adr) AS avg_price
FROM hotel_bookings
GROUP BY Reserved_Room_Type;

-- 4. Cancellation Rate by Market Segment
SELECT Market_Segment,
       COUNT(*) AS total_bookings,
       SUM(Is_Canceled) AS total_canceled,
       ROUND(AVG(Is_Canceled) * 100, 2) AS cancellation_rate_percent
FROM hotel_bookings
GROUP BY Market_Segment
ORDER BY cancellation_rate_percent DESC;

-- 5. Average Lead Time and ADR for Canceled vs Not Canceled
SELECT Is_Canceled,
       ROUND(AVG(Lead_Time), 2) AS avg_lead_time,
       ROUND(AVG(Adr), 2) AS avg_adr,
       COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY Is_Canceled;

