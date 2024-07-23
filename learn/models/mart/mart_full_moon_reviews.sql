{{
    config(
        materialized = 'table',
    )
}}

with fct_review as (
    select * from {{ref('fct_review')}}
),
mart_full_moon_review as (
    select * from {{ref("seed_full_moon_dates")}}
    )

SELECT r.*,
CASE WHEN fm.full_moon_date is null then 'Not full Moon'
else 'Full Moon'
END as is_full_moon
FROM fct_review r 
LEFT JOIN mart_full_moon_review fm ON (TO_DATE(r.review_date) = DATEADD(DAY,1,fm.full_moon_date))

