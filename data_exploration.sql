-- checking for null values in all columns

SELECT COUNT(*) - COUNT(hotel) hotel,
  COUNT(*) - COUNT(is_canceled) is_canceled,
  COUNT(*) - COUNT(lead_time) lead_time,
  COUNT(*) - COUNT(arrival_date_year) arrival_date_year,
  COUNT(*) - COUNT(arrival_date_month) arrival_date_month,
  COUNT(*) - COUNT(arrival_date_week_number) arrival_date_week_number,
  COUNT(*) - COUNT(arrival_date_day_of_month) arrival_date_day_of_month,
  COUNT(*) - COUNT(stays_in_weekend_nights) stays_in_weekend_nights,
  COUNT(*) - COUNT(stays_in_week_nights) stays_in_week_nights,
  COUNT(*) - COUNT(adults) adults,
  COUNT(*) - COUNT(children) children,
  COUNT(*) - COUNT(babies) babies,
  COUNT(*) - COUNT(meal) meal,
  COUNT(*) - COUNT(country) country,
  COUNT(*) - COUNT(market_segment) market_segment,
  COUNT(*) - COUNT(distribution_channel) distribution_channel,
  COUNT(*) - COUNT(is_repeated_guest) is_repeated_guest,
  COUNT(*) - COUNT(previous_cancellations) previous_cancellations,
  COUNT(*) - COUNT(previous_bookings_not_canceled) previous_bookings_not_canceled, 
  COUNT(*) - COUNT(reserved_room_type) reserved_room_type,
  COUNT(*) - COUNT(assigned_room_type) assigned_room_type,
  COUNT(*) - COUNT(booking_changes) booking_changes,
FROM `grand-reference-393706.hotel_revenue_2019.revenue_combined`;

-- hotel has 2 unique types of hotel
SELECT DISTINCT hotel, COUNT(hotel) AS no_hotels
FROM `grand-reference-393706.hotel_revenue_2019.revenue_combined`
GROUP BY hotel;

-- reservation status has 3 unique type
SELECT DISTINCT reservation_status, COUNT(reservation_status) AS no_status
FROM `grand-reference-393706.hotel_revenue_2019.revenue_combined`
GROUP BY reservation_status;

-- deposit type has unique type
SELECT DISTINCT deposit_type, COUNT(deposit_type) AS no_type
FROM `grand-reference-393706.hotel_revenue_2019.revenue_combined`
GROUP BY deposit_type;

-- reservation status date type
SELECT reservation_status_date
FROM `grand-reference-393706.hotel_revenue_2019.revenue_combined`
LIMIT 5