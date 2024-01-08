-- Data Combining

CREATE TABLE IF NOT EXISTS `grand-reference-393706.hotel_revenue_2019.revenue_combined` AS (
  SELECT * FROM `grand-reference-393706.hotel_revenue_2019.revenue_2018`
  UNION ALL
  SELECT * FROM `grand-reference-393706.hotel_revenue_2019.2019`
  UNION ALL
  SELECT * FROM `grand-reference-393706.hotel_revenue_2019.revenue_2020`
);