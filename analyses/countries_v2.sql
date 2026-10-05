-- Step 4b: same loop with "United States" added.
-- "United States_amount" is not a valid column name, so when the country contains
-- a space we build a second variable with the space replaced by "_".
{%- set countries = ["France", "Spain", "Germany", "United States"] -%}

select
{%- for country in countries %}
{%- if ' ' not in country %}
count(case when name = '{{country}}' then name end) as {{country}}_amount
{%- else %}
{% set country_underscore = country.replace(' ', '_') -%}
count(case when name = '{{country}}' then name end) as {{country_underscore}}_amount
{% endif -%}
{%- if not loop.last %},{% endif -%}
{% endfor -%}
from {{ ref('my_first_join') }}
