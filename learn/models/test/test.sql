with test as 
(

    Select * from {{ref("src_listing")}}
)
select * from test