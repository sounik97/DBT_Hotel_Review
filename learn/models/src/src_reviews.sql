with raw_reviews as (
SELECT * FROM  {{ source('airbnb', 'reviews') }}
)
SELECT 
listing_id,
date as review_date,
comments as review_text,
sentiment as review_sentiment,
REVIEWER_NAME
from raw_reviews
