{{
    config(
      materialized = 'view'
     
      )
}}

with src_listings as 
(

SELECT * from {{ref("src_listing")}}
)
select listing_id,
listing_name,
room_type,
CASE WHEN minimum_nights = 0 then 1 else minimum_nights end as minimum_nights,
host_id,
REPLACE (price_str,'$'):: NUMBER(10,2) as price,
created_at,
updated_at
from src_listings