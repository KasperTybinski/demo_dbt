-- Step 7: macro used by the on-run-start / on-run-end hooks.
-- target.database and target.schema come from profiles.yml (DEMO_DB / PUBLIC),
-- so nothing is hard-coded. Snowflake commits automatically, no "commit;" needed.
{% macro auto_test(number) %}
    insert into {{ target.database }}.{{ target.schema }}.my_first_dbt_model values ({{ number }})
{% endmacro %}
