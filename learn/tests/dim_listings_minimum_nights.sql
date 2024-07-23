{# as this is singular tests, this statement should return zero rows to pass the tests #}

Select * 
from {{ ref('dim_listings_cleaned') }}
where minimum_nights < 1
limit 10