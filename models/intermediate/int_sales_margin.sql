with sales AS (
    SELECT *
    FROM {{ ref('stg_raw__sales') }}
),

product AS (
    SELECT * 
    FROM {{ ref('stg_raw__product') }}
),

joined AS (

SELECT s.date_date,
s.orders_id,
s.product_id,
s.revenue,
s.quantity,
p.purchase_price,

(s.quantity * p.purchase_price) as purchase_cost,

ROUND((s.revenue - (s.quantity * p.purchase_price)),2) as margin

FROM sales as s
LEFT JOIN product as p on s.product_id = p.products_id )

SELECT * 
FROM joined