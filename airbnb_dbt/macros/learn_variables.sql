{%  macro learn_variables() %}
{% set first_name = "Jack" %}
{{ log("Hello, " ~ first_name, info=True) }}
{# dbt run-operation learn_variables --vars '{email: "jackptoke@gmail.com"}' #}
{{  log("Please, email me at: " ~ var("email", "jack.toke@cocolab.com.au"), info=True) }}
{% endmacro %}