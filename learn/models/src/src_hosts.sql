with raw_hosts as (
Select * from {{ source('airbnb', 'hosts') }}
)
SELECT
ID as host_id,
name as host_name,
is_superhost,
created_at,
updated_at
from raw_hosts