-- Step 4a: Jinja loop over a list (France, Spain, Germany).
-- Analyses are only compiled, never run: use "dbt compile" and look in target/compiled/.
-- The "-" inside the Jinja tags removes the extra line breaks in the compiled SQL.
{%- set countries = ["France", "Spain", "Germany"] -%}

select
{%- for country in countries %}
count(case when name = '{{country}}' then name end) as {{country}}_amount
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{ ref('my_first_join') }}
