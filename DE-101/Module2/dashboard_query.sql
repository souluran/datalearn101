select 
s.order_id ,
dt.date,
dc.customer_name ,
dp.category ,
dp.sub_category ,
dp.segment ,
dp.product_name ,
dg.state ,
dr.region_name ,
ds.shipping_mode ,
sum(s.quantity) as quantity ,
sum(s.sales) as sales ,
sum(s.profit) as profit ,
sum(s.profit)/sum(s.sales) as profit_rate,
sum(s.discount) as discount 
from dw.fc_sales s 
inner join dw.dm_customer dc 
on s.cust_id = dc.cust_id 
inner join dw.dm_product dp 
on s.prod_id = dp.prod_id 
inner join dw.dm_geo dg 
on s.geo_id = dg.geo_id 
  and dg.country = 'United States' 
inner join dw.dm_shipping ds 
on s.ship_id = ds.ship_id 
inner join dw.dm_calendar dt 
on s.order_date_id = dt.dateid
inner join dw.dm_region dr 
on s.region_id = dr.region_id 
group by s.order_id ,
dt.date,
dc.customer_name ,
dp.category ,
dp.sub_category ,
dp.segment ,
dp.product_name ,
dg.state ,
dr.region_name ,
ds.shipping_mode