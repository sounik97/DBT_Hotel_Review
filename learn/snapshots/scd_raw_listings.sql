 
  {# this is snapshot table name #}
 {% snapshot scd_raw_listings %} 


{{
   config(
       target_database='airbnb',
       target_schema='dev',
       unique_key='id',
       strategy='timestamp',
       updated_at='updated_at',
       invalidate_hard_deletes = True
       
   )
}}
{# invalidate_hard_deletes if any record is deleted snapshot will reflect that and change the null_valid to the actual snapshot date #}
{# this config defines the column where scd will take place #}
select * from {{ source('airbnb', 'listings') }}

{% endsnapshot %}