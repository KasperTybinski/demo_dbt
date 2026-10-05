-- Step 1: first model reading from the source.
-- source('<source name>', '<table name>') is replaced by the full table path at compile time.
with pop as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),

final as (
    select * from pop
)

select * from final
