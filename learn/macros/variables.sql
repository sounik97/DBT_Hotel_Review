{% {% macro learn_variables() %}

  {% set your_name = "sounik" %}
  {{log("Hello! " ~ your_name, info = True)}}
   
  {{log("Hello user " ~ var("user") ~"!", info = True)}}
{% endmacro %}%}