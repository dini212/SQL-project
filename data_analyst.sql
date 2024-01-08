-- join table revenue by year
SELECT 
  arrival_date_year,
  hotel,
  round(sum((stays_in_week_nights + stays_in_weekend_nights)* adr * Discount),2) as revenue
FROM 
  `grand-reference-393706.hotel_revenue_2019.revenue_combined`
left join 
  `grand-reference-393706.hotel_revenue_2019.market_segment`
on 
  `grand-reference-393706.hotel_revenue_2019.revenue_combined`.market_segment = `grand-reference-393706.hotel_revenue_2019.revenue_combined`.market_segment
left join 
  `grand-reference-393706.hotel_revenue_2019.meal_cost`
on 
  `grand-reference-393706.hotel_revenue_2019.revenue_combined`.meal = `grand-reference-393706.hotel_revenue_2019.meal_cost`.meal
GROUP BY arrival_date_year, hotel;

-- total night
SELECT 
  arrival_date_year,
  hotel,
  sum(stays_in_week_nights + stays_in_weekend_nights) AS total_night
FROM 
  `grand-reference-393706.hotel_revenue_2019.revenue_combined`
GROUP BY arrival_date_year, hotel;

-- Average of adr 
SELECT 
  arrival_date_year,
  hotel,
  round(AVG(adr),2) AS avg_of_adr
FROM 
  `grand-reference-393706.hotel_revenue_2019.revenue_combined`
GROUP BY arrival_date_year, hotel;

-- Average of discount
SELECT 
  arrival_date_year,
  hotel,
  round(avg(Discount),2) as discount
FROM 
  `grand-reference-393706.hotel_revenue_2019.revenue_combined`
left join 
  `grand-reference-393706.hotel_revenue_2019.market_segment`
on 
  `grand-reference-393706.hotel_revenue_2019.revenue_combined`.market_segment = `grand-reference-393706.hotel_revenue_2019.revenue_combined`.market_segment
GROUP BY arrival_date_year, hotel;

-- required parking space
SELECT
  hotel,
  sum(required_car_parking_spaces) AS total_parking_spaces,
  sum(stays_in_week_nights + stays_in_weekend_nights) AS total_night,
  round((sum(required_car_parking_spaces) / sum(stays_in_week_nights + stays_in_weekend_nights)) * 100,2)AS required_parking_percentage
FROM
  `grand-reference-393706.hotel_revenue_2019.revenue_combined`
GROUP BY hotel
