Select * from {{ref('fct_review')}} f
LEFT JOIN {{ref('dim_listings_cleaned')}} d
ON f.listing_id = d.listing_id
where f.review_date < d.created_at
LIMIT 10