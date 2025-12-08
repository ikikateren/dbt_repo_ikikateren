with month_table as (
SELECT
EXTRACT(MONTH FROM date_date) AS date_month,
operational_margin - ads_cost AS ads_margin,
ROUND(average_basket,2) AS average_basket,
operational_margin,
ads_cost,
impression,
click,
quantity,
revenue,
purchase_cost,
margin,
shipping_fee,
log_cost,
ship_cost
FROM {{ ref("finance_campaigns_day") }} )

SELECT date_month,
SUM(ads_margin) AS ads_margin,
ROUND(AVG(average_basket),2) AS average_basket,
SUM(operational_margin) AS operational_margin,
SUM(ads_cost) AS ads_cost,
SUM(impression) AS impression,
SUM(click) AS click,
SUM(quantity) AS quantity,
SUM(revenue) AS revenue,
SUM(purchase_cost) AS purchase_cost,
SUM(margin) AS margin,
SUM(shipping_fee) AS shipping_fee,
SUM(log_cost) AS log_cost,
SUM(ship_cost) AS ship_cost
FROM month_table
GROUP BY date_month
ORDER BY date_month DESC