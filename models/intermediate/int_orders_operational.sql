with order_margin as(
    select *
    from {{ ref('int_orders_margin')}}
),

ship as (
    select * 
    from {{ ref('stg_raw__ship')}}
),

joined as (

select o.date_date,
o.orders_id,
o.revenue,
o.quantity,
o.purchase_cost,
o.margin,
s.shipping_fee,
s.ship_cost,
s.log_cost,
round((margin + shipping_fee - ship_cost - log_cost),2) as operational_margin
from order_margin as o
left join ship as s on o.orders_id = s.orders_id )

select *
from joined