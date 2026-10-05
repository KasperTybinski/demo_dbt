-- Step 3: a macro is a reusable piece of SQL.
-- argument2 has a default value (1), so it can be left out when calling the macro.
-- numeric(16, x) = up to 16 digits in total, x of them after the decimal point.
{% macro divide_by_hundred(argument1, argument2=1) %}
    ({{ argument1 }} / 100)::numeric(16, {{ argument2 }})
{% endmacro %}
