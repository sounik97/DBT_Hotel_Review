{# adapter.get_columns_in_relation(model) is a build in function, it returns all the columns #}
{# '-%}' means trim the whitespaces #}

{%{% macro no_null_in_columns(model) %}
  Select * from {{model}}
  WHERE 
  {% for col in adapter.get_columns_in_relation(model) -%}
    {{col.column}} IS NULL OR
    {% endfor %}
    FALSE
{% endmacro %}%}