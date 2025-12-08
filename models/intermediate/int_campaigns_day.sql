SELECT date_date,
SUM(ads_cost) as ads_cost,
SUM(impression) as impression,
SUM(click) as click
FROM {{ ref("int_campaigns") }}
GROUP BY date_date
ORDER BY date_date DESC