
{%test positive_value(model, column_name)%}
Select * from {{model}}
where {{column_name}} < 1
{%endtest%}
