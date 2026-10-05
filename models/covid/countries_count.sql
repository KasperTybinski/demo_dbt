-- Step 4c: same logic, but the list now comes from "vars" in dbt_project.yml.
select
{%- for country in var('countries') %}
{%- if ' ' not in country %}
count(case when name = '{{country}}' then name end) as {{country}}_amount
{%- else %}
{% set country_underscore = country.replace(' ', '_') -%}
count(case when name = '{{country}}' then name end) as {{country_underscore}}_amount
{% endif -%}
{%- if not loop.last %},{% endif -%}
{% endfor -%}
from {{ ref('my_first_join') }}
