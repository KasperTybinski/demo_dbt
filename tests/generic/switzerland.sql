-- Step 6: custom generic test.
-- A dbt test FAILS when its query returns rows.
-- This query returns a row only when no 'Switzerland' value is found,
-- so the test passes when Switzerland is present in the column.
-- (The notebook's version did the opposite.)
{% test switzerland(model, column_name) %}

select 1 as missing_switzerland
from (
    select count(*) as n
    from {{ model }}
    where {{ column_name }} = 'Switzerland'
)
where n = 0

{% endtest %}
