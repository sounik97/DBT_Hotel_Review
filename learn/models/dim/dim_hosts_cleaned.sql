{{
    config(
      materialized = 'view'
      )
}}

with src_hosts as (

    Select * from {{ref("src_hosts")}}
)

Select 
host_id,
NVL(host_name ,'Anonymous') as host_name,
is_superhost,
created_at,
updated_at
from src_hosts