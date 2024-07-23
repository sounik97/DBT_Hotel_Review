{% {% macro learn_logging() %}
 
 -- {#  this will comment out the logging #}
  -- {# log('Testing logging now', info = True) #}  

  {{log('Testing logging now', info = True)}}

{% endmacro %}%}