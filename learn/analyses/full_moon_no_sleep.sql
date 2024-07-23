with mart_full_moon_review as (

    Select * from {{ref('mart_full_moon_reviews')}}
)

Select is_full_moon, review_sentiment, count(*)
from mart_full_moon_review
group by is_full_moon, review_sentiment
order by is_full_moon, review_sentiment