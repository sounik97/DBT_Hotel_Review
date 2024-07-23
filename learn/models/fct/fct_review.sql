
{{
    config(
      materialized = 'incremental',
      on_schema_change = 'fail'
      )
}}



with src_reviews as (
    Select * from {{ref('src_reviews')}}
)
Select 
{{ dbt_utils.generate_surrogate_key(['listing_id','review_date','reviewer_name','review_text']) }} as review_id,
* 
from src_reviews
where review_text is not null
-- this line runs and data gets loaded only when review_date is higher that current fct_review table, this refers to fct_review tbl.
{# {% if is_incremental() %}
  and review_date >= (select max(review_date) from {{this}})
{% endif %} #}

{% if is_incremental() %}
  {% if var("start_date", False) and var("end_date", False) %}
    {{ log('Loading ' ~ this ~ ' incrementally (start_date: ' ~ var("start_date") ~ ', end_date: ' ~ var("end_date") ~ ')', info=True) }}
    AND review_date >= '{{ var("start_date") }}'
    AND review_date < '{{ var("end_date") }}'
  {% else %}
    AND review_date > (select max(review_date) from {{ this }})
    {{ log('Loading ' ~ this ~ ' incrementally (all missing dates)', info=True)}}
  {% endif %}
{% endif %}