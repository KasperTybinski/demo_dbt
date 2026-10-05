-- Step 5: replaces the original example model.
-- The original had "select null as id", which made the not_null test fail.
{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
    select 2 as id

)

select *
from source_data
